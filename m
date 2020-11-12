From: Julien Olivain <ju.o@free.fr>
Date: Thu, 12 Nov 2020 13:01:55 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/linux-backports: bump version to
 5.8
In-Reply-To: <20201112120155.333290-1-ju.o@free.fr>
References: <20201111162208.362275-1-ju.o@free.fr>
 <20201112120155.333290-1-ju.o@free.fr>
Message-ID: <20201112120155.333290-2-ju.o@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Attempting to compile this package with newer Kernel version (e.g. v5.4)
fails with message:

   Generating local configuration database from kernel ...Kernel version parse failed!

Upgrading the package to 5.8 fixes this issue. Anyways, v4.4 is now
rather old and beat the very purpose of having newer drivers in older
kernels.

Note that since backports tag v4.14-rc4-1, the requirement on minimal
kernel version changed from 3.0 to 3.10. See commit [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/backports/backports.git/commit/?id=a0d05f9f9ca50ea8b1d60726fac6b54167257e76

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
  - Add a note about the change in minimal kernel version (3.0 -> 3.10).
---
 package/linux-backports/linux-backports.hash | 4 ++--
 package/linux-backports/linux-backports.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-backports/linux-backports.hash b/package/linux-backports/linux-backports.hash
index f39bc2ed27..0d60955b02 100644
--- a/package/linux-backports/linux-backports.hash
+++ b/package/linux-backports/linux-backports.hash
@@ -1,4 +1,4 @@
-# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v4.4.2/sha256sums.asc
-sha256  a979e194c2ed9fdfca092a448e626d85c5af0e4de5ad993c0967afd15af01285  backports-4.4.2-1.tar.xz
+# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v5.8/sha256sums.asc
+sha256  19b4174d89bf11ee221458e11f1e8dace26558498774b823051156f522d2036b  backports-5.8-1.tar.xz
 # Locally computed
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
index 030d7a2864..7e725147dc 100644
--- a/package/linux-backports/linux-backports.mk
+++ b/package/linux-backports/linux-backports.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_BACKPORTS_VERSION_MAJOR = 4.4.2
+LINUX_BACKPORTS_VERSION_MAJOR = 5.8
 LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
 LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
 LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
-- 
2.28.0
