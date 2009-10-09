From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Oct 2009 14:58:32 +0200
Subject: [Buildroot] [git commit master] qt: use configure option instead a
	sed hack to disable xinerama
Message-ID: <20091009130116.160F1772E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f9e208866bbed8a75de881b555760b095ced4011
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Qt configure script gained the option '-no-xinerama' in the
meantime. So use it instead hacking the script itself using sed.

Signed-off-by: Michael Roth <mroth@nessie.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 015312e..a4ca3a9 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -406,7 +406,6 @@ ifneq ($(BR2_INET_IPV6),y)
 	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QT_TARGET_DIR)/configure
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QT_TARGET_DIR)/configure
 endif
-	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QT_TARGET_DIR)/configure
 	# Fix compiler path
 	$(call QT_QMAKE_SET,CC,$(TARGET_CC))
 	$(call QT_QMAKE_SET,CXX,$(TARGET_CXX))
@@ -433,6 +432,7 @@ endif
 		-embedded $(BR2_PACKAGE_QT_EMB_PLATFORM) \
 		$(QT_QCONFIG_COMMAND) \
 		$(QT_CONFIGURE) \
+		-no-xinerama \
 		-no-cups \
 		-no-nis \
 		-no-accessibility \
-- 
1.6.3.3
