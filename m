From: Dagg Stompler <daggs@gmx.com>
Date: Fri, 25 Nov 2016 09:48:46 +0200
Subject: [Buildroot] [PATCH] odroid-scripts: init display as early as
	possible
Message-ID: <20161125074846.9647-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this commit will init the display as early as possible so the user can
see on screen the boot process.
the displey init will be called after the logging init to provide some
logging of the init.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/odroid-scripts/{S50odroidc2_fb => S02odroidc2_fb} | 0
 package/odroid-scripts/odroid-scripts.mk                  | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename package/odroid-scripts/{S50odroidc2_fb => S02odroidc2_fb} (100%)

diff --git a/package/odroid-scripts/S50odroidc2_fb b/package/odroid-scripts/S02odroidc2_fb
similarity index 100%
rename from package/odroid-scripts/S50odroidc2_fb
rename to package/odroid-scripts/S02odroidc2_fb
diff --git a/package/odroid-scripts/odroid-scripts.mk b/package/odroid-scripts/odroid-scripts.mk
index 858ec37fe..72e7b9588 100644
--- a/package/odroid-scripts/odroid-scripts.mk
+++ b/package/odroid-scripts/odroid-scripts.mk
@@ -29,8 +29,8 @@ define ODROID_SCRIPTS_INSTALL_INIT_SYSTEMD
 endef
 
 define ODROID_SCRIPTS_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/odroid-scripts/S50odroidc2_fb \
-		$(TARGET_DIR)/etc/init.d/S50odroidc2_fb
+	$(INSTALL) -D -m 0755 package/odroid-scripts/S02odroidc2_fb \
+		$(TARGET_DIR)/etc/init.d/S02odroidc2_fb
 endef
 
 $(eval $(generic-package))
-- 
2.11.0.rc2
