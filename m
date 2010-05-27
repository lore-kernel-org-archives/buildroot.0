From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 27 May 2010 22:26:24 +0200
Subject: [Buildroot] [PATCH] coreutils: add 'join'
Message-ID: <1274991984-6652-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

coreutils: add 'join' to the list of files that are copied to target
rootfs.
---
 package/coreutils/coreutils.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 2081994..e2f7bc5 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -12,7 +12,8 @@ COREUTILS_DIR:=$(BUILD_DIR)/coreutils-$(COREUTILS_VERSION)
 COREUTILS_BINARY:=src/vdir
 COREUTILS_TARGET_BINARY:=bin/vdir
 BIN_PROGS:=cat chgrp chmod chown cp date dd df dir echo false hostname \
-	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true uname
+	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
+	uname join
 
 $(DL_DIR)/$(COREUTILS_SOURCE):
 	 $(call DOWNLOAD,$(COREUTILS_SITE),$(COREUTILS_SOURCE))
-- 
1.7.0.4
