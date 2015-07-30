From: =?UTF-8?Q?No=C3=A9_Rubinstein?= <noe.rubinstein@gmail.com>
Date: Thu, 30 Jul 2015 18:42:37 +0200
Subject: [Buildroot] [PATCH 1/2] fs/iso9660: fix hybrid image support
In-Reply-To: <20150730170352.0331b2c4@free-electrons.com>
References: <1438267651-16818-1-git-send-email-nrubinstein@aldebaran.com>
 <20150730165052.1eea5a29@free-electrons.com>
 <CAOccFZCnm3yrooc7uwiAphQz9SEzFtmMkUwCyv3z6EY_OknRSg@mail.gmail.com>
 <20150730170352.0331b2c4@free-electrons.com>
Message-ID: <CAOccFZBc5Nn1F5fKTMJT6U6mjBd0z88hrKLk18vFQLnKSAkiig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hum then maybe in the end my _POST_GEN_HOOKS idea is better?

Would you prefer something like:

>  define ROOTFS_ISO9660_CMD
>         $(HOST_DIR)/usr/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
>                 -no-emul-boot -boot-load-size 4 -boot-info-table \
> -               -o $@ $(ROOTFS_ISO9660_TARGET_DIR)
> +               -o $@ $(ROOTFS_ISO9660_TARGET_DIR) ; \
> +       $(ROOTFS_ISO9660_GEN_HYBRID)
>  endef

--
No? Rubinstein
