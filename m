From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:06:03 +0200
Subject: [Buildroot] [git commit] package/rp-pppoe: bump to version 3.14
Message-ID: <20200714130313.748ED86EF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd67e652254f63e46ebe518782793a4597c96f16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update patch and renumber it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rp-pppoe/{0002-krn-plugin.patch => 0001-krn-plugin.patch} | 6 ++++--
 package/rp-pppoe/rp-pppoe.hash                                    | 2 +-
 package/rp-pppoe/rp-pppoe.mk                                      | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/rp-pppoe/0002-krn-plugin.patch b/package/rp-pppoe/0001-krn-plugin.patch
similarity index 79%
rename from package/rp-pppoe/0002-krn-plugin.patch
rename to package/rp-pppoe/0001-krn-plugin.patch
index d364e8684c..c386e85f29 100644
--- a/package/rp-pppoe/0002-krn-plugin.patch
+++ b/package/rp-pppoe/0001-krn-plugin.patch
@@ -1,3 +1,5 @@
+[Fabrice: update patch for 3.14]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 diff -Nura rp-pppoe-3.11.orig/src/configure rp-pppoe-3.11/src/configure
 --- rp-pppoe-3.11.orig/src/configure	2012-08-21 10:01:10.536440032 -0300
 +++ rp-pppoe-3.11/src/configure	2012-08-21 10:01:45.353442397 -0300
@@ -5,8 +7,8 @@ diff -Nura rp-pppoe-3.11.orig/src/configure rp-pppoe-3.11/src/configure
  modprobe pppoe > /dev/null 2>&1
  fi
  if test "$cross_compiling" = yes; then :
--  ac_cv_linux_kernel_pppoe=no; $ECHO "cross-compiling, default: "
-+  ac_cv_linux_kernel_pppoe=yes; $ECHO "cross-compiling, default: "
+-  ac_cv_linux_kernel_pppoe=no; echo "cross-compiling, default: "
++  ac_cv_linux_kernel_pppoe=yes; echo "cross-compiling, default: "
  else
    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
diff --git a/package/rp-pppoe/rp-pppoe.hash b/package/rp-pppoe/rp-pppoe.hash
index 3f7af60558..806bab1b0f 100644
--- a/package/rp-pppoe/rp-pppoe.hash
+++ b/package/rp-pppoe/rp-pppoe.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  00794e04031546b0e9b8cf286f2a6d1ccfc4a621b2a3abb2d7ef2a7ab7cc86c2  rp-pppoe-3.12.tar.gz
+sha256  7825232f64ab4d618ef074d62d145ae43d6edc91b9a718c6130a4742bac40e2a  rp-pppoe-3.14.tar.gz
 # Locally computed
 sha256  464006ba771074f4022db14f58a29a0b447b6fdde9529cf0331be396b6279162  doc/LICENSE
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 4214df929f..2f0073b6c0 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RP_PPPOE_VERSION = 3.12
-RP_PPPOE_SITE = http://www.roaringpenguin.com/files/download
+RP_PPPOE_VERSION = 3.14
+RP_PPPOE_SITE = https://dianne.skoll.ca/projects/rp-pppoe/download
 RP_PPPOE_LICENSE = GPL-2.0
 RP_PPPOE_LICENSE_FILES = doc/LICENSE
 RP_PPPOE_DEPENDENCIES = pppd
