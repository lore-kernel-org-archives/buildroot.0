From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Apr 2020 23:43:52 -0600
Subject: [Buildroot] [PATCH 1/1] support/dependencies: set cmake version min
 to 3.15.3
Message-ID: <20200428054352.110007-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is required by uvw.

Fixes:
http://autobuild.buildroot.net/results/ab6/ab6954a65fd6d43c0674cb7a38a941102cb0dfe3/build-end.log

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 support/dependencies/check-host-cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 01f38da376..b0a704c0f2 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -3,7 +3,7 @@
 # package is bumped or a new one added, and it requires a higher
 # version, our cmake infra will catch it and build its own.
 #
-BR2_CMAKE_VERSION_MIN = 3.10
+BR2_CMAKE_VERSION_MIN = 3.15.3
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
-- 
2.20.1
