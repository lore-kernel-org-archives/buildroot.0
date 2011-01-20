From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jan 2011 21:23:23 +0100
Subject: [Buildroot] [git commit master 1/1] cdrkit: fix build with ccache
Message-ID: <20110120202551.3757C8B537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=464f862d82c2c1dee1f154e587e8771bbf45f780
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cmake gets confused about ccache, so don't use ccache for cmake builds.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cdrkit/cdrkit.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index a0ce9cb..7d6899a 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -13,8 +13,9 @@ endif
 
 # CMake doesn't support having the --sysroot option directly in the
 # compiler path, so move this option to the CFLAGS/CXXFLAGS variables.
-CDRKIT_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC))
-CDRKIT_TARGET_CXX = $(filter-out --sysroot=%,$(TARGET_CXX))
+# It also gets confused by ccache, so don't use ccache here.
+CDRKIT_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC_NOCCACHE))
+CDRKIT_TARGET_CXX = $(filter-out --sysroot=%,$(TARGET_CXX_NOCCACHE))
 CDRKIT_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC)) $(TARGET_CFLAGS)
 CDRKIT_TARGET_CXXFLAGS = $(filter --sysroot=%,$(TARGET_CXX)) $(TARGET_CXXFLAGS)
 
-- 
1.7.3.4
