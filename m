From: =?UTF-8?q?DUPONCHEEL=20S=C3=A9bastien?= <sebastien.duponcheel@corp.ovh.com>
Date: Fri, 30 Nov 2018 17:39:43 +0100
Subject: [Buildroot] [PATCH next 1/1] package/shadowsocks-libev: bump to
 version 3.2.3
Message-ID: <1543595983-25420-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: DUPONCHEEL S?bastien <sebastien.duponcheel@corp.ovh.com>
---
 package/shadowsocks-libev/Config.in              | 2 +-
 package/shadowsocks-libev/shadowsocks-libev.hash | 2 +-
 package/shadowsocks-libev/shadowsocks-libev.mk   | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index 5ad79ad..fefb27b 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	  https://github.com/shadowsocks/shadowsocks-libev
 
 config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
-	bool "conmarktos support in ss-server"
+	bool "connmarktos support in ss-server"
 	depends on BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	help
diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/package/shadowsocks-libev/shadowsocks-libev.hash
index 00b1122..a7c0dc0 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.hash
+++ b/package/shadowsocks-libev/shadowsocks-libev.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 988fc151474d0d2fb7a6005621949656e7a7f79400b4514624e09fd4b22969f6 shadowsocks-libev-3.2.1.tar.gz
+sha256 2befc27b1cc62af0450702343d17e347936f0d4e3d4b04ba9246c4f9b409b742 shadowsocks-libev-3.2.3.tar.gz
 
 # License files, locally calculated
 sha256 736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index 368cb24..e8ca161 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOWSOCKS_LIBEV_VERSION = 3.2.1
+SHADOWSOCKS_LIBEV_VERSION = 3.2.3
 SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
 SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
 SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING
@@ -14,10 +14,11 @@ SHADOWSOCKS_LIBEV_CONF_OPTS = \
 	--with-pcre=$(STAGING_DIR)/usr \
 	--disable-ssp
 
-# --disable option was broken in 3.2.1, it will be fixed in 3.2.2
 ifeq ($(BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS),y)
 SHADOWSOCKS_LIBEV_DEPENDENCIES += libnetfilter_conntrack
 SHADOWSOCKS_LIBEV_CONF_OPTS += --enable-connmarktos
+else
+SHADOWSOCKS_LIBEV_CONF_OPTS += --disable-connmarktos
 endif
 
 $(eval $(autotools-package))
-- 
2.7.4
