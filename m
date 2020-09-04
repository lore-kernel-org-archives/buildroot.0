From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 15:43:51 +0200
Subject: [Buildroot] [git commit] package/libselinux: enable kernel selinux
 support for squashfs images
Message-ID: <20200904133609.4FC6186F35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c962a341df242e44948d1bc2a93fe4bff9c2e3fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_TARGET_ROOTFS_SQUASHFS is selected, enable the following kernel options:
  - CONFIG_SQUASHFS_XATTR

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
