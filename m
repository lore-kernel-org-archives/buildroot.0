From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Aug 2017 15:01:04 +0300
Subject: [Buildroot] [PATCH] gnupg: security bump to version 1.4.22
Message-ID: <10033e7b173d98374eac45d28e1fb97f68e82118.1504094464.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mitigate a flush+reload side-channel attack on RSA secret keys
dubbed "Sliding right into disaster".  For details see
<https://eprint.iacr.org/2017/627>.  [CVE-2017-7526]

Switch to https site for better firewall compatibility and security.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gnupg/gnupg.hash | 7 +++----
 package/gnupg/gnupg.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/gnupg/gnupg.hash b/package/gnupg/gnupg.hash
index 8968b00d2b16..abd76cde9c5e 100644
--- a/package/gnupg/gnupg.hash
+++ b/package/gnupg/gnupg.hash
@@ -1,4 +1,3 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2016-08/msg00008.html
-sha1	e3bdb585026f752ae91360f45c28e76e4a15d338	gnupg-1.4.21.tar.bz2
-# Locally computed
-sha256	6b47a3100c857dcab3c60e6152e56a997f2c7862c1b8b2b25adf3884a1ae2276	gnupg-1.4.21.tar.bz2
+# Locally computed based on signature
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-1.4.22.tar.bz2.sig
+sha256	9594a24bec63a21568424242e3f198b9d9828dea5ff0c335e47b06f835f930b4	gnupg-1.4.22.tar.bz2
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index b3578b87df99..0ed3e1e063fe 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GNUPG_VERSION = 1.4.21
+GNUPG_VERSION = 1.4.22
 GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
-GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
+GNUPG_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG_LICENSE = GPL-3.0+
 GNUPG_LICENSE_FILES = COPYING
 GNUPG_DEPENDENCIES = zlib ncurses $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-- 
2.14.1
