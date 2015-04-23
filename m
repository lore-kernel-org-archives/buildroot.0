From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Apr 2015 22:37:36 +0200
Subject: [Buildroot] [PATCH] Makefile: add list-defconfig to the general help
Message-ID: <1429821457-6008-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When listing defconfig files was moved to its own make target, it was
not added to the general help text.

However, this is a very important topic, so list it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Notes: I was not sure where to put it. On the one hand, the
'configuration' section seemed appropriate, but I think it does
fit well with all the other make targets in there; on the other
hand, the 'misc' section does not seem adequate either... Feel free to
move it around as you see fit...
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 5de4789..4418dfb 100644
--- a/Makefile
+++ b/Makefile
@@ -888,6 +888,7 @@ endif
 	@echo '  graph-depends          - generate graph of the dependency tree'
 	@echo
 	@echo 'Miscellaneous:'
+	@echo '  list-defconfigs:       - list all defconfigs (pre-configured minimal systems)'
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  source-check           - check selected packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
-- 
1.9.1
