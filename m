From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 00:31:45 +0200
Subject: [Buildroot] [git commit] libbluray: explicitly enable optional
	enabled features
Message-ID: <20150929223556.CF5DD80168@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d9b4b6431609f86f56cea6396ecf459ef94d12a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbluray/libbluray.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 2e9268e..e62ad48 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -20,18 +20,21 @@ endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 LIBBLURAY_DEPENDENCIES += freetype
+LIBBLURAY_CONF_OPTS += --with-freetype
 else
 LIBBLURAY_CONF_OPTS += --without-freetype
 endif
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 LIBBLURAY_DEPENDENCIES += fontconfig
+LIBBLURAY_CONF_OPTS += --with-fontconfig
 else
 LIBBLURAY_CONF_OPTS += --without-fontconfig
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 LIBBLURAY_DEPENDENCIES += libxml2
+LIBBLURAY_CONF_OPTS += --with-libxml2
 else
 LIBBLURAY_CONF_OPTS += --without-libxml2
 endif
