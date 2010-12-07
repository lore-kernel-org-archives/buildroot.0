From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Dec 2010 23:01:35 +0100
Subject: [Buildroot] [git commit master 1/1] linux: drop LDFLAGS override
Message-ID: <20101207220221.B9B878E11D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3bbf1c2ea6140d8b288b0af5b1a9c3a1aa92edad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current linux code overrides LDFLAGS that the kernel itself might be
setting up. Looking at the history, there doesn't seem to be any reason
for this override. It was added in ea8b1fa6a60705 without any logic.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8dc7dd0..feda418 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -24,7 +24,6 @@ LINUX26_MAKE_FLAGS = \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE=$(TARGET_CROSS) \
-	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LZMA="$(LZMA)"
 
 # Get the real Linux version, which tells us where kernel modules are
-- 
1.7.2.2
