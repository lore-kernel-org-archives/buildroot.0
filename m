From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Apr 2014 22:38:53 +0200
Subject: [Buildroot] [git commit] xserver: remove patch for aarch64
Message-ID: <20140410204504.37F209C483@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef2aad18edf5bc1b754ab9e3574444f401d3efc1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xorg-server-1.15.0.tar.gz already has full support of aarch64.
It was added with this commit http://patchwork.freedesktop.org/patch/14361/

Even though the patch in question doesn't break patching or building of xserver
it duplicates aarch64 entries in "include/servermd.h".

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xserver_xorg-server-01-aarch64-support.patch   |   23 --------------------
 1 files changed, 0 insertions(+), 23 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-01-aarch64-support.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-01-aarch64-support.patch
deleted file mode 100644
index ec497c8..0000000
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server-01-aarch64-support.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Add necessary definitions for AArch64
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: xserver_xorg-server-1.9.4/include/servermd.h
-===================================================================
---- xserver_xorg-server-1.9.4.orig/include/servermd.h	2009-11-04 20:31:46.000000000 +0100
-+++ xserver_xorg-server-1.9.4/include/servermd.h	2012-12-28 18:16:55.000000000 +0100
-@@ -68,6 +68,14 @@
-  * GLYPHPADBYTES is used.
-  */
- 
-+#ifdef __aarch64__
-+
-+# define IMAGE_BYTE_ORDER	LSBFirst
-+# define BITMAP_BIT_ORDER       LSBFirst
-+# define GLYPHPADBYTES		4
-+
-+#endif
-+
- #ifdef __avr32__
- 
- #define IMAGE_BYTE_ORDER        MSBFirst
