From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Sep 2020 10:09:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/dav1d: disable asm on i386
Message-ID: <20200920080930.864480-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/19e/19ee2bdd4c8d14cc1554092594b3721117ca1005/
http://autobuild.buildroot.net/results/72e/72e4089dafacd245e781214b72baeb81a1e3d3d7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dav1d/dav1d.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 1e84c21b47..62f673b991 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -14,12 +14,12 @@ DAV1D_CONF_OPTS = \
 	-Denable_tests=false \
 	-Denable_tools=false
 
-ifeq ($(BR2_i386)$(BR2_x86_64),y)
+ifeq ($(BR2_x86_64),y)
 DAV1D_DEPENDENCIES += host-nasm
 endif
 
-# ARM assembly requires v6+ ISA
-ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV7M),y)
+# ARM assembly requires v6+ ISA, asm is broken in i386
+ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV7M)$(BR2_i386),y)
 DAV1D_CONF_OPTS += -Denable_asm=false
 endif
 
-- 
2.27.0
