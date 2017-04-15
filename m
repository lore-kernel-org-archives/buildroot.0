From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 12:15:02 +0200
Subject: [Buildroot] [PATCH v5 2/4] package/supertux: new package
In-Reply-To: <20170325215901.15044-2-romain.naour@gmail.com>
References: <20170325215901.15044-1-romain.naour@gmail.com>
 <20170325215901.15044-2-romain.naour@gmail.com>
Message-ID: <20170415121502.32be15d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Mar 2017 22:58:59 +0100, Romain Naour wrote:

> +comment "supertux needs X11 and a toolchain w/ C++, OpenGL backend, gcc >= 4.8, NPTL, dynamic library, wchar"

Saying "needs X11" while the comment will not be visible until X11 is
enabled is not very useful, so I dropped this part.

Also, saying "needs a toolchain w/ ... OpenGL backend" is a bit weird,
because it's not the toolchain that has an OpenGL backend. So I've
reworded this.

> +	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_USE_MMU
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGL || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
> +		BR2_STATIC_LIBS || !BR2_USE_WCHAR

> +SUPERTUX_LICENSE = GPLv3+ (code), CC-BY-SA 2.0, CC-BY-SA 3.0, GPLv2+ (images music sounds)

I've changed this to use SPDX license codes.

Applied with those minor tweaks. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
