From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Apr 2013 21:36:15 +0200
Subject: [Buildroot] [git commit] wireless-regdb: bump to version 2013.02.13
	and style fixes
Message-ID: <20130423201911.17C519B7F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28431c2c0ee33dd192933954ca2e667624882503
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wireless-regdb/wireless-regdb.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index b4e038c..2d5b86a 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,15 +4,17 @@
 #
 #############################################################
 
-WIRELESS_REGDB_VERSION = 2013.01.11
+WIRELESS_REGDB_VERSION = 2013.02.13
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.bz2
 WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
 WIRELESS_REGDB_LICENSE_FILES = LICENSE
 
 define WIRELESS_REGDB_INSTALL_TARGET_CMDS
-    install -m 644 -D -T $(@D)/regulatory.bin $(TARGET_DIR)/usr/lib/crda/regulatory.bin
-    install -m 644 -D -T $(@D)/linville.key.pub.pem $(TARGET_DIR)/etc/wireless-regdb/pubkeys/linville.key.pub.pem
+	$(INSTALL) -m 644 -D -T $(@D)/regulatory.bin \
+		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
+	$(INSTALL) -m 644 -D -T $(@D)/linville.key.pub.pem \
+		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/linville.key.pub.pem
 endef
 
 $(eval $(generic-package))
