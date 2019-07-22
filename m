From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 22 Jul 2019 18:14:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/suricata: fix build with kernel >=
 5.2
Message-ID: <20190722161449.10624-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/422/422e1aa4e7d0bac31b55e7150a7ab031e23cef4a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...et-fix-build-on-recent-Linux-kernels.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/suricata/0002-af-packet-fix-build-on-recent-Linux-kernels.patch

diff --git a/package/suricata/0002-af-packet-fix-build-on-recent-Linux-kernels.patch b/package/suricata/0002-af-packet-fix-build-on-recent-Linux-kernels.patch
new file mode 100644
index 0000000000..6547fd57f5
--- /dev/null
+++ b/package/suricata/0002-af-packet-fix-build-on-recent-Linux-kernels.patch
@@ -0,0 +1,28 @@
+From b37554e0bc3cf383e6547c5c6a69c6f6849c09e3 Mon Sep 17 00:00:00 2001
+From: Eric Leblond <eric@regit.org>
+Date: Wed, 17 Jul 2019 12:35:12 +0200
+Subject: [PATCH] af-packet: fix build on recent Linux kernels
+
+Downloaded from upstream commit
+https://github.com/OISF/suricata/commit/b37554e0bc3cf383e6547c5c6a69c6f6849c09e3
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/source-af-packet.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/source-af-packet.c b/src/source-af-packet.c
+index 2c65ccbcf5..e117d36e5c 100644
+--- a/src/source-af-packet.c
++++ b/src/source-af-packet.c
+@@ -65,6 +65,10 @@
+ #include <sys/ioctl.h>
+ #endif
+ 
++#if HAVE_LINUX_SOCKIOS_H
++#include <linux/sockios.h>
++#endif
++
+ #ifdef HAVE_PACKET_EBPF
+ #include "util-ebpf.h"
+ #include <bpf/libbpf.h>
-- 
2.20.1
