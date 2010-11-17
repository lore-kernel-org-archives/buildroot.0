From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 17 Nov 2010 04:11:18 -0500
Subject: [Buildroot] [PATCH] linux: drop LDFLAGS override
Message-ID: <1289985078-3333-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current linux code overrides LDFLAGS that the kernel itself might be
setting up.  Looking at the history, there doesn't seem to be any reason
for this override.  It was added in ea8b1fa6a60705 without any logic.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 linux/linux.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 17c4b48..67b68ce 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -31,7 +31,6 @@ LINUX26_MAKE_FLAGS = \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE=$(TARGET_CROSS) \
-	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LZMA="$(LZMA)"
 ifneq ($(LINUX26_SOURCE_DIR),$(LINUX26_BUILD_DIR))
 LINUX26_MAKE_FLAGS += O="$(LINUX26_BUILD_DIR)"
-- 
1.7.3.2
