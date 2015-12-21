From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Mon, 21 Dec 2015 16:18:56 +0200
Subject: [Buildroot] [PATCH 1/1] nfs-utils: install /etc/nfsmount.conf
In-Reply-To: <1450707537-30154-1-git-send-email-yba@tkos.co.il>
References: <1450707537-30154-1-git-send-email-yba@tkos.co.il>
Message-ID: <1450707537-30154-2-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

Installs /etc/nfsmount.conf on the target, mainly to be able to configure the
the NFS version that mount.nfs uses by default.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/nfs-utils/nfs-utils.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 30f12fd..55b75e2 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -38,6 +38,9 @@ endif
 define NFS_UTILS_INSTALL_FIXUP
 	rm -f $(NFS_UTILS_TARGETS_)
 	touch $(TARGET_DIR)/etc/exports
+	$(INSTALL) -m 744 \
+		$(BUILD_DIR)/nfs-utils-$(NFS_UTILS_VERSION)/utils/mount/nfsmount.conf \
+		$(TARGET_DIR)/etc
 endef
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
 
-- 
1.7.9.5
