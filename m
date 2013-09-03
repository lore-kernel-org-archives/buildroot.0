From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Sep 2013 09:28:17 -0300
Subject: [Buildroot] [PATCH] libusb: build fix for flat binaries
Message-ID: <1378211297-2226-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/4d1/4d1b9c6132e7836bc2ecab4b1483b80d2e042dcd/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libusb/libusb-01-uclinux.patch | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libusb/libusb-01-uclinux.patch

diff --git a/package/libusb/libusb-01-uclinux.patch b/package/libusb/libusb-01-uclinux.patch
new file mode 100644
index 0000000..9d8cbb9
--- /dev/null
+++ b/package/libusb/libusb-01-uclinux.patch
@@ -0,0 +1,30 @@
+*-uclinux* is valid in the tuple for linux, it's used for flat binaries
+for example.
+Patch both configure* for consistency and to avoid an unnecessary autoreconf.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura libusb-1.0.9.orig/configure libusb-1.0.9/configure
+--- libusb-1.0.9.orig/configure	2013-09-03 08:57:14.412645064 -0300
++++ libusb-1.0.9/configure	2013-09-03 09:08:16.530353595 -0300
+@@ -11093,7 +11093,7 @@
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking operating system" >&5
+ $as_echo_n "checking operating system... " >&6; }
+ case $host in
+-*-linux*)
++*-*linux*)
+ 	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: Linux" >&5
+ $as_echo "Linux" >&6; }
+ 	backend="linux"
+diff -Nura libusb-1.0.9.orig/configure.ac libusb-1.0.9/configure.ac
+--- libusb-1.0.9.orig/configure.ac	2013-09-03 08:57:14.412645064 -0300
++++ libusb-1.0.9/configure.ac	2013-09-03 09:08:23.046567236 -0300
+@@ -46,7 +46,7 @@
+ 
+ AC_MSG_CHECKING([operating system])
+ case $host in
+-*-linux*)
++*-*linux*)
+ 	AC_MSG_RESULT([Linux])
+ 	backend="linux"
+ 	;;
-- 
1.8.1.5
