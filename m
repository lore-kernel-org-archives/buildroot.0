From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 19:00:18 +0200
Subject: [Buildroot] [git commit] package/urg: fix build caused by missing
	header inclusion
Message-ID: <20160916170048.363E88211A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8301c4fe3aaed3c7df33ac1e8d7bf8dc0cf6c54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update select-h patch to also fix the C++ serial driver.

Fixes:
  http://autobuild.buildroot.net/results/cd7/cd76699188d2ee99b5f2d32b6a797de0d832a192/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/urg/0001-select-h.patch | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/package/urg/0001-select-h.patch b/package/urg/0001-select-h.patch
index 09d1530..1d09bb5 100644
--- a/package/urg/0001-select-h.patch
+++ b/package/urg/0001-select-h.patch
@@ -1,11 +1,39 @@
---- urg-0.8.18/src/c/connection/serial_ctrl_lin.c	2010-11-22 01:48:01.000000000 +0000
-+++ urg-0.8.18.mod/src/c/connection/serial_ctrl_lin.c	2013-05-21 20:56:35.822025969 +0100
-@@ -17,7 +17,7 @@
- #include <fcntl.h>
+From 08c7ebec7c58fbc9c1cc0542863b34119c75c91f Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Thu, 15 Sep 2016 06:19:57 +0200
+Subject: [PATCH] Serial driver: add missing header to C and C++ serial driver
+
+Fixes:
+  http://autobuild.buildroot.net/results/cd7/cd76699188d2ee99b5f2d32b6a797de0d832a192/
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ src/c/connection/serial_ctrl_lin.c      | 1 +
+ src/cpp/connection/SerialDevice_lin.cpp | 1 +
+ 2 files changed, 2 insertions(+)
+
+Index: b/src/c/connection/serial_ctrl_lin.c
+===================================================================
+--- a/src/c/connection/serial_ctrl_lin.c
++++ b/src/c/connection/serial_ctrl_lin.c
+@@ -18,6 +18,7 @@
  #include <errno.h>
  #include <string.h>
--
+ 
 +#include <sys/select.h>
  //#include <ctype.h>
  
  enum {
+Index: b/src/cpp/connection/SerialDevice_lin.cpp
+===================================================================
+--- a/src/cpp/connection/SerialDevice_lin.cpp
++++ b/src/cpp/connection/SerialDevice_lin.cpp
+@@ -13,7 +13,7 @@
+ #include <cerrno>
+ #include <cstring>
+ #include <cstdio>
+-
++#include <sys/select.h>
+ 
+ class RawSerialDevice
+ {
