From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Jul 2021 22:02:06 +0200
Subject: [Buildroot] [PATCH 0/6] allwinner: arm32: misc BSP updates
In-Reply-To: <20210613161926.2790763-1-geomatsi@gmail.com>
References: <20210613161926.2790763-1-geomatsi@gmail.com>
Message-ID: <2602cdd0-d951-96fc-5cb1-a53ec37e34c4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/06/2021 18:19, Sergey Matyukevich wrote:
> Hi all,
> 
> Here is a patch set with BSP updates for several boards with Allwinner
> 32-bit CPU. U-Boot version updated to 2021.04 and Linux version updated
> to 5.12.2. Besides, rtl8189fs out-of-tree wireless driver revision was
> updated to compile it with new kernel.

 Series applied to master, thanks.

> 
> Regards,
> Sergey
> 
> 
> Sergey Matyukevich (6):
>   rtl8189fs: bump revision to 62c31d57
>   rtl8189fs: disable debug messages
>   configs/orangepi_zero_defconfig: bump BSP versions
>   configs/orangepi_one_defconfig: bump BSP versions
>   configs/orangepi_pc_plus_defconfig: bump BSP versions
>   board/orangepi-pc-plus: switch to GPT partitions for PARTLABEL support

 Next time you're messing with these defconfigs, you could also consider
switching them to extlinux.conf (like in orangepi-one-plus), so a single
partition is sufficient.

 And it would make sense to make that scenario a little easier in Buildroot,
since it's pretty much always supported in new boards, and is compatible with
x86-based boards.

 Regards,
 Arnout

> 
>  board/orangepi/orangepi-pc-plus/boot.cmd      |  2 +-
>  board/orangepi/orangepi-pc-plus/genimage.cfg  |  8 +++++-
>  configs/orangepi_one_defconfig                | 13 +++++----
>  configs/orangepi_pc_plus_defconfig            | 11 ++++----
>  configs/orangepi_zero_defconfig               | 10 +++----
>  .../0001-include-disable-debug-messages.patch | 28 +++++++++++++++++++
>  package/rtl8189fs/rtl8189fs.hash              |  2 +-
>  package/rtl8189fs/rtl8189fs.mk                |  2 +-
>  8 files changed, 56 insertions(+), 20 deletions(-)
>  create mode 100644 package/rtl8189fs/0001-include-disable-debug-messages.patch
> 
