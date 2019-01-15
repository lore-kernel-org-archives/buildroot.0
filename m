From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 15 Jan 2019 18:37:28 +0200
Subject: [Buildroot] [PATCH 3/3] gnupg2: security bump to version 2.2.12
In-Reply-To: <a310feb727c90725d66a7506af583445a3eb3ec2.1547570248.git.baruch@tkos.co.il>
References: <a310feb727c90725d66a7506af583445a3eb3ec2.1547570248.git.baruch@tkos.co.il>
Message-ID: <5a09750bb57f85248ecbdddb0d477c529e0c3b7d.1547570248.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2018-1000858: Cross Site Request Forgery with arbitrary HTTPS
GET requests via HTTP redirect.

https://sektioneins.de/en/advisories/advisory-012018-gnupg-wkd.html

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gnupg2/gnupg2.hash | 8 ++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index a367effcab72..f985e11ad3c3 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q3/000428.html
-sha1 3e87504e2ca317718aa9b6299947ebf7e906b54e  gnupg-2.2.10.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q4/000433.html
+sha1 2aeccc35ea8034306ff7a1072b84abbaa79619c3  gnupg-2.2.12.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.10.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.12.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256 799dd37a86a1448732e339bd20440f4f5ee6e69755f6fd7a73ee8af30840c915  gnupg-2.2.10.tar.bz2
+sha256 db030f8b4c98640e91300d36d516f1f4f8fe09514a94ea9fc7411ee1a34082cb  gnupg-2.2.12.tar.bz2
 sha256 bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 64329522d513..9365e960f258 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.10
+GNUPG2_VERSION = 2.2.12
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.20.1
