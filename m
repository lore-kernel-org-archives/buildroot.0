From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  6 Mar 2013 18:14:26 +0100
Subject: [Buildroot] [PATCH 5/5] CMake packages: remove .cmake files from
	target directory
In-Reply-To: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1362590066-5448-6-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just like pkgconfig files.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f6d8494..8346f27 100644
--- a/Makefile
+++ b/Makefile
@@ -452,7 +452,9 @@ ifeq ($(BR2_HAVE_DEVFILES),y)
 	( support/scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
 else
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
-		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig
+		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
+		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
+	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 endif
-- 
1.7.10.4
