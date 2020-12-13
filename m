From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Dec 2020 23:38:15 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/libressl:
 security bump to version 3.1.5
Message-ID: <20201213222542.AF28D81544@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=032baed755aed03d360a506ab0f42b49d65cc2a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes the following security issues:

    * Malformed ASN.1 in a certificate revocation list or a timestamp
      response token can lead to a NULL pointer dereference.

https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.1.5-relnotes.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index eb784868a8..32a9babcc7 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  414c149c9963983f805a081db5bd3aec146b5f82d529bb63875ac941b25dcbb6  libressl-3.1.4.tar.gz
+sha256  2c13ddcec5081c0e7ba7f93d8370a91911173090f1922007e1d90de274500494  libressl-3.1.5.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 06b7174c5e..53812c23cc 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.1.4
+LIBRESSL_VERSION = 3.1.5
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
