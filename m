From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 31 Jul 2020 13:40:57 -0700
Subject: [Buildroot] [PATCH 6/9] package/libselinux: enable kernel selinux
 support for f2fs images
In-Reply-To: <20200731204100.1171427-1-aduskett@gmail.com>
References: <20200731204100.1171427-1-aduskett@gmail.com>
Message-ID: <20200731204100.1171427-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If BR2_TARGET_ROOTFS_F2FS is selected, enable the following kernel options:
  - CONFIG_F2FS_FS_XATTR
  - CONFIG_F2FS_FS_SECURITY

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
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
-- 
2.26.2
