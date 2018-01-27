From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 10:15:47 +0100
Subject: [Buildroot] [git commit] package/wf111: bump to version 5.2.2-r3
Message-ID: <20180127091600.2A09383F5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b857c7481a9fc8ff47906e15bdc485abb03d368a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wf111/wf111.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
index ad9d891..ed55672 100644
--- a/package/wf111/wf111.mk
+++ b/package/wf111/wf111.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WF111_VERSION = 5.2.2-r2
+WF111_VERSION = 5-2-2-r3
 WF111_SITE_METHOD = file
 WF111_SITE = $(call qstrip,$(BR2_PACKAGE_WF111_TARBALL_PATH))
 WF111_DEPENDENCIES = linux
@@ -14,11 +14,11 @@ $(error No tarball location specified, check BR2_PACKAGE_WF111_TARBALL_PATH)
 endif
 
 ifeq ($(BR2_ARM_CPU_ARMV7A),y)
-WF111_SOURCE = wf111-linux-driver_$(WF111_VERSION)_armv7-a.tar.gz
+WF111_SOURCE = wf111-linux-driver-$(WF111_VERSION)-armv7-a.tar.gz
 else ifeq ($(BR2_ARM_CPU_ARMV5),y)
-WF111_SOURCE = wf111-linux-driver_$(WF111_VERSION)_armv5t.tar.gz
+WF111_SOURCE = wf111-linux-driver-$(WF111_VERSION)-armv5t.tar.gz
 else ifeq ($(BR2_i386),y)
-WF111_SOURCE = wf111-linux-driver_$(WF111_VERSION)_x86.tar.gz
+WF111_SOURCE = wf111-linux-driver-$(WF111_VERSION)-x86.tar.gz
 endif
 
 # Due to the stupidity of the package Makefile, we can't invoke
