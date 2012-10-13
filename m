From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 13 Oct 2012 08:33:38 -0300
Subject: [Buildroot] [PATCH] package infra: remove empty TARGET_CPPFLAGS def
Message-ID: <1350128018-3195-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's unneeded, just fills the next match (LARGEFILE) with a leading
space. Fixes
http://autobuild.buildroot.net/results/ad5772d19036a0c5564228ac7aba953d35a3cf85/build-end.log
since SCons can't handle leading whitespace in LDFLAGS gracefully.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Makefile.in |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 45213c1..a939882 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -85,8 +85,6 @@ ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING=-g3
 endif
 
-TARGET_CPPFLAGS =
-
 ifeq ($(BR2_LARGEFILE),y)
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
-- 
1.7.8.6
