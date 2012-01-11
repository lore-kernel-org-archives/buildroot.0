From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 11 Jan 2012 15:36:45 +0100
Subject: [Buildroot] [git commit] sshfs: bump to version 2.3,
	adjust SITE and description
Message-ID: <20120111151616.8F55290300@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6480f2bb91e2df46096ed5f6ef8d3138cd38470
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sshfs/Config.in |    5 +----
 package/sshfs/sshfs.mk  |    4 ++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 1d9f759..73d552f 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -9,10 +9,7 @@ config BR2_PACKAGE_SSHFS
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
 	help
-	  FUSE makes it possible to implement a filesystem in a userspace
-	  program. Features include: simple yet comprehensive API, secure
-	  mounting by non-root users, support for 2.4 and 2.6 Linux
-	  kernels, multi-threaded operation. etc...
+	  FUSE filesystem client based on the SSH File Transfer Protocol.
 
 	  http://fuse.sourceforge.net/sshfs.html
 
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 81eb4c6..738b4d0 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-SSHFS_VERSION = 2.2
-SSHFS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/$(SSHFS_VERSION)/sshfs-fuse
+SSHFS_VERSION = 2.3
+SSHFS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/$(SSHFS_VERSION)
 SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
 SSHFS_DEPENDENCIES = \
 	libglib2 libfuse openssh \
