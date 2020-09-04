From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 15:43:49 +0200
Subject: [Buildroot] [git commit] package/libselinux: enable kernel selinux
 support for jffs2 images
Message-ID: <20200904133609.41EEA86F35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7720ca37b715a8fb124b4e8f45451c8189d9cc61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_TARGET_ROOTFS_JFFS2 is selected, enable the following kernel options:
  - CONFIG_JFS_SECURITY

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
