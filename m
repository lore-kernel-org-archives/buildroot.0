From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:40:52 +0200
Subject: [Buildroot] [PATCH 11/19] Commonalize the definition of
	TOOLCHAIN_DIR
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <88870569c2ac04c0b589dd0f3c2ae886334f6fba.1272490771.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The definition of TOOLCHAIN_DIR is the same regardless of whether
external or internal toolchains are used. Moreover, move its
definition together with all the other *_DIR definitions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile            |    1 +
 package/Makefile.in |    2 --
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 54dd4f1..271db9c 100644
--- a/Makefile
+++ b/Makefile
@@ -267,6 +267,7 @@ STAMP_DIR:=$(BASE_DIR)/stamps
 
 BINARIES_DIR:=$(BASE_DIR)/images
 TARGET_DIR:=$(BASE_DIR)/target
+TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 
 BR2_DEPENDS_DIR=$(BUILD_DIR)/buildroot-config
 
diff --git a/package/Makefile.in b/package/Makefile.in
index 3dfc712..396187d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -105,7 +105,6 @@ ROOTFS_SUFFIX:=-$(BR2_ROOTFS_SUFFIX)
 endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(TOOLCHAIN_DIR)/bin:$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
@@ -116,7 +115,6 @@ KERNEL_CROSS=$(TARGET_CROSS)
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
-TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(TOOLCHAIN_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
-- 
1.6.3.3
