From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Apr 2019 22:42:52 +0200
Subject: [Buildroot] [PATCH 3/3] package/linknx: add optional log4cpp
 dependency
In-Reply-To: <20190420204252.26815-1-fontaine.fabrice@gmail.com>
References: <20190420204252.26815-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420204252.26815-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.20.1
