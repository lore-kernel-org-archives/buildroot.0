From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Sep 2009 12:09:08 +0200
Subject: [Buildroot] [git commit master] Makefile: Remove ancient
	'sourceball' target
Message-ID: <20090923102504.4611877740@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=18994732d3593a884260d943be3321b9dd4232a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Roth <mroth@nessie.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 192fdf2..3895473 100644
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
