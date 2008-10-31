From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Fri, 31 Oct 2008 01:18:50 +0100
Subject: [Buildroot] [PATCH] qtopia4: fix wrong variable name for SQL
Message-ID: <200810310118.50847.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/qtopia4/qtopia4.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
index 9c08be9..de3bf4d 100644
--- a/package/qtopia4/qtopia4.mk
+++ b/package/qtopia4/qtopia4.mk
@@ -307,7 +307,7 @@ endif
 		cp -dpfr $(STAGING_DIR)/usr/plugins/imageformats $(TARGET_DIR)/usr/plugins/; \
 		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/imageformats/*; \
 	fi
-ifneq ($(BR2_PACKAGE_QTOPIA4_SQL),y)
+ifneq ($(BR2_PACKAGE_QTOPIA4_SQL_MODULE),y)
 	# Remove Sql libraries, not needed
 	-rm $(TARGET_DIR)/usr/lib/libQtSql*
 endif
-- 
1.6.0.3.524.g3adb7d
