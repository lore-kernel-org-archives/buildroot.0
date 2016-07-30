From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 10:39:50 +0200
Subject: [Buildroot] [git commit] squashfs: update site to git.kernel.org
Message-ID: <20160730100500.5275F8043F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=668363e0faa5e2005c21826296592bc47395258c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

squashfs-tools development has been moved to git.kernel.org from
Sourceforge.

The hash was selected to fix a threading issue observed when
creating images on a build machine with at least 64 cores.
(Fixes random corrupted images that would fail to boot)

Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Thomas: use https:// instead of git://.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squashfs/squashfs.hash | 4 ++--
 package/squashfs/squashfs.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index e308089..eb456be 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  0d605512437b1eb800b4736791559295ee5f60177e102e4d4ccd0ee241a5f3f6  squashfs4.3.tar.gz
+# Locally computed
+sha256	e807202ab4dcfeea214df49d3a728b9a85644a7e7262fc6fcd875a0def99d4ed	squashfs-9c1db6d13a51a2e009f0027ef336ce03624eac0d.tar.gz
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index cdeb9c8..1a5f1ea 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = 4.3
-SQUASHFS_SOURCE = squashfs$(SQUASHFS_VERSION).tar.gz
-SQUASHFS_SITE = http://downloads.sourceforge.net/project/squashfs/squashfs/squashfs$(SQUASHFS_VERSION)
+SQUASHFS_VERSION = 9c1db6d13a51a2e009f0027ef336ce03624eac0d
+SQUASHFS_SITE = https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
+SQUASHFS_SITE_METHOD = git
 SQUASHFS_LICENSE = GPLv2+
 SQUASHFS_LICENSE_FILES = COPYING
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1
