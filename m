From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 21:05:18 +0200
Subject: [Buildroot] [git commit] linux: qstrip the custom DTS path
Message-ID: <20130605191225.2EF199A967@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82d2a47478e436495e5fe3cd5aff308fe3f212d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes a problem reported by wacha at mit.bme.hu, see
http://lists.busybox.net/pipermail/buildroot/2013-June/073312.html.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 11b32c3..177446d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -55,7 +55,7 @@ LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
-KERNEL_DTS_NAME = $(basename $(notdir $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))
+KERNEL_DTS_NAME = $(basename $(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))))
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
