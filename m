From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Mar 2016 19:35:00 -0300
Subject: [Buildroot] [PATCH] iputils: really remove patch
Message-ID: <1456958100-5661-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems the appropiate git rm was missing from 8461038f. Fixes:
http://autobuild.buildroot.net/results/1b1/1b1f63e8c7ba10d4055fb422af6a15c044efc9a6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iputils/0001-ping-link-against-libm.patch | 29 -----------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 package/iputils/0001-ping-link-against-libm.patch

diff --git a/package/iputils/0001-ping-link-against-libm.patch b/package/iputils/0001-ping-link-against-libm.patch
deleted file mode 100644
index d151c5b..0000000
--- a/package/iputils/0001-ping-link-against-libm.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8d189e73e660a637ae3f5a604448103ea42e397d Mon Sep 17 00:00:00 2001
-From: Martin Bark <martin@barkynet.com>
-Date: Fri, 12 Feb 2016 16:52:19 +0000
-Subject: [PATCH] ping: link against libm
-
-This commit links ping against libm because ping.c calls the math library
-function finite().
-
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 8b37c42..fb80f6f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -156,7 +156,7 @@ LIB_clockdiff = $(LIB_CAP)
- DEF_ping_common = $(DEF_CAP) $(DEF_IDN)
- DEF_ping6_common = $(DEF_CAP) $(DEF_IDN)
- DEF_ping  = $(DEF_CAP) $(DEF_IDN) $(DEF_WITHOUT_IFADDRS)
--LIB_ping  = $(LIB_CAP) $(LIB_IDN) $(LIB_RESOLV)
-+LIB_ping  = $(LIB_CAP) $(LIB_IDN) $(LIB_RESOLV) -lm
- 
- ping: ping_common.o ping6_common.o
- ping.o ping_common.o ping6_common.o: ping.h in6_flowlabel.h
--- 
-2.7.0
-
-- 
2.4.10
