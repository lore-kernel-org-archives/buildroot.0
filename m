From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 7 Mar 2020 10:08:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/thrift: disable qt for host
 build
In-Reply-To: <20200306220129.1149054-1-fontaine.fabrice@gmail.com>
References: <20200306220129.1149054-1-fontaine.fabrice@gmail.com>
Message-ID: <20200307100807.7507a41b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri,  6 Mar 2020 23:01:29 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> host-thrift can fail if a broken Qt4 is found on host:
>
> CMake Error in lib/cpp/CMakeLists.txt:
>   Imported target "Qt4::QtCore" includes non-existent path
>
>     "/nvmedata/autobuild/instance-4/output-1/host/usr/mkspecs/default"
>
>   in its INTERFACE_INCLUDE_DIRECTORIES.  Possible reasons include:
>
>   * The path was deleted, renamed, or moved to another location.
>
>   * An install or uninstall procedure did not complete successfully.
>
>   * The installation package was faulty and references files it does not
>   provide.
>
> Fixes:
>  - http://autobuild.buildroot.org/results/57cad5313896c868e99b0b9534678f1c83a386f2
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/thrift/thrift.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
> index 6014bbfcdd..bef8bf6fac 100644
> --- a/package/thrift/thrift.mk
> +++ b/package/thrift/thrift.mk
> @@ -51,7 +51,9 @@ HOST_THRIFT_CONF_OPTS += -DTHRIFT_COMPILER_CSHARP=OFF \
>  	-DTHRIFT_COMPILER_GO=OFF \
>  	-DTHRIFT_COMPILER_D=OFF \
>  	-DTHRIFT_COMPILER_LUA=OFF \
> -	-DBUILD_C_GLIB=OFF
> +	-DBUILD_C_GLIB=OFF \
> +	-DWITH_QT4=OFF \
> +	-DWITH_QT5=OFF

The option '-DWITH_QT5=OFF' should already be set by THRIFT_COMMON_CONF_OPTS,
the option '-DWITH_QT4=OFF' should therefore go to THRIFT_COMMON_CONF_OPTS too...

Regards,
Peter

>
>  # C bindings
>  ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
