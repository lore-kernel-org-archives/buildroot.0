From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 23:51:51 +0200
Subject: [Buildroot] [git commit] coreutils: bump version to 8.30
Message-ID: <20180907111607.DAE557FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34e703224cab3cc2b58743718ccf312e5426b8a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Among other things this is required to build aginst Glibc 2.28+,
see:
https://github.com/coreutils/gnulib/commit/4af4a4a71827c0bc5e0ec67af23edef4f15cee8e

Otherwise it fails on build like that:
----------------------->8------------------------
  CC       lib/fts.o
lib/freadptr.c: In function 'freadptr':
lib/freadptr.c:119:3: error: #error "Please port gnulib freadptr.c to your platform! Look at the definition of fflush, fread, getc, getc_unlocked on your system, then report this to bug-gnulib."
 #error "Please port gnulib freadptr.c to your platform! Look at the definition of fflush, fread, getc, getc_unlocked on your system, then report this to bug-gnulib."
  ^~~~~
----------------------->8------------------------

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coreutils/coreutils.hash | 2 +-
 package/coreutils/coreutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 472cab55f5..d55e25a86f 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 8891d349ee87b9ff7870f52b6d9312a9db672d2439d289bc57084771ca21656b  coreutils-8.27.tar.xz
+sha256 e831b3a86091496cdba720411f9748de81507798f6130adeaef872d206e1b057  coreutils-8.30.tar.xz
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 7e7251ff73..3e8efbf047 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 8.27
+COREUTILS_VERSION = 8.30
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
