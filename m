From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  2 Jan 2015 12:43:35 +0100
Subject: [Buildroot] [RFC 4/4] toolchain-external: define actual sources for
	arago toolchains
In-Reply-To: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
References: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1420199015-16907-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 91edd4a..ff79c3b 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -259,6 +259,7 @@ TOOLCHAIN_EXTERNAL_SOURCE = arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109),y)
 TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
+TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = arago-toolchain-2011.09-sources.tar.bz2
 define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv7a/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
@@ -266,6 +267,7 @@ endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109),y)
 TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
+TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = arago-toolchain-2011.09-sources.tar.bz2
 define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv5te/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
-- 
1.9.1
