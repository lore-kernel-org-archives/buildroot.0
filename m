From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 30 Aug 2014 22:15:39 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libdaemon: add patch to fix
	build with the musl C library
Message-ID: <1409429739-2998-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds a patch to the package libdaemon which removes an error when building
libdaemon against the musl C library.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v1 -> v2:
  - Add description to the top of the patch file
  - Add signed-off-by line to the patch file
  - Prefix the patch file name with libdaemon
---
 ...0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/libdaemon/libdaemon-0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch

diff --git a/package/libdaemon/libdaemon-0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch b/package/libdaemon/libdaemon-0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch
new file mode 100644
index 0000000..c8f4270
--- /dev/null
+++ b/package/libdaemon/libdaemon-0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch
@@ -0,0 +1,16 @@
+examples/testd.c: As the C POSIX library recommends include the <unistd.h>
+instead of <sys/unistd.h>. This removes an error when building libdaemon
+against the musl C library.
+
+Signed-off-by: J?rg Krause <jkrause@posteo.de>
+--- libdaemon-0.14.orig/examples/testd.c	2014-08-30 00:27:08.359832977 +0200
++++ libdaemon-0.14/examples/testd.c	2014-08-30 00:27:25.439832670 +0200
+@@ -23,7 +23,7 @@
+ #include <string.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+-#include <sys/unistd.h>
++#include <unistd.h>
+ #include <sys/select.h>
+ 
+ #include <libdaemon/dfork.h>
-- 
2.1.0
