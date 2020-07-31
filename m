From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 31 Jul 2020 13:41:00 -0700
Subject: [Buildroot] [PATCH 9/9] package/libselinux: enable kernel selinux
 support for ubifs images
In-Reply-To: <20200731204100.1171427-1-aduskett@gmail.com>
References: <20200731204100.1171427-1-aduskett@gmail.com>
Message-ID: <20200731204100.1171427-10-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If BR2_TARGET_ROOTFS_UBIFS is selected, enable the following kernel options:
  - CONFIG_UBIFS_FS_XATTR
  - CONFIG_UBIFS_FS_SECURITY

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libselinux/libselinux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index f2c2922122..c96b5a4431 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -129,6 +129,9 @@ define LIBSELINUX_LINUX_CONFIG_FIXUPS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_JFS_SECURITY))
 	$(if $(BR2_TARGET_ROOTFS_SQUASHFS),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SQUASHFS_XATTR))
+	$(if $(BR2_TARGET_ROOTFS_UBIFS),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_UBIFS_FS_XATTR)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_UBIFS_FS_SECURITY))
 endef
 
 $(eval $(generic-package))
-- 
2.26.2
