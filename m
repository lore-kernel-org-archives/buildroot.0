From: Martin Hicks <mort@bork.org>
Date: Tue,  1 Feb 2011 12:13:00 -0500
Subject: [Buildroot] [PATCH] Enable ccache for kernel compile
Message-ID: <1296580381-4658-1-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just needed to pass in ccache as a prefix to the CROSS_TARGET variable.

Signed-off-by: Martin Hicks <mort@bork.org>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index d3c06db..2bc2efe 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -23,7 +23,7 @@ LINUX26_MAKE_FLAGS = \
 	HOSTCFLAGS="$(HOSTCFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
-	CROSS_COMPILE=$(TARGET_CROSS) \
+	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 	LZMA="$(LZMA)"
 
 # Get the real Linux version, which tells us where kernel modules are
-- 
1.5.6.5
