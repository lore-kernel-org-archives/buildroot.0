From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 11:03:35 +0200
Subject: [Buildroot] [git commit] directfb: Add upstream patch to fix
	qt5base build
Message-ID: <20130919133908.E2CC79B7EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ea44760f6a5ee8bf7f419ee0cc65b481a8cfe92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/8c7eaf99e365ecff28c097475b235dbe8d614294/

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...irectfb-remove-redefinition-of-__typeof__.patch |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

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
