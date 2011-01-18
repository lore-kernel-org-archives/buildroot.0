From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 18 Jan 2011 09:23:40 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: fix busybox-menuconfig
	after 69df644f5
Message-ID: <20110118082433.298848A3AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0705e448a484eca77bca37b96ee0ef03f55251e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3109

Pass the correct -C <dir> option to make menuconfig.

Signed-off-by: Kim Jae-hui <twinkle.j4k@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    1 +
 package/busybox/busybox.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index bbc2d42..baddfad 100644
--- a/CHANGES
+++ b/CHANGES
@@ -44,6 +44,7 @@
 	#2965: Broken linkage to xkbcomp (blocking X server startup)
 	#2983: xlib_libX11 build failed
 	#3007: kexec doesn't build: Missing regdef.h file
+	#3109: abnormal `make busybox-menuconfig`
 
 2010.11, Released November 30th, 2010:
 
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 38897f7..5583bc6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -151,7 +151,7 @@ endef
 $(eval $(call GENTARGETS,package,busybox))
 
 busybox-menuconfig:	$(BUSYBOX_DIR)/.stamp_extracted
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) menuconfig
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) menuconfig
 	rm -f $(BUSYBOX_DIR)/.stamp_built
 	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
 
-- 
1.7.3.4
