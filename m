From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 21 Aug 2016 23:36:48 +0200
Subject: [Buildroot] [PATCH 1/2] package/trousers: needs host-pkgconf
Message-ID: <1471815409-25953-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise the build fail with this error:
configure.in:53: error: possibly undefined macro: AC_MSG_ERROR
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.in:95: error: possibly undefined macro: AM_CONDITIONAL

Also, there is a PKG_CHECK_MODULES used for GTK.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/trousers/trousers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
index be6ce39..3d9e0ba 100644
--- a/package/trousers/trousers.mk
+++ b/package/trousers/trousers.mk
@@ -12,7 +12,7 @@ TROUSERS_LICENSE_FILES = LICENSE
 TROUSERS_INSTALL_STAGING = YES
 # Need autoreconf because of a patch touching configure.in and Makefile.am
 TROUSERS_AUTORECONF = YES
-TROUSERS_DEPENDENCIES = openssl
+TROUSERS_DEPENDENCIES = host-pkgconf openssl
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TROUSERS_DEPENDENCIES += libiconv
-- 
2.5.5
