From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 24 Jun 2011 11:06:35 +0200
Subject: [Buildroot] [git commit] webkit: update pthread_getattr_np patches
	for uClibc 0.9.32
Message-ID: <20110624090758.5F3F988DF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ec61799c338f939adc9ca830fdab6cb07bd1c1cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to how it is done for qt.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/webkit/webkit-pthread_getattr_np.patch |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/webkit/webkit-pthread_getattr_np.patch b/package/webkit/webkit-pthread_getattr_np.patch
index b71c878..8027e37 100644
--- a/package/webkit/webkit-pthread_getattr_np.patch
+++ b/package/webkit/webkit-pthread_getattr_np.patch
@@ -13,16 +13,17 @@ Index: webkit-1.2.3/JavaScriptCore/runtime/Collector.cpp
 ===================================================================
 --- webkit-1.2.3.orig/JavaScriptCore/runtime/Collector.cpp	2010-07-22 17:16:19.000000000 +0200
 +++ webkit-1.2.3/JavaScriptCore/runtime/Collector.cpp	2010-07-22 17:25:02.000000000 +0200
-@@ -75,6 +75,18 @@
+@@ -75,6 +75,19 @@
  #endif
  #include <unistd.h>
  
 +#if defined(__UCLIBC__)
-+// versions of uClibc 0.9.31 and below do not have
++// versions of uClibc 0.9.32 and below with linuxthreads.old do not have
 +// pthread_getattr_np or pthread_attr_getstack.
 +#if __UCLIBC_MAJOR__ == 0 &&					\
 +  (__UCLIBC_MINOR__ < 9 ||					\
-+   (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 31))
++   (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 32)) &&	\
++   defined(__LINUXTHREADS_OLD__)
 +#define UCLIBC_USE_PROC_SELF_MAPS 1
 +#include <stdio_ext.h>
 +extern int *__libc_stack_end;
-- 
1.7.3.4
