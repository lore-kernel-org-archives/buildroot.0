From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 12:07:22 +0200
Subject: [Buildroot] [git commit] package/linknx: add optional log4cpp
 dependency
Message-ID: <20190421101111.9AC81814C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30e918133c3def291962f7f0b6b63aabe3620ba9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linknx/linknx.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index e593feda36..15d4b5a109 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -13,7 +13,6 @@ LINKNX_INSTALL_STAGING = YES
 LINKNX_AUTORECONF = YES
 LINKNX_CONF_OPTS = \
 	--without-cppunit \
-	--without-log4cpp \
 	--without-pth-test \
 	--with-pth=$(STAGING_DIR)/usr \
 	--disable-smtp
@@ -29,6 +28,13 @@ else
 LINKNX_CONF_OPTS += --without-libcurl
 endif
 
+ifeq ($(BR2_PACKAGE_LOG4CPP),y)
+LINKNX_CONF_OPTS += --with-log4cpp
+LINKNX_DEPENDENCIES += host-pkgconf log4cpp
+else
+LINKNX_CONF_OPTS += --without-log4cpp
+endif
+
 ifeq ($(BR2_PACKAGE_LUA),y)
 LINKNX_CONF_OPTS += --with-lua
 LINKNX_DEPENDENCIES += lua
