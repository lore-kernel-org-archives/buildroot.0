From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:22:14 +0200
Subject: [Buildroot] [PATCH 40/49] at91bootstrap: bump version to 2.13
In-Reply-To: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
Message-ID: <811b67a71b1c4e89ffb726e5fde691f764bbb2c9.1276352309.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the same time, remove the unused AT91BOOTSTRAP_PATCH_LEVEL and
AT91BOOTSTRAP_PATCHED_VERSION variables.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index b71df89..d6e2c18 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -3,9 +3,7 @@
 # at91bootstrap
 #
 #############################################################
-AT91BOOTSTRAP_VERSION:=2.10
-AT91BOOTSTRAP_PATCH_LEVEL:=
-AT91BOOTSTRAP_PATCHED_VERSION:=$(AT91BOOTSTRAP_VERSION)$(AT91BOOTSTRAP_PATCH_LEVEL)
+AT91BOOTSTRAP_VERSION:=2.13
 AT91BOOTSTRAP_NAME:=at91bootstrap-$(AT91BOOTSTRAP_VERSION)
 ATMEL_MIRROR:=$(call qstrip,$(BR2_ATMEL_MIRROR))
 AT91BOOTSTRAP_SITE:=$(ATMEL_MIRROR)
@@ -18,7 +16,7 @@ AT91BOOTSTRAP_BOARD:=$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
 
 AT91BOOTSTRAP_MEMORY:=$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
 
-AT91BOOTSTRAP_BINARY:=$(BOARD_NAME)-$(AT91BOOTSTRAP_MEMORY)boot-$(AT91BOOTSTRAP_PATCHED_VERSION).bin
+AT91BOOTSTRAP_BINARY:=$(BOARD_NAME)-$(AT91BOOTSTRAP_MEMORY)boot-$(AT91BOOTSTRAP_VERSION).bin
 
 AT91BOOTSTRAP_TARGET:=$(AT91BOOTSTRAP_DIR)/binaries/$(AT91BOOTSTRAP_BINARY)
 
-- 
1.7.0.4
