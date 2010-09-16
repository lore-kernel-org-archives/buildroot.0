From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] neon: remove useless stripping
Message-ID: <20100916113833.59B278AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ccc6ef6c171c188863f1d5350c8037ea1a2e5fee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/neon/neon.mk |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index e942f87..285d49f 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -47,10 +47,3 @@ NEON_CONF_OPT+=--without-ssl
 endif
 
 $(eval $(call AUTOTARGETS,package,neon))
-
-ifeq ($(BR2_ENABLE_DEBUG),)
-# neon doesn't have an install-strip target, so do it afterwards
-$(NEON_HOOK_POST_INSTALL): $(NEON_TARGET_INSTALL_TARGET)
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libneon.so
-	touch $@
-endif
-- 
1.7.1
