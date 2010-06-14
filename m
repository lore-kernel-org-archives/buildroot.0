From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] at91bootstrap: don't depend on
	BR .config
Message-ID: <20100614203444.E5A05804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=db55d4b80aa879bb63fb7057a7d17700742214c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/at91bootstrap/at91bootstrap.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 9030696..d7723c4 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -35,7 +35,7 @@ $(AT91BOOTSTRAP_DIR)/.unpacked: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
 	toolchain/patch-kernel.sh $(AT91BOOTSTRAP_DIR) boot/at91bootstrap/ at91bootstrap-$(AT91BOOTSTRAP_VERSION)\*.patch
 	touch $(AT91BOOTSTRAP_DIR)/.unpacked
 
-$(AT91BOOTSTRAP_DIR)/.configured: $(AT91BOOTSTRAP_DIR)/.unpacked .config
+$(AT91BOOTSTRAP_DIR)/.configured: $(AT91BOOTSTRAP_DIR)/.unpacked
 	$(MAKE) \
 		MEMORY=$(AT91BOOTSTRAP_MEMORY) \
 		CROSS_COMPILE=$(TARGET_CROSS) \
-- 
1.7.1
