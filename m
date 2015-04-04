From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 15:17:48 +0200
Subject: [Buildroot] [git commit] Makefile: help: add package-specific
	targets
Message-ID: <20150404132028.739D47FA53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1e0b6d736481efedd4036be414105eb4b5b581b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The documentation of the package-specific targets is heavily inspired by
the earlier patch by Thomas Petazzoni [1], but the <pkg>-install*
targets were left out since they're not useful for the developer IMHO.

The *-menuconfig target's help text is moved to the package-specific
targets.

[1] http://patchwork.ozlabs.org/patch/433692

[Thomas: remove double <pkg>-graph-depends help.]

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 32a18ff..8d09725 100644
--- a/Makefile
+++ b/Makefile
@@ -873,6 +873,20 @@ help:
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
+	@echo '  <pkg>-graph-depends    - Generate a graph of <pkg>'\''s dependencies'
+	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
+	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
+	@echo '  <pkg>-rebuild          - Restart the build from the build step'
+	@echo '  <pkg>-legal-info       - Generate license information for <pkg>'
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
 endif
