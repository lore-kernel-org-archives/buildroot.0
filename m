From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 31 Jul 2020 13:40:54 -0700
Subject: [Buildroot] [PATCH 3/9] package/libselinux: enable kernel selinux
 support for ext2 images
In-Reply-To: <20200731204100.1171427-1-aduskett@gmail.com>
References: <20200731204100.1171427-1-aduskett@gmail.com>
Message-ID: <20200731204100.1171427-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If BR2_TARGET_ROOTFS_EXT2 is selected, enable the following kernel options:
  - CONFIG_EXT2_FS_XATTR
  - CONFIG_EXT2_FS_SECURITY

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
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
-- 
2.26.2
