From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Fri, 13 Nov 2020 12:39:40 +0100
Subject: [Buildroot] [PATCH] package/rauc: prevent occurring the error when
 directory exists
Message-ID: <20201113113940.842415-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add -p argument that ignore that specified directory already exists.

Fixes:
 mkdir: cannot create directory ?/home/bartekk/buildroot-2020.11-rc1/output/target/usr/lib/systemd/system/rauc.service.d?: File exists

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/rauc/rauc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 1915c783aa..61c50ab316 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -31,7 +31,7 @@ RAUC_DEPENDENCIES += systemd
 endif
 
 define RAUC_INSTALL_INIT_SYSTEMD
-	mkdir $(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d
+	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d
 	printf '[Install]\nWantedBy=multi-user.target\n' \
 		>$(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d/buildroot-enable.conf
 endef
-- 
2.29.2
