From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Apr 2013 23:59:33 +0200
Subject: [Buildroot] [PATCH 1/2] protobuf-c: new package
In-Reply-To: <1365691296-16042-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 11 Apr 2013 11:41:35 -0300")
References: <1365691296-16042-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877gk4ojsq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/Config.in                |  1 +
 Gustavo>  package/protobuf-c/Config.in     | 12 ++++++++++++
 Gustavo>  package/protobuf-c/protobuf-c.mk | 16 ++++++++++++++++
 Gustavo>  3 files changed, 29 insertions(+)
 Gustavo>  create mode 100644 package/protobuf-c/Config.in
 Gustavo>  create mode 100644 package/protobuf-c/protobuf-c.mk

 Gustavo> diff --git a/package/Config.in b/package/Config.in
 Gustavo> index 0537ffa..826310c 100644
 Gustavo> --- a/package/Config.in
 Gustavo> +++ b/package/Config.in
 Gustavo> @@ -585,6 +585,7 @@ source "package/mtdev2tuio/Config.in"
 Gustavo>  source "package/orc/Config.in"
 Gustavo>  source "package/poco/Config.in"
 Gustavo>  source "package/protobuf/Config.in"
 Gustavo> +source "package/protobuf-c/Config.in"
 Gustavo>  source "package/schifra/Config.in"
 Gustavo>  source "package/startup-notification/Config.in"
 Gustavo>  source "package/liblog4c-localtime/Config.in"
 Gustavo> diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
 Gustavo> new file mode 100644
 Gustavo> index 0000000..9aff6e2
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/protobuf-c/Config.in
 Gustavo> @@ -0,0 +1,12 @@
 Gustavo> +config BR2_PACKAGE_PROTOBUF_C
 Gustavo> +	bool "protobuf-c"
 Gustavo> +	depends on BR2_INSTALL_LIBSTDCPP
 Gustavo> +	select BR2_PACKAGE_PROTOBUF
 Gustavo> +	help
 Gustavo> +	  Code generator and runtime libraries to use Protocol Buffers
 Gustavo> +	  from pure C (not C++).
 Gustavo> +
 Gustavo> +	  http://code.google.com/p/protobuf-c/
 Gustavo> +
 Gustavo> +comment "protobuf-c requires a toolchain with C++ support enabled"
 Gustavo> +	depends on !BR2_INSTALL_LIBSTDCPP

A bit stupid for a 'pure C' library, but ok - Committed both, thanks.

-- 
Bye, Peter Korsgaard
