From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 13 Apr 2017 21:22:25 -0300
Subject: [Buildroot] [PATCH] atop: bump version to 2.3.0
Message-ID: <20170414002225.11351-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch applied upstream [1].

[1] https://github.com/Atoptool/atop/commit/a2306c0e1c83f5a123ce521a34d9efaa2297c26d

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
49 builds, 3 skipped, 0 failed
---
 .../0001-remove-unused-include-of-termio.h.patch   | 52 ----------------------
 package/atop/atop.hash                             |  2 +-
 package/atop/atop.mk                               |  2 +-
 3 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 package/atop/0001-remove-unused-include-of-termio.h.patch

diff --git a/package/atop/0001-remove-unused-include-of-termio.h.patch b/package/atop/0001-remove-unused-include-of-termio.h.patch
deleted file mode 100644
index 3a04b05e6..000000000
--- a/package/atop/0001-remove-unused-include-of-termio.h.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-remove unused include of termio.h
-
-This header is not provided by musl, leading to build failures.
-
-Patch status: accepted upstream.
-
-Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
----
-diff -purN atop-2.2-3.orig/showgeneric.c atop-2.2-3/showgeneric.c
---- atop-2.2-3.orig/showgeneric.c	2016-07-19 22:07:43.275324499 -0300
-+++ atop-2.2-3/showgeneric.c	2016-07-19 22:08:16.171453283 -0300
-@@ -268,7 +268,6 @@ static const char rcsid[] = "$Id: showge
- #include <errno.h>
- #include <fcntl.h>
- #include <string.h>
--#include <termio.h>
- #include <unistd.h>
- #include <stdarg.h>
- #include <curses.h>
-diff -purN atop-2.2-3.orig/showlinux.c atop-2.2-3/showlinux.c
---- atop-2.2-3.orig/showlinux.c	2016-07-19 22:07:43.275324499 -0300
-+++ atop-2.2-3/showlinux.c	2016-07-19 22:08:20.979472459 -0300
-@@ -274,7 +274,6 @@ static const char rcsid[] = "$Id: showli
- #include <string.h>
- #include <errno.h>
- #include <fcntl.h>
--#include <termio.h>
- #include <unistd.h>
- #include <stdarg.h>
- #include <curses.h>
-diff -purN atop-2.2-3.orig/showprocs.c atop-2.2-3/showprocs.c
---- atop-2.2-3.orig/showprocs.c	2016-07-19 22:07:43.275324499 -0300
-+++ atop-2.2-3/showprocs.c	2016-07-19 22:08:25.083488900 -0300
-@@ -94,7 +94,6 @@ static const char rcsid[] = "$Id: showpr
- #include <string.h>
- #include <errno.h>
- #include <fcntl.h>
--#include <termio.h>
- #include <unistd.h>
- #include <stdarg.h>
- #include <curses.h>
-diff -purN atop-2.2-3.orig/showsys.c atop-2.2-3/showsys.c
---- atop-2.2-3.orig/showsys.c	2016-07-19 22:07:43.275324499 -0300
-+++ atop-2.2-3/showsys.c	2016-07-19 22:08:29.099505047 -0300
-@@ -80,7 +80,6 @@ static const char rcsid[] = "XXXXXX";
- #include <string.h>
- #include <errno.h>
- #include <fcntl.h>
--#include <termio.h>
- #include <unistd.h>
- #include <stdarg.h>
- #include <curses.h>
diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index bbf268d06..7a7bffbfa 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  c785b8a2355be28b3de6b58a8ea4c4fcab8fadeaa57a99afeb03c66fac8e055d  atop-2.2-3.tar.gz
+sha256  73e4725de0bafac8c63b032e8479e2305e3962afbe977ec1abd45f9e104eb264  atop-2.3.0.tar.gz
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index f0893821c..2cc0da6af 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.2-3
+ATOP_VERSION = 2.3.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
-- 
2.11.0
