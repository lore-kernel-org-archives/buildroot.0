From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 11 Sep 2013 22:34:35 +0200
Subject: [Buildroot] [git commit] libusb: build fix for flat binaries
Message-ID: <20130911210218.927569B6FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d1228894dab3444b161467c669d52deab88257f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/4d1/4d1b9c6132e7836bc2ecab4b1483b80d2e042dcd/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libusb/libusb-01-uclinux.patch |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/libusb/libusb-01-uclinux.patch b/package/libusb/libusb-01-uclinux.patch
new file mode 100644
index 0000000..cbf48a7
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
+--- libusb-1.0.9.orig/configure	2013-09-03 10:13:52.212301259 -0300
++++ libusb-1.0.9/configure	2013-09-03 10:19:08.443669386 -0300
+@@ -11093,7 +11093,7 @@
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking operating system" >&5
+ $as_echo_n "checking operating system... " >&6; }
+ case $host in
+-*-linux*)
++*-linux* | *-uclinux*)
+ 	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: Linux" >&5
+ $as_echo "Linux" >&6; }
+ 	backend="linux"
+diff -Nura libusb-1.0.9.orig/configure.ac libusb-1.0.9/configure.ac
+--- libusb-1.0.9.orig/configure.ac	2013-09-03 10:13:52.212301259 -0300
++++ libusb-1.0.9/configure.ac	2013-09-03 10:19:00.573411346 -0300
+@@ -46,7 +46,7 @@
+ 
+ AC_MSG_CHECKING([operating system])
+ case $host in
+-*-linux*)
++*-linux* | *-uclinux*)
+ 	AC_MSG_RESULT([Linux])
+ 	backend="linux"
+ 	;;
