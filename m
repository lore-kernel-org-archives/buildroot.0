From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 May 2014 22:09:43 +0200
Subject: [Buildroot] [PATCH v5 09/32] mesa3d: dri2 does not need udev support
In-Reply-To: <1399493406-7247-1-git-send-email-bernd.kuhls@t-online.de>
References: <1399493406-7247-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1399493406-7247-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?id=b959fd9674938e127a34d42d34b903e3a9ae7ad9
"The loader infrastructure for everything but DRI2 requires that udev be present"

Check for udev only for dri3.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../mesa3d/mesa3d-0002-dri2-does-not-need-udev.patch   |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/mesa3d/mesa3d-0002-dri2-does-not-need-udev.patch

diff --git a/package/mesa3d/mesa3d-0002-dri2-does-not-need-udev.patch b/package/mesa3d/mesa3d-0002-dri2-does-not-need-udev.patch
new file mode 100644
index 0000000..825debc
--- /dev/null
+++ b/package/mesa3d/mesa3d-0002-dri2-does-not-need-udev.patch
@@ -0,0 +1,16 @@
+diff -uNr Mesa-10.2.0-rc1.org/configure.ac Mesa-10.2.0-rc1/configure.ac
+--- Mesa-10.2.0-rc1.org/configure.ac	2014-05-03 02:17:23.000000000 +0200
++++ Mesa-10.2.0-rc1/configure.ac	2014-05-07 19:51:54.187921825 +0200
+@@ -998,11 +998,11 @@
+         DEFINES="$DEFINES -DHAVE_ALIAS"
+         if test "x$enable_dri3" = xyes; then
+             DEFINES="$DEFINES -DHAVE_DRI3"
+-        fi
+ 
+         if test "x$have_libudev" != xyes; then
+             AC_MSG_ERROR([libudev-dev required for building DRI])
+         fi
++        fi
+ 
+         case "$host_cpu" in
+         powerpc* | sparc*)
-- 
1.7.10.4
