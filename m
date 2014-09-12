From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 11 Sep 2014 22:21:07 -0400
Subject: [Buildroot] [PATCH 1/1] tiff: ensure directory exists before
	installing to it
Message-ID: <1410488467-2093-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, don't ignore errors during installation.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/tiff/tiff.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 8d2e087..c61894b 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -76,7 +76,8 @@ ifneq ($(BR2_PACKAGE_TIFF_JBIG),y)
 endif
 
 define TIFF_INSTALL_TARGET_CMDS
-	-cp -a $(@D)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
+	mkdir -p $(TARGET_DIR)/usr/lib/
+	cp -a $(@D)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
 	for i in $(TIFF_TOOLS_LIST); \
 	do \
 		$(INSTALL) -m 755 -D $(@D)/tools/$$i $(TARGET_DIR)/usr/bin/$$i; \
-- 
1.7.9.5
