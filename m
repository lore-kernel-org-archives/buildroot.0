From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 18 Aug 2016 10:39:11 +0300
Subject: [Buildroot] [PATCH] gnupg: security bump to version 1.4.21
Message-ID: <4c3273437b9b93736b622a9d245f715f7fd9a75e.1471505951.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2016-6313: An attacker who obtains 580 bytes from the standard RNG
can trivially predict the next 20 bytes of output.

Add cryptographically secure sha256 hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gnupg/gnupg.hash | 6 ++++--
 package/gnupg/gnupg.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/gnupg/gnupg.hash b/package/gnupg/gnupg.hash
index f872d24d5cd9..8968b00d2b16 100644
--- a/package/gnupg/gnupg.hash
+++ b/package/gnupg/gnupg.hash
@@ -1,2 +1,4 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2015q4/000382.html
-sha1	cbc9d960e3d8488c32675019a79fbfbf8680387e	gnupg-1.4.20.tar.bz2
+# From https://lists.gnu.org/archive/html/info-gnu/2016-08/msg00008.html
+sha1	e3bdb585026f752ae91360f45c28e76e4a15d338	gnupg-1.4.21.tar.bz2
+# Locally computed
+sha256	6b47a3100c857dcab3c60e6152e56a997f2c7862c1b8b2b25adf3884a1ae2276	gnupg-1.4.21.tar.bz2
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 54f4d97365a9..182abd670976 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG_VERSION = 1.4.20
+GNUPG_VERSION = 1.4.21
 GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG_LICENSE = GPLv3+
-- 
2.8.1
