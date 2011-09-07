From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 07 Sep 2011 14:25:02 +0200
Subject: [Buildroot] [PATCH v2] openssl: bump to 1.0.0e
Message-ID: <4E67629E.10809@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes between 1.0.0d and 1.0.0e [6 Sep 2011]

  *) Fix bug where CRLs with nextUpdate in the past are sometimes accepted
     by initialising X509_STORE_CTX properly. (CVE-2011-3207)
     [Kaspar Brand <ossl@velox.ch>]

  *) Fix SSL memory handling for (EC)DH ciphersuites, in particular
     for multi-threaded use of ECDH. (CVE-2011-3210)
     [Adam Langley (Google)]

  *) Fix x509_name_ex_d2i memory leak on bad inputs.
     [Bodo Moeller]

  *) Remove hard coded ecdsaWithSHA1 signature tests in ssl code and check
     signature public key algorithm by using OID xref utilities instead.
     Before this you could only use some ECC ciphersuites with SHA1 only.
     [Steve Henson]

  *) Add protection against ECDSA timing attacks as mentioned in the paper
     by Billy Bob Brumley and Nicola Tuveri, see:

	http://eprint.iacr.org/2011/232.pdf

     [Billy Bob Brumley and Nicola Tuveri]

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
v2: added changes between 1.0.0d and 1.0.0e

 package/openssl/openssl.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/package/openssl/openssl.mk
===================================================================
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSL_VERSION = 1.0.0d
+OPENSSL_VERSION = 1.0.0e
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
