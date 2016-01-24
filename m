From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 14:30:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xload: fix musl build
In-Reply-To: <1453642260-24302-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453642260-24302-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453642260-24302-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build based
on the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xload/0001-musl.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/x11r7/xapp_xload/0001-musl.patch

diff --git a/package/x11r7/xapp_xload/0001-musl.patch b/package/x11r7/xapp_xload/0001-musl.patch
new file mode 100644
index 0000000..de32333
--- /dev/null
+++ b/package/x11r7/xapp_xload/0001-musl.patch
@@ -0,0 +1,19 @@
+Fix musl build
+
+Partly downloaded from
+https://github.com/GregorR/musl-pkgsrc-patches/blob/master/x11-xload.diff
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr xload-1.1.2.org/get_rload.c xload-1.1.2/get_rload.c
+--- xload-1.1.2.org/get_rload.c	2013-08-04 06:43:06.000000000 +0200
++++ xload-1.1.2/get_rload.c	2016-01-24 14:18:58.000000000 +0100
+@@ -9,7 +9,7 @@
+ /* Not all OS supports get_rload
+    steal the STUB idea from get_load
+  */
+-#if defined(QNX4) || defined(__CYGWIN__)
++#if defined(QNX4) || defined(__CYGWIN__) || 1
+ #define RLOADSTUB
+ #endif
+ 
-- 
2.7.0.rc3
