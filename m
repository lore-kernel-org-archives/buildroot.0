From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Mar 2021 23:43:19 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/libressl:
 security bump to 3.2.5
Message-ID: <20210326222259.075E37FD2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65d018436e5859abdc541af3d77ad14493afc0e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

It includes the following bug fix:

 * A TLS client using session resumption may cause a use-after-free.

https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.2.5-relnotes.txt

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f3894ffce2b6e6c52c2d9e3b7d0040f3d5a5b728)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 0dd0ffcaed..9f216bf2f1 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  412dc2baa739228c7779e93eb07cd645d5c964d2f2d837a9fd56db7498463d73  libressl-3.2.3.tar.gz
+sha256  798a65fd61d385e09d559810cdfa46512f8def5919264cfef241a7b086ce7cfe  libressl-3.2.5.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 654b8bda26..ad345ba3f0 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.2.3
+LIBRESSL_VERSION = 3.2.5
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
