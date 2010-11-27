From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Nov 2010 23:44:02 +0100
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: use HOST_PATH when
	building the toolchain
Message-ID: <1290897842-21811-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 1e8fa7a..31797c4 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -28,7 +28,7 @@ CTNG_UCLIBC_CONFIG_FILE := $(TOPDIR)/toolchain/toolchain-crosstool-ng/uClibc.con
 # to calling ct-ng.
 # $1: the set of arguments to pass to ct-ng
 define ctng
-$(CTNG_DIR)/ct-ng -C $(CTNG_DIR) --no-print-directory $(1)
+PATH=$(HOST_PATH) $(CTNG_DIR)/ct-ng -C $(CTNG_DIR) --no-print-directory $(1)
 endef
 
 #-----------------------------------------------------------------------------
-- 
1.7.1
