From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:49 -0000
Subject: [Buildroot] [git commit branch/next] linux: use backtick instead of
	$(shell ...) make function
Message-ID: <20150808105633.BF43F80414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28f57bb863ba48df054cec0057c844bf23d5969f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Verified that LINUX_VERSION_PROBED is only used in "-quoted commands
(actually, usually it's not quoted).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3ea564f..375a9e1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -76,7 +76,7 @@ LINUX_MAKE_ENV = \
 
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
-LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease)
+LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease`
 
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
