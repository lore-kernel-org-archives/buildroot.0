From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Apr 2015 08:07:48 -0300
Subject: [Buildroot] [PATCH] libnl: bump to version 3.2.26
Message-ID: <1429009668-2550-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...link.h-fix-build-including-poll.h-with-th.patch | 30 ----------------------
 package/libnl/libnl.hash                           |  5 ++--
 package/libnl/libnl.mk                             |  4 +--
 3 files changed, 4 insertions(+), 35 deletions(-)
 delete mode 100644 package/libnl/0001-netlink-netlink.h-fix-build-including-poll.h-with-th.patch

diff --git a/package/libnl/0001-netlink-netlink.h-fix-build-including-poll.h-with-th.patch b/package/libnl/0001-netlink-netlink.h-fix-build-including-poll.h-with-th.patch
deleted file mode 100644
index 53a299b..0000000
--- a/package/libnl/0001-netlink-netlink.h-fix-build-including-poll.h-with-th.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 14128766e80823f79a3b2c97573da1aea5c16ea8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
-Date: Mon, 1 Sep 2014 12:38:10 +0200
-Subject: [PATCH 1/2] netlink/netlink.h: fix build including <poll.h> with the
- musl C library
-
-https://github.com/thom311/libnl/pull/64
-
-Signed-off-by: Thomas Haller <thaller@redhat.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- include/netlink/netlink.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/netlink/netlink.h b/include/netlink/netlink.h
-index 28dba06..61656b3 100644
---- a/include/netlink/netlink.h
-+++ b/include/netlink/netlink.h
-@@ -16,7 +16,7 @@
- #include <stdint.h>
- #include <string.h>
- #include <stdlib.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/socket.h>
- #include <sys/types.h>
- #include <sys/time.h>
--- 
-2.1.0
-
diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index 6188d70..9ce5ffe 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,3 +1,2 @@
-# From http://lists.infradead.org/pipermail/libnl/2014-July/001549.html
-sha256	8beb7590674957b931de6b7f81c530b85dc7c1ad8fbda015398bc1e8d1ce8ec5 libnl-3.2.25.tar.gz
-md5	03f74d0cd5037cadc8cdfa313bbd195c	libnl-3.2.25.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_2_26/libnl-3.2.26.tar.gz.sha256sum
+sha256	1323ff6cea47efe9f988893b09840942a8c36131f472a9f3b96eb68d8f8d7555	libnl-3.2.26.tar.gz
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index e795e80..5993e97 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.2.25
-LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
+LIBNL_VERSION = 3.2.26
+LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
 LIBNL_INSTALL_STAGING = YES
-- 
2.0.5
