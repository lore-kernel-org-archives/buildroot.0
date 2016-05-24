From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 22:01:03 +0200
Subject: [Buildroot] [git commit] erlang-p1-stringprep: backport upstream
	commit to fix musl build
Message-ID: <20160524200143.AF216807F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20b3ed7408dd106b5d6d64ab0683e493537b7411
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Amusingly, a fix made upstream to fix the build on Windows also fixes
the build with the musl C library.

Fixes:

  http://autobuild.buildroot.net/results/d7b0cacc5d99d8dc91fdeaf770bb5d2b1b1975b6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Stdint-is-required-on-windows.patch       | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/erlang-p1-stringprep/0001-Stdint-is-required-on-windows.patch b/package/erlang-p1-stringprep/0001-Stdint-is-required-on-windows.patch
new file mode 100644
index 0000000..7385503
--- /dev/null
+++ b/package/erlang-p1-stringprep/0001-Stdint-is-required-on-windows.patch
@@ -0,0 +1,28 @@
+From f5a2b8b78afb253630ee8833f16f131b3b52701e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pawe=C5=82=20Chmielowski?= <pchmielowski@process-one.net>
+Date: Mon, 29 Feb 2016 10:56:32 +0100
+Subject: [PATCH] Stdint is required on windows
+
+[Backport from upstream commit
+4fc5cae81122540fff983e40dda1fa905c329fd0, which happens to not only
+fix the build on Windows, but also with the musl C library.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ c_src/stringprep.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/c_src/stringprep.cpp b/c_src/stringprep.cpp
+index 461cf09..26215cf 100644
+--- a/c_src/stringprep.cpp
++++ b/c_src/stringprep.cpp
+@@ -19,6 +19,7 @@
+  */
+ 
+ #include <string.h>
++#include <stdint.h>
+ #include <erl_nif.h>
+ 
+ #include "uni_data.c"
+-- 
+2.7.4
+
