From: Noam Camus <noamc@ezchip.com>
Date: Sun, 23 Feb 2014 08:29:34 +0000
Subject: [Buildroot] FW: [PATCH] external toolchain: use relative path to
 external toolchain.
Message-ID: <884EA965490E3C4D8E66AEF41E98025006BF60@ezex10.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now configuration may include relative path to external toolchain.

Signed-off-by: Noam Camus <noamc@ezchip.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index a7bfafc..46f33a9 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -131,7 +131,7 @@ TOOLCHAIN_EXTERNAL_PREFIX=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_INSTALL_DIR=$(HOST_DIR)/opt/ext-toolchain
 else
-TOOLCHAIN_EXTERNAL_INSTALL_DIR=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
+TOOLCHAIN_EXTERNAL_INSTALL_DIR=$(abspath $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH)))
 endif
 
 ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
-- 
1.7.1
