From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2015 22:55:42 +0200
Subject: [Buildroot] [PATCH] fs/iso9660: change the name of the tmp dir
 to be consistent
In-Reply-To: <1436820748-30551-1-git-send-email-arnout@mind.be>
References: <1436820748-30551-1-git-send-email-arnout@mind.be>
Message-ID: <20150713205542.GM4008@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-07-13 22:52 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Currently, the generated rootfs will be called rootfs.iso9660, but the
> temporary directory we create while building it is called
> rootfs-iso9660.tmp. They are in different directories so it's not so
> obvious, but still to be consistent it's better to call the temp dir
> rootfs.iso9660.tmp.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  fs/iso9660/iso9660.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index 6ed979c..d836194 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -35,7 +35,7 @@ ROOTFS_ISO9660_USE_INITRD = YES
>  endif
>  
>  ifeq ($(ROOTFS_ISO9660_USE_INITRD),YES)
> -ROOTFS_ISO9660_TARGET_DIR = $(BUILD_DIR)/rootfs-iso9660.tmp
> +ROOTFS_ISO9660_TARGET_DIR = $(BUILD_DIR)/rootfs.iso9660.tmp
>  define ROOTFS_ISO9660_CREATE_TEMPDIR
>  	$(RM) -rf $(ROOTFS_ISO9660_TARGET_DIR)
>  	mkdir -p $(ROOTFS_ISO9660_TARGET_DIR)
> -- 
> 2.1.4
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
