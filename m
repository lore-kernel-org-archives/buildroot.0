From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 14:36:49 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libopenssl:
 security bump to version 1.1.1f
Message-ID: <20200408122834.BC6808DE7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcfdf366a1fb2d0aa1f2eed88295968d90596386
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues (1.1.1e):

CVE-2019-1551 [Low severity]: There is an overflow bug in the x64_64
Montgomery squaring procedure used in exponentiation with 512-bit moduli.
No EC algorithms are affected.  Analysis suggests that attacks against
2-prime RSA1024, 3-prime RSA1536, and DSA1024 as a result of this defect
would be very difficult to perform and are not believed likely.  Attacks
against DH512 are considered just feasible.  However, for an attack the
target would have to re-use the DH512 private key, which is not recommended
anyway.  Also applications directly using the low level API BN_mod_exp may
be affected if they use BN_FLG_CONSTTIME.  Reported by OSS-Fuzz and Guido
Vranken.

https://www.openssl.org/news/secadv/20191206.txt

CVE-2019-1563 [Low severity]: In situations where an attacker receives
automated notification of the success or failure of a decryption attempt an
attacker, after sending a very large number of messages to be decrypted, can
recover a CMS/PKCS7 transported encryption key or decrypt any RSA encrypted
message that was encrypted with the public RSA key, using a Bleichenbacher
padding oracle attack.  Applications are not affected if they use a
certificate together with the private RSA key to the CMS_decrypt or
PKCS7_decrypt functions to select the correct recipient info to decrypt.
Reported by Bernd Edlinger.

https://www.openssl.org/news/secadv/20190910.txt

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
[Peter: mention security impact]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d397b231b7c7f02f9c52d13ac9d3d82b39f4f4c5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 2 +-
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 1b239fbee7..3becd790ac 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
 # From https://www.openssl.org/source/openssl-1.1.1d.tar.gz.sha256
-sha256	1e3a91bc1f9dfce01af26026f856e064eab4c8ee0a8f457b5ae30b40b8b711f2	openssl-1.1.1d.tar.gz
+sha256	186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35	openssl-1.1.1f.tar.gz
 
 # License files
 sha256	c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c	LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index da4ae291c0..4639c63fac 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1d
+LIBOPENSSL_VERSION = 1.1.1f
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
