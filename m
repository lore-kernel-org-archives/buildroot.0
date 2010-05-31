From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:25 +0200
Subject: [Buildroot] [PATCH 39/46] at91bootstrap: fix install procedure
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0db9afb059336725f736754a10854861577537fc.1275343448.git.thomas.petazzoni@free-electrons.com>
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
