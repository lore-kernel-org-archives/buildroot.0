From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 23:21:55 +0100
Subject: [Buildroot] [git commit] core: add a make target to check the
	dependencies
Message-ID: <20160207222644.AE1D180008@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9dac986696a34d30a1e1408df961710edc748bdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a make target that will checks the dependencies of all packages.
This will currently only detect circular dependencies, but more tests
can be added later if need be.

This can then be used in the autobuilders to automatically report
dependency issues.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 7c5daa4..9daf011 100644
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
