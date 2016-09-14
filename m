From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Sep 2016 11:46:05 +0200
Subject: [Buildroot] [git commit] Revert "package/urg: fix build"
Message-ID: <20160914094629.5642482261@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8c0c2ef3dea429f6b2c7d728f7c858312f171d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 57e61a91531bf8ea696b5613bd8d846cc645a1d5.

The patch doesn't apply, and makes the urg package fail in all
situations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/urg/0001-select-h.patch | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/package/urg/0001-select-h.patch b/package/urg/0001-select-h.patch
index 8de0a5b..09d1530 100644
--- a/package/urg/0001-select-h.patch
+++ b/package/urg/0001-select-h.patch
@@ -1,28 +1,11 @@
-Serial driver: add missing header to C and C++ serial driver
-
-Fixes:
-  http://autobuild.buildroot.net/results/cd7/cd76699188d2ee99b5f2d32b6a797de0d832a192/
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
---- a/src/c/connection/serial_ctrl_lin.c	2016-09-11 15:49:42.599807053 +0200
-+++ b/src/c/connection/serial_ctrl_lin.c	2016-09-11 15:50:07.850700420 +0200
-@@ -18,6 +18,7 @@
+--- urg-0.8.18/src/c/connection/serial_ctrl_lin.c	2010-11-22 01:48:01.000000000 +0000
++++ urg-0.8.18.mod/src/c/connection/serial_ctrl_lin.c	2013-05-21 20:56:35.822025969 +0100
+@@ -17,7 +17,7 @@
+ #include <fcntl.h>
  #include <errno.h>
  #include <string.h>
- 
+-
 +#include <sys/select.h>
  //#include <ctype.h>
  
  enum {
---- a/src/cpp/connection/SerialDevice_lin.cpp	2016-09-11 15:38:23.335547059 +0200
-+++ b/src/cpp/connection/SerialDevice_lin.cpp	2016-09-11 15:38:38.472741418 +0200
-@@ -13,7 +13,7 @@
- #include <cerrno>
- #include <cstring>
- #include <cstdio>
--
-+#include <sys/select.h>
- 
- class RawSerialDevice
- {
