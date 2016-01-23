From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 23:15:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/kismet: fix musl build
Message-ID: <1453587321-3174-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8e7/8e7f790f215cb6a4d2389c83f0fbaeba43a827b8/
http://autobuild.buildroot.net/results/3f7/3f71e7eb29688304ae4298defe1997932112a1cc/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kismet/0005-musl.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/kismet/0005-musl.patch

diff --git a/package/kismet/0005-musl.patch b/package/kismet/0005-musl.patch
new file mode 100644
index 0000000..79e8f67
--- /dev/null
+++ b/package/kismet/0005-musl.patch
@@ -0,0 +1,15 @@
+Fix musl build
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr kismet-Kismet-2014-02-R1.org/ifcontrol.h kismet-Kismet-2014-02-R1/ifcontrol.h
+--- kismet-Kismet-2014-02-R1.org/ifcontrol.h	2014-02-19 05:37:43.000000000 +0100
++++ kismet-Kismet-2014-02-R1/ifcontrol.h	2016-01-23 23:12:39.000000000 +0100
+@@ -39,7 +39,6 @@
+ #include <net/if_arp.h>
+ #include <sys/ioctl.h>
+ #include <netinet/in.h>
+-#include <netinet/if_ether.h>
+ #include <arpa/inet.h>
+ #endif
+ 
-- 
2.7.0.rc3
