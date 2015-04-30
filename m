From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 30 Apr 2015 20:32:55 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/bsdiff: add patch to fix missing
	header for u_char
Message-ID: <1430418775-19094-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix missing header <sys/types.h> for u_char in bspatch.c.

Fixes http://autobuild.buildroot.net/results/31a/31a837cf6e34b02dce498f2b12e40d6d16a5a8e6/

Patch not sent upstream - no maintainer mail address or repository found.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v1 -> v2:
  - Add description and Sob to patch file
---
 package/bsdiff/0001-Add-missing-header-for-u_char.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/bsdiff/0001-Add-missing-header-for-u_char.patch

diff --git a/package/bsdiff/0001-Add-missing-header-for-u_char.patch b/package/bsdiff/0001-Add-missing-header-for-u_char.patch
new file mode 100644
index 0000000..56affb4
--- /dev/null
+++ b/package/bsdiff/0001-Add-missing-header-for-u_char.patch
@@ -0,0 +1,17 @@
+bspatch: Fix missing header <sys/types.h> for u_char
+
+Fixes http://autobuild.buildroot.net/results/31a/31a837cf6e34b02dce498f2b12e40d6d16a5a8e6/
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+diff -purN bsdiff-4.3.orig/bspatch.c bsdiff-4.3/bspatch.c
+--- bsdiff-4.3.orig/bspatch.c	2015-04-30 13:47:26.485903359 +0200
++++ bsdiff-4.3/bspatch.c	2015-04-30 13:48:14.808908672 +0200
+@@ -35,6 +35,7 @@ __FBSDID("$FreeBSD: src/usr.bin/bsdiff/b
+ #include <err.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#include <sys/types.h>
+
+ static off_t offtin(u_char *buf)
+ {
-- 
2.3.7
