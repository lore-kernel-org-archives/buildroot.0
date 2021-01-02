From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 12:06:11 +0100
Subject: [Buildroot] [git commit] package/datatables-buttons: move files to
 $(@D)
Message-ID: <20210102104839.6522B83A28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d72ee289ef06438e5713220b1ffc072e9b9edd49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/datatables-buttons/datatables-buttons.hash | 2 +-
 package/datatables-buttons/datatables-buttons.mk   | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/datatables-buttons/datatables-buttons.hash b/package/datatables-buttons/datatables-buttons.hash
index 336e4afd24..eda8df34b2 100644
--- a/package/datatables-buttons/datatables-buttons.hash
+++ b/package/datatables-buttons/datatables-buttons.hash
@@ -1,3 +1,3 @@
 # Locally computed:
 sha256	427632c0245f488328edab83b53294545744c8de621a5eaa9dd3d257d7ed7775  Buttons-1.6.1.zip
-sha256	21fa7cbc3c00bcad1e0f3417d465e702bd470d7dc446a6deff80c8fc5eda9148  Buttons-1.6.1/License.txt
+sha256	21fa7cbc3c00bcad1e0f3417d465e702bd470d7dc446a6deff80c8fc5eda9148  License.txt
diff --git a/package/datatables-buttons/datatables-buttons.mk b/package/datatables-buttons/datatables-buttons.mk
index fe66deac8e..a08be05869 100644
--- a/package/datatables-buttons/datatables-buttons.mk
+++ b/package/datatables-buttons/datatables-buttons.mk
@@ -8,15 +8,18 @@ DATATABLES_BUTTONS_VERSION = 1.6.1
 DATATABLES_BUTTONS_SITE = https://datatables.net/releases
 DATATABLES_BUTTONS_SOURCE = Buttons-$(DATATABLES_BUTTONS_VERSION).zip
 DATATABLES_BUTTONS_LICENSE = MIT
-DATATABLES_BUTTONS_LICENSE_FILES = Buttons-$(DATATABLES_BUTTONS_VERSION)/License.txt
+DATATABLES_BUTTONS_LICENSE_FILES = License.txt
+
 define DATATABLES_BUTTONS_EXTRACT_CMDS
 	$(UNZIP) $(DATATABLES_BUTTONS_DL_DIR)/$(DATATABLES_BUTTONS_SOURCE) -d $(@D)
+	mv $(@D)/Buttons-$(DATATABLES_BUTTONS_VERSION)/* $(@D)
+	rmdir $(@D)/Buttons-$(DATATABLES_BUTTONS_VERSION)
 endef
 
 define DATATABLES_BUTTONS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables-buttons/css $(TARGET_DIR)/var/www/datatables-buttons/js
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-buttons/css $(@D)/Buttons-$(DATATABLES_BUTTONS_VERSION)/css/*.min.css
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-buttons/js $(@D)/Buttons-$(DATATABLES_BUTTONS_VERSION)/js/*.min.js
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-buttons/css $(@D)/css/*.min.css
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-buttons/js $(@D)/js/*.min.js
 endef
 
 $(eval $(generic-package))
