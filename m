From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Feb 2017 09:23:07 +0100
Subject: [Buildroot] [PATCH v1] qt5: disable qt-5.8.0 support for arc,
 nios2 and xtensa
In-Reply-To: <20170221223950.23314-1-ps.report@gmx.net>
References: <20170221223950.23314-1-ps.report@gmx.net>
Message-ID: <20170222092307.22ca917a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Feb 2017 23:39:50 +0100, Peter Seiderer wrote:

> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index 8de248139..1648b1c74 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -39,6 +39,8 @@ config BR2_PACKAGE_QT5_VERSION_LATEST
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>  	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
>  	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
> +	# no built-in double-conversion support
> +	depends on !BR2_arcle && !BR2_arceb && !BR2_nios2 && !BR2_xtensa

	!BR2_arcle && !BR2_arceb

can be simplified to:

	!BR2_arc

See arch/Config.in.arc:

config BR2_arc
        bool
        default y if BR2_arcle || BR2_arceb

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
