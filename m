From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed,  7 Nov 2012 20:39:46 +0100
Subject: [Buildroot] [PATCH 1/1] qextserialport : fix download and bump
	version
Message-ID: <1352317186-2905-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/qextserialport/qextserialport-no-examples.patch | 17 -----------------
 package/qextserialport/qextserialport.mk                | 12 +++++++-----
 2 files changed, 7 insertions(+), 22 deletions(-)
 delete mode 100644 package/qextserialport/qextserialport-no-examples.patch

diff --git a/package/qextserialport/qextserialport-no-examples.patch b/package/qextserialport/qextserialport-no-examples.patch
deleted file mode 100644
index c7d2d41..0000000
--- a/package/qextserialport/qextserialport-no-examples.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Disable compilation of examples
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: qextserialport-ef4af2a2ee3f/qextserialport.pro
-===================================================================
---- qextserialport-ef4af2a2ee3f.orig/qextserialport.pro
-+++ qextserialport-ef4af2a2ee3f/qextserialport.pro
-@@ -1,7 +1,4 @@
- #
- TEMPLATE = subdirs
- CONFIG   += ordered
--SUBDIRS  = src \
--           examples/enumerator \
--           examples/event
--
-+SUBDIRS  = src
diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 6ffb9eb..f240cda 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-QEXTSERIALPORT_VERSION     = ef4af2a2ee3f
-QEXTSERIALPORT_SITE        = https://qextserialport.googlecode.com/hg/
-QEXTSERIALPORT_SITE_METHOD = hg
+QEXTSERIALPORT_VERSION     = f83b4e7ca922e53
+QEXTSERIALPORT_SITE        = https://qextserialport.googlecode.com/git/
+QEXTSERIALPORT_SITE_METHOD = git
+
+QEXTSERIALPORT_LICENSE = MIT
 
 QEXTSERIALPORT_DEPENDENCIES = qt
 
@@ -24,12 +26,12 @@ define QEXTSERIALPORT_INSTALL_STAGING_CMDS
 	mkdir -p $(STAGING_DIR)/usr/include/QExtSerialPort
 	cp $(@D)/src/*.h $(STAGING_DIR)/usr/include/QExtSerialPort/
 	cp $(@D)/src/QExtSerialPort $(STAGING_DIR)/usr/include/QExtSerialPort/
-	cp -a $(@D)/src/build/*.so* $(STAGING_DIR)/usr/lib/
+	cp -a $(@D)/*.so* $(STAGING_DIR)/usr/lib/
 	cp $(@D)/qextserialport.pc $(STAGING_DIR)/usr/lib/pkgconfig/
 endef
 
 define QEXTSERIALPORT_INSTALL_TARGET_CMDS
-	cp -a $(@D)/src/build/*.so.* $(TARGET_DIR)/usr/lib
+	cp -a $(@D)/*.so.* $(TARGET_DIR)/usr/lib
 endef
 
 $(eval $(generic-package))
-- 
1.8.0
