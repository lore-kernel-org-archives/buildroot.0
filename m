From: Carlos Santos <casantos@datacom.com.br>
Date: Wed,  7 Nov 2018 00:32:17 -0200
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.33
Message-ID: <20181107023217.3564-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update "basic set" help to include the new "choom" utility.
- Re-generate checksums for license files, whose names now follow the
  SPDX License List.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/util-linux/Config.in       |  2 +-
 package/util-linux/util-linux.hash | 14 +++++++-------
 package/util-linux/util-linux.mk   | 11 ++++++++---
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 5f0a35cdbb..a5a137bfe0 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -53,7 +53,7 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	help
 	  Install the basic set of util-linux binaries.
 
-	  blkdiscard, blkid, blockdev, chcpu, col, colcrt, colrm,
+	  blkdiscard, blkid, blockdev, chcpu, choom, col, colcrt, colrm,
 	  column, ctrlaltdel, dmesg, fdisk, fincore, findfs, findmnt,
 	  flock, fsfreeze, fstrim, getopt, hexdump, ipcmk, isosize,
 	  ldattach, look, lsblk, lscpu, lsipc, lslocks, lsns, mcookie,
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 1b7d6db45a..ed503a12ed 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,9 +1,9 @@
-# From https://www.kernel.org/pub/linux/utils/util-linux/v2.32/sha256sums.asc
-sha256 86e6707a379c7ff5489c218cfaf1e3464b0b95acf7817db0bc5f179e356a67b2  util-linux-2.32.1.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.33/sha256sums.asc
+sha256 f261b9d73c35bfeeea04d26941ac47ee1df937bd3b0583e748217c1ea423658a  util-linux-2.33.tar.xz
 # License files, locally calculated
-sha256 1e4b65802b0df8115395c697029d03339f983d451a473a08643309c684410d9a  README.licensing
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPLv2
-sha256 ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.UCB
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPLv2.1
-sha256 9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3
+sha256 4335620e8f478ee4dc4d26540448d39469091ef1d8e3fbbbb8bf753206ceac74  README.licensing
+sha256 9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
+sha256 ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.BSD-4-Clause-UC
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-or-later
 sha256 e53348ce276358e9997014071c5294b36a18c4b34f32f00ee57b9acce0aafd63  Documentation/licenses/COPYING.ISC
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPL-2.1-or-later
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d6b3c33b26..c176d364ce 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,15 +4,20 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION_MAJOR = 2.32
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
+UTIL_LINUX_VERSION_MAJOR = 2.33
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
 # README.licensing claims that some files are GPL-2.0 only, but this is not true.
 # Some files are GPL-3.0+ but only in tests. rfkill uses an ISC-style license.
 UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid) ISC (rfkill)
-UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3 Documentation/licenses/COPYING.ISC
+UTIL_LINUX_LICENSE_FILES = README.licensing \
+	Documentation/licenses/COPYING.BSD-3-Clause \
+	Documentation/licenses/COPYING.BSD-4-Clause-UC \
+	Documentation/licenses/COPYING.GPL-2.0-or-later \
+	Documentation/licenses/COPYING.ISC \
+	Documentation/licenses/COPYING.LGPL-2.1-or-later
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 UTIL_LINUX_CONF_OPTS += \
-- 
2.17.1
