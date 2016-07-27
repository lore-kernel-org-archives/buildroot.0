From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 09:15:44 +0200
Subject: [Buildroot] [PATCH] nettle: disable assembly optimizations for
	ARMv7M
In-Reply-To: <87y44oyu6q.fsf@dell.be.48ers.dk>
References: <1469405759-3224-1-git-send-email-gustavo@zacarias.com.ar>
 <20160725224844.2ea67984@free-electrons.com>
 <87y44oyu6q.fsf@dell.be.48ers.dk>
Message-ID: <20160727091544.3f40cf72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 23:18:37 +0200, Peter Korsgaard wrote:

>  > ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV6),)  
> 
> I take it that you mean:
> 
> ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV7A),)

Indeed, bad copy/paste.

> We could also simply check for ARM and THUMB2 instructions, E.G.:
> 
> # needs thumb2 and arm instructions support
> ifneq ($(BR2_ARM_CPU_HAS_ARM)$(BR2_ARM_CPU_HAS_THUMB2),yy)

I don't think this is equivalent. Indeed, ARMv6 doesn't have Thumb2 (at
least from Buildroot point of view), while the assembly code in Nettle
is OK for ARMv6.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
