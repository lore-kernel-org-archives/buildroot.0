From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Dec 2020 11:39:43 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/libressl:
 security bump to version 3.2.3
Message-ID: <20201213102402.0709F82226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00cf600bbc9aa7240784f7f977c70a4e423ceb53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

It includes the following security fix:
 * Malformed ASN.1 in a certificate revocation list or a timestamp
   response token can lead to a NULL pointer dereference.

https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.2.3-relnotes.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 87b23b380d6fa7637ddfb2233538901f138b763f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 9dfb74ff07..0dd0ffcaed 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  a9d1e1d030b8bcc67bf6428b8c0fff14a5602e2236257b9e3d77acaf12e2a7a1  libressl-3.2.2.tar.gz
+sha256  412dc2baa739228c7779e93eb07cd645d5c964d2f2d837a9fd56db7498463d73  libressl-3.2.3.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 41484f5a96..2f7644a8e8 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.2.2
+LIBRESSL_VERSION = 3.2.3
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
