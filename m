From: Stijn Souffriau <stijn.souffriau@essensium.com>
Date: Wed,  9 May 2012 23:29:46 +0200
Subject: [Buildroot] [PATCH 5/5] Added host targets to gnupg and its
	prerequisite libraries.
In-Reply-To: <1336598986-9518-1-git-send-email-stijn.souffriau@essensium.com>
References: <1336598986-9518-1-git-send-email-stijn.souffriau@essensium.com>
Message-ID: <1336598986-9518-5-git-send-email-stijn.souffriau@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/gnupg/gnupg.mk               |   11 +++++++++++
 package/libassuan/libassuan.mk       |    5 +++++
 package/libgcrypt/libgcrypt.mk       |    1 +
 package/libgpg-error/libgpg-error.mk |    1 +
 package/libksba/libksba.mk           |    5 +++++
 package/libpth/libpth.mk             |    5 +++++
 6 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index a9cdf38..0a6c99f 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -20,4 +20,15 @@ GNUPG_CONF_OPT = \
 	--with-zlib=$(STAGING_DIR)/usr/lib \
 	--with-libiconv-prefix=$(STAGING_DIR)/usr
 
+HOST_GNUPG_CONF_OPT = \
+	--disable-optimization \
+	--with-gpg-error-prefix=$(HOST_DIR)/usr \
+	--with-libgcrypt-prefix=$(HOST_DIR)/usr \
+	--with-libassuan-prefix=$(HOST_DIR)/usr \
+	--with-ksba-prefix=$(HOST_DIR)/usr \
+	--with-pth-prefix=$(HOST_DIR)/usr \
+	--with-zlib=$(HOST_DIR)/usr/lib \
+	--with-libiconv-prefix=$(HOST_DIR)/usr
+
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index d2a018a..a94e601 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -13,6 +13,11 @@ LIBASSUAN_CONF_OPT = \
 	--disable-optimization \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
+HOST_LIBASSUAN_CONF_OPT = \
+	--disable-optimization \
+	--with-gpg-error-prefix=$(HOST_DIR)/usr
+
 LIBASSUAN_DEPENDENCIES = libgpg-error
 
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 68c6c47..55606fe 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -18,3 +18,4 @@ LIBGCRYPT_CONF_OPT = \
 LIBGCRYPT_DEPENDENCIES = libgpg-error
 
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 1b78b17..2aa1da3 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -9,3 +9,4 @@ LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
 LIBGPG_ERROR_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index bebd352..d33b149 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -13,4 +13,9 @@ LIBKSBA_CONF_OPT = \
 	--disable-optimization \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
+HOST_LIBKSBA_CONF_OPT = \
+	--disable-optimization \
+	--with-gpg-error-prefix=$(HOST_DIR)/usr
+
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/libpth/libpth.mk b/package/libpth/libpth.mk
index 07c5c61..4fb7494 100644
--- a/package/libpth/libpth.mk
+++ b/package/libpth/libpth.mk
@@ -12,4 +12,9 @@ LIBPTH_INSTALL_STAGING = YES
 LIBPTH_CONF_OPT = \
 	--disable-optimization
 
+HOST_LIBPTH_CONF_OPT = \
+	--disable-optimization
+
+
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.0.4
