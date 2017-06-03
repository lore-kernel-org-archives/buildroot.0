From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  3 Jun 2017 17:19:35 +0200
Subject: [Buildroot] [PATCH] package/openpowerlink: bump to 2.6.0
Message-ID: <20170603151935.6012-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://sourceforge.net/p/openpowerlink/news/2017/05/openpowerlink-v260

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...all-the-stack-libraries-to-lib-subdirectory.patch | 16 ++++++++--------
 .../0002-cmake-install-oplk-headers-files.patch      |  8 ++++----
 .../0003-Add-top-level-CMakeLists.txt.patch          |  8 ++++----
 ...=> 0004-use-contrib-getopt-only-on-Windows.patch} | 20 ++++++++++----------
 ...-config-to-fix-static-linking-with-libpcap.patch} |  8 ++++----
 package/openpowerlink/openpowerlink.hash             |  8 ++++----
 package/openpowerlink/openpowerlink.mk               |  2 +-
 7 files changed, 35 insertions(+), 35 deletions(-)
 rename package/openpowerlink/{0004-FIX-use-contrib-getopt-only-on-Windows.patch => 0004-use-contrib-getopt-only-on-Windows.patch} (89%)
 rename package/openpowerlink/{0005-FIX-use-pcap-config-to-fix-static-linking-with-libpc.patch => 0005-use-pcap-config-to-fix-static-linking-with-libpcap.patch} (96%)

diff --git a/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch b/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch
index 1f5eb89..0e1c21e 100644
--- a/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch
+++ b/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch
@@ -1,4 +1,4 @@
-From 4e8aa3a9e1696e5e02ff0a3ae5a72f034ee60c2f Mon Sep 17 00:00:00 2001
+From 16230b7f51bff2bdf061fa80e9a49c807596bb92 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Wed, 25 May 2016 15:57:10 +0200
 Subject: [PATCH] install the stack libraries to "lib" subdirectory
@@ -53,7 +53,7 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  11 files changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/stack/proj/linux/liboplkcn-sim/CMakeLists.txt b/stack/proj/linux/liboplkcn-sim/CMakeLists.txt
-index 73b641d..b8b5c9d 100644
+index 2b3da16..ddb3e92 100644
 --- a/stack/proj/linux/liboplkcn-sim/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkcn-sim/CMakeLists.txt
 @@ -96,4 +96,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
@@ -63,7 +63,7 @@ index 73b641d..b8b5c9d 100644
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkcn/CMakeLists.txt b/stack/proj/linux/liboplkcn/CMakeLists.txt
-index 323eafc..459124a 100644
+index 3be6c52..cf1b1dd 100644
 --- a/stack/proj/linux/liboplkcn/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkcn/CMakeLists.txt
 @@ -90,4 +90,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
@@ -73,7 +73,7 @@ index 323eafc..459124a 100644
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
-index f8b1850..c16194a 100644
+index 904de6c..d8713a8 100644
 --- a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
 @@ -83,4 +83,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
@@ -83,7 +83,7 @@ index f8b1850..c16194a 100644
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
-index 0f07e63..0074616 100644
+index e2514cf..a4e2b75 100644
 --- a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
 @@ -83,4 +83,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
@@ -93,7 +93,7 @@ index 0f07e63..0074616 100644
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt b/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
-index d0dad78..ee0fdec 100644
+index 98f068c..bb20006 100644
 --- a/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
 @@ -76,4 +76,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
@@ -153,7 +153,7 @@ index cd97882..aaaa526 100644
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt b/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
-index 7e1a820..82205c2 100644
+index 0c29087..1783134 100644
 --- a/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
 @@ -79,4 +79,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
@@ -163,5 +163,5 @@ index 7e1a820..82205c2 100644
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 -- 
-2.8.1
+2.9.4
 
diff --git a/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch b/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch
index 7d338a4..8e815c0 100644
--- a/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch
+++ b/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch
@@ -1,4 +1,4 @@
-From 8cb39257e12d6b82190aec8ab9ad89a9ee13af71 Mon Sep 17 00:00:00 2001
+From f7679a4083de3a9dba80cd719ad4904fbade349b Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Wed, 25 May 2016 15:57:29 +0200
 Subject: [PATCH] cmake: install oplk headers files
@@ -15,10 +15,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/stack/CMakeLists.txt b/stack/CMakeLists.txt
-index 3b11c54..4eadf44 100644
+index 69454f2..45f131d 100644
 --- a/stack/CMakeLists.txt
 +++ b/stack/CMakeLists.txt
