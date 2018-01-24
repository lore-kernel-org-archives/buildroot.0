From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 24 Jan 2018 17:03:56 -0500
Subject: [Buildroot] [PATCH 1/2] bootstrap: bump version to 4.0.0
Message-ID: <20180124220357.2861-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

other changes:
  - Add a license file to bootstrap.mk
  - Add a hash for the license file to bootstrap.hash
  - Remove copying bootstrap-theme.min.css as it's no longer included.
  - Remove copying fonts folder as it's no longer included.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/bootstrap/bootstrap.hash | 3 ++-
 package/bootstrap/bootstrap.mk   | 8 ++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/bootstrap/bootstrap.hash b/package/bootstrap/bootstrap.hash
index abc09da213..6bf6e5218c 100644
--- a/package/bootstrap/bootstrap.hash
+++ b/package/bootstrap/bootstrap.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 f498a8ff2dd007e29c2074f5e4b01a9a01775c3ff3aeaf6906ea503bc5791b7b  bootstrap-3.3.7-dist.zip
+sha256	fa1caaaf640c32c553d0b323da1036f2232703d64a1d22c3a2ec84ace68c791a	bootstrap-4.0.0-dist.zip
+sha256	8c1a4c25634d5841924aab1848acc9dcbc3d5672183053c8b71ff2139b65d7c3	bootstrap.css
diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
index 33161f53ae..aac457c190 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -4,25 +4,21 @@
 #
 ################################################################################
 
-BOOTSTRAP_VERSION = 3.3.7
+BOOTSTRAP_VERSION = 4.0.0
 BOOTSTRAP_SITE = https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRAP_VERSION)
 BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
 BOOTSTRAP_LICENSE = MIT
+BOOTSTRAP_LICENSE_FILES = bootstrap.css
 
 define BOOTSTRAP_EXTRACT_CMDS
 	$(UNZIP) $(DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
-	mv $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist/* $(@D)/
-	rmdir $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist
 endef
 
 define BOOTSTRAP_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/css/bootstrap-theme.min.css \
-		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap-theme.min.css
 	$(INSTALL) -m 0644 -D $(@D)/css/bootstrap.min.css \
 		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap.min.css
 	$(INSTALL) -m 0644 -D $(@D)/js/bootstrap.min.js \
 		$(TARGET_DIR)/var/www/bootstrap/js/bootstrap.min.js
-	cp -r $(@D)/fonts $(TARGET_DIR)/var/www/bootstrap/
 endef
 
 $(eval $(generic-package))
-- 
2.14.3
