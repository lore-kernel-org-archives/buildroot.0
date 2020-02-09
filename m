From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun,  9 Feb 2020 16:49:26 +0100
Subject: [Buildroot] [PATCH] package/iozone: bump to version 3_489
Message-ID: <20200209154927.7974-1-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also install "fileop", another file system benchmarking tool
provided by the iozone package.

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/iozone/iozone.hash | 2 +-
 package/iozone/iozone.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 8522486297..f2f40473c3 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	960265163d93f15f7ad352f726d4837c5dd794fff357c743fdb56cbcf4abca04	iozone3_488.tar
+sha256	6155850d1019f2450dc926bbdb5a24abf423ee3bb928ab1e68569cf60a908584	iozone3_489.tar
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index adc5a66955..a491faf9d4 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3_488
+IOZONE_VERSION = 3_489
 IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
@@ -25,6 +25,8 @@ endef
 define IOZONE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/src/current/iozone \
 		$(TARGET_DIR)/usr/bin/iozone
+	$(INSTALL) -D -m 755 $(@D)/src/current/fileop \
+		$(TARGET_DIR)/usr/bin/fileop
 endef
 
 $(eval $(generic-package))
-- 
2.17.1
