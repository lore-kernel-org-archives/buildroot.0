From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 10:04:18 +0100
Subject: [Buildroot] [PATCH v4 2/2] gtkmm3: bump to version 3.18.0
In-Reply-To: <1458561948-13971-3-git-send-email-gustavo@zacarias.com.ar>
References: <1458561948-13971-1-git-send-email-gustavo@zacarias.com.ar>
 <1458561948-13971-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160322100418.61301c67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Mar 2016 09:05:48 -0300, Gustavo Zacarias wrote:

>  	# Broken on existing external/internal nios2 toolchains,
> @@ -11,19 +20,14 @@ config BR2_PACKAGE_GTKMM3
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
>  	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
>  	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
> +	depends on BR2_PACKAGE_HAS_LIBEGL # libgtk3 -> libepoxy
> +	select BR2_PACKAGE_LIBGTK3
>  	select BR2_PACKAGE_ATKMM
>  	select BR2_PACKAGE_CAIROMM
>  	select BR2_PACKAGE_GLIBMM
> -	select BR2_PACKAGE_LIBGTK3

I'm not sure why you changed the location of this select, which used to
be nicely alphabetically sorted. I've reverted to the old ordering, and
applied your patch to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
