From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:32:51 +0100
Subject: [Buildroot] [PATCH 1/3] configs/minnowboard_max_defconfig: bump
 kernel to 5.10.11
In-Reply-To: <20210130101915.18423-1-peter@korsgaard.com>
References: <20210130101915.18423-1-peter@korsgaard.com>
Message-ID: <20210131213251.29949f5f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Jan 2021 11:19:13 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Explicitly enable PCI support in the kernel after commit eb01d42a77785 (PCI:
> consolidate PCI config entry in drivers/pci) and change to GPT partitions /
> root=PARTLABEL to find the rootfs instead of hardcoding /dev/mmcblk2p2 as
> the mmc probing order has changed since commit 21b2cec61c04bd1 (mmc: Set
> PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4).
> 
> This has the additional advantage that the same image will work when written
> to a USB drive instead of a microsd.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  board/minnowboard/genimage.cfg    | 5 +++--
>  board/minnowboard/grub.cfg        | 2 +-
>  board/minnowboard/linux.config    | 1 +
>  configs/minnowboard_max_defconfig | 6 +++---
>  4 files changed, 8 insertions(+), 6 deletions(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
