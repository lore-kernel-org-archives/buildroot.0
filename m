From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2015 00:02:48 +0100
Subject: [Buildroot] [git commit] package/Makefile.in: remove
	BR2_TARGET_OPTIMIZATION from TARGET_CFLAGS
Message-ID: <20151029092251.F24CF81F7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50f44d877e5246198e692ecab3579ec36779da74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the toolchain is always wrapped and the wrapper already passes
BR2_TARGET_OPTIMIZATION (through BR_ADDITIONAL_CFLAGS), there is no longer
any need to pass it in TARGET_CFLAGS as well.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

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
