From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Apr 2012 20:54:19 +0200
Subject: [Buildroot] [git commit] kexec: fix build without largefile support
Message-ID: <20120422185443.0B71796B89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56bf500c8b0163510e156fbe2ce5e954176481bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kexec/kexec-largefile.patch |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/kexec/kexec-largefile.patch b/package/kexec/kexec-largefile.patch
new file mode 100644
index 0000000..74dd8e2
--- /dev/null
+++ b/package/kexec/kexec-largefile.patch
@@ -0,0 +1,22 @@
+[PATCH] vmcore-dmesg: don't enforce largefile handling
+
+Breaks build on !largefile toolchains.
+
+Instead simply use whatever mode is selected by toolchain / CFLAGS.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ vmcore-dmesg/vmcore-dmesg.c |    2 --
+ 1 file changed, 2 deletions(-)
+
+Index: kexec-tools-2.0.3/vmcore-dmesg/vmcore-dmesg.c
+===================================================================
+--- kexec-tools-2.0.3.orig/vmcore-dmesg/vmcore-dmesg.c
++++ kexec-tools-2.0.3/vmcore-dmesg/vmcore-dmesg.c
+@@ -1,6 +1,4 @@
+ #define _XOPEN_SOURCE 600
+-#define _LARGEFILE_SOURCE 1
+-#define _FILE_OFFSET_BITS 64
+ #include <endian.h>
+ #include <byteswap.h>
+ #include <stdio.h>
