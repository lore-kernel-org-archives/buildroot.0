From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Fri,  5 Oct 2018 15:31:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/poppler: Remove patch which is not
 needed for poppler 0.69.0
In-Reply-To: <20181005133142.1205-1-olivier.schonken@gmail.com>
References: <20181005133142.1205-1-olivier.schonken@gmail.com>
Message-ID: <20181005133142.1205-2-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch has been applied to the upstream project,
https://github.com/freedesktop/poppler/commit/d3f12611b30e6421f05603a9838ed9131b1aa61e
and is thus not needed anymore.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 ...c-include-ctype.h-to-fix-build-error.patch | 37 -------------------
 1 file changed, 37 deletions(-)
 delete mode 100644 package/poppler/0001-Form.cc-include-ctype.h-to-fix-build-error.patch

diff --git a/package/poppler/0001-Form.cc-include-ctype.h-to-fix-build-error.patch b/package/poppler/0001-Form.cc-include-ctype.h-to-fix-build-error.patch
deleted file mode 100644
index 8d210dab99..0000000000
--- a/package/poppler/0001-Form.cc-include-ctype.h-to-fix-build-error.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f40143f7acca81b7d39d774ed4c349aec8d9310b Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 23 Sep 2017 11:37:23 +0200
-Subject: [PATCH] Form.cc: include ctype.h to fix build error
-
-Fixes
-Form.cc:546:28: error: 'isdigit' was not declared in this scope
-Form.cc:548:34: error: 'isxdigit' was not declared in this scope
-Form.cc:575:40: error: 'isxdigit' was not declared in this scope
-
-detected by buildroot autobuilders:
-http://autobuild.buildroot.net/results/a6a/a6a336f8b6a0136b204a34091e33dc4598178125/
-when cross-compiling with
-gcc version 4.7.3 (crosstool-NG hg+-c65fcf8a34b7)
-
-Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=102951
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- poppler/Form.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/poppler/Form.cc b/poppler/Form.cc
-index 83bceb20..e7efae95 100644
---- a/poppler/Form.cc
-+++ b/poppler/Form.cc
-@@ -32,6 +32,7 @@
- #include <stddef.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <ctype.h>
- #include "goo/gmem.h"
- #include "goo/GooString.h"
- #include "Error.h"
--- 
-2.11.0
-
-- 
2.17.1
