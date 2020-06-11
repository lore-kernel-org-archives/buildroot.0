From: stefan at astylos.dk <stefan@astylos.dk>
Date: Thu, 11 Jun 2020 07:31:51 +0200
Subject: [Buildroot] [PATCH] package/gnutls: security bump to 3.6.14
Message-ID: <20200611053151.709390-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stefan S?rensen <stefan.sorensen@spectralink.com>

Fixes the following security issue:

 * CVE-2020-13777: It was found that GnuTLS 3.6.4 introduced a
   regression in the TLS protocol implementation. This caused the TLS
   server to not securely construct a session ticket encryption key
   considering the application supplied secret, allowing a MitM
   attacker to bypass authentication in TLS 1.3 and recover previous
   conversations in TLS 1.2

Release announcement:
 https://lists.gnupg.org/pipermail/gnutls-help/2020-June/004648.html

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 99279bfb6b..75f64281bc 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.13.tar.xz.sig
-sha256	32041df447d9f4644570cf573c9f60358e865637d69b7e59d1159b7240b52f38	gnutls-3.6.13.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.14.tar.xz.sig
+sha256	5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63	gnutls-3.6.14.tar.xz
 # Locally calculated
 sha256	e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b	doc/COPYING
 sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index a1dfce62a2..34878e97b4 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.6
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).14
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.25.4
