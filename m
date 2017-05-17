From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 17 May 2017 10:26:02 +0200
Subject: [Buildroot] [PATCH] package/pulseview: fix a build issue
Message-ID: <1495009562-7144-1-git-send-email-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a downstream patch fixing a build issue related to Boost.Math.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 ...-boost-math-related-build-issue-with-musl.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/pulseview/0003-build-fix-a-boost-math-related-build-issue-with-musl.patch

diff --git a/package/pulseview/0003-build-fix-a-boost-math-related-build-issue-with-musl.patch b/package/pulseview/0003-build-fix-a-boost-math-related-build-issue-with-musl.patch
new file mode 100644
index 0000000..d67a0b2
--- /dev/null
+++ b/package/pulseview/0003-build-fix-a-boost-math-related-build-issue-with-musl.patch
@@ -0,0 +1,29 @@
+From 7b5446117bce40af352823189cab771f33558622 Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <brgl@bgdev.pl>
+Date: Tue, 16 May 2017 15:38:06 +0200
+Subject: [PATCH 3/3] build: fix a boost math related build issue with musl
+
+Boost causes problems with its BOOST_MATH_BIG_CONSTANT definition when
+building with a musl libc toolchain. Add the -fext-numeric-literals to
+fix it.
+
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e8bc79f..c064cdb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -395,6 +395,7 @@ add_definitions(${QT_DEFINITIONS} -DQT_NO_KEYWORDS)
+ add_definitions(-D__STDC_LIMIT_MACROS)
+ add_definitions(-Wall -Wextra)
+ add_definitions(-std=c++11)
++add_definitions(-fext-numeric-literals)
+ 
+ if(ENABLE_DECODE)
+ 	add_definitions(-DENABLE_DECODE)
+-- 
+2.9.3
+
-- 
2.9.3
