From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Mar 2015 12:40:18 +0100
Subject: [Buildroot] [PATCH 1/5] libnl: use the backported patch for poll.h
	issue
In-Reply-To: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1425728422-14113-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that J?rg's patch has been merged upstream, let's use the
backported version, in a git format.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...etlink-h-use-poll-h-instead-of-sys-poll-h.patch | 18 -------------
 ...link.h-fix-build-including-poll.h-with-th.patch | 30 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 18 deletions(-)
 delete mode 100644 package/libnl/0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch
 create mode 100644 package/libnl/0001-netlink-netlink.h-fix-build-including-poll.h-with-th.patch

diff --git a/package/libnl/0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch b/package/libnl/0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch
deleted file mode 100644
index dd55cd4..0000000
--- a/package/libnl/0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-netlink/netlink.h: As the poll() man page recommends include the <poll.h>
-instead of <sys/poll.h>. This removes an error when building libdl against 
-the musl C library.
-
-Signed-off-by: J?rg Krause <jkrause@posteo.de>
-
-diff -purN libnl-3.2.25.orig/include/netlink/netlink.h libnl-3.2.25/include/netlink/netlink.h
---- libnl-3.2.25.orig/include/netlink/netlink.h	2014-09-01 11:42:37.254724124 +0200
-+++ libnl-3.2.25/include/netlink/netlink.h	2014-09-01 11:42:58.254724255 +0200
-@@ -16,7 +16,7 @@
- #include <stdint.h>
- #include <string.h>
- #include <stdlib.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/socket.h>
- #include <sys/types.h>
- #include <sys/time.h>
diff --git a/package/libnl/0001-netlink-netlink.h-fix-build-including-poll.h-with-th.patch b/package/libnl/0001-netlink-netlink.h-fix-build-including-poll.h-with-th.patch
new file mode 100644
index 0000000..53a299b
--- /dev/null
+++ b/package/libnl/0001-netlink-netlink.h-fix-build-including-poll.h-with-th.patch
@@ -0,0 +1,30 @@
+From 14128766e80823f79a3b2c97573da1aea5c16ea8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
+Date: Mon, 1 Sep 2014 12:38:10 +0200
+Subject: [PATCH 1/2] netlink/netlink.h: fix build including <poll.h> with the
+ musl C library
+
+https://github.com/thom311/libnl/pull/64
+
+Signed-off-by: Thomas Haller <thaller@redhat.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ include/netlink/netlink.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/netlink/netlink.h b/include/netlink/netlink.h
+index 28dba06..61656b3 100644
+--- a/include/netlink/netlink.h
++++ b/include/netlink/netlink.h
+@@ -16,7 +16,7 @@
+ #include <stdint.h>
+ #include <string.h>
+ #include <stdlib.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/socket.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+-- 
+2.1.0
+
-- 
2.1.0
