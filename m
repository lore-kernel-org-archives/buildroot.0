From: Mauro Condarelli <mc5686@mclink.it>
Date: Fri, 21 Apr 2017 12:33:08 +0200
Subject: [Buildroot] [PATCH 1/1] Simple additional patch to allow
	compilation of python-3.6.1 under mipsel-buildroot-linux-musl.
Message-ID: <20170421103308.6557-1-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 .../0005-mips-musl-fix-sgidefs_h-not-found-error.patch       | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 package/libffi/0005-mips-musl-fix-sgidefs_h-not-found-error.patch

diff --git a/package/libffi/0005-mips-musl-fix-sgidefs_h-not-found-error.patch b/package/libffi/0005-mips-musl-fix-sgidefs_h-not-found-error.patch
new file mode 100644
index 000000000..b9490f30a
--- /dev/null
+++ b/package/libffi/0005-mips-musl-fix-sgidefs_h-not-found-error.patch
@@ -0,0 +1,12 @@
+diff -ru libffi-3.2.1_/src/mips/ffitarget.h libffi-3.2.1/src/mips/ffitarget.h
+--- libffi-3.2.1_/src/mips/ffitarget.h	2014-11-08 13:47:24.000000000 +0100
++++ libffi-3.2.1/src/mips/ffitarget.h	2017-04-21 10:53:23.447304581 +0200
+@@ -32,7 +32,7 @@
+ #error "Please do not include ffitarget.h directly into your source.  Use ffi.h instead."
+ #endif
+ 
+-#ifdef linux
++#ifdef __linux__
+ # include <asm/sgidefs.h>
+ #elif defined(__rtems__)
+ /*
-- 
2.11.0
