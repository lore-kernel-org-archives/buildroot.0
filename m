From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Nov 2014 19:27:19 +0100
Subject: [Buildroot] Linux-Kernel-Version for using RTAI
In-Reply-To: <17b56e9456194f8d917cc8a5990df542@dsw332.wattens.swarovski.com>
References: <17b56e9456194f8d917cc8a5990df542@dsw332.wattens.swarovski.com>
Message-ID: <20141110192719.217adc3b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Werner,

On Mon, 10 Nov 2014 15:10:43 +0000, Spielmann Werner wrote:

> is there anybody out there who can give me a recommendation for an
> useable combination of Linux-Kernel / Kernel Config / RTAI-Version?

Well, what don't you look by yourself in the RTAI sources? :-) Plus
we need more details such as which platform you are interested in,
since RTAI will have patches for different kernel versions depending on
the platform being used.

With RTAI 3.8.1 currently packaged in Buildroot:

$ find base/arch/ -name '*.patch'
base/arch/ppc/patches/hal-linux-2.6.20-powerpc-1.8-06.patch
base/arch/ppc/patches/hal-linux-2.6.29.4-powerpc-2.6-02.patch
base/arch/ppc/patches/hal-linux-2.6.14-ppc-1.5-01.patch
base/arch/x86/patches/hal-linux-2.6.32.11-x86-2.6-03.patch
base/arch/x86/patches/hal-linux-2.6.24-x86-2.0-07.patch
base/arch/x86/patches/hal-linux-2.6.29.5-x86-2.4-03.patch
base/arch/x86/patches/hal-linux-2.6.25-x86-2.0-09.patch
base/arch/x86/patches/hal-linux-2.6.28.9-x86-2.2-07.patch
base/arch/x86/patches/hal-linux-2.6.31.8-x86-2.4-09.patch
base/arch/x86/patches/hal-linux-2.6.30.5-x86-2.4-05.patch
base/arch/i386/patches/hal-linux-2.6.22-i386-1.10-12.patch
base/arch/i386/patches/hal-linux-2.6.20.21-i386-1.12-03.patch
base/arch/i386/patches/hal-linux-2.6.23-i386-1.12-03.patch
base/arch/i386/patches/hal-linux-2.4.36-i386-1.3-04.patch
base/arch/arm/patches/RTAI-3.5-cv-AT91-v2.patch
base/arch/arm/patches/imx_2.6.7_rtai_3.2_v_1.0.patch
base/arch/arm/patches/RTAI-magma-AT91.patch
base/arch/arm/patches/at91_hal-linux-2.6.20-arm-AT91.patch
base/arch/arm/patches/pxa255_2.6.7-bk6-karo.patch
base/arch/arm/patches/RTAI-3.2-IMX.patch
base/arch/arm/patches/ep9301_hal17_2.4.21-rmk1-crus1.4.2.patch
base/arch/arm/patches/at91_adeos-ipipe-2.6.20-arm-AT91.patch
base/arch/x86_64/patches/hal-linux-2.6.19-x86_64-1.0-06.patch
base/arch/x86_64/patches/hal-linux-2.6.22-x86_64-1.2-05.patch
base/arch/x86_64/patches/hal-linux-2.6.23-x86_64-1.4-03.patch
base/arch/x86_64/patches/hal-linux-2.6.20-x86_64-1.0-08.patch
base/arch/m68k/patches/MCF5329/BSP20081215/patches/0069-ipipe-mcf5329_2.6.26.patch
base/arch/m68k/patches/MCF5329/BSP20081215/patches/ltib-rtai-3.8-mcf5329.patch
base/arch/m68k/patches/MCF5329/uClinux 20080808/uClinux-rtai-mcf5329_2.6.25.patch
base/arch/m68k/patches/MCF54455/BSP20071214/patches/ltib-rtai-3.8-mcf54455.patch
base/arch/m68k/patches/MCF54455/BSP20071214/patches/lin2-6-23-m5445x-0049-I-Pipe.patch
base/arch/m68k/patches/MCF54455/BSP20071214/patches/glibc-fix.patch

With RTAI 4.0 (latest upstream version, so you would have to update
Buildroot a bit):

$ find base/arch/ -name '*.patch'
base/arch/ppc/patches/hal-linux-2.6.20-powerpc-1.8-06.patch
base/arch/ppc/patches/hal-linux-2.6.29.4-powerpc-2.6-02.patch
base/arch/ppc/patches/hal-linux-2.6.14-ppc-1.5-01.patch
base/arch/x86/patches/hal-linux-3.4.6-x86-4.patch
base/arch/x86/patches/hal-linux-3.8.13-x86-4.patch
base/arch/x86/patches/hal-linux-3.4.67-x86-4.patch
base/arch/x86/patches/hal-linux-3.5.7-x86-4.patch
base/arch/arm/patches/at91_2.6.20.13.patch
base/arch/arm/patches/imxl_2.6.7.patch
base/arch/arm/patches/at91_2.6.20.13-at91sam9263.patch
base/arch/arm/patches/pxa255_2.6.7-bk6-karo.patch
base/arch/arm/patches/ep9301_hal17_2.4.21-rmk1-crus1.4.2.patch
base/arch/m68k/patches/MCF5329/BSP20081215/patches/0069-ipipe-mcf5329_2.6.26.patch
base/arch/m68k/patches/MCF5329/BSP20081215/patches/ltib-rtai-3.8-mcf5329.patch
base/arch/m68k/patches/MCF5329/uClinux 20080808/uClinux-rtai-mcf5329_2.6.25.patch
base/arch/m68k/patches/MCF54455/BSP20071214/patches/ltib-rtai-3.8-mcf54455.patch
base/arch/m68k/patches/MCF54455/BSP20071214/patches/lin2-6-23-m5445x-0049-I-Pipe.patch
base/arch/m68k/patches/MCF54455/BSP20071214/patches/glibc-fix.patch

Also, if you're interested in real-time extensions for non-x86
platforms, I would definitely recommend you to look at Xenomai. While
RTAI is well maintained on x86, as you can see, the support for other
architectures is not maintained: on PowerPC, the most recent kernel is
2.6.29, on ARM it's 2.6.20.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
