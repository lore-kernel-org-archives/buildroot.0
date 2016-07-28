From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 Jul 2016 08:13:28 -0500
Subject: [Buildroot] [PATCH v2] squashfs: update site to git.kernel.org
Message-ID: <1469711608-322-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Atul Singh <atul.singh.mandla@rockwellcollins.com>

squashfs-tools development has been moved to git.kernel.org from
Sourceforge.

The hash was selected to fix a threading issue observed when
creating images on a build machine with at least 64 cores.
(Fixes random corrupted images that would fail to boot)

Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---

v1 -> v2
[Thomas P
 - Updated commit description with hash selection reason
---
 package/squashfs/squashfs.hash | 4 ++--
 package/squashfs/squashfs.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

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
index cdeb9c8..9c8841a 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = 4.3
-SQUASHFS_SOURCE = squashfs$(SQUASHFS_VERSION).tar.gz
-SQUASHFS_SITE = http://downloads.sourceforge.net/project/squashfs/squashfs/squashfs$(SQUASHFS_VERSION)
+SQUASHFS_VERSION = 9c1db6d13a51a2e009f0027ef336ce03624eac0d
+SQUASHFS_SITE = git://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
 SQUASHFS_LICENSE = GPLv2+
 SQUASHFS_LICENSE_FILES = COPYING
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1
-- 
1.9.1
