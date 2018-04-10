From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 21:33:17 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libtasn1: security bump
 to version 4.13
Message-ID: <20180410205255.6DC0A88398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf9cad4c7b986d4993ae660e38e36e2c724236bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

CVE-2017-10790: NULL pointer dereference and crash when reading crafted
input

CVE-2018-6003: Stack exhaustion due to indefinite recursion during BER
decoding

Add license files hashes.

Cc: Stefan Fr??berg <stefan.froberg@petroprogram.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9ac75335bfaa84f12cea4836602a9764403d0a7a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtasn1/libtasn1.hash | 6 +++++-
 package/libtasn1/libtasn1.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index 699c14050a..9ed7a7a42c 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256	6753da2e621257f33f5b051cc114d417e5206a0818fe0b1ecfd6153f70934753	libtasn1-4.12.tar.gz
+# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.13.tar.gz.sig
+sha256	7e528e8c317ddd156230c4e31d082cd13e7ddeb7a54824be82632209550c8cca	libtasn1-4.13.tar.gz
+# Locally calculated
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LIB
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 8d3daca15f..5f1b0e24c8 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.12
+LIBTASN1_VERSION = 4.13
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPLv3+ (tests, tools), LGPLv2.1+ (library)
