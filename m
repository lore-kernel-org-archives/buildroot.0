From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 17:52:28 +0100
Subject: [Buildroot] [git commit] util-linux: add ISC licence, used by rfkill
Message-ID: <20180118165236.C11CD83F46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a483c9168e4c18642e90a280ecb435623d4d6d09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pull a patch from upstream that adds Documentation/licenses/COPYING.ISC
instead of distributing the whole rfkill.c file.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/0001-docs-add-ISC-licence.patch | 38 ++++++++++++++++++++++
 package/util-linux/util-linux.hash                 |  2 +-
 package/util-linux/util-linux.mk                   |  2 +-
 3 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/0001-docs-add-ISC-licence.patch b/package/util-linux/0001-docs-add-ISC-licence.patch
new file mode 100644
index 0000000..aea7b97
--- /dev/null
+++ b/package/util-linux/0001-docs-add-ISC-licence.patch
@@ -0,0 +1,38 @@
+From a9e4662d26b10789b28282d7e77ab189ef34cf5c Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Sun, 14 Jan 2018 16:39:31 -0200
+Subject: [PATCH] docs: add ISC licence
+
+Save the top 21 lines of sys-utils/rfkill.c as COPYING.ISC. This is
+useful for Linux distributions an integration tools like Buildroot,
+to collect detailed legal information for each package.
+
+[kzak at redhat.com: - remove C-comments and rfkill header]
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ Documentation/licenses/COPYING.ISC | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+ create mode 100644 Documentation/licenses/COPYING.ISC
+
+diff --git a/Documentation/licenses/COPYING.ISC b/Documentation/licenses/COPYING.ISC
+new file mode 100644
+index 000000000..8351a30e3
+--- /dev/null
++++ b/Documentation/licenses/COPYING.ISC
+@@ -0,0 +1,11 @@
++Permission to use, copy, modify, and/or distribute this software for any
++purpose with or without fee is hereby granted, provided that the above
++copyright notice and this permission notice appear in all copies.
++
++THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
++WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
++MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
++ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
++ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
++OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+-- 
+2.14.3
+
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 838d2dc..068bb45 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -6,4 +6,4 @@ sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documen
 sha256 ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.UCB
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPLv2.1
 sha256 9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3
-sha256 996126b78a42dd2eeea1256d78b7fd6dec090ea196365c0ccb46adc32bc92460  sys-utils/rfkill.c
+sha256 e53348ce276358e9997014071c5294b36a18c4b34f32f00ee57b9acce0aafd63  Documentation/licenses/COPYING.ISC
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 5858887..e368464 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -13,7 +13,7 @@ UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERS
 # README.licensing claims that some files are GPL-2.0 only, but this is not true.
 # Some files are GPL-3.0+ but only in tests. rfkill uses an ISC-style license.
 UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid) ISC (rfkill)
-UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3 sys-utils/rfkill.c
+UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3 Documentation/licenses/COPYING.ISC
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 # uClibc needs NTP_LEGACY for sys/timex.h -> ntp_gettime() support
