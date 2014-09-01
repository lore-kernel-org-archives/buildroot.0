From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon,  1 Sep 2014 12:29:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnl: add patch to fix build with
	the musl C library
Message-ID: <1409567348-18757-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to the package libnl which removes an error when building
libnl against the musl C library.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 ...nk-netlink-h-use-poll-h-instead-of-sys-poll-h.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/libnl/libnl-0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch

diff --git a/package/libnl/libnl-0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch b/package/libnl/libnl-0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch
new file mode 100644
index 0000000..dd55cd4
--- /dev/null
+++ b/package/libnl/libnl-0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch
@@ -0,0 +1,18 @@
+netlink/netlink.h: As the poll() man page recommends include the <poll.h>
+instead of <sys/poll.h>. This removes an error when building libdl against 
+the musl C library.
+
+Signed-off-by: J?rg Krause <jkrause@posteo.de>
+
+diff -purN libnl-3.2.25.orig/include/netlink/netlink.h libnl-3.2.25/include/netlink/netlink.h
+--- libnl-3.2.25.orig/include/netlink/netlink.h	2014-09-01 11:42:37.254724124 +0200
++++ libnl-3.2.25/include/netlink/netlink.h	2014-09-01 11:42:58.254724255 +0200
+@@ -16,7 +16,7 @@
+ #include <stdint.h>
+ #include <string.h>
+ #include <stdlib.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/socket.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
-- 
2.1.0
