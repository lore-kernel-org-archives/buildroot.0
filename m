From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Apr 2018 21:50:29 +0200
Subject: [Buildroot] [PATCH 15/23] graphite2: remove Blackfin related patch
In-Reply-To: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
References: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180405195037.32641-16-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../graphite2/0001-disable-double-promotion.patch  | 23 ----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 package/graphite2/0001-disable-double-promotion.patch

diff --git a/package/graphite2/0001-disable-double-promotion.patch b/package/graphite2/0001-disable-double-promotion.patch
deleted file mode 100644
index 888d862341..0000000000
--- a/package/graphite2/0001-disable-double-promotion.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Don't use -Wdouble-promotion gcc option
-
-The warning flag isn't recognized for older GCC versions (blackfin),
-so just disable it.
-
-Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
-[Gustavo: update for 1.3.5]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: update for 1.3.10]
-
-diff -Nura graphite2-1.3.5.orig/src/CMakeLists.txt graphite2-1.3.5/src/CMakeLists.txt
---- graphite2-1.3.5.orig/src/CMakeLists.txt	2016-02-15 11:46:45.941906112 -0300
-+++ graphite2-1.3.5/src/CMakeLists.txt	2016-02-15 11:46:54.237194222 -0300
-@@ -111,9 +111,6 @@
-     if (${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86|i.86")
-         add_definitions(-mfpmath=sse -msse2)
-     endif (${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86|i.86")
--    if (CMAKE_COMPILER_IS_GNUCXX)
--        add_definitions(-Wdouble-promotion)
--    endif (CMAKE_COMPILER_IS_GNUCXX)
-     message(STATUS "Compiler ID is: ${CMAKE_CXX_COMPILER_ID}")
-     if (${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
-         add_definitions(-Wimplicit-fallthrough)
-- 
2.14.3
