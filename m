From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Mar 2011 23:46:54 +0100
Subject: [Buildroot] [git commit master 1/1] fakeroot: use --program-prefix
	rather than manually renaming binaries
Message-ID: <20110313224722.2194090000@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b698051d599206a9b90e425a8fc54225410dd762
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fakeroot/fakeroot.mk |   10 +---------
 1 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index a672804..8061443 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -6,6 +6,7 @@
 FAKEROOT_VERSION:=1.9.5
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://snapshot.debian.org/archive/debian/20080427T000000Z/pool/main/f/fakeroot/
+FAKEROOT_CONF_OPT = --program-prefix=''
 
 define FAKEROOT_PATCH_FAKEROOT_IN
 	# If using busybox getopt, make it be quiet.
@@ -15,14 +16,5 @@ endef
 
 FAKEROOT_POST_PATCH_HOOKS += FAKEROOT_PATCH_FAKEROOT_IN
 
-define FAKEROOT_RENAME_TARGET_BINARIES
-	-mv $(TARGET_DIR)/usr/bin/$(ARCH)-*-faked \
-		$(TARGET_DIR)/usr/bin/faked
-	-mv $(TARGET_DIR)/usr/bin/$(ARCH)-*-fakeroot \
-		$(TARGET_DIR)/usr/bin/fakeroot
-endef
-
-FAKEROOT_POST_INSTALL_TARGET_HOOKS += FAKEROOT_RENAME_TARGET_BINARIES
-
 $(eval $(call AUTOTARGETS,package,fakeroot))
 $(eval $(call AUTOTARGETS,package,fakeroot,host))
-- 
1.7.3.4
