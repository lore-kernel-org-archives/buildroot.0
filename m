From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 14:46:05 +0200
Subject: [Buildroot] [git commit] package/wilink-bt-firmware: bump to
 version 43fca73c6a98c63fcb98f82af5bf83761778e005
Message-ID: <20190815125618.33DC78148D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5271c946ca0eff314ffc8f5a085bc27bc2ccafb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to git.ti.com
- Add hash for license file (and change filename to LICENSE, there is
  only a change in the site URL between old and new file)
- Fix path

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=11946

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wilink-bt-firmware/wilink-bt-firmware.hash | 3 ++-
 package/wilink-bt-firmware/wilink-bt-firmware.mk   | 9 +++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/wilink-bt-firmware/wilink-bt-firmware.hash b/package/wilink-bt-firmware/wilink-bt-firmware.hash
index 2cb6c880e6..7adcc86037 100644
--- a/package/wilink-bt-firmware/wilink-bt-firmware.hash
+++ b/package/wilink-bt-firmware/wilink-bt-firmware.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 b99700f6d504d76878de83ac50f18a0270b6edd0b52a0458c60fc606ed3332f0 wilink-bt-firmware-169b2df5b968f0ede32ea9044859942fc220c435.tar.gz
+sha256 9e3c3e8aa19e6cf59a72f235391a095d6d953c325b669d8a7815e32616c232df wilink-bt-firmware-43fca73c6a98c63fcb98f82af5bf83761778e005.tar.gz
+sha256 21fd99ce784dc33b39ec0b4a383a9a9b8dafea261d73ad4548683c4eecd87f37 LICENSE
diff --git a/package/wilink-bt-firmware/wilink-bt-firmware.mk b/package/wilink-bt-firmware/wilink-bt-firmware.mk
index 180a85e28a..722c4655cd 100644
--- a/package/wilink-bt-firmware/wilink-bt-firmware.mk
+++ b/package/wilink-bt-firmware/wilink-bt-firmware.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-WILINK_BT_FIRMWARE_VERSION = 169b2df5b968f0ede32ea9044859942fc220c435
-WILINK_BT_FIRMWARE_SITE = $(call github,TI-ECS,bt-firmware,$(WILINK_BT_FIRMWARE_VERSION))
+WILINK_BT_FIRMWARE_VERSION = 43fca73c6a98c63fcb98f82af5bf83761778e005
+WILINK_BT_FIRMWARE_SITE = git://git.ti.com/ti-bt/service-packs.git
+WILINK_BT_FIRMWARE_SITE_METHOD = git
 WILINK_BT_FIRMWARE_LICENSE = PROPRIETARY
-WILINK_BT_FIRMWARE_LICENSE_FILES = LICENCE
+WILINK_BT_FIRMWARE_LICENSE_FILES = LICENSE
 
 define WILINK_BT_FIRMWARE_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware/ti-connectivity
-	cp $(@D)/TIInit_*.bts $(TARGET_DIR)/lib/firmware/ti-connectivity
+	cp $(@D)/initscripts/TIInit_*.bts $(TARGET_DIR)/lib/firmware/ti-connectivity
 endef
 
 $(eval $(generic-package))
