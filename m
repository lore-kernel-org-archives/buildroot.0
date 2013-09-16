From: Fatih =?UTF-8?Q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Mon, 16 Sep 2013 10:32:14 +0300
Subject: [Buildroot] [PATCH] directfb: Add upstream patch to fix qt5base
	build
Message-ID: <1379316734.4275.2.camel@viko>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/8c7eaf99e365ecff28c097475b235dbe8d614294/

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 ...irectfb-remove-redefinition-of-__typeof__.patch |   28 ++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/directfb/directfb-remove-redefinition-of-__typeof__.patch

diff --git a/package/directfb/directfb-remove-redefinition-of-__typeof__.patch b/package/directfb/directfb-remove-redefinition-of-__typeof__.patch
new file mode 100644
index 0000000..e3861af
--- /dev/null
+++ b/package/directfb/directfb-remove-redefinition-of-__typeof__.patch
@@ -0,0 +1,28 @@
+Remove definition to fix qt5 build.
+
+Fetch from: http://git.directfb.org/?p=core/DirectFB.git;a=patch;h=203f78a4193a8ff110dec3c860e0928af1a0a72f
+
+From 203f78a4193a8ff110dec3c860e0928af1a0a72f Mon Sep 17 00:00:00 2001
+From: Denis Oliver Kropp <dok@directfb.org>
+Date: Wed, 31 Jul 2013 21:56:05 +0200
+Subject: [PATCH] libdirect: Remove redefinition of __typeof__!!!
+
+---
+ lib/direct/os/linux/glibc/types.h |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/lib/direct/os/linux/glibc/types.h b/lib/direct/os/linux/glibc/types.h
+index 08e94b2..80cb350 100644
+--- a/lib/direct/os/linux/glibc/types.h
++++ b/lib/direct/os/linux/glibc/types.h
+@@ -81,7 +81,6 @@ typedef int64_t s64;
+ #define __dfb_no_instrument_function__  __attribute__((no_instrument_function))
+ #define __constructor__                 __attribute__((constructor))
+ #define __destructor__                  __attribute__((destructor))
+-#define __typeof__(x)                   __typeof__(x)
+ 
+ #ifndef __func__
+ #define __func__                        __FUNCTION__
+-- 
+1.7.9.5
+
-- 
1.7.10.4
