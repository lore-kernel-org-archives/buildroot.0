From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Feb 2021 14:53:13 +0100
Subject: [Buildroot] [PATCH v1] package/util-linux: bump version to 2.36.2
Message-ID: <20210213135313.8069-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] http://lkml.iu.edu/hypermail/linux/kernel/2102.1/07236.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:

- configure.ac contains a LIBBLKID_DATE typo (12-Feb-2020 instead of
  12-Feb-2021), do not know if the date is important/worth to be patched?

	$ diff -u build/util-linux-2.36.1/configure.ac build/util-linux-2.36.2/configure.ac
	--- build/util-linux-2.36.1/configure.ac	2020-11-16 11:51:02.118672677 +0100
	+++ build/util-linux-2.36.2/configure.ac	2021-02-12 14:59:51.946015300 +0100
	@@ -29,7 +29,7 @@

	 dnl libblkid version
	 LIBBLKID_VERSION="$PACKAGE_VERSION_MAJOR.$PACKAGE_VERSION_MINOR.$PACKAGE_VERSION_RELEASE"
	-LIBBLKID_DATE="16-Nov-2020"
	+LIBBLKID_DATE="12-Feb-2020"
	 LIBBLKID_LT_MAJOR=1
	 LIBBLKID_LT_MINOR=1
	 LIBBLKID_LT_MICRO=0
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index c5f5c69a4d..3f9fe39818 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.36/sha256sums.asc
-sha256  09fac242172cd8ec27f0739d8d192402c69417617091d8c6e974841568f37eed  util-linux-2.36.1.tar.xz
+sha256  f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f  util-linux-2.36.2.tar.xz
 # License files, locally calculated
 sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 0178c52bac..95fd7ec82b 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.36
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
2.30.0
