From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Oct 2009 14:58:32 +0200
Subject: [Buildroot] [git commit master] qt: remove TARGET_CONFIGURE_OPTS
	from make invocation
Message-ID: <20091009130113.16C6377784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ad1a8a156aaab584387d5cbfb27c20f21be32a54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All compiler options, switches and path settings are done in the
configure step. For the compile and install step there is no need
for the TARGET_CONFIGURE_OPTS variables.

Signed-off-by: Michael Roth <mroth@nessie.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 47b5feb..09a027d 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -474,11 +474,11 @@ endif
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
