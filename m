From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 11:29:25 +0200
Subject: [Buildroot] [git commit] package/glorytun: remove patch
Message-ID: <20191018092554.549D18259E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2cda34dea8bd6824f52c2e764e2cef4cf84e920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is already in version

Fixes:
 - http://autobuild.buildroot.org/results/e4056bea4d2ef97d89753dce6441e56959b3f470

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glorytun/0001-Check-for-cpuid.h-too.patch | 29 -----------------------
 1 file changed, 29 deletions(-)

diff --git a/package/glorytun/0001-Check-for-cpuid.h-too.patch b/package/glorytun/0001-Check-for-cpuid.h-too.patch
deleted file mode 100644
index c05e01a262..0000000000
--- a/package/glorytun/0001-Check-for-cpuid.h-too.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 00fdf8a605f019570113e0f6af64c840767846c3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
-Date: Tue, 8 Oct 2019 08:50:09 +0000
-Subject: [PATCH] Check for cpuid.h too
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Adrien Gallou??t <adrien@gallouet.fr>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/angt/aegis256/commit/00fdf8a605f019570113e0f6af64c840767846c3]
----
- mud/aegis256/aegis256.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mud/aegis256/aegis256.c b/mud/aegis256/aegis256.c
-index 97cf171..5e3c237 100644
---- a/mud/aegis256/aegis256.c
-+++ b/mud/aegis256/aegis256.c
-@@ -7,7 +7,7 @@
- #define __has_include(X) 0
- #endif
- 
--#if __has_include("x86intrin.h")
-+#if (__has_include("x86intrin.h") && __has_include("cpuid.h"))
- 
- #include <string.h>
- #include <x86intrin.h>
