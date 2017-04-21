From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 21 Apr 2017 15:25:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgpgme: bump version to 1.9.0
Message-ID: <20170421132544.23310-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed configure option --with-gpg, it was removed upstream in 2013:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commitdiff;h=02ba35c1b6a2cbb3361b2f2ad507c53564b2be0b#patch3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libgpgme/libgpgme.hash | 2 +-
 package/libgpgme/libgpgme.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 5ef7b0e5c..cf7c5050f 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	d0abe1449395315eac37e4e45076bbb82732cedf94210937b37776e10cdc2bb6	gpgme-1.7.1.tar.bz2
+sha256 1b29fedb8bfad775e70eafac5b0590621683b2d9869db994568e6401f4034ceb  gpgme-1.9.0.tar.bz2
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 09b6fbe44..11693d1bf 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.7.1
+LIBGPGME_VERSION = 1.9.0
 LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
@@ -14,7 +14,7 @@ LIBGPGME_DEPENDENCIES = libassuan libgpg-error
 LIBGPGME_LANGUAGE_BINDINGS = cl
 
 # libgpgme, needs to know the gpg binary path on the target.
-LIBGPGME_CONF_OPTS = --with-gpg=/usr/bin/gpg \
+LIBGPGME_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr \
 	--with-libassuan-prefix=$(STAGING_DIR)/usr \
 	--disable-gpgsm-test \
-- 
2.11.0
