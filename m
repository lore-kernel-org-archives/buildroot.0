From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 28 Jan 2010 16:05:40 +0100
Subject: [Buildroot] [git commit master] gperf: convert to newstyle
	autotools infrastructure
Message-ID: <20100128150633.09A1D77719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8fb159e14002d7a0ac51d5a531b1015dabb2f05a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gperf/gperf.mk |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 0dc6d6e..0dec44e 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -9,12 +9,8 @@ GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 GPERF_AUTORECONF = NO
 GPERF_INSTALL_STAGING = NO
 GPERF_INSTALL_TARGET = YES
-GPERF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
+
+# install-strip rule does not exist in gperf's makefiles
 GPERF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package,gperf))
-
-$(GPERF_HOOK_POST_INSTALL): $(GPERF_TARGET_INSTALL_TARGET)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/gperf
-	touch $@
-
-- 
1.6.3.3
