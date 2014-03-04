From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 20:09:48 +0100
Subject: [Buildroot] Problem with starting TI Graphics
In-Reply-To: <trinity-c25b0db0-54b6-4f8c-977a-023518dc467a-1392373446805@3capp-gmx-bs16>
References: <trinity-96c3bbe4-4de2-4d94-a868-2ca9c13f130e-1392279117507@3capp-gmx-bs38>
 <CA+kK6WuqEOYcgypxbDJ8Hs5Jy3JXpuGaQPb9Qgp0+nsjDz1k5g@mail.gmail.com>
 <trinity-c25b0db0-54b6-4f8c-977a-023518dc467a-1392373446805@3capp-gmx-bs16>
Message-ID: <20140304200948.619fc7fe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Kuemmel,

On Fri, 14 Feb 2014 11:24:06 +0100, Peter Kuemmel wrote:

> Thanks, I found the issue: it was the missing user binary thumb support in the kernel.

Interesting. Were you building the kernel with Buildroot, or separately?

If you built your kernel with Buildroot, then maybe we should add
something like:

	$(if $(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),
		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_THUMB,$(@D)/.config))

This way we would ensure that the kernel gets built with
CONFIG_ARM_THUMB=y when the Thumb or Thumb-2 instruction sets have been
selected for userspace.

Thoughts?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
