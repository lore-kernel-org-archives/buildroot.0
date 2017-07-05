From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed,  5 Jul 2017 22:08:40 +0300
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: Set
	CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT for ARMv8
In-Reply-To: <20170705190840.22469-1-aperez@igalia.com>
References: <20170705190840.22469-1-aperez@igalia.com>
Message-ID: <20170705190840.22469-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is needed for correctly building some CMake-based packages which
use this variable. For example, this is needed for WebKitGTK+ 2.16.x
to build correctly when an ARMv8 target is configured.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/pkg-cmake.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 401084fb12..914bda7482 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -219,6 +219,8 @@ else ifeq ($(BR2_ARM_CPU_ARMV6),y)
 CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT = armv6
 else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT = armv7
+else ifeq ($(BR2_ARM_CPU_ARMV8),y)
+CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT = armv8
 endif
 
 ifeq ($(BR2_arm),y)
-- 
2.13.2
