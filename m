From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun, 7 Sep 2008 01:15:13 +0200
Subject: [Buildroot] [PATCH] xapp_xman: fix paths
Message-ID: <200809070115.13870.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xapp_xman: fix paths

---
 package/x11r7/xapp_xman/xapp_xman.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index cc55734..4e207fd 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -16,7 +16,7 @@ $(XAPP_XMAN_DIR)/.extracted: $(DL_DIR)/$(XAPP_XMAN_SOURCE)
 	touch $@
 
 $(XAPP_XMAN_DIR)/.patched: $(XAPP_XMAN_DIR)/.extracted
-	toolchain/patch-kernel.sh $(XAPP_XMAN_DIR) package/xapp_xman/ xapp_xman\*.patch
+	toolchain/patch-kernel.sh $(XAPP_XMAN_DIR) package/x11r7/xapp_xman/ xapp_xman\*.patch
 	touch $@
 
 $(XAPP_XMAN_DIR)/.configured: $(XAPP_XMAN_DIR)/.patched
-- 
1.5.6.4
