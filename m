From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Sep 2020 09:06:51 +0200
Subject: [Buildroot] [PATCH 4/5] package make: build nommu builds as
 linux
In-Reply-To: <20200908050744.425303-5-damien.lemoal@wdc.com>
References: <20200908050744.425303-1-damien.lemoal@wdc.com>
 <20200908050744.425303-5-damien.lemoal@wdc.com>
Message-ID: <20200908090651.6cf90841@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Sep 2020 14:07:43 +0900
Damien Le Moal <damien.lemoal@wdc.com> wrote:

> From: Christoph Hellwig <hch@lst.de>
> 
> Using *-uclinux-* seems like an only partially followed convention.
> And at least for RISC-V gcc doesn't know about uclinux tuples, so
> switch back to the normal Linux one for now.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

I believe this is going to break support for ARM noMMU, where the
TARGET_OS part of the tuple is really uclinux. So I guess we should
simply make this conditional.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
