From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 31 Jul 2020 13:40:58 -0700
Subject: [Buildroot] [PATCH 7/9] package/libselinux: enable kernel selinux
 support for jffs2 images
In-Reply-To: <20200731204100.1171427-1-aduskett@gmail.com>
References: <20200731204100.1171427-1-aduskett@gmail.com>
Message-ID: <20200731204100.1171427-8-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If BR2_TARGET_ROOTFS_JFFS2 is selected, enable the following kernel options:
  - CONFIG_JFS_SECURITY

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libselinux/libselinux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index c16dcdf1d0..3dee922214 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -125,6 +125,8 @@ define LIBSELINUX_LINUX_CONFIG_FIXUPS
 	$(if $(BR2_TARGET_ROOTFS_F2FS),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_F2FS_FS_XATTR)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_F2FS_FS_SECURITY))
+	$(if $(BR2_TARGET_ROOTFS_JFFS2),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_JFS_SECURITY))
 endef
 
 $(eval $(generic-package))
-- 
2.26.2
