From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  7 Jan 2021 14:39:46 +0100
Subject: [Buildroot] [PATCH 09/10] Makefile: add new missing-cpe target
In-Reply-To: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
References: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210107133948.2997849-10-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It invokes the recently introduced gen-missing-cpe script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Makefile b/Makefile
index 4d334adcd6..a3b17079fb 100644
--- a/Makefile
+++ b/Makefile
@@ -945,6 +945,14 @@ pkg-stats:
 		--html $(O)/pkg-stats.html \
 		--nvd-path $(DL_DIR)/buildroot-nvd
 
+.PHONY: missing-cpe
+missing-cpe:
+	mkdir -p $(O)/cpe-updates
+	@cd "$(CONFIG_DIR)" ; \
+	$(TOPDIR)/support/scripts/gen-missing-cpe \
+		--nvd-path $(DL_DIR)/buildroot-nvd \
+		--output $(O)/cpe-updates
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 # Some subdirectories are also package names. To avoid that "make linux"
-- 
2.29.2
