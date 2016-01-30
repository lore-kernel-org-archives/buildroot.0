From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 16:33:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/faifa: fix musl build
Message-ID: <1454167986-27614-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/dc6/dc6e4d7327d2031ef921cccd814605dec73a0f9c/
http://autobuild.buildroot.net/results/868/868642325dbcd581373eaa9e1ef900f8a27f9121/
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...do-not-include-linux-if_ether.h-for-musl-.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch

diff --git a/package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch b/package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch
new file mode 100644
index 0000000..6f340c3
--- /dev/null
+++ b/package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch
@@ -0,0 +1,32 @@
+From 36eed08a3783df6bb8d92d3c80cd47d0660eeb12 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 30 Jan 2016 16:27:37 +0100
+Subject: [PATCH 1/1] hpav_cfg.c: do not include linux/if_ether.h for musl
+ compatibility
+
+Fixes a build issue with the musl C library
+http://autobuild.buildroot.net/results/dc6/dc6e4d7327d2031ef921cccd814605dec73a0f9c/build-end.log
+
+Patch sent upstream: https://github.com/ffainelli/faifa/pull/13
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ hpav_cfg.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/hpav_cfg.c b/hpav_cfg.c
+index 7cc53af..45d3f0a 100644
+--- a/hpav_cfg.c
++++ b/hpav_cfg.c
+@@ -53,8 +53,6 @@
+ #include <arpa/inet.h>
+ #include <net/if.h>
+ 
+-#include <linux/if_ether.h>
+-
+ #include "homeplug_av.h"
+ #include "crypto.h"
+ 
+-- 
+2.7.0.rc3
+
-- 
2.7.0.rc3
