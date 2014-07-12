From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jul 2014 20:47:38 +0200
Subject: [Buildroot] [git commit] libgpgme: disable all tests
Message-ID: <20140712184744.ECD689D211@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30252ae893298bf3f190b57d33c545e0e46c40db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable all of the tests, including runtime that needs gnupg.
There's no longer --without configure options for them, it's now
--disable. Fixes:
http://autobuild.buildroot.net/results/eb1/eb1e06b1d99c441b6086c07ee04b084a61041dc7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgpgme/libgpgme.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

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
