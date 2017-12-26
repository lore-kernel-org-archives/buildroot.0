From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Dec 2017 17:35:21 +0100
Subject: [Buildroot] [git commit] libassuan: bump to version 2.5.1
Message-ID: <20171226164129.004A583542@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8879bca7c0194f7c8fbb9452103e695c0bac513
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add cryptographically secure sha256 hash and a reference to upstream
signature.

Add license files hashes.

Cc: Philipp Claves <claves@budelmann-elektronik.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libassuan/libassuan.hash | 7 ++++++-
 package/libassuan/libassuan.mk   | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index 01ade11..2e80cfa 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,2 +1,7 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1 27391cf4a820b5350ea789c30661830c9a271518  libassuan-2.4.3.tar.bz2
+sha1 c8432695bf1daa914a92f51e911881ed93d50604  libassuan-2.5.1.tar.bz2
+# Locally calculated after checking signature
+# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.1.tar.bz2.sig
+sha256 47f96c37b4f2aac289f0bc1bacfa8bd8b4b209a488d3d15e2229cb6cc9b26449  libassuan-2.5.1.tar.bz2
+sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 0e3aca3..e807086 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.4.3
+LIBASSUAN_VERSION = 2.5.1
 LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPL-2.1+ (library), GPL-3.0 (tests, doc)
