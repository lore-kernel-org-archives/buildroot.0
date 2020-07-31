From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 31 Jul 2020 13:40:59 -0700
Subject: [Buildroot] [PATCH 8/9] package/libselinux: enable kernel selinux
 support for squashfs images
In-Reply-To: <20200731204100.1171427-1-aduskett@gmail.com>
References: <20200731204100.1171427-1-aduskett@gmail.com>
Message-ID: <20200731204100.1171427-9-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If BR2_TARGET_ROOTFS_SQUASHFS is selected, enable the following kernel options:
  - CONFIG_SQUASHFS_XATTR

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libselinux/libselinux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 3dee922214..f2c2922122 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -127,6 +127,8 @@ define LIBSELINUX_LINUX_CONFIG_FIXUPS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_F2FS_FS_SECURITY))
 	$(if $(BR2_TARGET_ROOTFS_JFFS2),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_JFS_SECURITY))
+	$(if $(BR2_TARGET_ROOTFS_SQUASHFS),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SQUASHFS_XATTR))
 endef
 
 $(eval $(generic-package))
-- 
2.26.2
