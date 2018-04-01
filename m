From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Apr 2018 14:26:40 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/apache: fix lua detection
Message-ID: <20180401122640.1330-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch suggested by Thomas: Adding a path to --with-lua disables
pkgconf-based detection of lua, which in some cases needs libdl.

This patch removes --with-lua which fixes
http://autobuild.buildroot.net/results/cc1/cc13f4cef9cf6f18615d58f1d83b233812f19fa0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: rely on pkgconf (Thomas)

 package/apache/apache.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 3b39be4a40..23414fe44d 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -57,9 +57,7 @@ APACHE_CONF_OPTS += \
 endif
 
 ifeq ($(BR2_PACKAGE_LUA),y)
-APACHE_CONF_OPTS += \
-	--enable-lua \
-	--with-lua=$(STAGING_DIR)/usr
+APACHE_CONF_OPTS += --enable-lua
 APACHE_DEPENDENCIES += lua
 else
 APACHE_CONF_OPTS += --disable-lua
-- 
2.14.2
