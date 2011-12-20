From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Dec 2011 11:24:29 +0100
Subject: [Buildroot] [git commit] package: don't install javascript files as
	executable
Message-ID: <20111220110103.C7B298FB06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=601bf47ef8a68f773393210b5a7c54f9020ec91a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

install defaults to mode 0755, not 0644, so explicitly pass mode to
ensure .js files aren't made executable.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flot/flot.mk                           |    2 +-
 package/jquery-sparkline/jquery-sparkline.mk   |    2 +-
 package/jquery-validation/jquery-validation.mk |    2 +-
 package/jquery/jquery.mk                       |    3 ++-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/flot/flot.mk b/package/flot/flot.mk
index df3f4d1..8b51b55 100644
--- a/package/flot/flot.mk
+++ b/package/flot/flot.mk
@@ -12,7 +12,7 @@ FLOT_FILES = jquery.flot $(addprefix jquery.flot.,\
 
 define FLOT_INSTALL_TARGET_CMDS
 	for i in $(FLOT_FILES); do \
-		$(INSTALL) -D $(@D)/$$i.min.js $(TARGET_DIR)/var/www/$$i.js; \
+		$(INSTALL) -m 0644 -D $(@D)/$$i.min.js $(TARGET_DIR)/var/www/$$i.js; \
 	done
 endef
 
diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
index 93dddf0..d0b478a 100644
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -7,7 +7,7 @@ define JQUERY_SPARKLINE_EXTRACT_CMDS
 endef
 
 define JQUERY_SPARKLINE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/$(JQUERY_SPARKLINE_SOURCE) \
+	$(INSTALL) -m 0644 -D $(@D)/$(JQUERY_SPARKLINE_SOURCE) \
 		$(TARGET_DIR)/var/www/jquery.sparkline.js
 endef
 
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 5f25b58..5fee4c1 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -7,7 +7,7 @@ define JQUERY_VALIDATION_EXTRACT_CMDS
 endef
 
 define JQUERY_VALIDATION_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/jquery.validate.min.js \
+	$(INSTALL) -m 0644 -D $(@D)/jquery.validate.min.js \
 		$(TARGET_DIR)/var/www/jquery.validate.js
 endef
 
diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index aba6301..08dd4a3 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -7,7 +7,8 @@ define JQUERY_EXTRACT_CMDS
 endef
 
 define JQUERY_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/$(JQUERY_SOURCE) $(TARGET_DIR)/var/www/jquery.js
+	$(INSTALL) -m 0644 -D $(@D)/$(JQUERY_SOURCE) \
+		$(TARGET_DIR)/var/www/jquery.js
 endef
 
 define JQUERY_UNINSTALL_TARGET_CMDS
