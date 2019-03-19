From: Esben Haabendal <esben.haabendal@gmail.com>
Date: Tue, 19 Mar 2019 12:28:52 +0100
Subject: [Buildroot] [PATCH 3/3] gummiboot: fix compatibility with newer
 glibc versions
In-Reply-To: <20190319112852.9592-1-esben.haabendal@gmail.com>
References: <20190319112852.9592-1-esben.haabendal@gmail.com>
Message-ID: <20190319112852.9592-4-esben.haabendal@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Esben Haabendal <esben@haabendal.dk>

Signed-off-by: Esben Haabendal <esben@haabendal.dk>
---
 boot/gummiboot/0001-glibc-2.25-fix.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 boot/gummiboot/0001-glibc-2.25-fix.patch

diff --git a/boot/gummiboot/0001-glibc-2.25-fix.patch b/boot/gummiboot/0001-glibc-2.25-fix.patch
new file mode 100644
index 000000000000..377098f9ea60
--- /dev/null
+++ b/boot/gummiboot/0001-glibc-2.25-fix.patch
@@ -0,0 +1,16 @@
+Allow building with glibc with sys/sysmacros.h removed from sys/types.h.
+
+See https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html for why
+this was done.
+
+diff -urN gummiboot-43~orig/src/setup/setup.c gummiboot-43/src/setup/setup.c
+--- gummiboot-43~orig/src/setup/setup.c	2019-03-14 22:28:34.533206018 +0100
++++ gummiboot-43/src/setup/setup.c	2019-03-15 06:40:07.895651992 +0100
+@@ -37,6 +37,7 @@
+ #include <ftw.h>
+ #include <stdbool.h>
+ #include <blkid.h>
++#include <sys/sysmacros.h>
+ 
+ #include "efivars.h"
+ 
-- 
2.21.0
