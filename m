From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 15:00:17 +0100
Subject: [Buildroot] Enable option of nodeJS 4.1.2 in buildroot 2015.11
In-Reply-To: <20161111043706.nrzzr7ca5nybi2ir@tarshish>
References: <CALD51P8hSabOW+SdV0Ycc46Ar4Pqn0jZuyazKhUUQcqKvsg6qA@mail.gmail.com>
 <20161111043706.nrzzr7ca5nybi2ir@tarshish>
Message-ID: <20161111150017.29e032b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Nov 2016 06:37:06 +0200, Baruch Siach wrote:

> That's because nodejs 4.1.2 on Buildroot 2015.11 (and 6.7.0 on current master) 
> depends on BR2_ARM_CPU_HAS_VFPV2:
> 
> config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
>         bool
>         # On supported architectures other than ARM, no special requirement
>         default y if !BR2_arm
>         # On ARM, at least ARMv6+ with VFPv2+ is needed
>         default y if !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
> 
> The comment seems indicates that BR2_ARM_CPU_HAS_VFPV3 should also be fine. 
> You may try changing this line to
> 
>         default y if !BR2_ARM_CPU_ARMV5 && (BR2_ARM_CPU_HAS_VFPV2 || BR2_ARM_CPU_HAS_VFPV3)
> 
> Yann, you added this dependency in commit f443386c5d. Is that the right fix?

I'm wondering if BR2_ARM_CPU_HAS_VFPV3 shouldn't select
BR2_ARM_CPU_HAS_VFPV2, and ditto for V4 selecting V3.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
