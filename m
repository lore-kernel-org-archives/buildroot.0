From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2015 17:40:41 +0200
Subject: [Buildroot] [PATCHv2 11/15] fs/iso9660: use 'depends on'
 instead of 'select' for bootloader
In-Reply-To: <1433802108-14351-12-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433802108-14351-12-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150614154041.GI3615@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-09 00:21 +0200, Thomas Petazzoni spake thusly:
> In preparation to the introduction of the support for other
> bootloaders than Grub, this commit switches from having the iso9660
> support "select" the necessary bootloader to using a "depends on".
> 
> The main motivation is that the isolinux bootloader support will
> really need to do a "depends on", due to the need of having a certain
> option enabled, but this option being a kconfig "choice".
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  fs/iso9660/Config.in | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
> index f5e5f32..cd7b175 100644
> --- a/fs/iso9660/Config.in
> +++ b/fs/iso9660/Config.in
> @@ -2,6 +2,7 @@ config BR2_TARGET_ROOTFS_ISO9660
>  	bool "iso image"
>  	depends on (BR2_i386 || BR2_x86_64)
>  	depends on BR2_LINUX_KERNEL
> +	depends on BR2_TARGET_GRUB
>  	select BR2_LINUX_KERNEL_INSTALL_TARGET \
>  	       if (!BR2_TARGET_ROOTFS_ISO9660_INITRD && !BR2_TARGET_ROOTFS_INITRAMFS)
>  	help
> @@ -25,7 +26,7 @@ choice
>  
>  config BR2_TARGET_ROOTFS_ISO9660_GRUB
>  	bool "grub"
> -	select BR2_TARGET_GRUB
> +	depends on BR2_TARGET_GRUB
>  	select BR2_TARGET_GRUB_FS_ISO9660
>  
>  endchoice
> @@ -52,6 +53,6 @@ config BR2_TARGET_ROOTFS_ISO9660_INITRD
>  
>  endif
>  
> -comment "iso image needs a Linux kernel to be built"
> +comment "iso image needs a Linux kernel and grub to be built"
>  	depends on BR2_i386 || BR2_x86_64
> -	depends on !BR2_LINUX_KERNEL
> +	depends on !BR2_LINUX_KERNEL || !BR2_TARGET_GRUB
> -- 
> 2.1.0
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
