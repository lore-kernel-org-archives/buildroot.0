From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Fri, 27 Jul 2007 15:15:35 +0200
Subject: [Buildroot] [PATCH 1/1] qtopia4: fix _VER => _VERSION typo
Message-ID: <11855421353423-git-send-email-hcegtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
---
 package/qtopia4/qtopia4.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
index 0058b82..ea2499e 100644
--- a/package/qtopia4/qtopia4.mk
+++ b/package/qtopia4/qtopia4.mk
@@ -116,7 +116,7 @@ qtopia4-source: $(DL_DIR)/$(QTOPIA4_SOURCE)
 $(QTOPIA4_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QTOPIA4_SOURCE)
 	$(QTOPIA4_CAT) $(DL_DIR)/$(QTOPIA4_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(QTOPIA4_TARGET_DIR) package/qtopia4/ \
-		qtopia-$(QTOPIA4_VER)-\*.patch\*
+		qtopia-$(QTOPIA4_VERSION)-\*.patch\*
 	touch $(QTOPIA4_TARGET_DIR)/.unpacked
 
 # This configure is very tailored towards my needs.
@@ -204,7 +204,7 @@ $(TARGET_DIR)/usr/lib/libQtCore.so.$(QTOPIA4_VERSION): $(STAGING_DIR)/usr/lib/li
 $(QTOPIA4_HOST_DIR)/.unpacked: $(DL_DIR)/$(QTOPIA4_SOURCE)
 	$(QTOPIA4_CAT) $(DL_DIR)/$(QTOPIA4_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(QTOPIA4_HOST_DIR) package/qtopia4/ \
-		qtopia-$(QTOPIA4_VER)-\*.patch\*
+		qtopia-$(QTOPIA4_VERSION)-\*.patch\*
 	touch $(QTOPIA4_HOST_DIR)/.unpacked
 
 # This configure is very tailored towards my needs.
-- 
1.5.2.3
