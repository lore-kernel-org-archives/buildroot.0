From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:43 -0000
Subject: [Buildroot] [git commit branch/next] libnl: remove patch to fix
	bmon breakage
Message-ID: <20150808105633.08CCB7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7ca4e81163700146e39f3b9aba90225bad86b45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Upstream decided that programs should be fixed, so so be it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...remove-unnecessary-include-of-private-lin.patch |   44 --------------------
 1 files changed, 0 insertions(+), 44 deletions(-)

diff --git a/package/libnl/0001-Revert-route-remove-unnecessary-include-of-private-lin.patch b/package/libnl/0001-Revert-route-remove-unnecessary-include-of-private-lin.patch
deleted file mode 100644
index 3520899..0000000
--- a/package/libnl/0001-Revert-route-remove-unnecessary-include-of-private-lin.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 61310ce3f2b6c5c21be8c788848f083e4c58d138 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Fri, 17 Apr 2015 07:20:48 -0300
-Subject: [PATCH] Revert "route: remove unnecessary include of private
- linux/if.h"
-
-It breaks rtnl_link_get_flags() checks against IFF_* defines that aren't
-defined.
-
-This reverts commit 50a76998ac36ace3716d3c979b352fac73cfc80a.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- include/netlink/route/link.h | 1 +
- src/nl-link-set.c            | 1 -
- 2 files changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/netlink/route/link.h b/include/netlink/route/link.h
-index 8f74f42..a7aa88b 100644
---- a/include/netlink/route/link.h
-+++ b/include/netlink/route/link.h
-@@ -15,6 +15,7 @@
- #include <netlink/netlink.h>
- #include <netlink/cache.h>
- #include <netlink/addr.h>
-+#include <linux/if.h>
- #include <sys/types.h>
- 
- #ifdef __cplusplus
-diff --git a/src/nl-link-set.c b/src/nl-link-set.c
-index 6a6bac8..bbb60f9 100644
---- a/src/nl-link-set.c
-+++ b/src/nl-link-set.c
-@@ -9,7 +9,6 @@
-  * Copyright (c) 2003-2010 Thomas Graf <tgraf@suug.ch>
-  */
- 
--#include <linux/if.h>
- #include <netlink/cli/utils.h>
- #include <netlink/cli/link.h>
- 
--- 
-2.0.5
-
