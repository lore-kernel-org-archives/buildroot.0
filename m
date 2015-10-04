From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 17:49:00 +0100
Subject: [Buildroot] [git commit] nfs-utils: Bump version
Message-ID: <20151004164905.CB27681D4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9bd4ee8e66dbc644b580f06ccc9ce339a98a73a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch as it was backported from upstream:
http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=17a3e5bffb7110d46de1bf42b64b90713ff5ea50

Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0004-statd-Fix-test-for-foreground-mode.patch  |   30 --------------------
 package/nfs-utils/nfs-utils.hash                   |    4 +-
 package/nfs-utils/nfs-utils.mk                     |    2 +-
 3 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/package/nfs-utils/0004-statd-Fix-test-for-foreground-mode.patch b/package/nfs-utils/0004-statd-Fix-test-for-foreground-mode.patch
deleted file mode 100644
index a6138a3..0000000
--- a/package/nfs-utils/0004-statd-Fix-test-for-foreground-mode.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ca1fd7153937e147f66d1ca3edbe9c2615f33880 Mon Sep 17 00:00:00 2001
-From: Chris Mayo <aklhfex@gmail.com>
-Date: Sun, 1 Feb 2015 12:03:46 -0500
-Subject: [PATCH] statd: Fix test for foreground mode
-
-daemon_init parameter has the opposite sense
-to code removed in commit 7addf9d
-
-Signed-off-by: Chris Mayo <aklhfex@gmail.com>
-Signed-off-by: Steve Dickson <steved@redhat.com>
----
- utils/statd/statd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/utils/statd/statd.c b/utils/statd/statd.c
-index 60ce6d1..2b7a167 100644
---- a/utils/statd/statd.c
-+++ b/utils/statd/statd.c
-@@ -393,7 +393,7 @@ int main (int argc, char **argv)
- 		simulator (--argc, ++argv);	/* simulator() does exit() */
- #endif
- 
--	daemon_init(!(run_mode & MODE_NODAEMON));
-+	daemon_init((run_mode & MODE_NODAEMON));
- 
- 	if (run_mode & MODE_LOG_STDERR) {
- 		xlog_syslog(0);
--- 
-2.4.5
-
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index a4959ee..2bd5121 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/1.3.2/sha256sums.asc
-sha256 2966bb431c06e9ba35a54f48f89db03a5132bc2d8ed8084ac8ccb34e25a9b739  nfs-utils-1.3.2.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/1.3.3/sha256sums.asc
+sha256 700d689c5622c87953c34102e5befafc4d3c811e676852238f0dd79c9c0c084d  nfs-utils-1.3.3.tar.xz
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 095d095..8c06d8e 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 1.3.2
+NFS_UTILS_VERSION = 1.3.3
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPLv2+
