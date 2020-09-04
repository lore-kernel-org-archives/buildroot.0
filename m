From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 15:43:54 +0200
Subject: [Buildroot] [git commit] package/libselinux: enable kernel selinux
 support for ubifs images
Message-ID: <20200904133609.5BBD787609@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ab421080cfc6157c6cdf2d8c4c6443119760297
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_TARGET_ROOTFS_UBIFS is selected, enable the following kernel options:
  - CONFIG_UBIFS_FS_XATTR
  - CONFIG_UBIFS_FS_SECURITY

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
