From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  2 Apr 2018 20:36:26 +0200
Subject: [Buildroot] [PATCH 5/5] zynq-boot-bin: use
 HOST_ZYNQ_BOOT_BIN_DL_DIR instead of ZYNQ_BOOT_BIN_DL_DIR
In-Reply-To: <20180402183626.7769-1-maxime.hadjinlian@gmail.com>
References: <20180402183626.7769-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180402183626.7769-5-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The infrastructure only provides HOST_ZYNQ_BOOT_BIN_DL_DIR, because this
package is host only. Ideally the infra should provide ZYNQ_BOOT_BIN_DL_DIR,
but it doesn't currently, and that requires more significant changes.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/zynq-boot-bin/zynq-boot-bin.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
index c523e04f45..c56203fb68 100644
--- a/package/zynq-boot-bin/zynq-boot-bin.mk
+++ b/package/zynq-boot-bin/zynq-boot-bin.mk
@@ -12,7 +12,7 @@ ZYNQ_BOOT_BIN_LICENSE = GPL-3.0+
 HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = host-python
 
 define HOST_ZYNQ_BOOT_BIN_EXTRACT_CMDS
-	cp $(ZYNQ_BOOT_BIN_DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
+	cp $(HOST_ZYNQ_BOOT_BIN_DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
 endef
 
 define HOST_ZYNQ_BOOT_BIN_INSTALL_CMDS
-- 
2.16.2
