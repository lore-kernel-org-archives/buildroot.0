From: Will Newton <will.newton@gmail.com>
Date: Wed, 15 Feb 2012 15:56:42 +0000
Subject: [Buildroot] [PATCH] lite: Fix pkg-config file by removing excess
	slashes.
Message-ID: <CAFbHwiQd02YFDDZ1pzQk=Yv2Zv_OM1aGz8ddb_p3neNOPUq7MQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/lite/lite-pkg-config.patch |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 package/lite/lite-pkg-config.patch

diff --git a/package/lite/lite-pkg-config.patch
b/package/lite/lite-pkg-config.patch
new file mode 100644
index 0000000..5a6bea0
--- /dev/null
+++ b/package/lite/lite-pkg-config.patch
@@ -0,0 +1,11 @@
+Remove excess slashes from the .pc file. This change was made in
+the upstream git repo as 7982cccbb6ad58f3802bb266467290200d130a48.
+
+--- lite-0.8.10/lite.pc.in	2008-06-20 22:34:10.000000000 +0100
++++ lite-0.8.10.mod/lite.pc.in	2012-02-15 15:42:43.847835643 +0000
+@@ -9,4 +9,4 @@
+ Requires: directfb >= @DFB_REQUIRED_VERSION@
+ Version: @VERSION@
+ Libs: -L${libdir} -llite
+-Cflags: -I${includedir} -DLITEFONTDIR=\\\"@LITEFONTDIR@\\\"
++Cflags: -I${includedir} -DLITEFONTDIR=\"@LITEFONTDIR@\"
-- 
1.7.1
-------------- next part --------------
