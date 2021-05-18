From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 22:28:17 +0200
Subject: [Buildroot] [PATCH] Makefile: remove pkg-stats data on clean
Message-ID: <20210518202817.2197910-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like commit 1f187371d002 for cpe-updates data, also remove pkg-stats
data on clean.

Unlike the rest, those are not nicely located in a directory of their
own, and have no variable name associated with them, so we just need
to repeat their names in the clean rule.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c3305f46e9..9d2c0d8ecb 100644
--- a/Makefile
+++ b/Makefile
@@ -1089,7 +1089,8 @@ printvars:
 clean:
 	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
-		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR) $(CPE_UPDATES_DIR)
+		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR) $(CPE_UPDATES_DIR) \
+		$(O)/pkg-stats.*
 
 .PHONY: distclean
 distclean: clean
-- 
2.25.1
