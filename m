From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 16:48:56 +0100
Subject: [Buildroot] [git commit] bootstrap: install production files only
Message-ID: <20150114154902.2A9F280142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efa0afe08ab0ef06277196d7a0acb9d75e5e9312
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bootstrap/bootstrap.mk |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
index 1bf8aa2..1a1c4f1 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -14,8 +14,13 @@ define BOOTSTRAP_EXTRACT_CMDS
 endef
 
 define BOOTSTRAP_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/var/www/bootstrap
-	cp -dpfr $(@D)/dist/* $(TARGET_DIR)/var/www/bootstrap
+	$(INSTALL) -m 0644 -D $(@D)/dist/css/bootstrap-theme.min.css \
+		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap-theme.min.css
+	$(INSTALL) -m 0644 -D $(@D)/dist/css/bootstrap.min.css \
+		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap.min.css
+	$(INSTALL) -m 0644 -D $(@D)/dist/js/bootstrap.min.js \
+		$(TARGET_DIR)/var/www/bootstrap/js/bootstrap.min.js
+	cp -r $(@D)/dist/fonts $(TARGET_DIR)/var/www/bootstrap/
 endef
 
 $(eval $(generic-package))
