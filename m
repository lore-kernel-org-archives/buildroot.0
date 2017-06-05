From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:14:17 +0200
Subject: [Buildroot] [git commit] package/graphite2: bump version to 1.3.10
Message-ID: <20170605091447.A23C580142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d0b3bdf23692db45f835a897d051bb2dc126e98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/graphite2/0001-disable-double-promotion.patch | 8 +++++---
 package/graphite2/graphite2.hash                      | 6 ++++--
 package/graphite2/graphite2.mk                        | 2 +-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/graphite2/0001-disable-double-promotion.patch b/package/graphite2/0001-disable-double-promotion.patch
index 3bda3d7..888d862 100644
--- a/package/graphite2/0001-disable-double-promotion.patch
+++ b/package/graphite2/0001-disable-double-promotion.patch
@@ -5,14 +5,16 @@ so just disable it.
 
 Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
 [Gustavo: update for 1.3.5]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: update for 1.3.10]
 
 diff -Nura graphite2-1.3.5.orig/src/CMakeLists.txt graphite2-1.3.5/src/CMakeLists.txt
 --- graphite2-1.3.5.orig/src/CMakeLists.txt	2016-02-15 11:46:45.941906112 -0300
 +++ graphite2-1.3.5/src/CMakeLists.txt	2016-02-15 11:46:54.237194222 -0300
 @@ -111,9 +111,6 @@
-         COMPILE_FLAGS   "-Wall -Wextra -Wno-unknown-pragmas -Wendif-labels -Wshadow -Wctor-dtor-privacy -Wnon-virtual-dtor -fno-rtti -fno-exceptions -fvisibility=hidden -fvisibility-inlines-hidden -fno-stack-protector"
-         LINK_FLAGS      "-nodefaultlibs ${GRAPHITE_LINK_FLAGS}" 
-         LINKER_LANGUAGE C)
+     if (${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86|i.86")
+         add_definitions(-mfpmath=sse -msse2)
+     endif (${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86|i.86")
 -    if (CMAKE_COMPILER_IS_GNUCXX)
 -        add_definitions(-Wdouble-promotion)
 -    endif (CMAKE_COMPILER_IS_GNUCXX)
diff --git a/package/graphite2/graphite2.hash b/package/graphite2/graphite2.hash
index 86be69e..ecf082b 100644
--- a/package/graphite2/graphite2.hash
+++ b/package/graphite2/graphite2.hash
@@ -1,3 +1,5 @@
 # From http://sourceforge.net/projects/silgraphite/files/graphite2
-md5	17e6a3b1a88c100c9e3fc0763c85d269	graphite2-1.3.9.tgz
-sha1	0693e9eef87edf1792db247dd38794211666a1b9	graphite2-1.3.9.tgz
+md5 b39d5ed21195f8b709bcee548c87e2b5  graphite2-1.3.10.tgz
+sha1 668f3bce96fc02d90ea875b401ed36b2e8957d2f  graphite2-1.3.10.tgz
+# Locally computed
+sha256 90fde3b2f9ea95d68ffb19278d07d9b8a7efa5ba0e413bebcea802ce05cda1ae  graphite2-1.3.10.tgz
diff --git a/package/graphite2/graphite2.mk b/package/graphite2/graphite2.mk
index 737e072..2bb4f46 100644
--- a/package/graphite2/graphite2.mk
+++ b/package/graphite2/graphite2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRAPHITE2_VERSION = 1.3.9
+GRAPHITE2_VERSION = 1.3.10
 GRAPHITE2_SOURCE = graphite2-$(GRAPHITE2_VERSION).tgz
 GRAPHITE2_SITE = http://downloads.sourceforge.net/project/silgraphite/graphite2
 GRAPHITE2_INSTALL_STAGING = YES
