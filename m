From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Sep 2019 21:44:48 +0200
Subject: [Buildroot] [git commit] package/dav1d: disable tests and tools
Message-ID: <20190904194616.4302A8B530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc4ee4063b45afd1351f9594ccc08d81d4374607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some tools need SDL2 which will break the build if SDL2 is found on host

Fixes:
 - http://autobuild.buildroot.org/results/4cea773805e62911019d0627dcdf5d17b71032b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dav1d/dav1d.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 6c08694f15..0e9c79bd34 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -10,6 +10,9 @@ DAV1D_SITE = https://code.videolan.org/videolan/dav1d/-/archive/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
 DAV1D_LICENSE_FILES = COPYING
 DAV1D_INSTALL_STAGING = YES
+DAV1D_CONF_OPTS = \
+	-Denable_tests=false \
+	-Denable_tools=false
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
 DAV1D_DEPENDENCIES += host-nasm
@@ -17,7 +20,7 @@ endif
 
 # ARM assembly requires v6+ ISA
 ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV7M),y)
-DAV1D_CONF_OPTS = -Denable_asm=false
+DAV1D_CONF_OPTS += -Denable_asm=false
 endif
 
 # Uses __atomic_fetch_add_4
