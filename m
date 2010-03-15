From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Mar 2010 15:14:56 +0100
Subject: [Buildroot] [git commit master] kernel-headers: remove obsolete
	openswan support
Message-ID: <20100315141649.5CD747764D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9d3e9e0f2cb7046d57054f4c01b8012068b95adb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../kernel-headers/kernel-headers-new.makefile     |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/toolchain/kernel-headers/kernel-headers-new.makefile b/toolchain/kernel-headers/kernel-headers-new.makefile
index d063d29..2237a0a 100644
--- a/toolchain/kernel-headers/kernel-headers-new.makefile
+++ b/toolchain/kernel-headers/kernel-headers-new.makefile
@@ -39,10 +39,6 @@ ifneq ($(KERNEL_HEADERS_PATCH_DIR),)
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
 endif
-ifeq ($(BR2_PACKAGE_OPENSWAN),y)
-	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
-		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
-endif
 	touch $@
 
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
-- 
1.6.3.3
