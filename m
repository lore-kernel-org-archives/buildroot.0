From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 14 Jul 2015 20:51:50 +0200
Subject: [Buildroot] [PATCH v4 3/7] boot/uboot: Add support for dtb.img
	format
In-Reply-To: <20150714171401.117b8fec@pcviktorin.fit.vutbr.cz>
References: <20150714171214.706e9e4d@pcviktorin.fit.vutbr.cz>
 <20150714171401.117b8fec@pcviktorin.fit.vutbr.cz>
Message-ID: <CAGduivyVPrJF=+ZdoNicew+g-cgRyecfZzxo-KGZvAoh5s3aEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan, all

On Tue, Jul 14, 2015 at 5:14 PM, Jan Viktorin <viktorin@rehivetech.com> wrote:
> Allow to generate u-boot-dtb.img. This is the same format
> as u-boot.img, however, it contains a built-in device-tree.
> This file is being loaded by the U-Boot SPL.
>
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  boot/uboot/Config.in | 3 +++
>  boot/uboot/uboot.mk  | 2 ++
>  2 files changed, 5 insertions(+)
>
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index fa1741c..0554544 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -109,6 +109,9 @@ config BR2_TARGET_UBOOT_FORMAT_BIN
>  config BR2_TARGET_UBOOT_FORMAT_IMG
>         bool "u-boot.img"
>
> +config BR2_TARGET_UBOOT_FORMAT_DTB_IMG
> +       bool "u-boot-dtb.img"
> +
>  config BR2_TARGET_UBOOT_FORMAT_IMX
>         bool "u-boot.imx"
>
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 2cfff28..e064a8e 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -47,6 +47,8 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
>  UBOOT_BIN = u-boot-nand.bin
>  else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
>  UBOOT_BIN = u-boot.img
> +else ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_IMG),y)
> +UBOOT_BIN = u-boot-dtb.img
>  else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
>  UBOOT_BIN = u-boot.imx
>  else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
> --
> 2.4.5
>
I agree with your patch, but I would prefer dtb_img entry to be before IMG.
I know that the file is not properly organized but that's not a reason
to worsen it.
Other than that (which could be fixed when merged) it's fine by me.

Reviewed-by "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
>
>
>
> --
>    Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
>    System Architect              Web:    www.RehiveTech.com
>    RehiveTech                    Phone:  +420 606 201 868
>    Brno, Czech Republic
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
