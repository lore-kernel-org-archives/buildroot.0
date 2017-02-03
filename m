From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Feb 2017 17:20:17 +0100
Subject: [Buildroot] [PATCH v2 23/38] package/kodi-pvr-mediaportal-tvserver:
	needs locale support
In-Reply-To: <20170203162032.2923-1-bernd.kuhls@t-online.de>
References: <20170203162032.2923-1-bernd.kuhls@t-online.de>
Message-ID: <20170203162032.2923-24-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-mediaportal-tvserver/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kodi-pvr-mediaportal-tvserver/Config.in b/package/kodi-pvr-mediaportal-tvserver/Config.in
index 733ca8859..d63ad882e 100644
--- a/package/kodi-pvr-mediaportal-tvserver/Config.in
+++ b/package/kodi-pvr-mediaportal-tvserver/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_KODI_PVR_MEDIAPORTAL_TVSERVER
 	bool "kodi-pvr-mediaportal-tvserver"
+	depends on BR2_ENABLE_LOCALE # for included live555
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  MediaPortal TVServer PVR client addon for Kodi
 
 	  https://github.com/kodi-pvr/pvr.mediaportal.tvserver
+
+comment "kodi-pvr-mediaportal-tvserver needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
-- 
2.11.0
