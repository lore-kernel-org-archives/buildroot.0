From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 22:36:19 +0200
Subject: [Buildroot] [git commit] e2fsprogs: remove more busybox applet links
Message-ID: <20150722203626.EAF7881DD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6b701c0cc983d4ea6b36d8e5de18e118c94eb9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following commit aa02829240b2 (e2fsprogs: remove busybox tune2fs when
installing full version, 2015-07-08), remove the rest of Busybox e2fsprogs
applet links. All of them are installed in different locations than upstream
e2fsprogs.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/e2fsprogs.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index ca54b70..c863f70 100644
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
