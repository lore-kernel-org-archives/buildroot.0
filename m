From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Jul 2010 14:55:02 +0200
Subject: [Buildroot] [git commit master 1/1] qt: install qt3 support lib to
	target if enabled
Message-ID: <20100709130908.8120A82575@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=57120f08a62bd97716e5456d8dffdf8f3b5e63eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Karl Krach <mailinglists@blueSpirit.la>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index e2ebbb2..b4b6b29 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -418,6 +418,9 @@ endif
 ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
 QT_LIBS+= qt-scripttools
 endif
+ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
+QT_LIBS+= qt-qt3support
+endif
 
 QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++/qmake.conf
 
@@ -597,6 +600,10 @@ ifeq ($(BR2_PACKAGE_QT_SHARED),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/libQtScriptTools.so.* $(TARGET_DIR)/usr/lib/
 endif
 
+qt-qt3support: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt3Support.so.* $(TARGET_DIR)/usr/lib/
+endif
 
 $(TARGET_DIR)/usr/lib/libQtCore.so.4: $(STAGING_DIR)/usr/lib/libQtCore.la $(QT_LIBS)
 	# Strip all installed libs
-- 
1.7.1
