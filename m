From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 15:29:01 +0100
Subject: [Buildroot] [git commit] package/ninja: set minimum cmake version
 to 3.10
Message-ID: <20200203141825.81F50888CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9cdc1f2b6eaf0d493c89750855c3cdde813802e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CMakeLists.txt file uses the CMP0091 which is an MSVC runtime
library flag abstraction macro.

Because we are not building ninja for Microsoft, it is safe to remove
this macro and set the minimum version to 3.10.

Fixes:
http://autobuild.buildroot.net/results/992b34c5625ec733d8dce678aa7a7540c4768ca1

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-set-minimum-cmake-version-to-3.10.patch   | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/ninja/0001-set-minimum-cmake-version-to-3.10.patch b/package/ninja/0001-set-minimum-cmake-version-to-3.10.patch
new file mode 100644
index 0000000000..d75b78fde9
--- /dev/null
+++ b/package/ninja/0001-set-minimum-cmake-version-to-3.10.patch
@@ -0,0 +1,30 @@
+From 4645f74eb668cc1cf876d1e9bef933591da7575c Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 3 Feb 2020 06:21:57 -0800
+Subject: [PATCH] set minimum cmake version to 3.10
+
+The CMakeLists.txt file uses the CMP0091 which is an MSVC runtime library flag
+abstraction macro.
+
+Because we are not building ninja for Microsoft, it is safe to remove this
+macro and set the minimum version to 3.10.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ CMakeLists.txt | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 60fd8a1..a040e0b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,4 @@
+-cmake_minimum_required(VERSION 3.15)
+-cmake_policy(SET CMP0091 NEW)
++cmake_minimum_required(VERSION 3.10)
+ project(ninja)
+ 
+ if(CMAKE_BUILD_TYPE MATCHES "Release")
+-- 
+2.24.1
+
