From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Dec 2015 09:12:39 -0300
Subject: [Buildroot] [PATCH 2/2] sshfs: switch to github
In-Reply-To: <1451391159-9906-1-git-send-email-gustavo@zacarias.com.ar>
References: <1451391159-9906-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1451391159-9906-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The project moved to github, so point the homepage and download URL
there.
Use direct download link since the helper can't handle the re-uploaded
release files, and add a comment that it might make sense to switch to
it once a new release is made.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sshfs/Config.in  | 2 +-
 package/sshfs/sshfs.hash | 4 ++--
 package/sshfs/sshfs.mk   | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 7c821a5..31fef9f 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_SSHFS
 	help
 	  FUSE filesystem client based on the SSH File Transfer Protocol.
 
-	  http://fuse.sourceforge.net/sshfs.html
+	  https://github.com/libfuse/sshfs
 
 comment "sshfs needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/sshfs/sshfs.hash b/package/sshfs/sshfs.hash
index c8b0c00..16253e0 100644
--- a/package/sshfs/sshfs.hash
+++ b/package/sshfs/sshfs.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  e9171452e5d0150b9c6a2158fd2e2dcefb5d5d03ba4d208949e00a3a46c6e63e  sshfs-fuse-2.5.tar.gz
+# Locally computed
+sha256	e9171452e5d0150b9c6a2158fd2e2dcefb5d5d03ba4d208949e00a3a46c6e63e	sshfs-fuse-2.5.tar.gz
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 572f44e..e576dc7 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 SSHFS_VERSION = 2.5
-SSHFS_SITE = http://downloads.sourceforge.net/project/fuse/sshfs-fuse/$(SSHFS_VERSION)
+# Switch to github helper on bump
+SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs_2_5
 SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
 SSHFS_LICENSE = GPLv2
 SSHFS_LICENSE_FILES = COPYING
-- 
2.4.10
