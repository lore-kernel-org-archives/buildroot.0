From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Oct 2019 07:13:04 -0600
Subject: [Buildroot] [PATCH v3 2/2] support/dependencies: set cmake version
 min to 3.10
In-Reply-To: <20191012131304.13283-1-james.hilliard1@gmail.com>
References: <20191012131304.13283-1-james.hilliard1@gmail.com>
Message-ID: <20191012131304.13283-2-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is required by wpewebkit and webkitgtk.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
---
 support/dependencies/check-host-cmake.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 5604713de6..01f38da376 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -1,9 +1,9 @@
-# Set this to either 3.8 or higher, depending on the highest minimum
+# Set this to either 3.10 or higher, depending on the highest minimum
 # version required by any of the packages bundled in Buildroot. If a
 # package is bumped or a new one added, and it requires a higher
 # version, our cmake infra will catch it and build its own.
 #
-BR2_CMAKE_VERSION_MIN = 3.8
+BR2_CMAKE_VERSION_MIN = 3.10
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
-- 
2.20.1
