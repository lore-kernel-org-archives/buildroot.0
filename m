From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 20:17:09 +0200
Subject: [Buildroot] [git commit] package/apache: add optional support for
 lua
Message-ID: <20180331181716.297688405A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be796657cb921d33a7ef8debbd042e5f9fed5b8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apache/apache.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index eaf7b9c5bf..3b39be4a40 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -40,7 +40,6 @@ APACHE_CONF_OPTS = \
 	--without-suexec-bin \
 	--enable-mods-shared=all \
 	--with-mpm=$(APACHE_MPM) \
-	--disable-lua \
 	--disable-luajit
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
@@ -57,6 +56,15 @@ APACHE_CONF_OPTS += \
 	--disable-proxy-html
 endif
 
+ifeq ($(BR2_PACKAGE_LUA),y)
+APACHE_CONF_OPTS += \
+	--enable-lua \
+	--with-lua=$(STAGING_DIR)/usr
+APACHE_DEPENDENCIES += lua
+else
+APACHE_CONF_OPTS += --disable-lua
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 APACHE_DEPENDENCIES += openssl
 APACHE_CONF_OPTS += \
