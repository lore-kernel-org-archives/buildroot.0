From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 15 Jul 2020 10:37:06 -0700
Subject: [Buildroot] [PATCH 3/4] package/mender: set the default script
 version to 3
In-Reply-To: <20200715173707.584226-1-aduskett@gmail.com>
References: <20200715173707.584226-1-aduskett@gmail.com>
Message-ID: <20200715173707.584226-3-aduskett@gmail.com>
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
index cd840b1e3f..2faf3fe980 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -39,7 +39,7 @@ MENDER_LDFLAGS = -X main.Version=$(MENDER_VERSION)
 
 define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
-	echo -n "2" > $(TARGET_DIR)/etc/mender/scripts/version
+	echo -n "3" > $(TARGET_DIR)/etc/mender/scripts/version
 
 	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.conf \
 		$(TARGET_DIR)/etc/mender/mender.conf
-- 
2.26.2
