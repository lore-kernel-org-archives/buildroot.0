From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2015 11:45:49 +0200
Subject: [Buildroot] [git commit] make help: remove <pkg>-legal-info
Message-ID: <20150904100013.DAFFD81EDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=466382e1fab84b57e60156f7b9f2fc8abbb01fe4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The <pkg>-legal-info target is only a component of the top-level
legal-info target, it is not meant to be used alone.

For example, calling twice 'make busybox-legal-info' produces duplicate
entries in licenses.txt and manifest.csv.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 9a6e9c0..23e2ee6 100644
--- a/Makefile
+++ b/Makefile
@@ -876,7 +876,6 @@ help:
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
-	@echo '  <pkg>-legal-info       - Generate license information for <pkg>'
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
 endif
