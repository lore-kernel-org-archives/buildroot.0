From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 10 Sep 2013 21:56:35 +0200
Subject: [Buildroot] [git commit] linux: fix depmod location after move to
	host-kmod
Message-ID: <20130910200702.D0160834B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc34519201278a4737fb12b551fce98740383ff5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-kmod version of depmod gets installed into HOST_DIR/sbin, so
adjust the path we use to refer to it in linux.mk

Reported-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8508a54..649d06b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -47,7 +47,7 @@ LINUX_MAKE_FLAGS = \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
-	DEPMOD=$(HOST_DIR)/usr/sbin/depmod
+	DEPMOD=$(HOST_DIR)/sbin/depmod
 
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
