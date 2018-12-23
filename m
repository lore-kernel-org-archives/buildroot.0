From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 23 Dec 2018 14:33:17 +0100
Subject: [Buildroot] [PATCH] package/solarus: bump to version 1.6.0
Message-ID: <20181223133317.3490-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here are the big features in Solarus 1.6:

    * OpenGL backend and support for GLSL shaders (by Stdgregwar and Vlag)
    * Support for external script editor of your choice.
        Zerobrane integration: autocompletion, debug breakpoints,
        stack inspection (by Stdgregwar)
    * Multiple improvements in map editor, including the much-requested
        contour generator, tile replacement and support for multiple
        tilesets
    * Multiple improvements in tileset editor, including multiple selection,
        custom frame count for animated tile patterns
    * Multiple improvements in sprite editor
    * Data import from other quests
    * Beautiful new free tilesets (Zoria by DragonDePlatino,
        Ocean?s Heart by Max Mraz)
    * Free pixel fonts (by Wekhter)
    * Custom hero states in Lua to allow advanced customization of the hero
    * Tons of new features in the Lua API

Last but not least: Solarus 1.6 is fully compatible with Solarus 1.5 quests.
You have no work to do to upgrade your project to Solarus 1.6.

Update the download url since solarus no longer use github.
Rebase patch.

See:
http://www.solarus-games.org/2018/12/22/solarus-1-6-released

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/solarus/0001-cmake-remove-Werror.patch | 27 +++++++++++++-------------
 package/solarus/solarus.hash                   |  2 +-
 package/solarus/solarus.mk                     |  5 +++--
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/package/solarus/0001-cmake-remove-Werror.patch b/package/solarus/0001-cmake-remove-Werror.patch
index b27908c829..533ac91c7d 100644
--- a/package/solarus/0001-cmake-remove-Werror.patch
+++ b/package/solarus/0001-cmake-remove-Werror.patch
@@ -1,27 +1,26 @@
-From 4d315359d15e1221f3463b77a960a60093aac893 Mon Sep 17 00:00:00 2001
+From 5f372ba3502369c6501c77650a761300d26f64c0 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Thu, 22 Jun 2017 00:19:56 +0200
 Subject: [PATCH] cmake: remove Werror
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
- cmake/AddCompilationFlags.cmake | 3 ---
- 1 file changed, 3 deletions(-)
+ cmake/AddCompilationFlags.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/cmake/AddCompilationFlags.cmake b/cmake/AddCompilationFlags.cmake
-index 5159ff9..a506033 100644
+index 2c105db7f..cb5c5719a 100644
 --- a/cmake/AddCompilationFlags.cmake
 +++ b/cmake/AddCompilationFlags.cmake
-@@ -24,9 +24,6 @@ endif()
- # Be less pedantic in release builds for users.
- set(CMAKE_CXX_FLAGS_RELEASE "-Wno-error -Wall -Wextra -Wno-unknown-pragmas -Wno-fatal-errors ${CMAKE_CXX_FLAGS_RELEASE}")
+@@ -25,7 +25,7 @@ endif()
+ set(CMAKE_CXX_FLAGS_RELEASE "-Wno-error -Wall -Wextra -Wno-unknown-pragmas -Wno-fatal-errors ${CMAKE_CXX_FLAGS_RELEASE} -O3")
  
--# Be more pedantic in debug mode for developers.
--set(CMAKE_CXX_FLAGS_DEBUG "-Werror -Wall -Wextra -pedantic ${CMAKE_CXX_FLAGS_DEBUG}")
--
- # Platform-specific flags.
- if(WIN32)
-   # MinGW: disable the console by default.
+ # Be more pedantic in debug mode for developers.
+-set(CMAKE_CXX_FLAGS_DEBUG "-Werror -Wall -Wextra -Wno-error=deprecated-declarations -pedantic ${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG")
++set(CMAKE_CXX_FLAGS_DEBUG "-Wno-error -Wall -Wextra -Wno-error=deprecated-declarations -pedantic ${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG")
+ if(CMAKE_COMPILER_IS_GNUCXX)
+     set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wsuggest-override")
+ endif()
 -- 
-2.9.4
+2.14.5
 
diff --git a/package/solarus/solarus.hash b/package/solarus/solarus.hash
index 8ed5cafa4b..e4a7a3a6b6 100644
--- a/package/solarus/solarus.hash
+++ b/package/solarus/solarus.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 5930584e7c333089a2c1bf372ccc25ad3fb5c1d973189d2bf67f2308189af94d  solarus-v1.5.3.tar.gz
+sha256 d800fdf388f860732f2d40c8dd635c34fd1c452857f75bf9b3a421e3ef5ee751  solarus-1.6.0-src.tar.gz
 
 sha256 09cb24006b6a3f2698d8851dc5df4f413c1a98e20d4008bffd76ec236f14244d  license.txt
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  license_gpl.txt
diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
index af37f81a0b..97dcbd4773 100644
--- a/package/solarus/solarus.mk
+++ b/package/solarus/solarus.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-SOLARUS_VERSION = v1.5.3
-SOLARUS_SITE = $(call github,solarus-games,solarus,$(SOLARUS_VERSION))
+SOLARUS_VERSION = 1.6.0
+SOLARUS_SITE = http://www.solarus-games.org/downloads/solarus
+SOLARUS_SOURCE = solarus-$(SOLARUS_VERSION)-src.tar.gz
 
 SOLARUS_LICENSE = GPL-3.0 (code), CC-BY-SA-4.0 (Solarus logos and icons), \
 	CC-BY-SA-3.0 (GUI icons)
-- 
2.14.5
