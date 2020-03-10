From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 22:41:17 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] boot/uboot: license files
 hashes only valid for latest version
Message-ID: <20200310213455.1C5259087F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f541c16b1ddfed5fa37773b4042a691dcc354099
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

We can only know the details of the license files for known versions.  For
custom, older or newer versions, the license files may change, or may be
moved around.

So, do for U-Boot as was done for ATF, linux, and linux-headers, and only
define the list of license files for the latest version.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ff1a03ab28c8b5ffd7703cc4710bf20cc6223b5e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 5e0f614024..724ae29f63 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -8,7 +8,9 @@ UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
 UBOOT_LICENSE = GPL-2.0+
+ifeq ($(BR2_TARGET_UBOOT_LATEST_VERSION),y)
 UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
+endif
 
 UBOOT_INSTALL_IMAGES = YES
 
