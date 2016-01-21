From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jan 2016 22:14:03 +0100
Subject: [Buildroot] [git commit] iproute2: add musl build fix patch
Message-ID: <20160121211408.1FFEC7FCD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11d7b8b64aa171823bc4c97e3cce43884d078ecf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch status: submitted upstream
http://marc.info/?l=linux-netdev&m=145340072013792

Fixes:
http://autobuild.buildroot.net/results/d3d/d3d79b55cb19987d5d5c0da9c0f0d25697697c05/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-iproute2-fix-building-with-musl.patch     | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/iproute2/0003-iproute2-fix-building-with-musl.patch b/package/iproute2/0003-iproute2-fix-building-with-musl.patch
new file mode 100644
index 0000000..377bf40
--- /dev/null
+++ b/package/iproute2/0003-iproute2-fix-building-with-musl.patch
@@ -0,0 +1,33 @@
+From e445686215f44c95b8b777c4c7efe5318d48505e Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 21 Jan 2016 15:14:44 -0300
+Subject: [PATCH] iproute2: fix building with musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We need limits.h for PATH_MAX, fixes:
+
+rt_names.c:364:13: error: ???PATH_MAX??? undeclared (first use in this
+function)
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ lib/rt_names.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/rt_names.c b/lib/rt_names.c
+index f6d17c0..b665d3e 100644
+--- a/lib/rt_names.c
++++ b/lib/rt_names.c
+@@ -18,6 +18,7 @@
+ #include <sys/time.h>
+ #include <sys/socket.h>
+ #include <dirent.h>
++#include <limits.h>
+ 
+ #include <asm/types.h>
+ #include <linux/rtnetlink.h>
+-- 
+2.4.10
+
