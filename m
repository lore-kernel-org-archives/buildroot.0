From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 18 Apr 2020 14:26:42 -0700
Subject: [Buildroot] [PATCH 1/2] package/mender: set the default script
 version to 3
Message-ID: <20200418212643.2743304-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Version 3 scripts have been supported since version 2.0 and should be the
default.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/mender/mender.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 6543402f07..e1ca976797 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -41,7 +41,7 @@ MENDER_LDFLAGS = -X main.Version=$(MENDER_VERSION)
 
 define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
-	echo -n "2" > $(TARGET_DIR)/etc/mender/scripts/version
+	echo -n "3" > $(TARGET_DIR)/etc/mender/scripts/version
 
 	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.conf \
 		$(TARGET_DIR)/etc/mender/mender.conf
-- 
2.25.2
