From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:09:50 +0100
Subject: [Buildroot] [git commit] Revert "package/prelink-cross: new package"
Message-ID: <20190318210820.509578F30F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ded8a6f8ec54528c92efc7d646ac6f6b3d44bb3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 0bb0f2ba849dac9208d3a5a4107b8edd5ee46a1e, because
using "host-binutils" is not correct as it should only be used with
internal toolchains, and not external toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 -
 package/prelink-cross/prelink-cross.hash |  3 ---
 package/prelink-cross/prelink-cross.mk   | 15 ---------------
 3 files changed, 19 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c91325e284..3e0ac08e11 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -55,7 +55,6 @@ F:	package/openjdk/
 F:	package/openjdk-bin/
 F:	package/php/
 F:	package/policycoreutils/
-F:	package/prelink-cross/
 F:	package/python3/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
deleted file mode 100644
index 3ac33ac3d0..0000000000
--- a/package/prelink-cross/prelink-cross.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  cb3f5d833cd74b7e90e38465c9c948b0f4138c017509cb91e391b0931063429e  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2.tar.gz
-sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/prelink-cross/prelink-cross.mk b/package/prelink-cross/prelink-cross.mk
deleted file mode 100644
index ab7a967f95..0000000000
--- a/package/prelink-cross/prelink-cross.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# host-prelink-cross
-#
-################################################################################
-
-HOST_PRELINK_CROSS_VERSION = a853a5d715d84eec93aa68e8f2df26b7d860f5b2
-HOST_PRELINK_CROSS_SITE = git://git.yoctoproject.org/prelink-cross
-HOST_PRELINK_CROSS_SITE_METHOD = git
-HOST_PRELINK_CROSS_LICENSE = GPL-2.0
-HOST_PRELINK_CROSS_LICENSE_FILES = COPYING
-HOST_PRELINK_CROSS_AUTORECONF = YES
-HOST_PRELINK_CROSS_DEPENDENCIES = host-binutils host-elfutils
-
-$(eval $(host-autotools-package))
