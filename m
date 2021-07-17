From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:05:13 +0200
Subject: [Buildroot] [git commit] package/keepalived: fix build with kernel
 >= 5.13
Message-ID: <20210717073130.C103891140@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=db67c4fcff8c99c0efb91896648666cd1f891a6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/9a93d7d76b0a4319c29fbf7b5986bcc78539ae8b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-core-Fix-compiling-on-RHEL-9.patch        | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/keepalived/0001-core-Fix-compiling-on-RHEL-9.patch b/package/keepalived/0001-core-Fix-compiling-on-RHEL-9.patch
new file mode 100644
index 0000000000..39134fcc35
--- /dev/null
+++ b/package/keepalived/0001-core-Fix-compiling-on-RHEL-9.patch
@@ -0,0 +1,34 @@
+From 3fd0c21e4f63ac0a52b5d7a09575f0f364972e4d Mon Sep 17 00:00:00 2001
+From: Quentin Armitage <quentin@armitage.org.uk>
+Date: Tue, 8 Jun 2021 08:57:45 +0100
+Subject: [PATCH] core: Fix compiling on RHEL 9
+
+Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
+
+[Retrieved from:
+https://github.com/acassen/keepalived/commit/3fd0c21e4f63ac0a52b5d7a09575f0f364972e4d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ keepalived/core/layer4.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/keepalived/core/layer4.c b/keepalived/core/layer4.c
+index d2cc971a3..fdca04913 100644
+--- a/keepalived/core/layer4.c
++++ b/keepalived/core/layer4.c
+@@ -27,13 +27,14 @@
+ #include <errno.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#include <netinet/in.h>
++#include <net/if.h>
+ #include <linux/icmp.h>
+ #include <linux/icmpv6.h>
+ #ifdef ERRQUEUE_NEEDS_SYS_TIME
+ #include <sys/time.h>
+ #endif
+ #include <linux/errqueue.h>
+-#include <netinet/in.h>
+ 
+ #include "layer4.h"
+ #include "logger.h"
