From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 23:23:11 +0100
Subject: [Buildroot] [git commit] linux: use the depmod built in HOST_DIR
Message-ID: <20120131232309.8B60290963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ba5301cdc9e7c7d4348f7bfdf567592fcc7882f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 5c5a1d2..dbe1ad7 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -40,7 +40,8 @@ LINUX_MAKE_FLAGS = \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
-	LZMA="$(LZMA)"
+	LZMA="$(LZMA)" \
+	DEPMOD=$(HOST_DIR)/usr/sbin/depmod
 
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
