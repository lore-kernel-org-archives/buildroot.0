From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 12 Jul 2014 10:08:01 -0300
Subject: [Buildroot] [PATCH] libgpgme: disable all tests
Message-ID: <1405170481-18028-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable all of the tests, including runtime that needs gnupg.
There's no longer --without configure options for them, it's now
--disable. Fixes:
http://autobuild.buildroot.net/results/eb1/eb1e06b1d99c441b6086c07ee04b084a61041dc7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgpgme/libgpgme.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index c06d713..43d7484 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -16,9 +16,10 @@ LIBGPGME_DEPENDENCIES = libassuan libgpg-error
 LIBGPGME_CONF_OPT = --with-gpg=/usr/bin/gpg \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr \
 	--with-libassuan-prefix=$(STAGING_DIR)/usr \
-	--without-gpgsm \
-	--without-gpgconf \
-	--without-g13
+	--disable-gpgsm-test \
+	--disable-gpgconf-test \
+	--disable-g13-test \
+	--disable-gpg-test
 
 # Handle argp-standalone or it errors out during build
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
-- 
1.8.5.5
