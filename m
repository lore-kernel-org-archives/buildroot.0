From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Dec 2014 12:13:58 +0100
Subject: [Buildroot] [PATCH 8/9 v2] packages: switch to using the gitorious
	forge
In-Reply-To: <cover.1417863715.git.yann.morin.1998@free.fr>
References: <cover.1417863715.git.yann.morin.1998@free.fr>
Message-ID: <e3eacdc768b7db5f470cc98f805e32b29415732a.1417863715.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/xloader/xloader.mk                | 3 ++-
 package/can-utils/can-utils.mk         | 3 ++-
 package/lpc3250loader/lpc3250loader.mk | 3 ++-
 package/qhull/qhull.mk                 | 3 ++-
 package/ti-uim/ti-uim.mk               | 3 ++-
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
index 90d5fa2..a9319b1 100644
--- a/boot/xloader/xloader.mk
+++ b/boot/xloader/xloader.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 XLOADER_VERSION = 6f3a26101303051e0f91b6213735b68ce804e94e
-XLOADER_SITE = git://gitorious.org/x-loader/x-loader.git
+XLOADER_FORGE = gitorious
+XLOADER_FORGE_PATH = x-loader/x-loader
 XLOADER_BOARD_NAME = $(call qstrip,$(BR2_TARGET_XLOADER_BOARDNAME))
 
 XLOADER_LICENSE = GPLv2+
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 44713cf..3bdbf15 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 CAN_UTILS_VERSION = 111f8d3acf6f6b30bf208fd9c98399c5fb9d29de
-CAN_UTILS_SITE = git://gitorious.org/linux-can/can-utils.git
+CAN_UTILS_FORGE = gitorious
+CAN_UTILS_FORGE_PATH = linux-can/can-utils
 CAN_UTILS_AUTORECONF = YES
 
 $(eval $(autotools-package))
diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
index d13ab40..ff0cedf 100644
--- a/package/lpc3250loader/lpc3250loader.mk
+++ b/package/lpc3250loader/lpc3250loader.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-HOST_LPC3250LOADER_SITE = git://gitorious.org/lpc3250loader/lpc3250loader.git
+HOST_LPC3250LOADER_FORGE = gitorious
+HOST_LPC3250LOADER_FORGE_PATH = lpc3250loader/lpc3250loader
 HOST_LPC3250LOADER_VERSION = 1.0
 LPC3250LOADER_LICENSE = GPLv2+
 LPC3250LOADER_LICENSE_FILES = LPC3250loader.py
diff --git a/package/qhull/qhull.mk b/package/qhull/qhull.mk
index 6992d71..9de72fc 100644
--- a/package/qhull/qhull.mk
+++ b/package/qhull/qhull.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 QHULL_VERSION = 60d55819729d7b49391dde0271e15a56c70992b9
-QHULL_SITE = git://gitorious.org/qhull/qhull.git
+QHULL_FORGE = gitorious
+QHULL_FORGE_PATH = qhull/qhull
 QHULL_INSTALL_STAGING = YES
 QHULL_LICENSE = BSD-Style
 QHULL_LICENSE_FILES = COPYING.txt
diff --git a/package/ti-uim/ti-uim.mk b/package/ti-uim/ti-uim.mk
index b498180..381fbe0 100644
--- a/package/ti-uim/ti-uim.mk
+++ b/package/ti-uim/ti-uim.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 TI_UIM_VERSION = c73894456df5def97111cb33d2106b684b8b7959
-TI_UIM_SITE = git://gitorious.org/uim/uim.git
+TI_UIM_FORGE = gitorious
+TI_UIM_FORGE_PATH = uim/uim
 TI_UIM_LICENSE = GPLv2+
 
 define TI_UIM_BUILD_CMDS
-- 
1.9.1
