From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Mar 2011 21:33:26 +0200
Subject: [Buildroot] [git commit master 1/1] busybox: ensure source gets
	downloaded/extracted/patched before -menuconfig
Message-ID: <20110328193407.1B6FA819DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2c97608387f586f361e81a242d8838b9481369f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3511

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    1 +
 package/busybox/busybox.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index e4da26c..0908804 100644
--- a/CHANGES
+++ b/CHANGES
@@ -13,6 +13,7 @@
 	#3451: fakeroot package: wrong FAKEROOT_SITE variable
 	#3457: alsamixergui: broken URL
 	#3475: Calling sync on large filesystems when not always necessary
+	#3511: make busybox-menuconfig does not download busybox package
 
 2011.02, Released February 28th, 2011:
 
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 5583bc6..ffd6667 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -150,7 +150,7 @@ endef
 
 $(eval $(call GENTARGETS,package,busybox))
 
-busybox-menuconfig:	$(BUSYBOX_DIR)/.stamp_extracted
+busybox-menuconfig: busybox-patch
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) menuconfig
 	rm -f $(BUSYBOX_DIR)/.stamp_built
 	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
-- 
1.7.3.4
