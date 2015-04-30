From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 30 Apr 2015 14:07:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/bsdiff: add patch to fix missing
	header for u_char
Message-ID: <1430395648-17870-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/31a/31a837cf6e34b02dce498f2b12e40d6d16a5a8e6/

Patch not sent upstream - no maintainer mail address of repository found.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/bsdiff/0001-Add-missing-header-for-u_char.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/bsdiff/0001-Add-missing-header-for-u_char.patch

diff --git a/package/bsdiff/0001-Add-missing-header-for-u_char.patch b/package/bsdiff/0001-Add-missing-header-for-u_char.patch
new file mode 100644
index 0000000..9a7a837
--- /dev/null
+++ b/package/bsdiff/0001-Add-missing-header-for-u_char.patch
@@ -0,0 +1,11 @@
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
