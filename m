From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:26:38 +0100
Subject: [Buildroot] [PATCH] support/dependencies: require at least CMake 3.8
Message-ID: <20181231162638.13606-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The json-for-modern-cpp package unfortunately now requires CMake >=
3.8, so we need to bump our requirement from 3.1 to 3.8. If the host
doesn't have a CMake >= 3.8, Buildroot will build its own host-cmake
package.

Fixes:

  http://autobuild.buildroot.org/results/1f893d8bc7df3bfefd31df69aba918e2121cfaf7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/dependencies/check-host-cmake.mk | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 4300e6f600..3ea422ea87 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -1,14 +1,5 @@
-# Versions before 3.0 are affected by the bug described in
-# https://git.busybox.net/buildroot/commit/?id=ef2c1970e4bff3be3992014070392b0e6bc28bd2
-# and fixed in upstream CMake in version 3.0:
-# https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568
-#
-# Set this to either 3.0 or higher, depending on the highest minimum
-# version required by any of the packages bundled in Buildroot. If a
-# package is bumped or a new one added, and it requires a higher
-# version, our cmake infra will catch it and whine.
-#
-BR2_CMAKE_VERSION_MIN = 3.1
+# The json-for-modern-cpp package needs at least CMake 3.8
+BR2_CMAKE_VERSION_MIN = 3.8
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
-- 
2.20.1
