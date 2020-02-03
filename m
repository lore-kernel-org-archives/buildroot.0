From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  3 Feb 2020 07:51:17 -0800
Subject: [Buildroot] [PATCH 1/1] package/ninja: remove fdiagnostics-color
 from make command
Message-ID: <20200203155117.1972331-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-fdiagnostics-color was introduced in gcc 4.9 and the minimum supported version
that Buildroot supports is 4.8.

Fixes:
http://autobuild.buildroot.net/results/e5a02faa75345009e7cdcbf9d693199bee4741aa
Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 ...fdiagnostics-color-from-make-command.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/ninja/0002-remove-fdiagnostics-color-from-make-command.patch

diff --git a/package/ninja/0002-remove-fdiagnostics-color-from-make-command.patch b/package/ninja/0002-remove-fdiagnostics-color-from-make-command.patch
new file mode 100644
index 0000000000..d419ab48dc
--- /dev/null
+++ b/package/ninja/0002-remove-fdiagnostics-color-from-make-command.patch
@@ -0,0 +1,29 @@
+From 87caa8c4bc536f745aceed757ce8a492fbdba84f Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 3 Feb 2020 07:36:58 -0800
+Subject: [PATCH] remove fdiagnostics-color from make command
+
+-fdiagnostics-color was introduced in gcc 4.9 and the minimum supported version
+that Buildroot supports is 4.8.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a040e0b..af8010f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -18,7 +18,7 @@ if(MSVC)
+ 	set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
+ 	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4 /GR- /Zc:__cplusplus")
+ else()
+-	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated -fdiagnostics-color")
++	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated")
+ endif()
+ 
+ find_program(RE2C re2c)
+-- 
+2.24.1
+
-- 
2.24.1
