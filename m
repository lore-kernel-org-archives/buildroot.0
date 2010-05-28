From: =?utf-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 28 May 2010 12:06:47 +0200
Subject: [Buildroot] [git commit master] coreutils: add 'join'
Message-ID: <20100528113442.56FF9BFCFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c0b3dc20059a29bc36c699f5a71e038a44cf7544
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

coreutils: add 'join' to the list of files that are copied to target
rootfs.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    2 +-
 package/coreutils/coreutils.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index f6a4ecd..44ffa75 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: hal
+	Updated/fixed packages: coreutils, hal
 
 2010.05-rc3, Released May 27th, 2010:
 
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
1.6.3.3
