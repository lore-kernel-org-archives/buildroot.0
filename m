From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  8 Feb 2018 20:46:45 +0200
Subject: [Buildroot] [PATCH] libtasn1: security bump to version 4.13
Message-ID: <a055dd8302369efd8f63a769d9a6f2965b2a98da.1518115605.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2017-10790: NULL pointer dereference and crash when reading crafted
input

CVE-2018-6003: Stack exhaustion due to indefinite recursion during BER
decoding

Add license files hashes.

Cc: Stefan Fr?berg <stefan.froberg@petroprogram.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libtasn1/libtasn1.hash | 6 +++++-
 package/libtasn1/libtasn1.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index 699c14050a8a..9ed7a7a42c97 100644
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
index b34a3b63f018..f14d57abd373 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.12
+LIBTASN1_VERSION = 4.13
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
-- 
2.15.1
