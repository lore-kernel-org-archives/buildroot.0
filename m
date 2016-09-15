From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 15 Sep 2016 08:39:58 +0200
Subject: [Buildroot] [PATCH v2 3/6] package/upmpdcli: fix missing
	dependencies
In-Reply-To: <20160915064001.8684-1-joerg.krause@embedded.rocks>
References: <20160915064001.8684-1-joerg.krause@embedded.rocks>
Message-ID: <20160915064001.8684-4-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with version 1.2 upmpdcli depends on libmicrohttpd and jsoncpp.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/upmpdcli/Config.in   | 2 ++
 package/upmpdcli/upmpdcli.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index b075d7a..9fb6285 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_UPMPDCLI
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_LIBUPNPP
+	select BR2_PACKAGE_LIBMICROHTTPD
+	select BR2_PACKAGE_JSONCPP
 	help
 	  upmpdcli is a UPnP Media Renderer front-end for MPD, the Music
 	  Player Daemon. It supports UPnP gapless track transitions and
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index a7b98c9..85b78fe 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -8,7 +8,7 @@ UPMPDCLI_VERSION = 1.2.2
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
-UPMPDCLI_DEPENDENCIES = libmpdclient libupnpp
+UPMPDCLI_DEPENDENCIES = libmpdclient libupnpp libmicrohttpd jsoncpp
 
 ifeq ($(BR2_STATIC_LIBS),y)
 # Upmpdcli forgets to take the dependencies of libupnpp into
-- 
2.9.3
