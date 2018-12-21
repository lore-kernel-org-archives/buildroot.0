From: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
Date: Fri, 21 Dec 2018 20:37:29 +0300
Subject: [Buildroot] [PATCH] azure-iot-sdk-c: Bump to version 2018-12-13
Message-ID: <20181221173729.41870-1-Nikita.Sobolev@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: NikitaSobolev <Nikita.Sobolev@synopsys.com>

Bump azure-iot-sdk-c to 2018-12-13 release.
Add patch, that removes Windows specified variables from
azure-iot-sdk-c-2018-12-13 release. That variables cause
build errors.

Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
---
 ...-azure-iot-sdk-c-Delete-windows-variables.patch | 34 ++++++++++++++++++++++
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk         |  2 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 package/azure-iot-sdk-c/0001-azure-iot-sdk-c-Delete-windows-variables.patch

diff --git a/package/azure-iot-sdk-c/0001-azure-iot-sdk-c-Delete-windows-variables.patch b/package/azure-iot-sdk-c/0001-azure-iot-sdk-c-Delete-windows-variables.patch
new file mode 100644
index 0000000000..e8ff53cb5a
--- /dev/null
+++ b/package/azure-iot-sdk-c/0001-azure-iot-sdk-c-Delete-windows-variables.patch
@@ -0,0 +1,34 @@
+From 6c01ef50e0c2d562388aacbb60a1506e70db2218 Mon Sep 17 00:00:00 2001
+From: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
+Date: Thu, 20 Dec 2018 19:31:20 +0300
+Subject: [PATCH] azure-iot-sdk-c: Delete windows variables
+
+Delete windows specified variables, that have been added
+to azure-iot-sdk-c-2018-12-13 release. These variables
+are not defined for Linux and cause build errors.
+
+Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
+---
+ c-utility/CMakeLists.txt | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/c-utility/CMakeLists.txt b/c-utility/CMakeLists.txt
+index 190ea87dca..464d6d1069 100644
+--- a/c-utility/CMakeLists.txt
++++ b/c-utility/CMakeLists.txt
+@@ -264,12 +264,6 @@ if(${use_applessl})
+     include_directories(./pal/ios-osx/)
+ endif()
+ 
+-if (WIN32 AND (${CMAKE_SYSTEM_VERSION} VERSION_EQUAL "10.0.17763.0" OR ${CMAKE_SYSTEM_VERSION} VERSION_GREATER "10.0.17763.0"))
+-    # Windows added support for UNIX domain sockets to the OS and SDK
+-    # in the Oct 2018 update (10.0.17763.0, aka RS5)
+-    add_definitions(-DAF_UNIX_ON_WINDOWS)
+-endif()
+-
+ #these are the C headers
+ set(source_h_files
+ ./inc/azure_c_shared_utility/agenttime.h
+-- 
+2.16.2
+
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 504929aee6..8b3f670399 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = 2018-03-16
+AZURE_IOT_SDK_C_VERSION = 2018-12-13
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
-- 
2.16.2
