From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 10:18:28 +0200
Subject: [Buildroot] [git commit] libmpeg2: fix sparc32 build
Message-ID: <20170427081947.0550782809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43155c5b4c458c4526be47834c5e99bd11245d56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The output detection recognized wrong target output, because
sparcv9 optimization flags used for sparcv8 build.

Fixes:
  http://autobuild.buildroot.net/results/1b3158b03f7eaf5afb5a4dab9526091888f6c9b8

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmpeg2/0004-fix-sparc.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

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
