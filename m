From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 21:07:36 +0200
Subject: [Buildroot] [git commit] package/easydbus: bump to version
 b86721147b265dfefc9a857669408cb6eb3d6560
Message-ID: <20190417190309.D9E058147C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=216089130410d165e6318ce7ad6fb90e93fb8abc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-easydbus-is-a-C-project-file.patch        | 33 ----------------------
 package/easydbus/easydbus.hash                     |  2 +-
 package/easydbus/easydbus.mk                       |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/package/easydbus/0001-easydbus-is-a-C-project-file.patch b/package/easydbus/0001-easydbus-is-a-C-project-file.patch
deleted file mode 100644
index 1c149c582c..0000000000
--- a/package/easydbus/0001-easydbus-is-a-C-project-file.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a4bd47f593fbe55bd3ab17532e64be74aff5b29d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 17 Nov 2018 11:38:05 +0100
-Subject: [PATCH] easydbus is a C project file
-
-Specify that easydbus is a C project file otherwise build will fail if
-no C++ compiler is found by cmake
-
-Fixes:
- - http://autobuild.buildroot.org/results/486c3cd98124e7415dee2fd1463bd5e0fcc9ba91
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mniestroj/easydbus/pull/2]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 58ccb2d..575eb24 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -5,7 +5,7 @@
- #
- 
- cmake_minimum_required(VERSION 2.6)
--project(easydbus)
-+project(easydbus C)
- 
- add_definitions("-Wall -Wextra -Wno-unused-parameter")
- set(CMAKE_C_FLAGS_RELEASE "-O2")
--- 
-2.17.1
-
diff --git a/package/easydbus/easydbus.hash b/package/easydbus/easydbus.hash
index 0ef73f23f9..5e0484e9a6 100644
--- a/package/easydbus/easydbus.hash
+++ b/package/easydbus/easydbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 3e5907664f5dfebbc0e652faf87564fd58dbd639742f442c100ef2db8be46e52 easydbus-59c340f2cd2c92ded82f9d4436866847f295faab.tar.gz
+sha256 4626d6af3d9000d7e6ee9723abba7cd5f01d1c52420a80d8259dfa2d884faa11 easydbus-b86721147b265dfefc9a857669408cb6eb3d6560.tar.gz
diff --git a/package/easydbus/easydbus.mk b/package/easydbus/easydbus.mk
index 376b09bfca..5e6de73c31 100644
--- a/package/easydbus/easydbus.mk
+++ b/package/easydbus/easydbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EASYDBUS_VERSION = 59c340f2cd2c92ded82f9d4436866847f295faab
+EASYDBUS_VERSION = b86721147b265dfefc9a857669408cb6eb3d6560
 EASYDBUS_SITE = $(call github,mniestroj,easydbus,$(EASYDBUS_VERSION))
 EASYDBUS_DEPENDENCIES = luainterpreter libglib2
 EASYDBUS_LICENSE = MIT
