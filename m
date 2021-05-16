From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 13:58:36 +0200
Subject: [Buildroot] [git commit] Makefile: add new missing-cpe target
Message-ID: <20210516113857.9CF3E814B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd7312940aeffe015592396a9b24e014839e0eb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It invokes the recently introduced gen-missing-cpe script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Makefile b/Makefile
index 76f14888ea..75ef7f5eb5 100644
--- a/Makefile
+++ b/Makefile
@@ -945,6 +945,14 @@ pkg-stats:
 		--html $(O)/pkg-stats.html \
 		--nvd-path $(DL_DIR)/buildroot-nvd
 
+.PHONY: missing-cpe
+missing-cpe:
+	$(Q)mkdir -p $(O)/cpe-updates
+	$(Q)cd "$(CONFIG_DIR)" ; \
+	$(TOPDIR)/support/scripts/gen-missing-cpe \
+		--nvd-path $(DL_DIR)/buildroot-nvd \
+		--output $(O)/cpe-updates
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 # Some subdirectories are also package names. To avoid that "make linux"
@@ -1163,6 +1171,7 @@ help:
 	@echo '  legal-info             - generate info about license compliance'
 	@echo '  show-info              - generate info about packages, as a JSON blurb'
 	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
+	@echo '  missing-cpe            - generate XML snippets for missing CPE identifiers'
 	@echo '  printvars              - dump internal variables selected with VARS=...'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
