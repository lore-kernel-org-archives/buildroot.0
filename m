From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jun 2018 12:10:23 +0200
Subject: [Buildroot] [PATCH 1/2] package/speex: use pkgconf to detect libogg
Message-ID: <20180610101024.5035-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed with-ogg-* configure options and switched to pkgconf
to detect libogg back in 2014:
https://git.xiph.org/?p=speex.git;a=commitdiff;h=e1b1eeabce815283c5bbc42016a9d6a11eda2866

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/speex/speex.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 3c188b631e..516e89929a 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -8,12 +8,9 @@ SPEEX_VERSION = 1.2rc1
 SPEEX_SITE = http://downloads.us.xiph.org/releases/speex
 SPEEX_LICENSE = BSD-3-Clause
 SPEEX_LICENSE_FILES = COPYING
-
 SPEEX_INSTALL_STAGING = YES
-SPEEX_DEPENDENCIES = libogg
+SPEEX_DEPENDENCIES = host-pkgconf libogg
 SPEEX_CONF_OPTS = \
-	--with-ogg-libraries=$(STAGING_DIR)/usr/lib \
-	--with-ogg-includes=$(STAGING_DIR)/usr/include \
 	--enable-fixed-point
 
 ifeq ($(BR2_PACKAGE_SPEEX_ARM4),y)
-- 
2.17.1
