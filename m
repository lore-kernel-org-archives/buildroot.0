From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 09:31:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/musepack: fix musl build
Message-ID: <1454142700-9293-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/6eb/6ebc9cbee3fc48f4f5b658d11b040ad62fb6607f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/musepack/0003-musl.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/musepack/0003-musl.patch

diff --git a/package/musepack/0003-musl.patch b/package/musepack/0003-musl.patch
new file mode 100644
index 0000000..8c809e1
--- /dev/null
+++ b/package/musepack/0003-musl.patch
@@ -0,0 +1,24 @@
+Fix musl build
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr musepack_src_r475.org/mpcenc/mpcenc.h musepack_src_r475/mpcenc/mpcenc.h
+--- musepack_src_r475.org/mpcenc/mpcenc.h	2009-02-23 19:15:46.000000000 +0100
++++ musepack_src_r475/mpcenc/mpcenc.h	2016-01-30 09:29:08.000000000 +0100
+@@ -34,6 +34,7 @@
+ //// portable system includes //////////////////////////////////////
+ #include <stddef.h>
+ #include <math.h>
++#include <sys/select.h>
+ 
+ //// system dependent system includes //////////////////////////////
+ // low level I/O, where are prototypes and constants?
+@@ -50,7 +51,7 @@
+ # include <unistd.h>
+ #endif
+ 
+-#if   defined __linux__
++#if   defined __GLIBC__
+ #  include <fpu_control.h>
+ #elif defined __FreeBSD__
+ # include <machine/floatingpoint.h>
-- 
2.7.0.rc3
