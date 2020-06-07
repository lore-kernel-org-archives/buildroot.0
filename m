From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Jun 2020 12:03:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/i2pd: bump to version 2.32.1
Message-ID: <20200607100354.3983731-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch, not needed since version 2.32.0 and
https://github.com/PurpleI2P/i2pd/commit/db6a0e6ad9124ef9b6217af487b3c844234ba5e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ....txt-don-t-install-source-and-licens.patch | 58 -------------------
 package/i2pd/i2pd.hash                        |  2 +-
 package/i2pd/i2pd.mk                          |  2 +-
 3 files changed, 2 insertions(+), 60 deletions(-)
 delete mode 100644 package/i2pd/0001-build-CMakeLists.txt-don-t-install-source-and-licens.patch

diff --git a/package/i2pd/0001-build-CMakeLists.txt-don-t-install-source-and-licens.patch b/package/i2pd/0001-build-CMakeLists.txt-don-t-install-source-and-licens.patch
deleted file mode 100644
index bf5807f8d7..0000000000
--- a/package/i2pd/0001-build-CMakeLists.txt-don-t-install-source-and-licens.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 5fec22461a6d8d1045c849e468436b00ec7f9616 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 1 Apr 2018 20:11:21 +0200
-Subject: [PATCH] build/CMakeLists.txt: don't install source and license
-
-The CMakeLists.txt has the interesting (weird?) idea of installing the
-license to /usr/LICENSE and the source code to /usr/src/, which is a
-bit annoying. Let's not install such things.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- build/CMakeLists.txt | 30 ------------------------------
- 1 file changed, 30 deletions(-)
-
-diff --git a/build/CMakeLists.txt b/build/CMakeLists.txt
-index a6736a0b..3de79f3e 100644
---- a/build/CMakeLists.txt
-+++ b/build/CMakeLists.txt
-@@ -473,36 +473,6 @@ if (WITH_BINARY)
-   endif ()
- endif ()
- 
--install(FILES ../LICENSE
--  DESTINATION .
--  COMPONENT Runtime
--  )
--# Take a copy on Appveyor
--install(FILES "C:/projects/openssl-$ENV{OPENSSL}/LICENSE"
--  DESTINATION .
--  COMPONENT Runtime
--  RENAME LICENSE_OPENSSL
--  OPTIONAL                      # for local builds only!
--  )
--
--file(GLOB_RECURSE I2PD_SOURCES "../libi2pd/*.cpp" "../libi2pd_client/*.cpp" "../daemon/*.cpp" "../build" "../Win32" "../Makefile*")
--install(FILES ${I2PD_SOURCES} DESTINATION src/ COMPONENT Source)
--# install(DIRECTORY ../ DESTINATION src/
--#   # OPTIONAL
--#   COMPONENT Source FILES_MATCHING
--#   PATTERN .git EXCLUDE
--#   PATTERN "*.cpp"
--#   )
--
--file(GLOB I2PD_HEADERS "../libi2pd/*.h" "../libi2pd_client/*.h" "../daemon/*.h")
--install(FILES ${I2PD_HEADERS} DESTINATION src/ COMPONENT Headers)
--# install(DIRECTORY ../ DESTINATION src/
--#   # OPTIONAL
--#   COMPONENT Headers FILES_MATCHING
--#   PATTERN .git EXCLUDE
--#   PATTERN "*.h"
--#   )
--
- set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Purple I2P, a C++ I2P daemon")
- set(CPACK_PACKAGE_VENDOR "Purple I2P")
- set(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/../README.md")
--- 
-2.14.3
-
diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index 93e9070066..d56c9c1b47 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7e37abcf49e9f59ef6939069f4d74fc6bf29b09deec111bd3561021fc1349528  i2pd-2.31.0.tar.gz
+sha256  64229101411a9dda3237dc27939aa13ec90d4900aae499e59931063c36e8556b  i2pd-2.32.1.tar.gz
 sha256  d147a6acdaf8ec9f6513802ef6cad4a4afcdb5ab6b98d9f6bb26d2b7f4cf454c  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 0d2daa10f5..736794866d 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.31.0
+I2PD_VERSION = 2.32.1
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
-- 
2.26.2
