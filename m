From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 24 Jun 2016 11:57:56 -0400
Subject: [Buildroot] [PATCH v2] fs/tar: support passing long options to tar
Message-ID: <1466783876-7597-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move TAR_OPTS so that long options (or any option with an initial '-')
may be passed to tar. Since TAR_OPTS is at the front of the list, single
letter options still work.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v1 -> v2:
  - Move TAR_OPTS to front to preserve backward compatibility
    (suggested by Arnout)
  - Removed additional help text since no backward compatibility issues
    were introduced.

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
--
2.5.0
