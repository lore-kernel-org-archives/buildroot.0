From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Apr 2018 12:37:12 +0300
Subject: [Buildroot] [PATCH 2/3] gnupg2: security bump to version 2.2.6
In-Reply-To: <d59c6c57aff0a6c8966f33b2ee80bfa6328723f5.1523957833.git.baruch@tkos.co.il>
References: <d59c6c57aff0a6c8966f33b2ee80bfa6328723f5.1523957833.git.baruch@tkos.co.il>
Message-ID: <72dfe4457476a4e00aa7ab1d7bdf57d5ab0c1dc7.1523957833.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2018-9234: Unenforced configuration allows for apparently
valid certifications actually signed by signing subkeys.

Remove --disable-doc from configure options. We pass this options to all
autotools packages.

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gnupg2/gnupg2.hash | 8 ++++----
 package/gnupg2/gnupg2.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 9cc8e4c9138c..155295244e6c 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,6 +1,6 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q1/000420.html
-sha1 9dec110397e460b3950943e18f5873a4f277f216  gnupg-2.2.5.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q2/000421.html
+sha1 295298debcc2c12f02a2f2fdf04aecb6d6aae396  gnupg-2.2.6.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.5.tar.bz2.sig
-sha256 3fa189a32d4fb62147874eb1389047c267d9ba088f57ab521cb0df46f08aef57  gnupg-2.2.5.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.6.tar.bz2.sig
+sha256 e64d8c5fa2d05938a5080cb784a98ac21be0812f2a26f844b18f0d6a0e711984  gnupg-2.2.6.tar.bz2
 sha256 bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index ba5370902f1e..4d84bfbb9ea8 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.5
+GNUPG2_VERSION = 2.2.6
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
@@ -13,7 +13,7 @@ GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
 
 GNUPG2_CONF_OPTS = \
-	--disable-rpath --disable-regex --disable-doc \
+	--disable-rpath --disable-regex \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
 	--with-libassuan-prefix=$(STAGING_DIR)/usr \
-- 
2.17.0
