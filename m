From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 23:49:32 +0200
Subject: [Buildroot] [git commit] wf111: properly define and use the
	WF111_VERSION variable
Message-ID: <20160425220245.8766C81E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4389b88695ae01d0fd9e0ec69680b69c3d565095
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of hardcoding again the version of the package when defining
WF111_SOURCE, this commit changes the WF111_VERSION so that it
contains the entire version number, and then modifies the WF111_SOURCE
definitions to use WF111_VERSION.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wf111/wf111.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
index 28b1815..6e50f40 100644
--- a/package/wf111/wf111.mk
+++ b/package/wf111/wf111.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WF111_VERSION = 5.2.2
+WF111_VERSION = 5.2.2-r1
 WF111_SITE_METHOD = file
 WF111_SITE = $(call qstrip,$(BR2_PACKAGE_WF111_TARBALL_PATH))
 WF111_DEPENDENCIES = linux
@@ -14,11 +14,11 @@ $(error No tarball location specified, check BR2_PACKAGE_WF111_TARBALL_PATH)
 endif
 
 ifeq ($(BR2_ARM_CPU_ARMV7A),y)
-WF111_SOURCE = wf111-linux-driver_5.2.2-r1_armv7-a.tar.gz
+WF111_SOURCE = wf111-linux-driver_$(WF111_VERSION)_armv7-a.tar.gz
 else ifeq ($(BR2_ARM_CPU_ARMV5),y)
-WF111_SOURCE = wf111-linux-driver_5.2.2-r1_armv5t.tar.gz
+WF111_SOURCE = wf111-linux-driver_$(WF111_VERSION)_armv5t.tar.gz
 else ifeq ($(BR2_i386),y)
-WF111_SOURCE = wf111-linux-driver_5.2.2-r1_x86.tar.gz
+WF111_SOURCE = wf111-linux-driver_$(WF111_VERSION)_x86.tar.gz
 endif
 
 # Due to the stupidity of the package Makefile, we can't invoke
