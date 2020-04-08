From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 21:29:53 +0200
Subject: [Buildroot] [git commit] package/assimp: bump version to 5.0.1
Message-ID: <20200408191656.019518E072@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e55458aded755aba8ff1879397738cc4b3579bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-FBXConverter-use-proper-64-bit-constant.patch     | 10 ++++++----
 package/assimp/assimp.hash                                     |  4 ++--
 package/assimp/assimp.mk                                       |  2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/assimp/0001-Fix-FBXConverter-use-proper-64-bit-constant.patch b/package/assimp/0001-Fix-FBXConverter-use-proper-64-bit-constant.patch
index bfcbeb55e3..1b23d66364 100644
--- a/package/assimp/0001-Fix-FBXConverter-use-proper-64-bit-constant.patch
+++ b/package/assimp/0001-Fix-FBXConverter-use-proper-64-bit-constant.patch
@@ -12,15 +12,17 @@ Use proper 64-bit constant for CONVERT_FBX_TIME(time) conversion, fixes:
   code/FBXConverter.cpp:2878: error: integer constant is too large for 'long' type
   code/FBXConverter.cpp:2888: error: integer constant is too large for 'long' type
 
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Rebased on 5.0.1]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- code/FBXConverter.cpp | 2 +-
+ code/FBX/FBXConverter.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/code/FBXConverter.cpp b/code/FBXConverter.cpp
+diff --git a/code/FBX/FBXConverter.cpp b/code/FBXConverter.cpp
 index e0c6b9c..b1e9a71 100644
---- a/code/FBXConverter.cpp
-+++ b/code/FBXConverter.cpp
+--- a/code/FBX/FBXConverter.cpp
++++ b/code/FBX/FBXConverter.cpp
 @@ -67,7 +67,7 @@ namespace FBX {
  
  #define MAGIC_NODE_TAG "_$AssimpFbx$"
diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index 72d367ac43..df5daa79c9 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3520b1e9793b93a2ca3b797199e16f40d61762617e072f2d525fad70f9678a71  assimp-4.1.0.tar.gz
-sha256 a26ccc3dbf2f58ea99c100945a8a126fa0f9f4d7fd2b49aa8bdb8e09355864d8  LICENSE
+sha256  11310ec1f2ad2cd46b95ba88faca8f7aaa1efe9aa12605c55e3de2b977b3dbfc  assimp-5.0.1.tar.gz
+sha256  a26ccc3dbf2f58ea99c100945a8a126fa0f9f4d7fd2b49aa8bdb8e09355864d8  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index ce02ef300c..5e8e825375 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 4.1.0
+ASSIMP_VERSION = 5.0.1
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
