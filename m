From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2011 23:33:26 +0200
Subject: [Buildroot] [PATCH 09/28] at91bootstrap: use = instead of := and
	indent properly
In-Reply-To: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ab281e1cdfa2f6766dbff8dfba87f19997b21077.1309815048.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 3d4308e..052d1bd 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -3,17 +3,17 @@
 # at91bootstrap
 #
 #############################################################
-AT91BOOTSTRAP_VERSION:=1.16
-AT91BOOTSTRAP_NAME:=AT91Bootstrap$(AT91BOOTSTRAP_VERSION)
-AT91BOOTSTRAP_SITE:=http://www.atmel.com/dyn/resources/prod_documents/
-AT91BOOTSTRAP_SOURCE:=$(AT91BOOTSTRAP_NAME).zip
-AT91BOOTSTRAP_DIR:=$(BUILD_DIR)/at91bootstrap-$(AT91BOOTSTRAP_VERSION)
+AT91BOOTSTRAP_VERSION = 1.16
+AT91BOOTSTRAP_NAME    = AT91Bootstrap$(AT91BOOTSTRAP_VERSION)
+AT91BOOTSTRAP_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
+AT91BOOTSTRAP_SOURCE  = $(AT91BOOTSTRAP_NAME).zip
+AT91BOOTSTRAP_DIR     = $(BUILD_DIR)/at91bootstrap-$(AT91BOOTSTRAP_VERSION)
 
-AT91BOOTSTRAP_BOARD:=$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
-AT91BOOTSTRAP_MEMORY:=$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
-AT91BOOTSTRAP_BINARY:=$(AT91BOOTSTRAP_MEMORY)_$(AT91BOOTSTRAP_BOARD).bin
-AT91BOOTSTRAP_BUILD_DIR:=$(AT91BOOTSTRAP_DIR)/board/$(AT91BOOTSTRAP_BOARD)/$(AT91BOOTSTRAP_MEMORY)
-AT91BOOTSTRAP_TARGET:=$(AT91BOOTSTRAP_BUILD_DIR)/$(AT91BOOTSTRAP_BINARY)
+AT91BOOTSTRAP_BOARD     = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
+AT91BOOTSTRAP_MEMORY    = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
+AT91BOOTSTRAP_BINARY    = $(AT91BOOTSTRAP_MEMORY)_$(AT91BOOTSTRAP_BOARD).bin
+AT91BOOTSTRAP_BUILD_DIR = $(AT91BOOTSTRAP_DIR)/board/$(AT91BOOTSTRAP_BOARD)/$(AT91BOOTSTRAP_MEMORY)
+AT91BOOTSTRAP_TARGET    = $(AT91BOOTSTRAP_BUILD_DIR)/$(AT91BOOTSTRAP_BINARY)
 
 $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE):
 	 $(call DOWNLOAD,$(AT91BOOTSTRAP_SITE),$(AT91BOOTSTRAP_SOURCE))
-- 
1.7.4.1
