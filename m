From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:29 +0200
Subject: [Buildroot] [PATCH 06/23] qt: remove TARGET_CONFIGURE_OPTS from
	make invocation
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-7-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All compiler options, switches and path settings are done in the
configure step. For the compile and install step there is no need
for the TARGET_CONFIGURE_OPTS variables.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index f0fdfdd..e965a42 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -487,11 +487,11 @@ endif
 	touch $@
 
 $(QT_TARGET_DIR)/.compiled: $(QT_TARGET_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QT_TARGET_DIR)
+	$(MAKE) -C $(QT_TARGET_DIR)
 	touch $@
 
 $(STAGING_DIR)/usr/lib/libQtCore.la: $(QT_TARGET_DIR)/.compiled
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QT_TARGET_DIR) install
+	$(MAKE) -C $(QT_TARGET_DIR) install
 
 qt-gui: $(STAGING_DIR)/usr/lib/libQtCore.la
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
-- 
1.6.3.3
