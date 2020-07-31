From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 31 Jul 2020 13:40:55 -0700
Subject: [Buildroot] [PATCH 4/9] package/libselinux: enable kernel selinux
 support for ext3 images
In-Reply-To: <20200731204100.1171427-1-aduskett@gmail.com>
References: <20200731204100.1171427-1-aduskett@gmail.com>
Message-ID: <20200731204100.1171427-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If BR2_TARGET_ROOTFS_EXT2_3 is selected, enable the following kernel options:
  - CONFIG_EXT3_FS_SECURITY

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libselinux/libselinux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 77efe2d8e0..525f4fe9a2 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -118,6 +118,8 @@ define LIBSELINUX_LINUX_CONFIG_FIXUPS
 	$(if $(BR2_TARGET_ROOTFS_EXT2),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_EXT2_FS_XATTR)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_EXT2_FS_SECURITY))
+	$(if $(BR2_TARGET_ROOTFS_EXT2_3),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_EXT3_FS_SECURITY))
 endef
 
 $(eval $(generic-package))
-- 
2.26.2
