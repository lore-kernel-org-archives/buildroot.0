From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Apr 2019 11:49:01 +0200
Subject: [Buildroot] [PATCH v2 1/1] board: rename pine64 to pine64_a64
In-Reply-To: <lNEO_Exlu8W8Rjcd0oJ5vQ2ptr6KvnyYieAxGJuwAPSSa4Go3VPYfrZObxeECm6eCv1iWrGk1aaI8GXfqh1qEMvKZ5Nm_H0Ul49slqofIKA=@philipmolloy.com>
References: <lNEO_Exlu8W8Rjcd0oJ5vQ2ptr6KvnyYieAxGJuwAPSSa4Go3VPYfrZObxeECm6eCv1iWrGk1aaI8GXfqh1qEMvKZ5Nm_H0Ul49slqofIKA=@philipmolloy.com>
Message-ID: <be5ea5a8-7393-7293-200d-cc5f1fc7e365@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Philip, Jagan,

 Let's sort out this confusion...

On 30/03/2019 22:27, Philip Molloy wrote:
> The link to https://www.pine64.org/?page_id=1194 in
> board/pine64/pine64/readme.txt loads a page for the "PINE A64" board.
> Follow the convention of using the model name to identify the board.

 One thing is clear: the vendor is pine64. The names of the boards, however,
don't seem so clear...

 If I look at the pine64.org website, I see on the front page (at the moment)
three boards advertised, and they are named PINE A64-LTS, ROCK64, and SOPINE A64.

 So I think we have two options. Either we keep the A64 bit, and the three
current boards should be named:

pine64_pine_a64_defconfig and board/pine64/pine_a64
pine64_rock64_defconfig and board/pine64/rock64
pine64_sopine_a64_defconfig and board/pine64/sopine_a64

 Or we say that the a64 is a bit redundant, and we call them

pine64_pine_defconfig and board/pine64/pine
pine64_rock64_defconfig and board/pine64/rock64
pine64_sopine_defconfig and board/pine64/sopine


 Jagan, do you agree with this?


 We could also choose to follow the names chosen by U-Boot and the kernel. In
that case, the current situation is already good, because the Pine A64 board is
called pine64_plus in U-Boot and sun50i-a64-pine64 in the kernel.


 Regardless, the current patch is not correct, because it removes the 'pine'
part from the board name, and it doesn't follow the U-Boot and/or kernel
conventions. Therefore, I've marked this patch as Rejected in patchwork.

 Regards,
 Arnout


> Signed-off-by: Philip Molloy <philip@philipmolloy.com>
> ---
>  DEVELOPERS                                         | 2 +-
>  board/pine64/{pine64 => a64}/boot.cmd              | 0
>  board/pine64/{pine64 => a64}/genimage.cfg          | 0
>  board/pine64/{pine64 => a64}/readme.txt            | 8 ++++----
>  configs/{pine64_defconfig => pine64_a64_defconfig} | 4 ++--
>  5 files changed, 7 insertions(+), 7 deletions(-)
>  rename board/pine64/{pine64 => a64}/boot.cmd (100%)
>  rename board/pine64/{pine64 => a64}/genimage.cfg (100%)
>  rename board/pine64/{pine64 => a64}/readme.txt (80%)
>  rename configs/{pine64_defconfig => pine64_a64_defconfig} (93%)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 002ffa09c7..527fa85280 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1030,7 +1030,7 @@ F:	configs/orangepi_pc2_defconfig
>  F:	configs/orangepi_prime_defconfig
>  F:	configs/orangepi_win_defconfig
>  F:	configs/orangepi_zero_plus2_defconfig
> -F:	configs/pine64_defconfig
> +F:	configs/pine64_a64_defconfig
>  F:	configs/pine64_sopine_defconfig
> 
>  N:	James Hilliard <james.hilliard1@gmail.com>
> diff --git a/board/pine64/pine64/boot.cmd b/board/pine64/a64/boot.cmd
> similarity index 100%
> rename from board/pine64/pine64/boot.cmd
> rename to board/pine64/a64/boot.cmd
> diff --git a/board/pine64/pine64/genimage.cfg b/board/pine64/a64/genimage.cfg
> similarity index 100%
> rename from board/pine64/pine64/genimage.cfg
> rename to board/pine64/a64/genimage.cfg
> diff --git a/board/pine64/pine64/readme.txt b/board/pine64/a64/readme.txt
> similarity index 80%
> rename from board/pine64/pine64/readme.txt
> rename to board/pine64/a64/readme.txt
> index 85226fdd17..c35bf62037 100644
> --- a/board/pine64/pine64/readme.txt
> +++ b/board/pine64/a64/readme.txt
> @@ -2,10 +2,10 @@ Intro
>  =====
> 
>  This default configuration will allow you to start experimenting with the
> -buildroot environment for the Pine64. With the current configuration
> +buildroot environment for the Pine A64. With the current configuration
>  it will bring-up the board, and allow access through the serial console.
> 
> -Pine64 link:
> +Pine A64 link:
>  https://www.pine64.org/?page_id=1194
> 
>  Wiki link:
> @@ -16,7 +16,7 @@ This configuration uses U-Boot mainline and kernel mainline.
>  How to build
>  ============
> 
> -    $ make pine64_defconfig
> +    $ make pine64_a64_defconfig
> 
>      $ make
> 
> @@ -34,5 +34,5 @@ Copy the bootable "sdcard.img" onto an SD card with "dd":
>    $ sudo dd if=output/images/sdcard.img of=/dev/sdX
>    $ sudo sync
> 
> -Insert the micro SDcard in your Pine64 and power it up. The console
> +Insert the micro SDcard in your Pine A64 and power it up. The console
>  is on the serial line, 115200 8N1.
> diff --git a/configs/pine64_defconfig b/configs/pine64_a64_defconfig
> similarity index 93%
> rename from configs/pine64_defconfig
> rename to configs/pine64_a64_defconfig
> index 6e8eb15d73..17b10715e8 100644
> --- a/configs/pine64_defconfig
> +++ b/configs/pine64_a64_defconfig
> @@ -37,11 +37,11 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-pine64"
> 
>  # Filesystem
> -BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to PINE A64"
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pine64/genimage.cfg"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/a64/genimage.cfg"
> --
> 2.17.2
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
