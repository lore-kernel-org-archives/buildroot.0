From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Aug 2015 23:08:41 +0200
Subject: [Buildroot] [PATCH] fs: iso9660: change boot menu entry text
In-Reply-To: <1439326861-11486-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1439326861-11486-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20150811210841.GE3627@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivien, All,

On 2015-08-11 17:01 -0400, Vivien Didelot spake thusly:
> Replace Grub-specific "menu.lst" with "menu config" in the
> BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU Kconfig entry text.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  fs/iso9660/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
> index 7e1ddd6..bab9eec 100644
> --- a/fs/iso9660/Config.in
> +++ b/fs/iso9660/Config.in
> @@ -47,7 +47,7 @@ config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
>  endchoice
>  
>  config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
> -	string "Boot menu.lst file"
> +	string "Boot menu config file"

Yes, that's better.

>  	default "fs/iso9660/menu.lst" if BR2_TARGET_ROOTFS_ISO9660_GRUB
>  	default "fs/iso9660/grub.cfg" if BR2_TARGET_ROOTFS_ISO9660_GRUB2
>  	default "fs/iso9660/isolinux.cfg" if BR2_TARGET_ROOTFS_ISO9660_ISOLINUX

The following lines read:

    help
      Use this option to provide a custom bootloader configuration
      file (menu.lst for Grub, isolinux.cfg for isolinux).

Care to fix that text too (missing grub.cfg for grub2) and respin,
please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
