From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 13 Mar 2019 00:08:35 +0100
Subject: [Buildroot] [PATCH 1/5] package/binutils: switch to use 2.31.x as
 the default version
Message-ID: <20190312230839.23307-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that binutils 2.32 has been released, it is time to move to
binutils 2.31.x as the default binutils version, instead of 2.29.1.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 9a2b27c55e..8485568170 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -10,7 +10,7 @@ choice
 	prompt "Binutils Version"
 	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_INSTRUCTIONS_THUMB
 	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_INSTRUCTIONS_THUMB2
-	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_2_31_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
 	  Select the version of binutils you wish to use.
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 4531b8d9c8..6798356ff2 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2018.09-release
 else
-BINUTILS_VERSION = 2.29.1
+BINUTILS_VERSION = 2.31.1
 endif
 endif # BINUTILS_VERSION
 
-- 
2.14.5
