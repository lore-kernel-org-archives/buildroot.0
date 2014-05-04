From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 May 2014 23:02:44 +0200
Subject: [Buildroot] [git commit] package/tzdata: install missing files
Message-ID: <20140504212125.85C8C9CA5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d80f1c30252c5aba3adc6c8232bbbdeb7fd5c03f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install two additional files:
  - zone.tab   : {country-code,coordinates,timezone} tuples
  - iso3166.tab: {country-code,country} tuples

[Peter: simplify copy handling]
Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 05a82a2..a498d10 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -38,7 +38,7 @@ endef
 
 define TZDATA_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo
-	cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo
+	cp -a $(@D)/_output/* $(@D)/*.tab $(TARGET_DIR)/usr/share/zoneinfo
 	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
 	for zone in posix/*; do                 \
 	    ln -sfn "$${zone}" "$${zone##*/}";  \
@@ -66,7 +66,7 @@ endef
 
 define HOST_TZDATA_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/usr/share/zoneinfo
-	cp -a $(@D)/_output/* $(HOST_DIR)/usr/share/zoneinfo
+	cp -a $(@D)/_output/* $(@D)/*.tab $(HOST_DIR)/usr/share/zoneinfo
 endef
 
 $(eval $(generic-package))
