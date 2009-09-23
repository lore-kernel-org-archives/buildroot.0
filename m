From: Michael Roth <mroth@nessie.de>
Date: Wed, 23 Sep 2009 12:04:00 +0200
Subject: [Buildroot] [PATCH] Makefile: Remove ancient 'sourceball' target
Message-ID: <1253700240-11140-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 Makefile |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index eff903e..2eca1fd 100644
--- a/Makefile
+++ b/Makefile
@@ -450,15 +450,6 @@ endif
 	.config.cmd
 	$(MAKE) -C $(CONFIG) clean
 
-sourceball:
-	rm -rf $(BUILD_DIR) $(BUILD_DIR) $(BINARIES_DIR)
-	set -e; \
-	cd ..; \
-	rm -f buildroot.tar.bz2; \
-	tar -cvf buildroot.tar buildroot; \
-	bzip2 -9 buildroot.tar; \
-
-
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
-- 
1.6.3.3
