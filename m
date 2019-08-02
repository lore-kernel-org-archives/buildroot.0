From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Aug 2019 22:47:37 +0200
Subject: [Buildroot] [git commit] package/dnsmasq: fix build with kernel >=
 5.2
Message-ID: <20190802205213.925D48D1EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f867b988bf2b5ccaba459dd93f08add53190794
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/edfe5d208f1626903ce16cd481a29e54f9e8c611

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...003-Fix-build-after-y2038-changes-in-glib.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/dnsmasq/0003-Fix-build-after-y2038-changes-in-glib.patch b/package/dnsmasq/0003-Fix-build-after-y2038-changes-in-glib.patch
new file mode 100644
index 0000000000..fdde33a664
--- /dev/null
+++ b/package/dnsmasq/0003-Fix-build-after-y2038-changes-in-glib.patch
@@ -0,0 +1,29 @@
+From 3052ce208acf602f0163166dcefb7330d537cedb Mon Sep 17 00:00:00 2001
+From: Jiri Slaby <jslaby@suse.cz>
+Date: Wed, 24 Jul 2019 17:34:48 +0100
+Subject: [PATCH] Fix build after y2038 changes in glib.
+
+SIOCGSTAMP is defined in linux/sockios.h, not asm/sockios.h now.
+
+[Retrieved from:
+http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=patch;h=3052ce208acf602f0163166dcefb7330d537cedb]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/dnsmasq.h |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h
+index ff3204a..3ef04ad 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -137,6 +137,7 @@ typedef unsigned long long u64;
+ #endif
+ 
+ #if defined(HAVE_LINUX_NETWORK)
++#include <linux/sockios.h>
+ #include <linux/capability.h>
+ /* There doesn't seem to be a universally-available 
+    userspace header for these. */
+-- 
+1.7.10.4
+
