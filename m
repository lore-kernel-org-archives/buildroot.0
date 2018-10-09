From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  9 Oct 2018 19:25:19 +0200
Subject: [Buildroot] [PATCH 1/1] xerces: don't disable network without curl
Message-ID: <20181009172519.11571-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

curl is not the only network accessor, xerces can also use the socket
API if sys/socket is available.
So replace --disable-network by --disable-netaccessor-curl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xerces/xerces.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index da088d8e1c..d74b1e2d3d 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -34,7 +34,7 @@ ifeq ($(BR2_PACKAGE_LIBCURL),y)
 XERCES_CONF_OPTS += --enable-netaccessor-curl --with-curl=$(STAGING_DIR)/usr/lib
 XERCES_DEPENDENCIES += libcurl
 else
-XERCES_CONF_OPTS += --disable-network
+XERCES_CONF_OPTS += --disable-netaccessor-curl
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.17.1
