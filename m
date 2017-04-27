From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 27 Apr 2017 07:36:09 +0200
Subject: [Buildroot] [PATCH] libmpeg2: fix sparc32 build
Message-ID: <20170427053609.GA20301@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The output detection recognized wrong target output, because
sparcv9 optimization flags used for sparcv8 build.

Fixes:
  http://autobuild.buildroot.net/results/1b3158b03f7eaf5afb5a4dab9526091888f6c9b8

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libmpeg2/0004-fix-sparc.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/libmpeg2/0004-fix-sparc.patch

diff --git a/package/libmpeg2/0004-fix-sparc.patch b/package/libmpeg2/0004-fix-sparc.patch
new file mode 100644
index 0000000..d876b66
--- /dev/null
+++ b/package/libmpeg2/0004-fix-sparc.patch
@@ -0,0 +1,16 @@
+Do not use sparcv9 optimization flags for sparcv8 builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur libmpeg2-0.5.1.orig/configure.ac libmpeg2-0.5.1/configure.ac
+--- libmpeg2-0.5.1.orig/configure.ac	2008-07-18 16:30:17.000000000 +0200
++++ libmpeg2-0.5.1/configure.ac	2017-04-26 21:09:15.780838339 +0200
+@@ -95,7 +95,7 @@
+ 		break
+ 	    fi
+ 	done;;
+-    sparc-* | sparc64-*)
++    sparc64-*)
+ 	AC_DEFINE([ARCH_SPARC],,[sparc architecture])
+ 	TRY_CFLAGS="$OPT_CFLAGS -mcpu=ultrasparc -mvis"
+ 	AC_TRY_CFLAGS([$TRY_CFLAGS $CFLAGS],[OPT_CFLAGS="$TRY_CFLAGS"]);;
-- 
2.1.4
