From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 13 Mar 2019 20:07:25 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5webengine: fix comment
 on GL dependencies
In-Reply-To: <20190313164746.ECDF38B66D@busybox.osuosl.org>
References: <20190313164746.ECDF38B66D@busybox.osuosl.org>
Message-ID: <20190313200725.33bae840@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Martin, Thomas,

On Wed, 13 Mar 2019 17:50:39 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=6fb4c14ecb1e8f001449830b65ec2a4606b87682
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> qt5declarative can be built/used without opengl support so fix the
> dependency comment in qt5webengine.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/qt5/qt5webengine/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index 744d659567..bfc0a02c12 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -34,7 +34,7 @@ config BR2_PACKAGE_QT5WEBENGINE
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || BR2_PACKAGE_QT5_VERSION_5_6 # libnss
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
>  	depends on BR2_USE_WCHAR # libglib2
> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5base-eglfs

This comment change is only valid for BR2_PACKAGE_QT5_VERSION_LATEST/Qt5.12.x as
qt5webengine selects BR2_PACKAGE_QT5DECLARATIVE_QUICK and qt5declarative/Config.in
states:

  config BR2_PACKAGE_QT5DECLARATIVE_QUICK
          bool "quick module"
          depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST

Regards,
Peter

>  	depends on BR2_PACKAGE_HAS_LIBEGL # qt5base-eglfs
>  	depends on BR2_PACKAGE_HAS_UDEV
>  	# v8 (a chromium 3rd-party) compiles its internal host-tools with the
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
