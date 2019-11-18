From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 10:42:16 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/libressl: bump to
 version 3.0.2
Message-ID: <20191118093447.B1C3D8F14D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c18f255b9b4ec64da0fa11c7bc764817127520f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

[Thomas: cherry-picked to master as it fixes a build issue with the
musl C library:
 output/build/libressl-2.9.2/crypto/compat/getprogname_linux.c: In function ???getprogname???:
 output/build/libressl-2.9.2/crypto/compat/getprogname_linux.c:32:2: error: #error "Cannot emulate getprogname"
 #error "Cannot emulate getprogname"]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 26f42106e8acfd336d8e902da96cd2ac9e63c09d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index e3e5dbe00b..fcecc2b434 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256 c4c78167fae325b47aebd8beb54b6041d6f6a56b3743f4bd5d79b15642f9d5d4  libressl-2.9.2.tar.gz
+sha256 df7b172bf79b957dd27ef36dcaa1fb162562c0e8999e194aa8c1a3df2f15398e  libressl-3.0.2.tar.gz
 # Locally computed
 sha256 5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 2d0f6fc50f..c2491bb3a9 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 2.9.2
+LIBRESSL_VERSION = 3.0.2
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
