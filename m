From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 09:23:12 +0200
Subject: [Buildroot] [PATCH] package/libbdplus: Add missing libgpg arch
 support
In-Reply-To: <1467669466-16341-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467669466-16341-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160705092312.0b7b1119@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 23:57:46 +0200, Maxime Hadjinlian wrote:

>  comment "libbdplus needs a toolchain w/ threads, dynamic library"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS

That's not the proper way of taking into account architecture
dependencies. What we want is that the comment is only displayed if the
architecture requirements are met, so:

comment "libbdplus needs a toolchain w/ threads, dynamic library"
	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS

Applied with this fixed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
