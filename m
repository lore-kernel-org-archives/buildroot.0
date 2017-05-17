From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 17 May 2017 12:10:00 +0200
Subject: [Buildroot] [PATCH v3] package/pulseview: fix a build issue
Message-ID: <1495015800-30480-1-git-send-email-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport an upstream patch fixing the build issue related to boost
math definitions.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
v1 -> v2:
- backported the upstream patch instead of fixing it myself

v2 -> v3:
- dropped the patch numbering
- added the missing sign-off

 ...txt-Avoid-fext-numeric-literals-not-suppo.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/pulseview/0003-CMakeLists.txt-Avoid-fext-numeric-literals-not-suppo.patch

diff --git a/package/pulseview/0003-CMakeLists.txt-Avoid-fext-numeric-literals-not-suppo.patch b/package/pulseview/0003-CMakeLists.txt-Avoid-fext-numeric-literals-not-suppo.patch
new file mode 100644
index 0000000..89137f2
--- /dev/null
+++ b/package/pulseview/0003-CMakeLists.txt-Avoid-fext-numeric-literals-not-suppo.patch
@@ -0,0 +1,28 @@
+From 6ad4d7a6f17edecc3523a7ab3d627f9a70dbacc1 Mon Sep 17 00:00:00 2001
+From: Uwe Hermann <uwe@hermann-uwe.de>
+Date: Wed, 17 May 2017 11:00:44 +0200
+Subject: [PATCH] CMakeLists.txt: Avoid -fext-numeric-literals, (not supported
+ by clang).
+
+This (re-)fixes bug #863.
+
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e8bc79f..e7e4432 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -395,6 +395,7 @@ add_definitions(${QT_DEFINITIONS} -DQT_NO_KEYWORDS)
+ add_definitions(-D__STDC_LIMIT_MACROS)
+ add_definitions(-Wall -Wextra)
+ add_definitions(-std=c++11)
++add_definitions(-DBOOST_MATH_DISABLE_FLOAT128=1)
+ 
+ if(ENABLE_DECODE)
+ 	add_definitions(-DENABLE_DECODE)
+-- 
+2.9.3
+
-- 
2.9.3
