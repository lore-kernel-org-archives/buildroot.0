From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Nov 2010 10:24:42 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain/crosstool-NG: use
	HOST_PATH when building the toolchain
Message-ID: <20101129092503.9C0FC8D360@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=512bb3c6d4abd461376668fb2eac7e7e1f3a7ab2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.2.2
