From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:53 +0200
Subject: [Buildroot] [PATCH 67/74] neon: remove useless stripping
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ccc6ef6c171c188863f1d5350c8037ea1a2e5fee.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
