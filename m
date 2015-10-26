From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Oct 2015 09:25:36 +0100
Subject: [Buildroot] [PATCH] arch/arm: use EABIhf by default with VFP
In-Reply-To: <87bnbmdqad.fsf@dell.be.48ers.dk>
References: <87k2qn6gf0.fsf@dell.be.48ers.dk>
 <1445786380-2741-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <87bnbmixv1.fsf@dell.be.48ers.dk>
 <20151026013217.60ad1af8@free-electrons.com>
 <87bnbmdqad.fsf@dell.be.48ers.dk>
Message-ID: <20151026092536.6aa7996b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Mon, 26 Oct 2015 08:47:54 +0100, Peter Korsgaard wrote:

>  > However, unlike BR2_ARM_CPU_HAS_NEON which gets selected even on ARM
>  > cores for which NEON is optional, but for which the user has explicitly
>  > requested NEON support to be enabled (through BR2_ARM_ENABLE_NEON), it
>  > is not the case for the VFP option. I think we should do that.
>  > Otherwise, BR2_ARM_CPU_HAS_VFPV2 will not be true, even if the VFPv2
>  > unit is actually available and used.
> 
> But packages should use the BR2_ARM_FPU_VFPV2 (and 3/4) symbols to check
> if they should use the VFP, and not BR2_ARM_CPU_MAYBE_HAS_VFPV2 || BR2_ARM_CPU_HAS_VFPV2

But then they have to test BR2_ARM_FPU_VFPV2 || BR2_ARM_FPU_VFPV3 ||
BR2_ARM_FPU_VFPV3D16 || ...

If they just want to know if a VFP is available.

> I don't think kconfig will let us both have these options depend on
> BR2_ARM_CPU_MAYBE_HAS_VFPV2 || BR2_ARM_CPU_HAS_VFPV2 and select
> BR2_ARM_CPU_HAS_VFPV2.

Indeed, it doesn't. Some better solution is needed :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
