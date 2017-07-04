From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 08:59:33 +0200
Subject: [Buildroot] [git commit] package/tz: fix variable name
Message-ID: <20170704065726.E107E80ABD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e057861cb8314e1ce6e710f584a68a40eabc39b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tz package mixes its own variable with the one from the tzdata
package...

Fix the variable name in tz.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Alexandre BELLONI <alexandre.belloni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tz/tz.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index 4d1c8c4..6b1f9f4 100644
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
 
