From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 20:10:24 +0200
Subject: [Buildroot] [PATCH/next] package/bootstrap: bump version to 3.3.7
Message-ID: <20170521181024.27233-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed _INSTALL_TARGET_CMDS to reflect updated internal zip structure:

$ unzip -l ../dl/bootstrap-3.3.1-dist.zip
Archive:  ../dl/bootstrap-3.3.1-dist.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  2014-11-12 18:03   dist/
        0  2014-11-12 18:03   dist/css/
[...]

$ unzip -l ../dl/bootstrap-3.3.7-dist.zip
Archive:  ../dl/bootstrap-3.3.7-dist.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  2016-07-25 15:53   bootstrap-3.3.7-dist/css/
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/bootstrap/bootstrap.hash |  2 +-
 package/bootstrap/bootstrap.mk   | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/bootstrap/bootstrap.hash b/package/bootstrap/bootstrap.hash
index acb06b424..abc09da21 100644
--- a/package/bootstrap/bootstrap.hash
+++ b/package/bootstrap/bootstrap.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  95ca4a02aff37570660c81a87065b53ebc281c33fa86b91a6a7a650eee10678f  bootstrap-3.3.1-dist.zip
+sha256 f498a8ff2dd007e29c2074f5e4b01a9a01775c3ff3aeaf6906ea503bc5791b7b  bootstrap-3.3.7-dist.zip
diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
index 17752ce06..2e0b884b5 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-BOOTSTRAP_VERSION = 3.3.1
+BOOTSTRAP_VERSION = 3.3.7
 BOOTSTRAP_SITE = https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRAP_VERSION)
-BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
+BOOTSTRAP_SOURCE_DIR = bootstrap-$(BOOTSTRAP_VERSION)-dist
+BOOTSTRAP_SOURCE = $(BOOTSTRAP_SOURCE_DIR).zip
 BOOTSTRAP_LICENSE = MIT
 
 define BOOTSTRAP_EXTRACT_CMDS
@@ -14,13 +15,13 @@ define BOOTSTRAP_EXTRACT_CMDS
 endef
 
 define BOOTSTRAP_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/dist/css/bootstrap-theme.min.css \
+	$(INSTALL) -m 0644 -D $(@D)/$(BOOTSTRAP_SOURCE_DIR)/css/bootstrap-theme.min.css \
 		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap-theme.min.css
-	$(INSTALL) -m 0644 -D $(@D)/dist/css/bootstrap.min.css \
+	$(INSTALL) -m 0644 -D $(@D)/$(BOOTSTRAP_SOURCE_DIR)/css/bootstrap.min.css \
 		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap.min.css
-	$(INSTALL) -m 0644 -D $(@D)/dist/js/bootstrap.min.js \
+	$(INSTALL) -m 0644 -D $(@D)/$(BOOTSTRAP_SOURCE_DIR)/js/bootstrap.min.js \
 		$(TARGET_DIR)/var/www/bootstrap/js/bootstrap.min.js
-	cp -r $(@D)/dist/fonts $(TARGET_DIR)/var/www/bootstrap/
+	cp -r $(@D)/$(BOOTSTRAP_SOURCE_DIR)/fonts $(TARGET_DIR)/var/www/bootstrap/
 endef
 
 $(eval $(generic-package))
-- 
2.11.0
