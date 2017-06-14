From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 14 Jun 2017 21:18:34 +0300
Subject: [Buildroot] [PATCH 1/2] gnutls: security bump to version 3.5.13
Message-ID: <629c7b2bda5194692d4508ec53cb3502cffd285b.1497464315.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-7507: decoding a status request TLS extension that has a
non-empty responder IDs list could lead to a crash due to a null pointer
dereference.

https://lists.gnupg.org/pipermail/gnutls-devel/2017-June/008446.html

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 8e2469a5bdfb..f699716801c9 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	63cb39a5eaa029381df2e49a74cfb7be89fc4a592445191818ffe1e66bde57cb	gnutls-3.5.12.tar.xz
+sha256	79f5480ad198dad5bc78e075f4a40c4a315a1b2072666919d2d05a08aec13096	gnutls-3.5.13.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index c192469f9ea4..3c76c30af888 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.5
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).12
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
-- 
2.11.0
