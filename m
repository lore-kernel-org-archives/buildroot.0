From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Aug 2015 23:26:12 +0200
Subject: [Buildroot] [PATCH v2] fs: iso9660: change boot menu entry text
In-Reply-To: <1439328230-17550-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1439328230-17550-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20150811212612.GF3627@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivien, All,

On 2015-08-11 17:23 -0400, Vivien Didelot spake thusly:
> Replace Grub-specific "menu.lst" with "menu config" in the
> BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU Kconfig entry text, and mention
> missing grub.cfg for Grub 2.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  fs/iso9660/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
> index 7e1ddd6..2482e44 100644
> --- a/fs/iso9660/Config.in
> +++ b/fs/iso9660/Config.in
> @@ -47,13 +47,14 @@ config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
>  endchoice
>  
>  config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
> -	string "Boot menu.lst file"
> +	string "Boot menu config file"
>  	default "fs/iso9660/menu.lst" if BR2_TARGET_ROOTFS_ISO9660_GRUB
>  	default "fs/iso9660/grub.cfg" if BR2_TARGET_ROOTFS_ISO9660_GRUB2
>  	default "fs/iso9660/isolinux.cfg" if BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
>  	help
>  	  Use this option to provide a custom bootloader configuration
> -	  file (menu.lst for Grub, isolinux.cfg for isolinux).
> +	  file (menu.lst for Grub, grub.cfg for Grub 2, isolinux.cfg for
> +	  isolinux).
>  
>  	  Note that the strings __KERNEL_PATH__ and __INITRD_PATH__
>  	  will automatically be replaced by the path to the kernel and
> -- 
> 2.5.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
