From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:28 +0200
Subject: [Buildroot] [PATCH 05/23] qt: remove Makefile variable QT_QMAKE
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-6-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The variable is no longer referenced by any buildroot code and not
needed by external programs.

Once upon a time there was a problem with 'qmake' not finding its
spec file. But this problem in gone in the meantime.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 6351baa..f0fdfdd 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -391,9 +391,6 @@ QT_UNINSTALL_FILES := $(QT_TARGET_DIR)/.installed	\
 
 QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++/qmake.conf
 
-# Variable for other Qt applications to use
-QT_QMAKE:=$(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++
-
 ################################################################################
 # QT_QMAKE_SET -- helper macro to set QMAKE_<variable> = <value> in
 # QT_QMAKE_CONF. Will remove existing variable declaration if available.
-- 
1.6.3.3
