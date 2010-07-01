From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Jul 2010 15:35:00 +0200
Subject: [Buildroot] [git commit master 1/1] ubifs: fix lzo typo
Message-ID: <20100701133609.246E981662@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9280cafe308fe4d8706ba2b12e6d5ae464fb8aed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2155

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES           |    1 +
 fs/ubifs/ubifs.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index d00172b..9e672f1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -51,6 +51,7 @@
 	#2038: Bump ncurses to 5.7
 	#2095: make gconfig: undefined reference to symbol 'dlsym@@GLIBC_2.2.5'
 	#2119: Tries to build kernel, although disabled in config
+	#2155: Compression lzo don't set for ubifs
 
 2010.05, Released May 30th, 2010:
 
diff --git a/fs/ubifs/ubifs.mk b/fs/ubifs/ubifs.mk
index 0fad234..337180e 100644
--- a/fs/ubifs/ubifs.mk
+++ b/fs/ubifs/ubifs.mk
@@ -9,7 +9,7 @@ UBIFS_OPTS := -e $(BR2_TARGET_ROOTFS_UBIFS_LEBSIZE) -c $(BR2_TARGET_ROOTFS_UBIFS
 ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB),y)
 UBIFS_OPTS += -x zlib
 endif
-ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_LZI),y)
+ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_LZO),y)
 UBIFS_OPTS += -x lzo
 endif
 ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_NONE),y)
-- 
1.7.1
