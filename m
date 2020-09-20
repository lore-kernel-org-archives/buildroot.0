From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:05:58 +0200
Subject: [Buildroot] [git commit] package/clamav: bump version to 0.103.0
Message-ID: <20200920131304.B4E0281321@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9d55310e300479a453a47220aff9b11c3ed1724
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.clamav.net/pipermail/clamav-announce/2020/000050.html

Rebased patch 0002.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch   | 4 +++-
 package/clamav/clamav.hash                                            | 2 +-
 package/clamav/clamav.mk                                              | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/clamav/0002-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch b/package/clamav/0002-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch
index e99a9742ec..d4be5c7b29 100644
--- a/package/clamav/0002-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch
+++ b/package/clamav/0002-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch
@@ -12,6 +12,8 @@ This is a bit hacky, and would greatly benefit from a test in ./configure
 instead, but does nicely as a quick fix for now.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for 0.103.0]
 ---
  libclamav/mbox.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -20,7 +22,7 @@ diff --git a/libclamav/mbox.c b/libclamav/mbox.c
 index 71f540c0a..4851297a9 100644
 --- a/libclamav/mbox.c
 +++ b/libclamav/mbox.c
-@@ -98,7 +98,7 @@
+@@ -91,7 +91,7 @@
  #include <features.h>
  #endif
  
diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index b15460cecc..bc1bf3bf90 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  eebd426a68020ecad0d2084b8c763e6898ccfd5febcae833d719640bb3ff391b  clamav-0.102.4.tar.gz
+sha256  32a9745277bfdda80e77ac9ca2f5990897418e9416880f3c31553ca673e80546  clamav-0.103.0.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 358228b861..fc979a74aa 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.102.4
+CLAMAV_VERSION = 0.103.0
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
