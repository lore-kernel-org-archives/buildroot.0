From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Jun 2009 14:29:20 +0200
Subject: [Buildroot] [git commit] qtopia4: fix build for !QTOPIA4_SHARED
Message-ID: <20090630194636.648E977625@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2945b06610197422b17dd271e695164088f06f90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Only try to copy the shared objects from staging to target if QT
is configured for shared objects.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qtopia4/qtopia4.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
index a198a41..4282519 100644
--- a/package/qtopia4/qtopia4.mk
+++ b/package/qtopia4/qtopia4.mk
@@ -542,8 +542,8 @@ endif
 
 $(TARGET_DIR)/usr/lib/libQtCore.so.4: $(STAGING_DIR)/usr/lib/libQtCore.la $(QTOPIA4_LIBS)
 	# Strip all installed libs
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtCore.so.* $(TARGET_DIR)/usr/lib/
 ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtCore.so.* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.*
 endif
 
-- 
1.6.3.3
