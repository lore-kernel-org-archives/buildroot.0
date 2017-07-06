From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 23:21:28 +0200
Subject: [Buildroot] [git commit] pkg-cmake.mk: Set
	CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT for ARMv8
Message-ID: <20170706211949.53B908007C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4007c9e1d07ee3a0bb1353523bcf9df45bd16494
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed for correctly building some CMake-based packages which
use this variable. For example, this is needed for WebKitGTK+ 2.16.x
to build correctly when an ARMv8 target is configured.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 401084f..914bda7 100644
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
