From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 15:43:38 +0200
Subject: [Buildroot] [git commit] package/libselinux: enable kernel selinux
 support for ext2 images
Message-ID: <20200904133609.1491D86F35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=856b997b18fdef2ab4488c9cc31b463f26115946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_TARGET_ROOTFS_EXT2 is selected, enable the following kernel options:
  - CONFIG_EXT2_FS_XATTR
  - CONFIG_EXT2_FS_SECURITY

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libselinux/libselinux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index b8f9c3b55a..77efe2d8e0 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -115,6 +115,9 @@ define LIBSELINUX_LINUX_CONFIG_FIXUPS
 	$(if $(BR2_TARGET_ROOTFS_EROFS),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_EROFS_FS_XATTR)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_EROFS_FS_SECURITY))
+	$(if $(BR2_TARGET_ROOTFS_EXT2),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_EXT2_FS_XATTR)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_EXT2_FS_SECURITY))
 endef
 
 $(eval $(generic-package))
