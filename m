From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Tue,  7 Apr 2020 09:36:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnutls: security bump to 3.6.13
Message-ID: <20200407073644.2561937-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issue:

 * CVE-2020-11501: It was found that GnuTLS 3.6.3 introduced a
   regression in the DTLS protocol implementation. This caused the DTLS
   client to not contribute any randomness to the DTLS negotiation
   breaking the security guarantees of the DTLS protocol.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index c8a1e1cbca..99279bfb6b 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.10.tar.xz.sig
-sha256 b1f3ca67673b05b746a961acf2243eaae0ffe658b6a6494265c648e7c7812293        gnutls-3.6.10.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.13.tar.xz.sig
+sha256 32041df447d9f4644570cf573c9f60358e865637d69b7e59d1159b7240b52f38        gnutls-3.6.13.tar.xz
 # Locally calculated
 sha256 e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b        doc/COPYING
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3        doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index efdcd21d9d..a1dfce62a2 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################

 GNUTLS_VERSION_MAJOR = 3.6
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).10
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
--
2.25.1



Spectralink Disclaimer:
"The information transmitted by this email is intended only for the person or entity to which it is addressed. This email may contain proprietary, confidential and/or privileged material. If you are not the intended recipient of this message, please notify the sender by reply email immediately and delete this message without reading further or forwarding to others. The contents of this email may be protected by copyright law. This email is not intended to be a contract or other legally binding obligation".
