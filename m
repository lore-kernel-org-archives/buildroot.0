From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 10:54:26 -0800
Subject: [Buildroot] [git commit] jquery-validation: bump to version 1.10.0
Message-ID: <20121204190929.61CA099716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48e0da1d745435f1c64c17556fc8758c6e37ce42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jquery-validation/jquery-validation.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 7d30270..746b534 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -1,13 +1,13 @@
-JQUERY_VALIDATION_VERSION = 1.9.0
+JQUERY_VALIDATION_VERSION = 1.10.0
 JQUERY_VALIDATION_SITE = http://jquery.bassistance.de/validate
 JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
 
 define JQUERY_VALIDATION_EXTRACT_CMDS
-	unzip -d $(BUILD_DIR) $(DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
+	unzip -d $(@D) $(DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
 endef
 
 define JQUERY_VALIDATION_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/jquery.validate.min.js \
+	$(INSTALL) -m 0644 -D $(@D)/dist/jquery.validate.min.js \
 		$(TARGET_DIR)/var/www/jquery.validate.js
 endef
 
