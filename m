From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Sep 2014 13:20:20 +0200
Subject: [Buildroot] [git commit] package/libnl: add patch to fix build with
	the musl C library
Message-ID: <20140901113155.70A439D5B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f6e8e5992ed434295584501f99924a1f6706ad4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to the package libnl which removes an error when building
libnl against the musl C library.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...etlink-h-use-poll-h-instead-of-sys-poll-h.patch |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

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
+Signed-off-by: J??rg Krause <jkrause@posteo.de>
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
