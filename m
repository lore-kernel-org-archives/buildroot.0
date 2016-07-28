From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 Jul 2016 12:49:00 -0500
Subject: [Buildroot] [PATCH 7/7] zynq: unify readme.txt for all Zynq
	boards
In-Reply-To: <1468834703-27518-8-git-send-email-yamada.masahiro@socionext.com>
References: <1468834703-27518-1-git-send-email-yamada.masahiro@socionext.com>
 <1468834703-27518-8-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <CANQCQpZ6uF+S4A5huUFj_Z3YHWB__9K=mw4n=ab9yxymuEDwrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Jul 18, 2016 at 4:38 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> The readme.txt for the three boards are almost the same, so merge
> them into board/zynq/readme.txt.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  board/avnet/microzed/readme.txt | 33 --------------------------
>  board/avnet/zedboard/readme.txt | 28 ----------------------
>  board/xilinx/zc706/readme.txt   | 29 -----------------------
>  board/zynq/readme.txt           | 52 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 52 insertions(+), 90 deletions(-)
>  delete mode 100644 board/avnet/microzed/readme.txt
>  delete mode 100644 board/avnet/zedboard/readme.txt
>  delete mode 100644 board/xilinx/zc706/readme.txt
>  create mode 100644 board/zynq/readme.txt
>
> diff --git a/board/avnet/microzed/readme.txt b/board/avnet/microzed/readme.txt
> deleted file mode 100644
> index 927e97a..0000000
> --- a/board/avnet/microzed/readme.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -This is the buildroot board support for the Avnet Microzed. The Microzed is
> -a development board based on the Xilinx Zynq-7000 based All-Programmable
> -System-On-Chip.
> -
> -Microzed information including schematics, reference designs, and manuals are
> -available from http://www.zedboard.org .
> -
> -Steps to create a working system for Microzed:
> -
> -1) make zynq_microzed_defconfig
> -2) make
> -2) make
> -3) All needed files will be available in the output/images directory.
> -   Create a FAT32 partition at the beginning of your SD Card and copy files:
> -     - boot.bin
> -     - u-boot.img
> -     - uImage
> -     - uramdisk.image.gz (should be renamed from rootfs.cpio.uboot)
> -     - devicetree.dtb (should be renamed from zynq-zed.dtb)
> -   into your SD card
> -4) boot your Microzed
> -
> -Note th at the DTB (zynq-zed.dtb) is the same as the one used for the
> -Zedboard, and that this is the recommended solution, see
> -https://forums.xilinx.com/t5/Embedded-Linux/Microzed-default-device-tree-dts/td-p/432856.
> -
> -You can alter the booting procedure by creating a file uEnv.txt
> -in the root of the SD card. It is a plain text file in format
> -<key>=<value> one per line:
> -
> -kernel_image=myimage
> -modeboot=myboot
> -myboot=...
> diff --git a/board/avnet/zedboard/readme.txt b/board/avnet/zedboard/readme.txt
> deleted file mode 100644
> index b2c30a3..0000000
> --- a/board/avnet/zedboard/readme.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -This is the buildroot board support for the Avnet Zedboard. The Zedboard is
> -a development board based on the Xilinx Zynq-7000 based All-Programmable
> -System-On-Chip.
> -
> -Zedboard information including schematics, reference designs, and manuals are
> -available from http://www.zedboard.org .
> -
> -Steps to create a working system for Zedboard:
> -
> -1) make zynq_zed_defconfig
> -2) make
> -3) All needed files will be available in the output/images directory.
> -   Create a FAT32 partition at the beginning of your SD Card and copy files:
> -     - boot.bin
> -     - u-boot.img
> -     - uImage
> -     - uramdisk.image.gz (should be renamed from rootfs.cpio.uboot)
> -     - devicetree.dtb (should be renamed from zynq-zed.dtb)
> -   into your SD card
> -4) boot your Zedboard
> -
> -You can alter the booting procedure by creating a file uEnv.txt
> -in the root of the SD card. It is a plain text file in format
> -<key>=<value> one per line:
> -
> -kernel_image=myimage
> -modeboot=myboot
> -myboot=...
> diff --git a/board/xilinx/zc706/readme.txt b/board/xilinx/zc706/readme.txt
> deleted file mode 100644
> index 5034658..0000000
> --- a/board/xilinx/zc706/readme.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -This is the Buildroot board support for the Xilinx ZC706. The ZC706 is
> -a development board based on the Xilinx Zynq-7000 based
> -All-Programmable System-On-Chip.
> -
> -ZC706 information including schematics, reference designs, and manuals
> -are available from
> -http://www.xilinx.com/products/boards-and-kits/ek-z7-zc706-g.html.
> -
> -Steps to create a working system for ZC706 board:
> -
> -1) make zynq_zc706_defconfig
> -2) make
> -3) All needed files will be available in the output/images directory.
> -   Create a FAT32 partition at the beginning of your SD Card and copy files:
> -     - boot.bin
> -     - u-boot.img
> -     - uImage
> -     - uramdisk.image.gz (should be renamed from rootfs.cpio.uboot)
> -     - devicetree.dtb (should be renamed from zynq-zc706.dtb)
> -   into your SD card
> -4) boot your ZC706 board
> -
> -You can alter the booting procedure by creating a file uEnv.txt
> -in the root of the SD card. It is a plain text file in format
> -<key>=<value> one per line:
> -
> -kernel_image=myimage
> -modeboot=myboot
> -myboot=...
> diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
> new file mode 100644
> index 0000000..73f8bf3
> --- /dev/null
> +++ b/board/zynq/readme.txt
> @@ -0,0 +1,52 @@
> +This is the Buildroot support for Zynq boards.  Zynq boards are available from
> +Xilinx and some third party vendors, but the build procedure is very similar.
> +
> +Currently, three boards are natively supported by Buildroot:
> + - Xilinx ZC706 board (zynq_zc706_defconfig)
> + - Avnet ZedBoard (zynq_zed_defconfig)
> + - Avnet MicroZed (zynq_microzed_defconfig)
> +
> +The following build procedure focuses on them, but you can adjust it to your
> +board even if it is not listed above.  Major Zynq-based boards are supported by
> +U-Boot, and their Device Trees are merged in Linux Kernel.  If your board is the
> +case, booting the kernel is a piece of cake.  All you need to do is to change:
> + - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
> + - U-Boot board defconfig (BR2_TARGET_UBOOT_BOARDNAME)
> +
> +Steps to create a working system for a Zynq board:
> +
> +1) Configuration (do one of the followings)
> +    make zynq_zc706_defconfig     (ZC706)
> +    make zynq_zed_defconfig       (Zedboard)
> +    make zynq_microzed_defconfig  (MicroZed)
> +2) make
> +3) All needed files will be available in the output/images directory.
> +   Create a FAT32 partition at the beginning of your SD Card and copy files:
> +     - boot.bin
> +     - u-boot.img
> +     - uImage
> +     - uramdisk.image.gz (should be renamed from rootfs.cpio.uboot)
> +     - devicetree.dtb (should be renamed from zynq-***.dtb)
> +   into your SD card
> +4) boot your board
> +
> +You can alter the booting procedure by creating a file uEnv.txt
> +in the root of the SD card. It is a plain text file in format
> +<key>=<value> one per line:
> +
> +kernel_image=myimage
> +modeboot=myboot
> +myboot=...
> +
> +Note:
> +The DTB for MicroZed is the same as the one for the Zedboard (zynq-zed.dtb),
> +and this is the recommended solution, see
> +https://forums.xilinx.com/t5/Embedded-Linux/Microzed-default-device-tree-dts/td-p/432856.
> +

See patch 6 of this series, I think you may want to pull the
instructions for custom handoff files over to here.

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> +References:
> + - ZC706 information including schematics, reference designs, and manuals are
> +   available from
> +   http://www.xilinx.com/products/boards-and-kits/ek-z7-zc706-g.html.
> +
> + - Zedboard/Microzed information including schematics, reference designs, and
> +   manuals are available from http://www.zedboard.org .
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
