From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 16:22:25 +0200
Subject: [Buildroot] [git commit] package/apache: fix lua detection
Message-ID: <20180401142237.03AE7813E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6087e548007b78ead9cb73bb4d642e3fb5236bd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch suggested by Thomas: Adding a path to --with-lua disables
pkgconf-based detection of lua, which in some cases needs libdl.

This patch removes --with-lua which fixes
http://autobuild.buildroot.net/results/cc1/cc13f4cef9cf6f18615d58f1d83b233812f19fa0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
