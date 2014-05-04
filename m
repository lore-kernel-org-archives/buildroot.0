From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 May 2014 17:46:59 +0200
Subject: [Buildroot] [PATCH] package/tz: install missing files
Message-ID: <1399218419-4707-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

As for the tzdata package, install the missing files:
  - zone.tab   : {country-code,coordinates,timezone} tuples
  - iso3166.tab: {country-code,country} tuples

Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tz/tz.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index a762acd..865ba3b 100644
--- a/package/tz/tz.mk
+++ b/package/tz/tz.mk
@@ -20,6 +20,10 @@ define TZ_BUILD_CMDS
 endef
 
 define TZ_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/zoneinfo/zone.tab \
+			      $(TARGET_DIR)/usr/share/zoneinfo/zone.tab
+	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/zoneinfo/iso3166.tab \
+			      $(TARGET_DIR)/usr/share/zoneinfo/iso3166.tab
 	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	if [ -n "$(TZ_LOCALTIME)" ]; then                               \
-- 
1.8.3.2
