From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:36 +0200
Subject: [Buildroot] [PATCH 13/23] qt: use configure option instead a sed
	hack to disable xinerama
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-14-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qt configure script gained the option '-no-xinerama' in the
meantime. So use it instead hacking the script itself using sed.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index b12d3eb..08995d4 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -419,7 +419,6 @@ ifneq ($(BR2_INET_IPV6),y)
 	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QT_TARGET_DIR)/configure
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QT_TARGET_DIR)/configure
 endif
-	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QT_TARGET_DIR)/configure
 	# Fix compiler path
 	$(call QT_QMAKE_SET,CC,$(TARGET_CC))
 	$(call QT_QMAKE_SET,CXX,$(TARGET_CXX))
@@ -446,6 +445,7 @@ endif
 		-embedded $(BR2_PACKAGE_QT_EMB_PLATFORM) \
 		$(QT_QCONFIG_COMMAND) \
 		$(QT_CONFIGURE) \
+		-no-xinerama \
 		-no-cups \
 		-no-nis \
 		-no-accessibility \
-- 
1.6.3.3
