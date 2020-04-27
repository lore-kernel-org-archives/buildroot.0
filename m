From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 22:26:57 +0200
Subject: [Buildroot] [PATCH] configs/qemu_sh4{,
 eb}-r2d: remove kernel patch "restore the old sh-sci driver
 behaviour"
In-Reply-To: <20200427160544.1166301-1-romain.naour@gmail.com>
References: <20200427160544.1166301-1-romain.naour@gmail.com>
Message-ID: <20200427222657.07c22235@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Apr 2020 18:05:44 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> This reverts commit f7a887c3682282a281206bca61724a750c326b3d and
> 23aee3eac497f15f901ddf99ab3aa81af747f7e5 since the kernel patch
> is not needed as soon as qemu >= 3.1.0 is used with a kernel >=
> 4.11-rc1.
> 
> The qemu emulation of sh-sci driver was fixed by adding basic
> timeout handling for 9600 bps [1].
> 
> [1] https://git.qemu.org/?p=qemu.git;a=commit;h=71bb4ce1b5592cdc03abc48cdf4ecb15b2db81a0
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> @Thomas: Removing this patch is ok for toolchain-builder since Ubuntu disco use qemu 3.1.x.
> ---
>  ...-sci-increase-RX-FIFO-trigger-defaul.patch | 61 -------------------
>  ...-sci-increase-RX-FIFO-trigger-defaul.patch | 61 -------------------
>  configs/qemu_sh4_r2d_defconfig                |  1 -
>  configs/qemu_sh4eb_r2d_defconfig              |  1 -
>  4 files changed, 124 deletions(-)
>  delete mode 100644 board/qemu/sh4-r2d/patches/linux/0001-Revert-serial-sh-sci-increase-RX-FIFO-trigger-defaul.patch
>  delete mode 100644 board/qemu/sh4eb-r2d/patches/linux/0001-Revert-serial-sh-sci-increase-RX-FIFO-trigger-defaul.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
