From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:36 +0200
Subject: [Buildroot] [PATCH 03/22] taglib: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-3-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/multimedia/taglib/taglib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/taglib/taglib.mk b/package/multimedia/taglib/taglib.mk
index e5433a4..5b480bb 100644
--- a/package/multimedia/taglib/taglib.mk
+++ b/package/multimedia/taglib/taglib.mk
@@ -14,7 +14,7 @@ TAGLIB_CONF_ENV = \
 	ac_cv_header_cppunit_extensions_HelperMacros_h=no \
 	ac_cv_header_zlib_h=$(if $(BR2_PACKAGE_ZLIB),yes,no)
 
-TAGLIB_CONF_OPT = --disable-libsuffix --program-prefix=''
+TAGLIB_CONF_OPT = --disable-libsuffix
 
 define TAGLIB_REMOVE_DEVFILE
 	rm -f $(TARGET_DIR)/usr/bin/taglib-config
-- 
1.7.2.5
