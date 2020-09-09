From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Wed,  9 Sep 2020 18:41:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: fix build for powerpc
 target
Message-ID: <20200909164104.6246-1-egorenar-dev@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 ...Makefile-fix-ARCH-for-TARGET-powerpc.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/makedumpfile/0003-Makefile-fix-ARCH-for-TARGET-powerpc.patch

diff --git a/package/makedumpfile/0003-Makefile-fix-ARCH-for-TARGET-powerpc.patch b/package/makedumpfile/0003-Makefile-fix-ARCH-for-TARGET-powerpc.patch
new file mode 100644
index 0000000000..ba75463ec4
--- /dev/null
+++ b/package/makedumpfile/0003-Makefile-fix-ARCH-for-TARGET-powerpc.patch
@@ -0,0 +1,28 @@
+From 18acea4df1d02f0275606fa4e73292d7759bdf15 Mon Sep 17 00:00:00 2001
+From: Alexander Egorenkov <egorenar-dev@posteo.net>
+Date: Wed, 9 Sep 2020 18:35:05 +0200
+Subject: [PATCH] Makefile: fix ARCH for TARGET powerpc
+
+TARGET 'ppc' and 'powerpc' shall result in ARCH 'powerpc32'.
+
+Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index ef20672..b55821c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -24,7 +24,7 @@ endif
+ ARCH := $(shell echo ${TARGET}  | sed -e s/i.86/x86/ -e s/sun4u/sparc64/ \
+ 			       -e s/arm.*/arm/ -e s/sa110/arm/ \
+ 			       -e s/s390x/s390/ -e s/parisc64/parisc/ \
+-			       -e s/ppc64/powerpc64/ -e s/ppc/powerpc32/)
++			       -e s/ppc64/powerpc64/ -e s/ppc/powerpc32/ -e s/powerpc/powerpc32/)
+ 
+ CROSS :=
+ ifneq ($(TARGET), $(HOST_ARCH))
+-- 
+2.28.0
+
-- 
2.28.0
