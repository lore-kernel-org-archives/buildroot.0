From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Nov 2014 09:48:01 -0300
Subject: [Buildroot] [PATCH] gnutls: security bump to version 3.2.20
Message-ID: <1415623681-11218-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-8564 / GNUTLS-SA-2014-5 - Sean Burford reported that the
encoding of elliptic curves parameters GnuTLS 3 is vulnerable to a
denial of service (heap corruption). It affects clients and servers
which print information about the peer's certificate, e.g., the key ID,
and can be exploited via a specially crafted X.509 certificate.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index ca743a8..e0124d3 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	a20d95a434a670afe5ce66430ae56151bbbe14456a0517ce775c46b1d4183dcf	gnutls-3.2.19.tar.xz
+sha256	7967057e78c3ed968e524a07ab262681219b73001ab8e75cbc4f1a506abdb598	gnutls-3.2.20.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index efc933e..06ca265 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.2
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).19
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).20
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
-- 
2.0.4
