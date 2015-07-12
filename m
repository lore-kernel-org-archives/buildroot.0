From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 12 Jul 2015 16:35:27 +0200
Subject: [Buildroot] [PATCH 2/5] linux: use backtick instead of $(shell ...)
	make function
In-Reply-To: <1436711730-20599-1-git-send-email-arnout@mind.be>
References: <1436711730-20599-1-git-send-email-arnout@mind.be>
Message-ID: <1436711730-20599-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Verified that LINUX_VERSION_PROBED is only used in "-quoted commands
(actually, usually it's not quoted).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Note: this one is not needed for per-package staging, and for printvars
it's maybe not such a great idea since we may want to see the actual
probed value. OTOH, if linux has not been configured yet (or is not
selected in .config), it still looks pretty bad.
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index eca1450..9deec36 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -76,7 +76,7 @@ LINUX_MAKE_ENV = \
 
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
-LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease)
+LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease`
 
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
-- 
2.1.4
