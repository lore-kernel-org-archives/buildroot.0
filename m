From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 22 Jul 2015 19:29:16 +0300
Subject: [Buildroot] [PATCH] e2fsprogs: remove more busybox applet links
Message-ID: <ab0038f8843309692e0f0a502b3223fe2525fa19.1437582556.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following commit aa02829240b2 (e2fsprogs: remove busybox tune2fs when
installing full version, 2015-07-08), remove the rest of Busybox e2fsprogs
applet links. All of them are installed in different locations than upstream
e2fsprogs.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/e2fsprogs/e2fsprogs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index ca54b706b6c5..c863f702ce6a 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -109,9 +109,11 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 E2FSPROGS_DEPENDENCIES += busybox
 
 define E2FSPROGS_REMOVE_BUSYBOX_APPLETS
+	$(RM) -f $(TARGET_DIR)/bin/chattr
+	$(RM) -f $(TARGET_DIR)/bin/lsattr
+	$(RM) -f $(TARGET_DIR)/sbin/fsck
 	$(RM) -f $(TARGET_DIR)/sbin/tune2fs
 	$(RM) -f $(TARGET_DIR)/sbin/e2label
-
 endef
 E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_REMOVE_BUSYBOX_APPLETS
 endif
-- 
2.1.4
