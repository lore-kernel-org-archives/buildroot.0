From: Noam Camus <noamc@ezchip.com>
Date: Sun, 22 Dec 2013 17:32:23 +0200
Subject: [Buildroot] [PATCH 19/29] added ability to use relative path to
 external toolchain.
Message-ID: <264C179F799EF24AB26D5319053335E80E59B737C0@ezexch.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tal Zilcer <talz@ezchip.com>

---
 toolchain/toolchain-external/toolchain-external.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index bd4f375..c286965 100644
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
