From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 15:09:03 +0200
Subject: [Buildroot] [[PATCH v2 03/14] package/mender: create directory
 structures required by the Mender client
In-Reply-To: <20180820130914.22377-1-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
Message-ID: <20180820130914.22377-4-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/uboot is a mount point for vfat boot partition.
/data is a mount point for the persistent data partition.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---
 package/mender/mender.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index deab0cb039..71f92ce048 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -8,6 +8,10 @@ MENDER_VERSION = 1.4.0
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
 
 define MENDER_INSTALL_CONFIG_FILES
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/mender
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/uboot
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/uboot
+
 	$(INSTALL) -D -m 0644 package/mender/mender.conf \
 		$(TARGET_DIR)/etc/mender/mender.conf
 	$(INSTALL) -D -m 0644 package/mender/tenant.conf \
-- 
2.11.0
