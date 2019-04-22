From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 21:24:00 +0200
Subject: [Buildroot] [PATCH 04/12] core: simplify removal of generated
 br2-external files
In-Reply-To: <cover.1555960978.git.yann.morin.1998@free.fr>
References: <cover.1555960978.git.yann.morin.1998@free.fr>
Message-ID: <a4aa1b30c09dafe64b788a2cbd19313edc53a1e0.1555960978.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that all the br2-external generated files are named after the same
pattern, it gets easier to remove them all using a glob.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8b8f5b2690..196bb3c958 100644
--- a/Makefile
+++ b/Makefile
@@ -1071,7 +1071,7 @@ ifeq ($(O),$(CURDIR)/output)
 	rm -rf $(O)
 endif
 	rm -rf $(TOPDIR)/dl $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
-		$(CONFIG_DIR)/.auto.deps $(BR2_EXTERNAL_FILE) $(BASE_DIR)/.br2-external.in
+		$(CONFIG_DIR)/.auto.deps $(BASE_DIR)/.br2-external.*
 
 .PHONY: help
 help:
-- 
2.14.1
