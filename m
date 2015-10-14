From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Oct 2015 00:19:10 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: remove
	BR2_TARGET_OPTIMIZATION from TARGET_CFLAGS
Message-ID: <1444861150-4972-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the toolchain is always wrapped and the wrapper already passes
BR2_TARGET_OPTIMIZATION (through BR_ADDITIONAL_CFLAGS), there is no longer
any need to pass it in TARGET_CFLAGS as well.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Tested with BR2_DEBUG_WRAPPER that BR2_TARGET_OPTIMIZATION and
BR2_OPTIMIZE_* are still called correctly.
---
 package/Makefile.in | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 8a592d4..ca34660 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -110,22 +110,20 @@ endif
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
 
-TARGET_OPTIMIZATION := $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
-
 ifeq ($(BR2_OPTIMIZE_0),y)
-TARGET_OPTIMIZATION += -O0
+TARGET_OPTIMIZATION = -O0
 endif
 ifeq ($(BR2_OPTIMIZE_1),y)
-TARGET_OPTIMIZATION += -O1
+TARGET_OPTIMIZATION = -O1
 endif
 ifeq ($(BR2_OPTIMIZE_2),y)
-TARGET_OPTIMIZATION += -O2
+TARGET_OPTIMIZATION = -O2
 endif
 ifeq ($(BR2_OPTIMIZE_3),y)
-TARGET_OPTIMIZATION += -O3
+TARGET_OPTIMIZATION = -O3
 endif
 ifeq ($(BR2_OPTIMIZE_S),y)
-TARGET_OPTIMIZATION += -Os
+TARGET_OPTIMIZATION = -Os
 endif
 ifeq ($(BR2_DEBUG_1),y)
 TARGET_DEBUGGING = -g1
-- 
2.6.1
