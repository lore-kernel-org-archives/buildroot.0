From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 09:39:41 +0100
Subject: [Buildroot] [PATCH 1/1] mtd: fix build on riscv
In-Reply-To: <de33d1c5-e23a-9de9-949d-2e7da195c8e8@mind.be>
References: <20181120185237.31403-1-fontaine.fabrice@gmail.com>
 <de33d1c5-e23a-9de9-949d-2e7da195c8e8@mind.be>
Message-ID: <20181121093941.643512bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Nov 2018 00:34:30 +0100, Arnout Vandecappelle wrote:

> > +# gcc on riscv doesn't define _REENTRANT when -pthread is passed while
> > +# it should. Compensate this deficiency here otherwise mtd configure
> > +# script doesn't find that thread support is enabled.
> > +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS):$(BR2_riscv),y:y)
> > +MTD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_REENTRANT"  
> 
>  Patching gcc sounds more and more attractive...

Yes, definitely. We should do that.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
