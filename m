From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Wed, 25 Dec 2013 17:18:59 +0100
Subject: [Buildroot] [PATCH 2/2] packages: use gitorious helper when
	applicable
In-Reply-To: <1387988339-17460-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1387988339-17460-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1387988339-17460-3-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 boot/xloader/xloader.mk                | 2 +-
 package/can-utils/can-utils.mk         | 2 +-
 package/lpc3250loader/lpc3250loader.mk | 2 +-
 package/ti-uim/ti-uim.mk               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
index 00c63b1efb91..0ec11de1d6af 100644
--- a/boot/xloader/xloader.mk
+++ b/boot/xloader/xloader.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 XLOADER_VERSION    = 6f3a26101303051e0f91b6213735b68ce804e94e
-XLOADER_SITE       = git://gitorious.org/x-loader/x-loader.git
+$(eval $(call gitorious,x-loader,x-loader))
 XLOADER_BOARD_NAME = $(call qstrip,$(BR2_TARGET_XLOADER_BOARDNAME))
 
 XLOADER_LICENSE = GPLv2+
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 743fe7ce0b2b..d5f6673dd25f 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CAN_UTILS_VERSION = 16c970d40e6c19dde705bad4751bab1a3a4f3a0d
-CAN_UTILS_SITE = git://gitorious.org/linux-can/can-utils.git
+$(eval $(call gitorious,linux-can,can-utils))
 CAN_UTILS_AUTORECONF = YES
 
 $(eval $(autotools-package))
diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
index 42beb7bc84b4..606e446c20bb 100644
--- a/package/lpc3250loader/lpc3250loader.mk
+++ b/package/lpc3250loader/lpc3250loader.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HOST_LPC3250LOADER_SITE = git://gitorious.org/lpc3250loader/lpc3250loader.git
 HOST_LPC3250LOADER_VERSION = 1.0
+$(eval $(call host-gitorious,lpc3250loader,lpc3250loader))
 
 define HOST_LPC3250LOADER_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/LPC3250loader.py \
diff --git a/package/ti-uim/ti-uim.mk b/package/ti-uim/ti-uim.mk
index b49818004989..034388a08d1e 100644
--- a/package/ti-uim/ti-uim.mk
+++ b/package/ti-uim/ti-uim.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TI_UIM_VERSION = c73894456df5def97111cb33d2106b684b8b7959
-TI_UIM_SITE = git://gitorious.org/uim/uim.git
+$(eval $(call gitorious,uim,uim))
 TI_UIM_LICENSE = GPLv2+
 
 define TI_UIM_BUILD_CMDS
-- 
1.8.3.2
