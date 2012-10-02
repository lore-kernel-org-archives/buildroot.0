From: Valentine Barshak <gvaxon@gmail.com>
Date: Tue,  2 Oct 2012 22:52:15 +0400
Subject: [Buildroot] [PATCH] Makefile: Remove more pkgconfig files
Message-ID: <1349203935-20225-1-git-send-email-gvaxon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pkgconfig files are located in  /usr/lib/pkgconfig
and /usr/share/pkgconfig directories.
However, only /usr/lib/pkgconfig is removed when no
development files are needed in the target filesystem.

Remove pkgconfig directory from $(TARGET_DIR)/usr/share
as well if BR2_HAVE_DEVFILES is not set.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6536bca..0128839 100644
--- a/Makefile
+++ b/Makefile
@@ -419,7 +419,8 @@ target-finalize:
 ifeq ($(BR2_HAVE_DEVFILES),y)
 	( support/scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
 else
-	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/aclocal
+	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
+		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig
 	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 endif
-- 
1.7.11.4
