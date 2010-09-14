From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:32 -0700
Subject: [Buildroot] [PATCH 05/21] bison: bump to 2.4.3
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-5-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 CHANGES                                            |    4 ++--
 .../bison/bison-2.4.3-00-spawn-sched_param.patch   |   12 ++++++++++++
 package/bison/bison.mk                             |    2 +-
 3 files changed, 15 insertions(+), 3 deletions(-)
 create mode 100644 package/bison/bison-2.4.3-00-spawn-sched_param.patch

diff --git a/CHANGES b/CHANGES
index 381e628..3783dd1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,8 +8,8 @@
 	Toolchain: ARM cortex A9 support
 
 	Updated/fixed packages: alsa-lib, alsa-utils, autoconf, automake,
-	berkeleydb, busybox, dropbear, iptables, kismet, openvpn, qt,
-	usbutils
+	berkeleydb, bison, busybox, dropbear, iptables, kismet, openvpn,
+	qt, usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
diff --git a/package/bison/bison-2.4.3-00-spawn-sched_param.patch b/package/bison/bison-2.4.3-00-spawn-sched_param.patch
new file mode 100644
index 0000000..850ac9e
--- /dev/null
+++ b/package/bison/bison-2.4.3-00-spawn-sched_param.patch
@@ -0,0 +1,12 @@
+diff -durpN a/lib/spawn.in.h b/lib/spawn.in.h
+--- a/lib/spawn.in.h    2010-01-28 05:04:07.000000000 -0800
++++ b/lib/spawn.in.h      2010-02-27 23:10:41.000000000 -0800
+@@ -31,7 +31,7 @@
+ 
+ /* Get definitions of 'struct sched_param' and 'sigset_t'.
+    But avoid namespace pollution on glibc systems.  */
+-#ifndef __GLIBC__
++#if 1
+ # include <sched.h>
+ # include <signal.h>
+ #endif
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 9e28e85..075a078 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -3,7 +3,7 @@
 # bison
 #
 #############################################################
-BISON_VERSION:=2.3
+BISON_VERSION:=2.4.3
 BISON_SOURCE:=bison-$(BISON_VERSION).tar.bz2
 BISON_SITE:=$(BR2_GNU_MIRROR)/bison
 
-- 
1.7.2.3
