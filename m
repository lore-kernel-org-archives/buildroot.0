From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] taglib: remove --program-prefix
Message-ID: <20110912052632.50D358D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4c5d599d9f509452b02b5e77db216a08fb222a90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
