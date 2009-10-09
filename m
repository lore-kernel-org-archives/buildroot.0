From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Oct 2009 14:58:32 +0200
Subject: [Buildroot] [git commit master] qt: remove Makefile variable
	QT_QMAKE_AR
Message-ID: <20091009130112.D530177784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ef951295bf624d3c21753c15ea6e40ecbe1d6839
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The variable is only referenced once, so inline it.

Signed-off-by: Michael Roth <mroth@nessie.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 5b9906e..47b5feb 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -375,8 +375,6 @@ endif
 
 QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++/qmake.conf
 
-QT_QMAKE_AR:=$(TARGET_AR) cqs
-
 # Variable for other Qt applications to use
 QT_QMAKE:=$(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++
 
@@ -437,7 +435,7 @@ endif
 	$(call QT_QMAKE_SET,CXX,$(TARGET_CXX))
 	$(call QT_QMAKE_SET,LINK,$(TARGET_CXX))
 	$(call QT_QMAKE_SET,LINK_SHLIB,$(TARGET_CXX))
-	$(call QT_QMAKE_SET,AR,$(QT_QMAKE_AR))
+	$(call QT_QMAKE_SET,AR,$(TARGET_AR) cqs)
 	$(call QT_QMAKE_SET,OBJCOPY,$(TARGET_OBJCOPY))
 	$(call QT_QMAKE_SET,RANLIB,$(TARGET_RANLIB))
 	$(call QT_QMAKE_SET,STRIP,$(TARGET_STRIP))
-- 
1.6.3.3
