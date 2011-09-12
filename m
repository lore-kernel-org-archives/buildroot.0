From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 13 Sep 2011 00:46:06 +0200
Subject: [Buildroot] [git commit] openssl: bump to 1.0.0e
Message-ID: <20110912224630.C773F8D58F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a50f6ef29e72b4725b0e53dbf28922c798eacf06
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssl/openssl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 0163ef8..82a4fc4 100644
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
-- 
1.7.3.4
