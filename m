From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Sep 2012 12:45:56 +0200
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
	host-pkg-config
Message-ID: <1348224356-20104-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
How was this never caught by the autobuilders?  Do they happen to
build host-pkg-config most of the time?  If so, maybe we should make
the randpackageconfig select a smaller number of packages to increase
the chance of finding this kind of issue...

 package/unionfs/unionfs.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index e2ffd72..eb8109e 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -7,7 +7,7 @@
 UNIONFS_VERSION = 0.26
 UNIONFS_SITE = http://podgorny.cz/unionfs-fuse/releases
 UNIONFS_SOURCE = unionfs-fuse-$(UNIONFS_VERSION).tar.xz
-UNIONFS_DEPENDENCIES = libfuse
+UNIONFS_DEPENDENCIES = libfuse host-pkg-config
 UNIONFS_LICENSE = BSD-3c
 UNIONFS_LICENSE_FILES = LICENSE
 
-- 
tg: (669d07b..) t/unionfs-host-pkg-config (depends on: master)
