From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Oct 2014 19:58:13 +0200
Subject: [Buildroot] [PATCH] mrouted: Use github call
Message-ID: <1413136693-30255-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/mrouted/mrouted.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 67bb8a1..78fe98a 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 MROUTED_VERSION = 3.9.6
-MROUTED_SOURCE = mrouted-$(MROUTED_VERSION).tar.bz2
-MROUTED_SITE = http://cloud.github.com/downloads/troglobit/mrouted
+MROUTED_SITE = $(call github,troglobit,mrouted,$(MROUTED_VERSION))
 MROUTED_DEPENDENCIES = host-bison
 
 define MROUTED_BUILD_CMDS
-- 
2.1.1
