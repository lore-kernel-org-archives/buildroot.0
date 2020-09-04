From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 15:43:47 +0200
Subject: [Buildroot] [git commit] package/libselinux: enable kernel selinux
 support for f2fs images
Message-ID: <20200904133609.383DF86F35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=664c370d0b64df43b98dca93429c56ad0ed2c4a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_TARGET_ROOTFS_F2FS is selected, enable the following kernel options:
  - CONFIG_F2FS_FS_XATTR
  - CONFIG_F2FS_FS_SECURITY

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libselinux/libselinux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 44d9ec3657..c16dcdf1d0 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -122,6 +122,9 @@ define LIBSELINUX_LINUX_CONFIG_FIXUPS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_EXT3_FS_SECURITY))
 	$(if $(BR2_TARGET_ROOTFS_EXT2_4),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_EXT4_FS_SECURITY))
+	$(if $(BR2_TARGET_ROOTFS_F2FS),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_F2FS_FS_XATTR)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_F2FS_FS_SECURITY))
 endef
 
 $(eval $(generic-package))
