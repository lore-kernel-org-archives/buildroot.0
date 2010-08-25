From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 25 Aug 2010 11:28:40 +0100
Subject: [Buildroot] [PATCH 4/4] Fix externals-deps and source-check when
	building out of tree
Message-ID: <1282732120-1561-1-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 Makefile |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 291badf..7345beb 100644
--- a/Makefile
+++ b/Makefile
@@ -432,10 +432,10 @@ endif
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 _source-check:
-	$(MAKE) SPIDER=--spider source
+	$(MAKE) O=$(O) SPIDER=--spider source
 
 external-deps:
-	@$(MAKE) -Bs BR2_WGET=$(TOPDIR)/toolchain/wget-show-external-deps.sh \
+	@$(MAKE) O=$(O) -Bs BR2_WGET=$(TOPDIR)/toolchain/wget-show-external-deps.sh \
 		SPIDER=--spider source
 
 show-targets:
@@ -558,7 +558,7 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf
 
 # check if download URLs are outdated
 source-check: allyesconfig
-	$(MAKE) _source-check
+	$(MAKE) O=$(O) _source-check
 
 endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
-- 
1.7.1
