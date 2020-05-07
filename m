From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 May 2020 23:55:53 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libopenssl:
 security bump to v1.1.1g
Message-ID: <20200507214107.D34A48FEFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=700f65462ed34b3fa97747c417fc0dc651c01509
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This fixes CVE-2020-1967:
Server or client applications that call the SSL_check_chain() function during
or after a TLS 1.3 handshake may crash due to a NULL pointer dereference as a
result of incorrect handling of the "signature_algorithms_cert" TLS extension.
The crash occurs if an invalid or unrecognised signature algorithm is received
from the peer. This could be exploited by a malicious peer in a Denial of
Service attack. OpenSSL version 1.1.1d, 1.1.1e, and 1.1.1f are affected by this
issue. This issue did not affect OpenSSL versions prior to 1.1.1d.

See https://www.openssl.org/news/secadv/20200421.txt

Also update the hash file to the new two spaces convention

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 849aee4f8805cce89376c0cd1ce23721436a90ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 6 +++---
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 3becd790ac..121e10c410 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1d.tar.gz.sha256
-sha256	186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35	openssl-1.1.1f.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1g.tar.gz.sha256
+sha256  ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46  openssl-1.1.1g.tar.gz
 
 # License files
-sha256	c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c	LICENSE
+sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 4639c63fac..a300458f85 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1f
+LIBOPENSSL_VERSION = 1.1.1g
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
