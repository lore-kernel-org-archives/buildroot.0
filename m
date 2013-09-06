From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Sep 2013 08:25:37 +0200
Subject: [Buildroot] [PATCH 2/2] arch/Config.in: Allow ARM to select
 BR2_BINFMT_FLAT
In-Reply-To: <CAAXf6LVLhC7LiuXTcSY+Rmyy_jt6ec37cU4S_4a=j=CpUs1qbA@mail.gmail.com>
References: <1378262598.32360.5.camel@phoenix>
 <1378262667.32360.6.camel@phoenix> <20130905234841.3bbfe0d4@skate>
 <CAAXf6LVLhC7LiuXTcSY+Rmyy_jt6ec37cU4S_4a=j=CpUs1qbA@mail.gmail.com>
Message-ID: <20130906082537.08818fba@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 6 Sep 2013 03:08:10 +0200, Thomas De Schampheleire wrote:

> > or something like this. This way, users of MMU-capable ARM variants
> > wouldn't be confused by the availability of FLAT and ELF as binary
> > formats. Of course, BR2_BINFMT_ELF should gain some !BR2_arm7tmdi
> > && !BR2_arm_cortex_m3 && !BR2_arm_cortex_m4 dependencies, or maybe even
> > a !BR2_USE_MMU dependency. I think there's quite some room for
> > improvement around the definition of which CPU has an MMU or not, and
> > which architectures support which binary formats.
> 
> Don't we/shouldn't we have something like ARCH_HAS_MMU and/or
> ARCH_SUPPORTS_FLAT_BINARY?

Yes, we should probably have something like this (and ditto for other
binary formats: ELF, FDPIC and so on).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
