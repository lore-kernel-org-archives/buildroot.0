From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 10 Mar 2017 21:41:05 +0100
Subject: [Buildroot] [PATCH] shairport-sync: bump to version 3.0
Message-ID: <20170310204105.29179-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for PolarSSL is deprecated and the usage of mbedTLS is
recommended, if not OpenSSL is used as crypto backend.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/shairport-sync/Config.in           | 2 +-
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index c558a64c5..2213a9663 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_SHAIRPORT_SYNC
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_LIBCONFIG
 	select BR2_PACKAGE_LIBDAEMON
-	select BR2_PACKAGE_POLARSSL if !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_MBEDTLS if !BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_POPT
 	help
 	  Shairport Sync emulates an AirPort Express for the purpose of
diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 45bce1016..fb837a4ad 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2e73416ac8fdda1657034afaa143f1710852ebed06e0aa43dafc2b7dc5eb653d  shairport-sync-2.8.6.tar.gz
+sha256  d02697810da0a2c10d3b39e8c9e0795af1e81fff065db1e27514cdb5da696108  shairport-sync-3.0.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 00d6a695b..ab4fdaee2 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.8.6
+SHAIRPORT_SYNC_VERSION = 3.0
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
@@ -36,8 +36,8 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SHAIRPORT_SYNC_DEPENDENCIES += openssl
 SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=openssl
 else
-SHAIRPORT_SYNC_DEPENDENCIES += polarssl
-SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=polarssl
+SHAIRPORT_SYNC_DEPENDENCIES += mbedtls
+SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=mbedtls
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
-- 
2.12.0
