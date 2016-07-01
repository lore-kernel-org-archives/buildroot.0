From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 23:06:23 +0200
Subject: [Buildroot] [PATCH v2 08/15] package/gcc: used
 BR2_TOOLCHAIN_HAS_FORTRAN instead of BR2_TOOLCHAIN_BUILDROOT_FORTRAN
In-Reply-To: <20160701162920.19632-9-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-9-s.martin49@gmail.com>
Message-ID: <20160701230623.505cc91a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In the title: used -> use

On Fri,  1 Jul 2016 18:29:13 +0200, Samuel Martin wrote:

>  # Languages supported by the cross-compiler
>  GCC_FINAL_CROSS_LANGUAGES-y = c
>  GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
> -GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
> +GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_HAS_FORTRAN) += fortran

I am not actually sure of the value of this change, and I would rather
suggest that BR2_TOOLCHAIN_BUILDROOT_CXX should be used to enable the
C++ support.

To me, BR2_TOOLCHAIN_BUILDROOT_CXX and BR2_TOOLCHAIN_BUILDROOT_FORTRAN
indicate that you *want* C++/Fortran support in the gcc being built by
Buildroot. Those config options are from gcc, and affect the gcc build.

On the other hand BR2_INSTALL_LIBSTDCPP (which should be named
BR2_TOOLCHAIN_HAS_CXX) and BR2_TOOLCHAIN_HAS_FORTRAN should be used by
*consumers* that need C++ or Fortran.

So I would be inclined to reject this patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
