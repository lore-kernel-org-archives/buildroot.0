From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 6 Sep 2013 03:08:10 +0200
Subject: [Buildroot] [PATCH 2/2] arch/Config.in: Allow ARM to select
	BR2_BINFMT_FLAT
In-Reply-To: <20130905234841.3bbfe0d4@skate>
References: <1378262598.32360.5.camel@phoenix>
 <1378262667.32360.6.camel@phoenix> <20130905234841.3bbfe0d4@skate>
Message-ID: <CAAXf6LVLhC7LiuXTcSY+Rmyy_jt6ec37cU4S_4a=j=CpUs1qbA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 5-sep.-2013 23:48 schreef "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> het volgende:

> But I'm wondering if we shouldn't go further than that, and make
> BR2_BINFMT_FLAT available only for non-MMU ARMs. Something like:
>
>         prompt "Target Binary Format"
>         depends on BR2_arm7tmdi || BR2_arm_cortex_m3 || BR2_arm_cortex_m4
|| BR2_m68k || BR2_bfin
>         default BR2_BINFMT_FLAT if BR2_arm7tmdi || BR2_arm_cortex_m3 ||
BR2_arm_cortex_m4 || BR2_m68k
>         default BR2_BINFMT_FDPIC if BR2_bfin
>
> or something like this. This way, users of MMU-capable ARM variants
> wouldn't be confused by the availability of FLAT and ELF as binary
> formats. Of course, BR2_BINFMT_ELF should gain some !BR2_arm7tmdi
> && !BR2_arm_cortex_m3 && !BR2_arm_cortex_m4 dependencies, or maybe even
> a !BR2_USE_MMU dependency. I think there's quite some room for
> improvement around the definition of which CPU has an MMU or not, and
> which architectures support which binary formats.

Don't we/shouldn't we have something like ARCH_HAS_MMU and/or
ARCH_SUPPORTS_FLAT_BINARY?

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130906/22703a2b/attachment.html>