-@@ -105,3 +105,8 @@ ELSEIF((CMAKE_SYSTEM_NAME STREQUAL "Generic") AND (CMAKE_SYSTEM_PROCESSOR STREQU
+@@ -110,3 +110,8 @@ ELSEIF((CMAKE_SYSTEM_NAME STREQUAL "Generic") AND (CMAKE_SYSTEM_PROCESSOR STREQU
  ELSE()
      MESSAGE(FATAL_ERROR "Unknown Platform and processor combination ${CMAKE_SYSTEM_NAME} and ${CMAKE_SYSTEM_PROCESSOR}!!")
  ENDIF()
@@ -28,5 +28,5 @@ index 3b11c54..4eadf44 100644
 +################################################################################
 +INSTALL(DIRECTORY ${STACK_INCLUDE_DIR}/oplk DESTINATION "include")
 -- 
-2.8.1
+2.9.4
 
diff --git a/package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch b/package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch
index 9cbf02d..cd8f927 100644
--- a/package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch
+++ b/package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch
@@ -1,4 +1,4 @@
-From 7f81c74726aec4aef6bd93ee644200ab34375437 Mon Sep 17 00:00:00 2001
+From cd0945a323cecb638ce56f2e3d7fb4e8c004b98b Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Wed, 25 May 2016 15:59:20 +0200
 Subject: [PATCH] Add top level CMakeLists.txt
@@ -174,10 +174,10 @@ index 49aab66..d9fd418 100644
              TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} optimized ${OPLKLIB})
          ENDIF()
 diff --git a/drivers/linux/drv_daemon_pcap/CMakeLists.txt b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-index 1ef9353..e720834 100644
+index 2b4a2c1..ecceb4c 100644
 --- a/drivers/linux/drv_daemon_pcap/CMakeLists.txt
 +++ b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-@@ -104,9 +104,15 @@ ENDIF()
+@@ -109,9 +109,15 @@ ENDIF()
  SET(OPLKLIB_DIR ${OPLK_BASE_DIR}/stack/lib/${SYSTEM_NAME_DIR}/${SYSTEM_PROCESSOR_DIR})
  SET(OPLKLIB_INCDIR ${OPLK_BASE_DIR}/stack/proj/${SYSTEM_NAME_DIR}/lib${LIB_NAME})
  
@@ -197,5 +197,5 @@ index 1ef9353..e720834 100644
  
  SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -pedantic -std=c99 -pthread -fno-strict-aliasing")
 -- 
-2.8.1
+2.9.4
 
diff --git a/package/openpowerlink/0004-FIX-use-contrib-getopt-only-on-Windows.patch b/package/openpowerlink/0004-use-contrib-getopt-only-on-Windows.patch
similarity index 89%
rename from package/openpowerlink/0004-FIX-use-contrib-getopt-only-on-Windows.patch
rename to package/openpowerlink/0004-use-contrib-getopt-only-on-Windows.patch
index 2edf9f2..9680c27 100644
--- a/package/openpowerlink/0004-FIX-use-contrib-getopt-only-on-Windows.patch
+++ b/package/openpowerlink/0004-use-contrib-getopt-only-on-Windows.patch
@@ -1,7 +1,7 @@
-From d05273e65657d82e44fb7bd91a8fba0ba990ff2c Mon Sep 17 00:00:00 2001
+From e7e421526b17c179d5ac33a982b180ff5f7ef7a7 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sat, 27 May 2017 23:51:41 +0200
-Subject: [PATCH] [FIX] use contrib getopt() only on Windows
+Subject: [PATCH] use contrib getopt() only on Windows
 
 Otherwise, contrib getopt will clash with the one from the libc when
 building statically.
@@ -22,7 +22,7 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  4 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/apps/demo_cn_console/CMakeLists.txt b/apps/demo_cn_console/CMakeLists.txt
-index a3a80bb..5733213 100644
+index 3bb8f25..800797a 100644
 --- a/apps/demo_cn_console/CMakeLists.txt
 +++ b/apps/demo_cn_console/CMakeLists.txt
 @@ -61,7 +61,6 @@ SET(DEMO_SOURCES
@@ -42,7 +42,7 @@ index a3a80bb..5733213 100644
  ELSE()
      MESSAGE(FATAL_ERROR "System ${CMAKE_SYSTEM_NAME} is not supported!")
 diff --git a/apps/demo_cn_console/src/main.c b/apps/demo_cn_console/src/main.c
-index c630586..9406473 100644
+index d64536c..f790570 100644
 --- a/apps/demo_cn_console/src/main.c
 +++ b/apps/demo_cn_console/src/main.c
 @@ -50,7 +50,13 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
@@ -60,18 +60,18 @@ index c630586..9406473 100644
  #include <eventlog/eventlog.h>
  
 diff --git a/apps/demo_mn_console/CMakeLists.txt b/apps/demo_mn_console/CMakeLists.txt
-index 9c3378c..a81c4b3 100644
+index 6f9c5a1..2e74529 100644
 --- a/apps/demo_mn_console/CMakeLists.txt
 +++ b/apps/demo_mn_console/CMakeLists.txt
-@@ -67,7 +67,6 @@ SET(DEMO_SOURCES
+@@ -68,7 +68,6 @@ SET(DEMO_SOURCES
      ${COMMON_SOURCE_DIR}/eventlog/eventlog.c
      ${COMMON_SOURCE_DIR}/eventlog/eventlogstring.c
      ${CONTRIB_SOURCE_DIR}/console/printlog.c
 -    ${CONTRIB_SOURCE_DIR}/getopt/getopt.c
+     ${FIRMWARE_MANAGER_SOURCES}
      )
  
- INCLUDE_DIRECTORIES(
-@@ -129,6 +128,7 @@ ENDIF()
+@@ -131,6 +130,7 @@ ENDIF()
  IF(CMAKE_SYSTEM_NAME STREQUAL "Linux")
      include(linux.cmake)
  ELSEIF(CMAKE_SYSTEM_NAME STREQUAL "Windows")
@@ -80,7 +80,7 @@ index 9c3378c..a81c4b3 100644
  ELSE()
      MESSAGE(FATAL_ERROR "System ${CMAKE_SYSTEM_NAME} is not supported!")
 diff --git a/apps/demo_mn_console/src/main.c b/apps/demo_mn_console/src/main.c
-index 12d9be0..194e446 100644
+index cba747d..b766ed1 100644
 --- a/apps/demo_mn_console/src/main.c
 +++ b/apps/demo_mn_console/src/main.c
 @@ -50,7 +50,13 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
@@ -96,7 +96,7 @@ index 12d9be0..194e446 100644
 +
  #include <console/console.h>
  #include <eventlog/eventlog.h>
- 
+ #include <firmwaremanager/firmwaremanager.h>
 -- 
 2.9.4
 
diff --git a/package/openpowerlink/0005-FIX-use-pcap-config-to-fix-static-linking-with-libpc.patch b/package/openpowerlink/0005-use-pcap-config-to-fix-static-linking-with-libpcap.patch
similarity index 96%
rename from package/openpowerlink/0005-FIX-use-pcap-config-to-fix-static-linking-with-libpc.patch
rename to package/openpowerlink/0005-use-pcap-config-to-fix-static-linking-with-libpcap.patch
index 091f18c..e2c0311 100644
--- a/package/openpowerlink/0005-FIX-use-pcap-config-to-fix-static-linking-with-libpc.patch
+++ b/package/openpowerlink/0005-use-pcap-config-to-fix-static-linking-with-libpcap.patch
@@ -1,7 +1,7 @@
-From 406e1759dc6a4c18f6a38c3d7571aacb177487c6 Mon Sep 17 00:00:00 2001
+From 88c0af910edd156075acf04d8497f541ed377d4b Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sun, 28 May 2017 00:25:11 +0200
-Subject: [PATCH] [FIX]: use pcap-config to fix static linking with libpcap
+Subject: [PATCH] use pcap-config to fix static linking with libpcap
 
 When linking demo_mn_console statically with pcap, the CMake build
 system forget to link with other libraries linked with libpcap
@@ -129,10 +129,10 @@ index 6ed75ee..c69dbd9 100644
  SET(ARCH_LIBRARIES ${ARCH_LIBRARIES} pthread rt)
  
 diff --git a/drivers/linux/drv_daemon_pcap/CMakeLists.txt b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-index 2b4a2c1..98f693f 100644
+index ecceb4c..b362a34 100644
 --- a/drivers/linux/drv_daemon_pcap/CMakeLists.txt
 +++ b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-@@ -134,7 +134,27 @@ INCLUDE_DIRECTORIES(
+@@ -140,7 +140,27 @@ INCLUDE_DIRECTORIES(
      ${CONTRIB_SOURCE_DIR}
      )
  
diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
index 7132090..2a3c1f0 100644
--- a/package/openpowerlink/openpowerlink.hash
+++ b/package/openpowerlink/openpowerlink.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.5.2/
-md5	aa74d7f80d1ef6debcd40f97cd2df3f5	openPOWERLINK_V2.5.2.tar.gz
-sha1	7c46f337324e88096531d2cb74e47750833e851b	openPOWERLINK_V2.5.2.tar.gz
+# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.6.0/
+md5	afe5c1ed2d329d5b3784eb6999ab9d17	openPOWERLINK_V2.6.0.tar.gz
+sha1	c8b317f118f69e416bc812e93a97e073d62a29d9	openPOWERLINK_V2.6.0.tar.gz
 # sha256 locally computed
-sha256	4bc288be11ceebba2aa5c2a43a66489218f1e55bb75a07afc9e01e0e6233bcdc	openPOWERLINK_V2.5.2.tar.gz
+sha256	a53dd279a5341fc350e4be94949d4642579c4c4eb27706f1b36d41136b400ff8	openPOWERLINK_V2.6.0.tar.gz
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index f52cc8d..660dd60 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = V2.5.2
+OPENPOWERLINK_VERSION = V2.6.0
 OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
 OPENPOWERLINK_SOURCE = openPOWERLINK_$(OPENPOWERLINK_VERSION).tar.gz
 OPENPOWERLINK_LICENSE = BSD-2-Clause, GPL-2.0
-- 
2.9.4
