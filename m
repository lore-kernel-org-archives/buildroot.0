From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Sep 2020 08:45:30 +0200
Subject: [Buildroot] [PATCH v2 3/6] package/elf2flt: add RISC-V support
In-Reply-To: <20200908113324.1022230-4-damien.lemoal@wdc.com> (Damien Le
 Moal's message of "Tue, 8 Sep 2020 20:33:21 +0900")
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
 <20200908113324.1022230-4-damien.lemoal@wdc.com>
Message-ID: <87wo135tyt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Damien" == Damien Le Moal <damien.lemoal@wdc.com> writes:

 > From: Christoph Hellwig <hch@lst.de>
 > Enable selecting elf2flt for RISC-V no MMU builds ad add support for it.

 > Signed-off-by: Christoph Hellwig <hch@lst.de>
 > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
 > ---
 >  .../0002-elf2flt-add-riscv-support.patch      | 302 ++++++++++++++++++
 >  package/elf2flt/Config.in.host                |   2 +-
 >  2 files changed, 303 insertions(+), 1 deletion(-)
 >  create mode 100644 package/elf2flt/0002-elf2flt-add-riscv-support.patch

 > diff --git a/package/elf2flt/0002-elf2flt-add-riscv-support.patch b/package/elf2flt/0002-elf2flt-add-riscv-support.patch
 > new file mode 100644
 > index 0000000000..2f3ce5ac69
 > --- /dev/null
 > +++ b/package/elf2flt/0002-elf2flt-add-riscv-support.patch
 > @@ -0,0 +1,302 @@
 > +From 9a1c84590f31897e681a8142481c73456a7eedcf Mon Sep 17 00:00:00 2001
 > +From: Christoph Hellwig <hch@lst.de>
 > +Date: Mon, 10 Jun 2019 09:21:57 +0200
 > +Subject: elf2flt: add riscv support
 > +
 > +We need a new linker script - riscv has a global_pointer and is
 > +very picky about some section ordering.
 > +
 > +Signed-off-by: Christoph Hellwig <hch@lst.de>

What is the upstream status of this patch? I don't see a PR for it?

https://github.com/uclinux-dev/elf2flt/pulls?q=is%3Apr+is%3Aclosed

-- 
Bye, Peter Korsgaard
