From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 23:47:50 +0200
Subject: [Buildroot] [PATCH v2 3/6] package/elf2flt: add RISC-V support
In-Reply-To: <20200908113324.1022230-4-damien.lemoal@wdc.com>
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
 <20200908113324.1022230-4-damien.lemoal@wdc.com>
Message-ID: <20201006234750.30ae4241@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Sep 2020 20:33:21 +0900
Damien Le Moal <damien.lemoal@wdc.com> wrote:

> From: Christoph Hellwig <hch@lst.de>
> 
> Enable selecting elf2flt for RISC-V no MMU builds ad add support for it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../0002-elf2flt-add-riscv-support.patch      | 302 ++++++++++++++++++
>  package/elf2flt/Config.in.host                |   2 +-
>  2 files changed, 303 insertions(+), 1 deletion(-)
>  create mode 100644 package/elf2flt/0002-elf2flt-add-riscv-support.patch
> 
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

We need your Signed-off-by here. However, I see that the upstreaming
process hasn't really made progress, and especially you're pointing
that binaries built with this elf2flt RISC-V support fail with recent
kernels.

Do you have some news about fixing this? It's a bit annoying to merge
something that doesn't work with recent kernels.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
