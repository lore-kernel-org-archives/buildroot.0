From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Mar 2015 20:49:47 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: help: add package-specific targets
In-Reply-To: <1426967388-559-1-git-send-email-arnout@mind.be>
References: <1426967388-559-1-git-send-email-arnout@mind.be>
Message-ID: <1426967388-559-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The documentation of the package-specific targets is heavily inspired by
the earlier patch by Thomas Petazzoni [1], but the <pkg>-install*
targets were left out since they're not useful for the developer IMHO.

The *-menuconfig target's help text is moved to the package-specific
targets.

[1] http://patchwork.ozlabs.org/patch/433692

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I wasn't sure about putting a condition on BR2_HAVE_DOT_CONFIG around
the package-specific targets. Obviously they only make sense when you
do have a configuration, but I don't see why we would change the help
text based on that.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Makefile b/Makefile
index ea08e6a..50fb5cf 100644
--- a/Makefile
+++ b/Makefile
@@ -871,6 +871,21 @@ help:
 	@echo '  randpackageconfig      - New config with random answer to package options'
 	@echo '  allyespackageconfig    - New config where pkg options are accepted with yes'
 	@echo '  allnopackageconfig     - New config where package options are answered with no'
+	@echo
+	@echo 'Package-specific:'
+	@echo '  <pkg>                  - Build and install <pkg> and all its dependencies'
+	@echo '  <pkg>-source           - Only download the source files for <pkg>'
+	@echo '  <pkg>-extract          - Extract <pkg> sources'
+	@echo '  <pkg>-patch            - Apply patches to <pkg>'
+	@echo '  <pkg>-depends          - Build <pkg>'\''s dependencies'
+	@echo '  <pkg>-configure        - Build <pkg> up to the configure step'
+	@echo '  <pkg>-build            - Build <pkg> up to the build step'
+	@echo '  <pkg>-graph-depends    - Display <pkg>'\''s dependencies'
+	@echo '  <pkg>-graph-depends    - Generate a graph of <pkg>'\''s dependencies'
+	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
+	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
+	@echo '  <pkg>-rebuild          - Restart the build from the build step'
+	@echo '  <pkg>-legal-info       - Generate license information for <pkg>'
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
 endif
-- 
2.1.4
