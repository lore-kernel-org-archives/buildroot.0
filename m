From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Apr 2019 22:45:49 +0200
Subject: [Buildroot] [git commit] package/gnutls: security bump to 3.6.7.1
Message-ID: <20190407205034.D613E81D72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dd5576ccb8eadeb8672c8b22df86f4f41dce1d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

 * CVE-2019-3836: It was discovered in gnutls before version 3.6.7 upstream
   that there is an uninitialized pointer access in gnutls versions 3.6.3 or
   later which can be triggered by certain post-handshake messages

 * CVE-2019-3829: A vulnerability was found in gnutls versions from 3.5.8
   before 3.6.7. A memory corruption (double free) vulnerability in the
   certificate verification API. Any client or server application that
   verifies X.509 certificates with GnuTLS 3.5.8 or later is affected.

3.6.7.1 is identical to 3.6.7, but fixes a packaging issue in the release
tarball:

https://lists.gnutls.org/pipermail/gnutls-devel/2019-April/013086.html

HTTP URLs changed to HTTPS in COPYING, so update license hash.

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.hash | 6 +++---
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 1af0e2d45d..8c0e0d69d5 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.6.tar.xz.sig
-sha256	bb9acab8af2ac430edf45faaaa4ed2c51f86e57cb57689be6701aceef4732ca7	gnutls-3.6.6.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.7.1.tar.xz.sig
+sha256	881b26409ecd8ea4c514fd3fbdb6fae5fab422ca7b71116260e263940a4bbbad	gnutls-3.6.7.1.tar.xz
 # Locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	doc/COPYING
+sha256	e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b	doc/COPYING
 sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index c6d2d72771..e7c5968204 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.6
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).6
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).7.1
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
