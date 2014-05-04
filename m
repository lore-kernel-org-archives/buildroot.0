From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 May 2014 23:03:15 +0200
Subject: [Buildroot] [git commit] package/tz: install missing files
Message-ID: <20140504212125.8FCF19C389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70c36464d1f149211ccfa43f40aa27ccca3d77ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As for the tzdata package, install the missing files:
  - zone.tab   : {country-code,coordinates,timezone} tuples
  - iso3166.tab: {country-code,country} tuples

Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tz/tz.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
