From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 06:33:12 +0100
Subject: [Buildroot] [git commit] libgpgme: bump to version 1.10.0
Message-ID: <20171214053330.6A08C7F9B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8636a3cbefdfd03a39cfe1ccda024b95fb0ba7f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use https download site.

Add license hash.

Cc: Philipp Claves <claves@budelmann-elektronik.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgpgme/libgpgme.hash | 7 ++++++-
 package/libgpgme/libgpgme.mk   | 4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index cf7c505..6bd595c 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,2 +1,7 @@
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q4/000418.html
+sha1 77d3390887da25ed70b7ac04392360efbdca501f  gpgme-1.10.0.tar.bz2
 # Locally calculated after checking pgp signature
-sha256 1b29fedb8bfad775e70eafac5b0590621683b2d9869db994568e6401f4034ceb  gpgme-1.9.0.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.10.0.tar.bz2.sig
+sha256 1a8fed1197c3b99c35f403066bb344a26224d292afc048cfdfc4ccd5690a0693  gpgme-1.10.0.tar.bz2
+# Locally calculated
+sha256 ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 5af2b5e..31f25b4 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.9.0
-LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme
+LIBGPGME_VERSION = 1.10.0
+LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
 LIBGPGME_LICENSE_FILES = COPYING.LESSER
