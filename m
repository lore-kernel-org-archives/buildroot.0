From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 12:00:49 +0200
Subject: [Buildroot] [PATCH v4 15/15] package/gcc: enable gcc 9.1 for
 ork1 (openrisc)
In-Reply-To: <20190714093916.GK2680@scaer>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-16-giulio.benetti@micronovasrl.com>
 <54fe6b56-aa43-b657-0b8e-1c42e2471735@mind.be>
 <CAJF2gTQ85czGP5BAMgn5kwbJKGTmxwAakkZGmUomquTugSwMcg@mail.gmail.com>
 <20190714084056.GI2680@scaer>
 <CAJF2gTSD9ANSQs7S3nSnboZm7P012mzO1EfuE-P4Z5xFusvSYw@mail.gmail.com>
 <20190714093916.GK2680@scaer>
Message-ID: <20190714120049.62a2ffa1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Jul 2019 11:39:16 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > # For C-SKY abiv1 & abiv2
> > ifeq ($(BR2_csky),y)
> > ifeq ($(BR2_ck610),y)
> > ABI = abiv1
> > else
> > ABI = abiv2
> > endif
> > endif  
> 
> Ah, thanks for pointing this out. I only had a look at arch/arch.mk.csky
> and arch/Config.in.csky.
> 
> This makes me wonder: should we move all this out of package/Makefile.in
> and into the per-arch .mk files instead?

Yes, I also thought about that when I merged Guo's patches for C-SKY.
But other architectures already have stuff in package/Makefile.in, so
it required a larger rework, which I didn't want to put as a
pre-requisite to merging Guo's patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
