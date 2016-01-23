From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 15:37:52 +0100
Subject: [Buildroot] [PATCH 2/2] package/lxc: fix musl build
In-Reply-To: <1453559872-11381-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453559872-11381-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453559872-11381-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/52d/52da7ccde83364169ce85c26a6ac701c606036c5/
http://autobuild.buildroot.net/results/6b5/6b5c57cbd95fb4387db0d059c9e92c47b18174f6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lxc/0002-fix-musl.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/lxc/0002-fix-musl.patch

diff --git a/package/lxc/0002-fix-musl.patch b/package/lxc/0002-fix-musl.patch
new file mode 100644
index 0000000..f1f8527
--- /dev/null
+++ b/package/lxc/0002-fix-musl.patch
@@ -0,0 +1,18 @@
+Fix musl build
+
+Patch downloaded from
+https://lists.linuxcontainers.org/pipermail/lxc-devel/2014-January/007648.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr lxc-1.1.5.org/src/lxc/lxc_user_nic.c lxc-1.1.5/src/lxc/lxc_user_nic.c
+--- lxc-1.1.5.org/src/lxc/lxc_user_nic.c	2015-11-09 17:25:59.000000000 +0100
++++ lxc-1.1.5/src/lxc/lxc_user_nic.c	2016-01-23 15:32:57.000000000 +0100
+@@ -40,7 +40,6 @@
+ #include <net/if.h>
+ #include <net/if_arp.h>
+ #include <netinet/in.h>
+-#include <linux/if_bridge.h>
+ #include <linux/netlink.h>
+ #include <linux/rtnetlink.h>
+ #include <linux/sockios.h>
-- 
2.7.0.rc3
