From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed,  8 Jan 2014 10:33:04 -0600
Subject: [Buildroot] [PATCH 3/4] libsigsegv: fix for microblaze
In-Reply-To: <1389198785-11923-1-git-send-email-spenser@gillilanding.com>
References: <1389198785-11923-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1389198785-11923-4-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes autobuild failure

http://autobuild.buildroot.net/results/799/799ac378713d82f9632a2aa925223e21157b1042/build-end.log
http://autobuild.buildroot.net/results/ae6/ae6a10ae7cd8f2d2f3891ea9c6e867695ca1acfe/build-end.log
http://autobuild.buildroot.net/results/db4/db48622f6c3a998ecec84ec51f21b4a031ab0fb5/build-end.log
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 .../libsigsegv-0003-fix-microblaze-build.patch           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/libsigsegv/libsigsegv-0003-fix-microblaze-build.patch

diff --git a/package/libsigsegv/libsigsegv-0003-fix-microblaze-build.patch b/package/libsigsegv/libsigsegv-0003-fix-microblaze-build.patch
new file mode 100644
index 0000000..4d96a83
--- /dev/null
+++ b/package/libsigsegv/libsigsegv-0003-fix-microblaze-build.patch
@@ -0,0 +1,16 @@
+Add microblaze support
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+
+Index: libsigsegv-2.10/m4/stack-direction.m4
+===================================================================
+--- libsigsegv-2.10.orig/m4/stack-direction.m4	2014-01-08 10:15:43.149509801 -0600
++++ libsigsegv-2.10/m4/stack-direction.m4	2014-01-08 10:16:57.249511153 -0600
+@@ -32,6 +32,7 @@
+       m68* | \
+       m88k | \
+       mcore | \
++      microblaze | \
+       mips* | \
+       mmix | \
+       mn10200 | \
-- 
1.8.3.2
