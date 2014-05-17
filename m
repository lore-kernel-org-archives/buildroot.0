From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 16:10:09 +0200
Subject: [Buildroot] [PATCH v7 20/31] xbmc: Allow compilation with uClibc
In-Reply-To: <1400326806-16428-21-git-send-email-bernd.kuhls@t-online.de>
References: <1400326806-16428-1-git-send-email-bernd.kuhls@t-online.de>
 <1400326806-16428-21-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140517161009.56006692@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

This commit seems to do a bit more than just allowing the compilation
with uClibc, no? It would need a bit more explanation in the commit log
I believe. Also, some comment below.

On Sat, 17 May 2014 13:39:55 +0200, Bernd Kuhls wrote:

>  menuconfig BR2_PACKAGE_XBMC
>  	bool "xbmc"
> @@ -57,10 +56,13 @@ menuconfig BR2_PACKAGE_XBMC
>  	select BR2_PACKAGE_TINYXML
>  	select BR2_PACKAGE_YAJL
>  	select BR2_PACKAGE_ZLIB
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_LARGEFILE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES
> +	depends on BR2_USE_MMU # python
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_i386 || BR2_x86_64

Are you sure RasberryPi and other ARM users are happy with XBMC only
being available on x86/x86-64 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
