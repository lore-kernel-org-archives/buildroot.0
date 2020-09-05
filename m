From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  5 Sep 2020 14:54:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/mg: fix build with gcc 10
Message-ID: <20200905125444.568775-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/aacc02abf41e120e0d0b22faa38642e6d149d73f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-src-def.h-fix-build-with-gcc-10.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/mg/0001-src-def.h-fix-build-with-gcc-10.patch

diff --git a/package/mg/0001-src-def.h-fix-build-with-gcc-10.patch b/package/mg/0001-src-def.h-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..7823d5b6c5
--- /dev/null
+++ b/package/mg/0001-src-def.h-fix-build-with-gcc-10.patch
@@ -0,0 +1,36 @@
+From 29c83c917bd4f5d0c37ff0ab5da1a85762bd5530 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 5 Sep 2020 14:50:20 +0200
+Subject: [PATCH] src/def.h: fix build with gcc 10
+
+Define hlp as extern to avoid the following build failure with gcc 10
+(which defaults to -fno-common):
+
+  CCLD     mg
+/home/buildroot/autobuild/run/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: mg-bell.o:(.bss+0x0): multiple definition of `hlp'; mg-basic.o:(.bss+0x0): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/aacc02abf41e120e0d0b22faa38642e6d149d73f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/troglobit/mg/pull/7]
+---
+ src/def.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/def.h b/src/def.h
+index e4c049c..cd59725 100644
+--- a/src/def.h
++++ b/src/def.h
+@@ -650,7 +650,7 @@ int		 excline(char *);
+ char		*skipwhite(char *);
+ 
+ /* help.c X */
+-const char	*hlp;
++extern const char	*hlp;
+ int		 desckey(int, int);
+ int		 wallchart(int, int);
+ int		 help_help(int, int);
+-- 
+2.28.0
+
-- 
2.28.0
