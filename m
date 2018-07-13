From: Christoph Engelbert <me@noctarius.com>
Date: Fri, 13 Jul 2018 12:32:54 +0300
Subject: [Buildroot] [PATCH 1/1] <wireless-regdb>: Adds the option to copy
 "regulatory.db[.p7s]" to /lib/firmware
Message-ID: <20180713093254.7994-1-me@noctarius.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Certain wireless drivers (like the Broadcom FullMac drivers" expect the regulatory.db and
regulatory.db.p7s files to be available to be loadable from /lib/firmware. If not available
the driver still loads but runs on a minimal subset of channels.

This newly added option gives possibility to have those files copied to the necessary directory.

Signed-off-by: Christoph Engelbert <me@noctarius.com>
---
 package/wireless-regdb/wireless-regdb.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index e9283a00e2..829374edcf 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -15,6 +15,10 @@ define WIRELESS_REGDB_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
 	$(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
 		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
+	$(INSTALL) -m 644 -D -T $(@D)/regulatory.db \
+		$(TARGET_DIR)/lib/firmware/regulatory.db
+	$(INSTALL) -m 644 -D -T $(@D)/regulatory.db.p7s \
+		$(TARGET_DIR)/lib/firmware/regulatory.db.p7s
 endef
 
 $(eval $(generic-package))
-- 
2.17.1
