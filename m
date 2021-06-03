From: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Thu,  3 Jun 2021 20:48:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/stunnel: bump to version 5.59
Message-ID: <20210603184846.25146-1-texier.pj2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release includes the following changes:

- Security bugfixes
  OpenSSL DLLs updated to version 1.1.1k.
- New features
  Client-side "protocol = ldap" support (thx to Bart Dopheide and Seth Grover).
- Bugfixes
  The test suite fixed not to require external connectivity.
  Fixed paths in generated manuals (thx to Tatsuki Makino).
  Fixed configuration reload when compression is used.
  Fixed compilation with early releases of OpenSSL 1.1.1.

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 package/stunnel/stunnel.hash | 4 ++--
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index a62fa07607..0ae20cb906 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/downloads/stunnel-5.58.tar.gz.sha256
-sha256  d4c14cc096577edca3f6a2a59c2f51869e35350b3988018ddf808c88e5973b79  stunnel-5.58.tar.gz
+# From https://www.stunnel.org/downloads/stunnel-5.59.tar.gz.sha256
+sha256  137776df6be8f1701f1cd590b7779932e123479fb91e5192171c16798815ce9f  stunnel-5.59.tar.gz
 # Locally calculated
 sha256  28b55d0157efd5ceb63640faeebb50fda13b1f49aec0b9c1240b9a3ea9f0eb4c  COPYING.md
 sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 2d066a4370..68d3c85534 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).58
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).59
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.17.1
