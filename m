From: Norbert Lange <nolange79@gmail.com>
Date: Sat,  6 Jun 2020 00:48:56 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: remove /usr/lib/rpm directory on
 target
Message-ID: <20200605224858.12870-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this is only relevant for staging (if at all)

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ce1c08a6f6..6a76e87b5e 100644
--- a/Makefile
+++ b/Makefile
@@ -748,7 +748,7 @@ target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
 		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake \
-		$(TARGET_DIR)/usr/doc
+		$(TARGET_DIR)/usr/lib/rpm $(TARGET_DIR)/usr/doc
 	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/lib/ $(TARGET_DIR)/usr/lib/ $(TARGET_DIR)/usr/libexec/ \
 		\( -name '*.a' -o -name '*.la' -o -name '*.prl' \) -print0 | xargs -0 rm -f
-- 
2.26.2
