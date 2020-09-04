From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 15:43:44 +0200
Subject: [Buildroot] [git commit] package/libselinux: enable kernel selinux
 support for ext4 images
Message-ID: <20200904133609.2BF5086F35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aae170c468b26940974bec403c2907ea34e734d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_TARGET_ROOTFS_EXT2_4 is selected, enable the following kernel options:
  - CONFIG_EXT4_FS_SECURITY

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libselinux/libselinux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 525f4fe9a2..44d9ec3657 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -120,6 +120,8 @@ define LIBSELINUX_LINUX_CONFIG_FIXUPS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_EXT2_FS_SECURITY))
 	$(if $(BR2_TARGET_ROOTFS_EXT2_3),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_EXT3_FS_SECURITY))
+	$(if $(BR2_TARGET_ROOTFS_EXT2_4),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_EXT4_FS_SECURITY))
 endef
 
 $(eval $(generic-package))
