From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:40:55 +0200
Subject: [Buildroot] [PATCH 14/19] Get rid of the code computing
	ROOTFS_SUFFIX
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1e092eb572cfdf1a6a2a2bacc45fe36273e410ef.1272490771.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index adc645e..5f7af99 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -95,14 +95,6 @@ TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/
 endif
 #########################################################################
-#ifeq ($(BR2_ROOTFS_SUFFIX),)
-ROOTFS_SUFFIX:=$(call qstrip,$(BR2_ROOTFS_SUFFIX))
-ifeq ($(ROOTFS_SUFFIX),)
-ROOTFS_SUFFIX:=
-else
-XXXX=xxxx
-ROOTFS_SUFFIX:=-$(BR2_ROOTFS_SUFFIX)
-endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 
-- 
1.6.3.3
