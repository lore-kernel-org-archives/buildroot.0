From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Jul 2017 21:22:09 +0200
Subject: [Buildroot] [PATCH 1/2] package/tz: fix variable name
In-Reply-To: <cover.1499109719.git.yann.morin.1998@free.fr>
References: <cover.1499109719.git.yann.morin.1998@free.fr>
Message-ID: <cf57d9e4fbce228070e160c52aaf5c1173ba4999.1499109719.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tz packages mizes its own variable with the one fro the tzdata
package...

Fix the variable name in tz.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Alexandre BELLONI <alexandre.belloni@free-electrons.com>
---
 package/tz/tz.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index 4d1c8c4d61..6b1f9f4d24 100644
--- a/package/tz/tz.mk
+++ b/package/tz/tz.mk
@@ -26,13 +26,13 @@ define TZ_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	if [ -n "$(TZ_LOCALTIME)" ]; then \
-		if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) ]; then \
+		if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZ_LOCALTIME) ]; then \
 			printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
-			"$(TZDATA_LOCALTIME)"; \
+				"$(TZ_LOCALTIME)"; \
 			exit 1; \
 		fi; \
 		cd $(TARGET_DIR)/etc; \
-		ln -sf ../usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) TZ; \
+		ln -sf ../usr/share/zoneinfo/uclibc/$(TZ_LOCALTIME) TZ; \
 	fi
 endef
 
-- 
2.11.0
