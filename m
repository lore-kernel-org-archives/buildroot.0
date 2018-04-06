From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 21:36:43 +0200
Subject: [Buildroot] [PATCH 1/2] configs/at91sam9g20dfc: add ubifs
 target filesystem
In-Reply-To: <1522963284-32258-1-git-send-email-joshua.henderson@microchip.com>
References: <1522963284-32258-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20180406213643.4ed8180b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 Apr 2018 14:21:23 -0700, Joshua Henderson wrote:

>  # Filesystem
>  BR2_TARGET_ROOTFS_TAR=y
> +BR2_TARGET_ROOTFS_UBI=y
> +BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2047

I guess these are the two options left after doing a "make
savedefconfig". However, I would be more comfortable if you made
explicit the other important options about UBI, like it is the case in
other Atmel defconfigs:

BR2_TARGET_ROOTFS_UBIFS=y
BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x3e000
BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x1000
BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2082
BR2_TARGET_ROOTFS_UBI=y
BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
BR2_TARGET_ROOTFS_UBI_SUBSIZE=0

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
