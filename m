From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jun 2016 15:42:44 +0200
Subject: [Buildroot] [git commit] fs/tar: support passing long options to tar
Message-ID: <20160625134248.530D580811@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ae48ae3af9840a0b09d0cf0d6b07b2435910eaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move TAR_OPTS so that long options (or any option with an initial '-')
may be passed to tar. Since TAR_OPTS is at the front of the list, single
letter options still work.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/tar/tar.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 28219cf..11c69c5 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -7,7 +7,7 @@
 TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
 define ROOTFS_TAR_CMD
-	tar -c$(TAR_OPTS)f $@ --numeric-owner -C $(TARGET_DIR) .
+	tar $(TAR_OPTS) -cf $@ --numeric-owner -C $(TARGET_DIR) .
 endef
 
 $(eval $(call ROOTFS_TARGET,tar))
