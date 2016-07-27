From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jul 2016 10:03:17 +0200
Subject: [Buildroot] [PATCH] nettle: disable assembly optimizations for
	ARMv7M
In-Reply-To: <20160727091544.3f40cf72@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 27 Jul 2016 09:15:44 +0200")
References: <1469405759-3224-1-git-send-email-gustavo@zacarias.com.ar>
 <20160725224844.2ea67984@free-electrons.com>
 <87y44oyu6q.fsf@dell.be.48ers.dk>
 <20160727091544.3f40cf72@free-electrons.com>
Message-ID: <87zip3y0ca.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> We could also simply check for ARM and THUMB2 instructions, E.G.:
 >> 
 >> # needs thumb2 and arm instructions support
 >> ifneq ($(BR2_ARM_CPU_HAS_ARM)$(BR2_ARM_CPU_HAS_THUMB2),yy)

 > I don't think this is equivalent. Indeed, ARMv6 doesn't have Thumb2 (at
 > least from Buildroot point of view), while the assembly code in Nettle
 > is OK for ARMv6.

True, but then the commit message doesn't make any sense as it said it
required thumb2 and classic in structions.

-- 
Venlig hilsen,
Peter Korsgaard 
