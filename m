From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Apr 2011 22:46:04 +0200
Subject: [Buildroot] [git commit] crosstool-ng: fix target libc install
	after s/sys-root/sysroot/ rename
Message-ID: <20110419204735.423B782103@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b4f976f28b6b95ade6b87525f95ab406b78aef87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index edd643b..2c5829c 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -60,7 +60,7 @@ endif
 $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
 	$(Q)mkdir -p $(TARGET_DIR)/lib
 	$(Q)CTNG_TUPLE="$$( $(call ctng,show-tuple) )";                     \
-	    CTNG_SYSROOT="$(HOST_DIR)/usr/$${CTNG_TUPLE}/sys-root";        \
+	    CTNG_SYSROOT="$(HOST_DIR)/usr/$${CTNG_TUPLE}/sysroot";          \
 	    echo "CTNG_TUPLE='$${CTNG_TUPLE}'";                             \
 	    echo "CTNG_SYSROOT='$${CTNG_SYSROOT}'";                         \
 	    echo "Copy external toolchain libraries to target...";          \
-- 
1.7.3.4
