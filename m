From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:27 +0200
Subject: [Buildroot] [PATCH 04/23] qt: remove Makefile variable QT_QMAKE_AR
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-5-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The variable is only referenced once, so inline it.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 7189f03..6351baa 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -391,8 +391,6 @@ QT_UNINSTALL_FILES := $(QT_TARGET_DIR)/.installed	\
 
 QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++/qmake.conf
 
-QT_QMAKE_AR:=$(TARGET_AR) cqs
-
 # Variable for other Qt applications to use
 QT_QMAKE:=$(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++
 
@@ -453,7 +451,7 @@ endif
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
