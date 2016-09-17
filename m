From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 13:34:46 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: fix missing dependencies
Message-ID: <20160917114306.5A92781908@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf51bff13802b2802aa580e5723880b322b95e86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with version 1.2 upmpdcli depends on libmicrohttpd and jsoncpp.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upmpdcli/Config.in   | 4 +++-
 package/upmpdcli/upmpdcli.mk | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index b075d7a..4872034 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -2,8 +2,10 @@ config BR2_PACKAGE_UPMPDCLI
 	bool "upmpdcli"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp -> libupnp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp, libmicrohttpd
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_LIBMICROHTTPD
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_LIBUPNPP
 	help
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
