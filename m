From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Mar 2014 23:48:40 +0100
Subject: [Buildroot] [git commit] mtools: add support for building for target
Message-ID: <20140317224945.556AB9C0CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4047270e75cff1fb1cc05e4d6f2c65f9e5663528
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a menu option and updates the mtools.mk file to support
building mtools for the target.

[Peter: use same upstream URL as host variant]
Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in        |    1 +
 package/mtools/Config.in |   13 +++++++++++++
 package/mtools/mtools.mk |    1 +
 3 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f9c1b0b..688ed4d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -144,6 +144,7 @@ source "package/kobs-ng/Config.in"
 source "package/makedevs/Config.in"
 source "package/mmc-utils/Config.in"
 source "package/mtd/Config.in"
+source "package/mtools/Config.in"
 source "package/nfs-utils/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/squashfs/Config.in"
diff --git a/package/mtools/Config.in b/package/mtools/Config.in
new file mode 100644
index 0000000..c471d77
--- /dev/null
+++ b/package/mtools/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MTOOLS
+	bool "mtools"
+	depends on BR2_USE_WCHAR
+	help
+	  Mtools is a collection of utilities to access MS-DOS disks from
+	  Unix without mounting them. It supports Win'95 style long file
+	  names, OS/2 Xdf disks and 2m disks (store up to 1992k on a high
+	  density 3 1/2 disk).
+
+	  http://www.gnu.org/software/mtools/
+
+comment "mtools needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 11517df..6d8f44b 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -10,4 +10,5 @@ MTOOLS_SITE          = $(BR2_GNU_MIRROR)/mtools/
 MTOOLS_LICENSE       = GPLv3+
 MTOOLS_LICENSE_FILES = COPYING
 
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
