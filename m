From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Feb 2015 14:22:37 -0300
Subject: [Buildroot] [PATCH 2/2] wireless-regdb: bump to version 2015.01.30
In-Reply-To: <1424280157-6849-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424280157-6849-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1424280157-6849-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index b9eabf1..c755efd 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256	eab6b50f30748a8b0065ba38cf3df05aac161a5861ae0a6c3cfd01d38a71c9dd	wireless-regdb-2014.11.18.tar.xz
+sha256	438d7f3d62686bc997098d17fe1aff95c6f6ec061aaab90ab7c2c17e8451ce85	wireless-regdb-2015.01.30.tar.xz
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 4322fb7..a4ca41b 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2014.11.18
+WIRELESS_REGDB_VERSION = 2015.01.30
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
@@ -13,8 +13,8 @@ WIRELESS_REGDB_LICENSE_FILES = LICENSE
 define WIRELESS_REGDB_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 644 -D -T $(@D)/regulatory.bin \
 		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
-	$(INSTALL) -m 644 -D -T $(@D)/linville.key.pub.pem \
-		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/linville.key.pub.pem
+	$(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
+		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
 endef
 
 $(eval $(generic-package))
-- 
2.0.5
