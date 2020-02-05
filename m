From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Feb 2020 15:48:40 +0100
Subject: [Buildroot] [PATCH 3/6 v2] boot/uboot: license files hashes only
 valid for latest version
In-Reply-To: <cover.1580914115.git.yann.morin.1998@free.fr>
References: <cover.1580914115.git.yann.morin.1998@free.fr>
Message-ID: <75edead37a0d9c4d78b3d03739bbfab1f35ee3a6.1580914115.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We can only know the path to the license files for the known version.
For custom, older or newer, versions may change, or may be moved
around.

So, do for U-Boot as was done for ATF, linux, and linu-headers, and only
define the list of license files for the latest version.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Markus Mayer <mmayer@broadcom.com>
---
 boot/uboot/uboot.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1f444351d7..2bfa50779b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -8,7 +8,9 @@ UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
 UBOOT_LICENSE = GPL-2.0+
+ifeq ($(BR2_TARGET_UBOOT_LATEST_VERSION),y)
 UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
+endif
 
 UBOOT_INSTALL_IMAGES = YES
 
-- 
2.20.1
