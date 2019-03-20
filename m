From: Esben Haabendal <esben.haabendal@gmail.com>
Date: Wed, 20 Mar 2019 14:47:54 +0100
Subject: [Buildroot] [PATCH v2 3/3] gummiboot: fix compatibility with newer
 glibc versions
In-Reply-To: <20190320134754.14357-1-esben.haabendal@gmail.com>
References: <20190320134754.14357-1-esben.haabendal@gmail.com>
Message-ID: <20190320134754.14357-4-esben.haabendal@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Esben Haabendal <esben@haabendal.dk>

Signed-off-by: Esben Haabendal <esben@haabendal.dk>
---
 ...w-building-with-newer-glibc-versions.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 boot/gummiboot/0001-Allow-building-with-newer-glibc-versions.patch

diff --git a/boot/gummiboot/0001-Allow-building-with-newer-glibc-versions.patch b/boot/gummiboot/0001-Allow-building-with-newer-glibc-versions.patch
new file mode 100644
index 000000000000..b35cd499bce0
--- /dev/null
+++ b/boot/gummiboot/0001-Allow-building-with-newer-glibc-versions.patch
@@ -0,0 +1,31 @@
+From 40ab4167b5a45c772304a879c71b47d54de3b0e3 Mon Sep 17 00:00:00 2001
+From: Esben Haabendal <esben@haabendal.dk>
+Date: Wed, 20 Mar 2019 14:19:40 +0100
+Subject: [PATCH] Allow building with newer glibc versions
+
+Newer glibc versions does not include sys/sysmacros.h from sys/types.h
+anymore.  Including it unconditionally should be safe.
+
+See https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html for why
+this was done.
+
+Signed-off-by: Esben Haabendal <esben@haabendal.dk>
+---
+ src/setup/setup.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/setup/setup.c b/src/setup/setup.c
+index 6a4275a2ae36..53429375a146 100644
+--- a/src/setup/setup.c
++++ b/src/setup/setup.c
+@@ -37,6 +37,7 @@
+ #include <ftw.h>
+ #include <stdbool.h>
+ #include <blkid.h>
++#include <sys/sysmacros.h>
+ 
+ #include "efivars.h"
+ 
+-- 
+2.21.0
+
-- 
2.21.0
