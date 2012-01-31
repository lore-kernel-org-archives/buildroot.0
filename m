From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jan 2012 20:39:59 +0100
Subject: [Buildroot] [PATCH 1/8] linux: use the depmod built in HOST_DIR
In-Reply-To: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
References: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
Message-ID: <28c6a15900cdc487752287f9d20e1ad7af0f992a.1328038759.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1
