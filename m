From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 22:02:02 +0100
Subject: [Buildroot] [git commit] odroid-scripts: init display as early as
	possible
Message-ID: <20161201222139.87A087FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fdb3af6316278400446511a7e6c53cde43f4a09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this commit will init the display as early as possible so the user can
see on screen the boot process.
the displey init will be called after the logging init to provide some
logging of the init.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/odroid-scripts/{S50odroidc2_fb => S02odroidc2_fb} | 0
 package/odroid-scripts/odroid-scripts.mk                  | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/odroid-scripts/S50odroidc2_fb b/package/odroid-scripts/S02odroidc2_fb
similarity index 100%
rename from package/odroid-scripts/S50odroidc2_fb
rename to package/odroid-scripts/S02odroidc2_fb
diff --git a/package/odroid-scripts/odroid-scripts.mk b/package/odroid-scripts/odroid-scripts.mk
index 858ec37..72e7b95 100644
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
