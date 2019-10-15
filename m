From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Oct 2019 09:20:42 +0200
Subject: [Buildroot] [PATCH] opensbi: Bump from 0.4 to 0.5
In-Reply-To: <20191014232106.13179-1-alistair.francis@wdc.com>
References: <20191014232106.13179-1-alistair.francis@wdc.com>
Message-ID: <20191015092042.669fb465@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Oct 2019 16:21:06 -0700
Alistair Francis <alistair.francis@wdc.com> wrote:

> diff --git a/board/qemu/riscv32-virt/patches/opensbi/0001-Makefile-Don-t-specify-mabi-or-march.patch b/board/qemu/riscv32-virt/patches/opensbi/0001-Makefile-Don-t-specify-mabi-or-march.patch
> new file mode 100644
> index 0000000000..5f554a6c24
> --- /dev/null
> +++ b/board/qemu/riscv32-virt/patches/opensbi/0001-Makefile-Don-t-specify-mabi-or-march.patch

Why is this patch in board/qemu/riscv32-virt/ ? It doesn't seem to be
specific to that particular platform, so anybody building opensbi for
another RV32 platform would also hit the issue. Shouldn't the patch (in
this form or another) be in boot/opensbi/ ?

Also minor nit: the commit title should be:

	boot/opensbi: bump to 0.5

You could also send a patch adding the hash for the license file in
opensbi.hash.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
