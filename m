From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 13:59:05 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] libnfs: fix license and
 add hashes for license files
Message-ID: <20181005115810.C2F598D2AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=196a978c91b3a0a2ba4db973e6ac803d7bbad62e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

As specified in COPYING, examples are licensed under GPL-3.0+ and .x
files are licensed under BSD-2-Clause.

So update LIBNFS_LICENSE, add COPYING, LICENCE-BSD.txt and
LICENCE-GPL-3.txt to LIBNFS_LICENSE_FILES and add hash for all license
files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1b486d4fa32a698ca9b454d7cfb874473009d20f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnfs/libnfs.hash | 3 +++
 package/libnfs/libnfs.mk   | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
index cfe6678842..2bd8caf255 100644
--- a/package/libnfs/libnfs.hash
+++ b/package/libnfs/libnfs.hash
@@ -1,3 +1,6 @@
 # Locally calculated
 sha256 7ea6cd8fa6c461d01091e584d424d28e137d23ff4b65b95d01a3fd0ef95d120e  libnfs-libnfs-2.0.0.tar.gz
+sha256 2d152e3a2f31ef0fe14d4908377277f8215fb5c82ec9329d1eed081c845fc85f  COPYING
+sha256 d9406ced95457941032aa11d04623b8ab71f2827a3395ebef137aec475be35b1  LICENCE-BSD.txt
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENCE-GPL-3.txt
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index d961fd1d4e..0cf07d2143 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -8,8 +8,8 @@ LIBNFS_VERSION = libnfs-2.0.0
 LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
-LIBNFS_LICENSE = LGPL-2.1+
-LIBNFS_LICENSE_FILES = LICENCE-LGPL-2.1.txt
+LIBNFS_LICENSE = LGPL-2.1+ (library), BSD-2-Clause (protocol, .x files), GPL-3.0+ (examples)
+LIBNFS_LICENSE_FILES = COPYING LICENCE-BSD.txt LICENCE-LGPL-2.1.txt LICENCE-GPL-3.txt
 LIBNFS_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
