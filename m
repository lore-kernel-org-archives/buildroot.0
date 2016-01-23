From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 00:50:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/rp-pppoe: fix musl build
Message-ID: <1453593059-24097-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build based
on the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rp-pppoe/0001-musl-fix.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/rp-pppoe/0001-musl-fix.patch

diff --git a/package/rp-pppoe/0001-musl-fix.patch b/package/rp-pppoe/0001-musl-fix.patch
new file mode 100644
index 0000000..645e27a
--- /dev/null
+++ b/package/rp-pppoe/0001-musl-fix.patch
@@ -0,0 +1,20 @@
+Fix musl build
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/plain/main/rp-pppoe/musl-fix.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- ./src/pppoe.h.orig
++++ ./src/pppoe.h
+@@ -127,10 +127,6 @@
+ #error Could not find a 32-bit integer type
+ #endif
+ 
+-#ifdef HAVE_LINUX_IF_ETHER_H
+-#include <linux/if_ether.h>
+-#endif
+-
+ #include <netinet/in.h>
+ 
+ #ifdef HAVE_NETINET_IF_ETHER_H
-- 
2.7.0.rc3
