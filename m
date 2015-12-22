From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Tue, 22 Dec 2015 19:12:17 +0200
Subject: [Buildroot] [PATCH 1/1 v1] nfs-utils: install /etc/nfsmount.conf
Message-ID: <1450804337-23440-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

Installs /etc/nfsmount.conf on the target, mainly to be able to configure the
the NFS version that mount.nfs uses by default. Without this ability you are
likely to encounter mount errors when automounting directories from NFS
version 3 servers.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/nfs-utils/nfs-utils.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 30f12fd..6dd175c 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -38,6 +38,8 @@ endif
 define NFS_UTILS_INSTALL_FIXUP
 	rm -f $(NFS_UTILS_TARGETS_)
 	touch $(TARGET_DIR)/etc/exports
+	$(INSTALL) -D -m 644 \
+		$(@D)/utils/mount/nfsmount.conf $(TARGET_DIR)/etc/nfsmount.conf
 endef
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
 
-- 
1.7.9.5
