From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Mar 2019 21:22:14 +0100
Subject: [Buildroot] [git commit] gummiboot: fix compatibility with newer
 glibc versions
Message-ID: <20190320203118.2C0E082B3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b38dfa7554760327b35b43d3137c73056c2419fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Esben Haabendal <esben@haabendal.dk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Allow-building-with-newer-glibc-versions.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/boot/gummiboot/0001-Allow-building-with-newer-glibc-versions.patch b/boot/gummiboot/0001-Allow-building-with-newer-glibc-versions.patch
new file mode 100644
index 0000000000..b35cd499bc
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
