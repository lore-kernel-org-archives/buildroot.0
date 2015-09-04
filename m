From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  4 Sep 2015 09:17:41 +0200
Subject: [Buildroot] [PATCH] make help: remove <pkg>-legal-info
Message-ID: <1441351061-6306-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The <pkg>-legal-info target is only a component of the top-level
legal-info target, it is not meant to be used alone.

For example, calling twice 'make busybox-legal-info' produces duplicate
entries in licenses.txt and manifest.csv.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile | 1 -
 1 file changed, 1 deletion(-)

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
-- 
1.9.1
