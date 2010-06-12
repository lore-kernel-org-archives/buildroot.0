From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:22:16 +0200
Subject: [Buildroot] [PATCH 42/49] at91bootstrap: fix install procedure
In-Reply-To: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f195596132326fe7640f6c2ae4020294a50137b0.1276352309.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index bad5cee..fc7206e 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -56,11 +56,10 @@ $(AT91BOOTSTRAP_TARGET): $(AT91BOOTSTRAP_DIR)/.configured
 
 $(AT91BOOTSTRAP_DIR)/.installed:: $(AT91BOOTSTRAP_TARGET)
 	mkdir -p $(BINARIES_DIR)
-	make MEMORY=$(AT91BOOTSTRAP_MEMORY) \
-		CROSS_COMPILE=$(TARGET_CROSS) \
-		-C $(AT91BOOTSTRAP_DIR) boot
-	make DESTDIR=$(BINARIES_DIR) -C $(AT91BOOTSTRAP_DIR) install || \
-		echo "Could not copy bootstrap to BINARIES_DIR"
+	make MEMORY=$(AT91BOOTSTRAP_MEMORY) 	\
+		CROSS_COMPILE=$(TARGET_CROSS) 	\
+		DESTDIR=$(BINARIES_DIR) 	\
+		-C $(AT91BOOTSTRAP_DIR) install
 	touch $@
 
 .PHONY: at91bootstrap at91bootstrap-source
-- 
1.7.0.4
