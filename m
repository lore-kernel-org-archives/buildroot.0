From: Scott Fan <fancp2007@gmail.com>
Date: Sun, 21 Feb 2021 00:27:15 +0800
Subject: [Buildroot] [PATCH 3/3] package/open62541: bump version to 1.2
In-Reply-To: <20210220162715.283519-1-fancp2007@gmail.com>
References: <20210220162715.283519-1-fancp2007@gmail.com>
Message-ID: <20210220162715.283519-3-fancp2007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 ...02-arch-posix-CMakeLists.txt-fix-build-without-threads.patch | 2 +-
 package/open62541/open62541.hash                                | 2 +-
 package/open62541/open62541.mk                                  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch b/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
index 94ee76ad92..bdf3608041 100644
--- a/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
+++ b/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
@@ -29,7 +29,7 @@ index bb24757c..a53c9f2c 100644
            ua_architecture_append_to_library(m)
 -          #TODO - Error on first make run if pthread is included conditional?
 -          ua_architecture_append_to_library(pthread)
-           if(UA_ENABLE_MULTITHREADING OR UA_BUILD_UNIT_TESTS)
+           if(UA_MULTITHREADING OR UA_BUILD_UNIT_TESTS)
              ua_architecture_append_to_library(pthread)
            endif()
 -- 
diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 3da8c8f5fb..11414085c3 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  36273793e5247586fadaa73c0edad89be610100cbc839d1fb5f567f20c3cbc44  open62541-1.0-br1.tar.gz
+sha256  38a8f9af14548ee9b04655eedb996f741032f7040ff9118bba853c0718d5e978  open62541-1.2-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 3f75196817..7e4058e29d 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = 1.0
+OPEN62541_VERSION = 1.2
 OPEN62541_DL_VERSION = v$(OPEN62541_VERSION)
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = git://github.com/open62541/open62541.git
-- 
2.25.1
