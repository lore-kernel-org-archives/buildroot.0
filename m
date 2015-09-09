From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Sep 2015 23:02:18 +0200
Subject: [Buildroot] [git commit] sunxi-tools: bump version
Message-ID: <20150909211502.B7C3481F0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=838fdfda5a30779a2770a97a49417192005c6c37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Among other changes brings A23/A33/A83T/H3 support. The makefile uses
pkg-config to find libusb, so ensure that is available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sunxi-tools/sunxi-tools.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index 2dfd496..049af9b 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-SUNXI_TOOLS_VERSION = v1.2
+SUNXI_TOOLS_VERSION = 82b9c656868d99553f11b1c8853ca808c7ce41ae
 SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPLv2+
 SUNXI_TOOLS_LICENSE_FILES = COPYING
-HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb
+HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb host-pkgconf
 FEX2BIN = $(HOST_DIR)/usr/bin/fex2bin
 
 define HOST_SUNXI_TOOLS_BUILD_CMDS
