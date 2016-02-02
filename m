From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Feb 2016 09:13:44 +0100
Subject: [Buildroot] [git commit] package/faifa: fix musl build
Message-ID: <20160202081409.88B4E81696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c8ad2644fbfc3c0e00fcdf4a8ea48d8cc1b8ac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/dc6/dc6e4d7327d2031ef921cccd814605dec73a0f9c/
http://autobuild.buildroot.net/results/868/868642325dbcd581373eaa9e1ef900f8a27f9121/
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...do-not-include-linux-if_ether.h-for-musl-.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

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
