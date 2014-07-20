From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 10:48:09 +0200
Subject: [Buildroot] [PATCH] package/opencv: fix dependencies for the Qt
 and GTK backends
In-Reply-To: <1405794942-32087-1-git-send-email-yann.morin.1998@free.fr>
References: <1405794942-32087-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140720104809.09052567@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 19 Jul 2014 20:35:42 +0200, Yann E. MORIN wrote:

> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index 6e938d2..1a026a9 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -159,6 +159,7 @@ config BR2_PACKAGE_OPENCV_WITH_GTK
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_MMU # libgtk2 -> glib2
> +	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>  	select BR2_PACKAGE_LIBGTK2
>  
>  config BR2_PACKAGE_OPENCV_WITH_JASPER
> @@ -188,11 +189,11 @@ config BR2_PACKAGE_OPENCV_WITH_QT
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_avr32 # qt
>  	depends on BR2_USE_MMU # qt
> +	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>  	select BR2_PACKAGE_QT
>  	select BR2_PACKAGE_QT_STL
>  	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>  	select BR2_PACKAGE_QT_TEST       if BR2_PACKAGE_OPENCV_LIB_HIGHGUI

Can I remove these "if" now that the Qt support anyway depends on
highgui ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
