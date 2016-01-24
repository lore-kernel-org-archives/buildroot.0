From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2016 17:02:41 +0100
Subject: [Buildroot] [PATCH 6/6 v2] core: add a make target to check the
	dependencies
In-Reply-To: <cover.1453651102.git.yann.morin.1998@free.fr>
References: <cover.1453651102.git.yann.morin.1998@free.fr>
Message-ID: <00edb6450d0b45ee3c0ae850f7d3a72d5aad711f.1453651102.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a make target that will checks the dependencies of all packages.
This will currently only detect circular dependencies, but more tests
can be added later if need be.

This can then be used in the autobuilders to automatically report
dependency issues.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 20927de..0532f3b 100644
--- a/Makefile
+++ b/Makefile
@@ -733,6 +733,10 @@ graph-size:
 		--file-size-csv $(GRAPHS_DIR)/file-size-stats.csv \
 		--package-size-csv $(GRAPHS_DIR)/package-size-stats.csv
 
+check-dependencies:
+	@cd "$(CONFIG_DIR)"; \
+	$(TOPDIR)/support/scripts/graph-depends -C
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
-- 
1.9.1
