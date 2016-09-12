From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 22:40:45 +0200
Subject: [Buildroot] [git commit] package/urg: fix build
Message-ID: <20160912204049.7384481898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57e61a91531bf8ea696b5613bd8d846cc645a1d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update select-h patch to also fix the C++ serial driver.

Fixes:
  http://autobuild.buildroot.net/results/cd7/cd76699188d2ee99b5f2d32b6a797de0d832a192/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/urg/0001-select-h.patch | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/package/urg/0001-select-h.patch b/package/urg/0001-select-h.patch
index 09d1530..8de0a5b 100644
--- a/package/urg/0001-select-h.patch
+++ b/package/urg/0001-select-h.patch
@@ -1,11 +1,28 @@
---- urg-0.8.18/src/c/connection/serial_ctrl_lin.c	2010-11-22 01:48:01.000000000 +0000
-+++ urg-0.8.18.mod/src/c/connection/serial_ctrl_lin.c	2013-05-21 20:56:35.822025969 +0100
-@@ -17,7 +17,7 @@
- #include <fcntl.h>
+Serial driver: add missing header to C and C++ serial driver
+
+Fixes:
+  http://autobuild.buildroot.net/results/cd7/cd76699188d2ee99b5f2d32b6a797de0d832a192/
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+--- a/src/c/connection/serial_ctrl_lin.c	2016-09-11 15:49:42.599807053 +0200
++++ b/src/c/connection/serial_ctrl_lin.c	2016-09-11 15:50:07.850700420 +0200
+@@ -18,6 +18,7 @@
  #include <errno.h>
  #include <string.h>
--
+ 
 +#include <sys/select.h>
  //#include <ctype.h>
  
  enum {
+--- a/src/cpp/connection/SerialDevice_lin.cpp	2016-09-11 15:38:23.335547059 +0200
++++ b/src/cpp/connection/SerialDevice_lin.cpp	2016-09-11 15:38:38.472741418 +0200
+@@ -13,7 +13,7 @@
+ #include <cerrno>
+ #include <cstring>
+ #include <cstdio>
+-
++#include <sys/select.h>
+ 
+ class RawSerialDevice
+ {
