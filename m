From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 16:50:52 +0200
Subject: [Buildroot] [PATCH 1/2] fs/iso9660: fix hybrid image support
In-Reply-To: <1438267651-16818-1-git-send-email-nrubinstein@aldebaran.com>
References: <1438267651-16818-1-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <20150730165052.1eea5a29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Jul 2015 16:47:30 +0200, No? Rubinstein wrote:

> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index d836194..9100547 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -146,15 +146,14 @@ endif # ROOTFS_ISO9660_USE_INITRD
>  define ROOTFS_ISO9660_CMD
>  	$(HOST_DIR)/usr/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
>  		-no-emul-boot -boot-load-size 4 -boot-info-table \
> -		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
> +		-o $@ $(ROOTFS_ISO9660_TARGET_DIR) \
> +	$(if $(ROOTFS_ISO9660_GEN_HYBRID), && $(ROOTFS_ISO9660_GEN_HYBRID))

Can you resubmit with the && thing ? It is not needed: make will
abort automatically if genisoimage fails.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
