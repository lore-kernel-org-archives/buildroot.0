From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Nov 2019 19:48:11 +0100
Subject: [Buildroot] [git commit] package/grantlee: fix build with newer
 cmake
Message-ID: <20191103184922.8748380FA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2130f663ece46b030f07ac042a21ddb06058a103
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/8cb0c153620be5765c098f05a2440fa1f3e4e2c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../grantlee/0001-Remove-vestigial-ansi-flag.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/grantlee/0001-Remove-vestigial-ansi-flag.patch b/package/grantlee/0001-Remove-vestigial-ansi-flag.patch
new file mode 100644
index 0000000000..250463c2fd
--- /dev/null
+++ b/package/grantlee/0001-Remove-vestigial-ansi-flag.patch
@@ -0,0 +1,27 @@
+From c989fcf192d01d26866faf6405a28ba4fdce64c3 Mon Sep 17 00:00:00 2001
+From: Stephen Kelly <steveire@gmail.com>
+Date: Sun, 21 Jul 2019 16:00:41 +0100
+Subject: [PATCH] Remove vestigial -ansi flag
+
+This causes the compiler to not operate in C++11 mode, meaning that
+headers such as <type_traits> issue errors.
+[Retrieved from:
+https://github.com/steveire/grantlee/commit/c989fcf192d01d26866faf6405a28ba4fdce64c3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6d51110..9172213 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -59,7 +59,7 @@ endif()
+ 
+ if (CMAKE_COMPILER_IS_GNUCXX)
+   set (CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wno-long-long -std=iso9899:1990 -Wundef -Wcast-align -Werror-implicit-function-declaration -Wchar-subscripts -Wall -W -Wpointer-arith -Wwrite-strings -Wformat-security -Wmissing-format-attribute -fno-common")
+-  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wnon-virtual-dtor -Wno-long-long -ansi -Wundef -Wcast-align -Wchar-subscripts -Wall -W -Wpointer-arith -Wformat-security -fno-check-new -fno-common ")
++  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wnon-virtual-dtor -Wno-long-long -Wundef -Wcast-align -Wchar-subscripts -Wall -W -Wpointer-arith -Wformat-security -fno-check-new -fno-common ")
+ 
+   if (CMAKE_BUILD_TYPE MATCHES TestCocoon)
+     # Needed on 64 bit
