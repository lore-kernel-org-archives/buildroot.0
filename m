From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2015 16:59:15 +0200
Subject: [Buildroot] [PATCHv2 06/15] fs/iso9660: get grub splash from
 $(TARGET_DIR)
In-Reply-To: <1433802108-14351-7-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433802108-14351-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150614145915.GE3615@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-09 00:21 +0200, Thomas Petazzoni spake thusly:
> Instead of using directly the splash image from the Buildroot source
> directory boot/grub, this commit changes the iso9660 logic to use the
> splash image installed in $(TARGET_DIR)/boot/grub.
> 
> This effectively allows a user to use a custom splash image by
> installing it to $(TARGET_DIR) through a rootfs overlay or using a
> post-build script.
> 
> Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  fs/iso9660/iso9660.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index b3e6b9d..b313c65 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -11,7 +11,7 @@ ROOTFS_ISO9660_DEPENDENCIES = grub host-cdrkit host-fakeroot linux rootfs-cpio
>  
>  ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
>  define ROOTFS_ISO9660_SPLASHSCREEN
> -	$(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
> +	$(INSTALL) -D -m 0644 $(TARGET_DIR)/boot/grub/splash.xpm.gz \
>  		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/splash.xpm.gz
>  endef
>  else
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
