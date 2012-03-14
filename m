From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Mar 2012 18:29:18 +0100
Subject: [Buildroot] [PATCH 2/2] fs/initramfs: refactor with fs/cpio
In-Reply-To: <CAAXf6LUAB_peHpGDsgv6P3W3sQ3MOeKOvwNpR77YZgcvE4N6RA@mail.gmail.com>
References: <1315343769-530-1-git-send-email-arnout@mind.be>
 <201203131715.58195.arnout@mind.be>
 <CAAXf6LUAB_peHpGDsgv6P3W3sQ3MOeKOvwNpR77YZgcvE4N6RA@mail.gmail.com>
Message-ID: <201203141829.18938.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 14 March 2012 15:19:33 Thomas De Schampheleire wrote:
> linux/linux.mk contains:
>         $(if $(BR2_TARGET_ROOTFS_INITRAMFS),
>                 touch $(BINARIES_DIR)/rootfs.cpio
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
>                 $(call
> KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.cpio\",$(@D)/.config)
>                 ...
> 
> This means that this code will be executed, even if
> BR2_TARGET_ROOTFS_INITRAMFS is explicitly set to 'n'. This may not be
> a common case, but I think it is valid to do so (I do so).

 I don't think it is valid to do so.  There are many places where we
expect Kconfig booleans to be either unquoted 'y' or nothing.  If you do
need to override a config variable (in local.mk or on the command line),
BR2_FOO= works well enough.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
