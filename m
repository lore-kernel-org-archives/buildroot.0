From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 16:47:04 +0200
Subject: [Buildroot] [PATCH 5/5] am33x-cm3: Use new FOO_INIT_SYSV_FILES
	variable
In-Reply-To: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1413643624-14757-6-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the update of pkg-generic, we don't need to define the
FOO_INSTALL_INIT_SYSV function.
In its place, we need to define FOO_INIT_SYSV_FILES with the full path
to the init script.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/am33x-cm3/am33x-cm3.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/am33x-cm3/am33x-cm3.mk b/package/am33x-cm3/am33x-cm3.mk
index 01cb9a0..ac78959 100644
--- a/package/am33x-cm3/am33x-cm3.mk
+++ b/package/am33x-cm3/am33x-cm3.mk
@@ -10,6 +10,7 @@ AM33X_CM3_SITE = http://arago-project.org/git/projects/am33x-cm3.git
 AM33X_CM3_SITE_METHOD = git
 AM33X_CM3_LICENSE = TI Publicly Available Software License
 AM33X_CM3_LICENSE_FILES = License.txt
+AM33X_CM3_INIT_SYSV_FILES = package/am33x-cm3/S93-am335x-pm-firmware-load
 
 # The build command below will use the standard cross-compiler (normally
 # build for Cortex-A8, to build the FW for the Cortex-M3.
@@ -23,9 +24,4 @@ define AM33X_CM3_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/lib/firmware/am335x-pm-firmware.bin
 endef
 
-define AM33X_CM3_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/am33x-cm3/S93-am335x-pm-firmware-load \
-		$(TARGET_DIR)/etc/init.d/S93-am335x-pm-firmware-load
-endef
-
 $(eval $(generic-package))
-- 
2.1.1
