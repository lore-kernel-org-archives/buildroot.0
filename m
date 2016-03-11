From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:41:10 +0100
Subject: [Buildroot] [PATCH 2/9 v2] core: also display the custom help with
	our main help
In-Reply-To: <cover.1457717002.git.yann.morin.1998@free.fr>
References: <cover.1457717002.git.yann.morin.1998@free.fr>
Message-ID: <a5e9ff4caa9fcab5386298ed5eadbcc4fc095562.1457717002.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch merges the custom help, introduced in the previous patch, at
the end of our internal help.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - new patch, by popular demand... :-/
---
 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 7bb5f6d..ea8b1e4 100644
--- a/Makefile
+++ b/Makefile
@@ -893,7 +893,9 @@ endif
 	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
 		$(CONFIG_DIR)/.auto.deps $(BR2_EXTERNAL_FILE)
 
-help:
+help: help-internal help-custom
+
+help-internal:
 	@echo 'Cleaning:'
 	@echo '  clean                  - delete all files created by build'
 	@echo '  distclean              - delete all non-source files (including .config)'
@@ -966,7 +968,6 @@ endif
 	@echo '  source-check           - check selected packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
-	@echo '  help-custom            - print help about custom actions (if any)'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
-- 
1.9.1
