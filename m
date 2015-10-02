From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  2 Oct 2015 18:31:37 +0200
Subject: [Buildroot] [PATCH v3 4/4] package/kodi-pvr-pctv: add jsoncpp
	reverse dependency
In-Reply-To: <1443803497-9936-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443803497-9936-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1443803497-9936-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: removed reference to c++ from comment (Baruch)
v2: skipped

 package/kodi-pvr-pctv/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kodi-pvr-pctv/Config.in b/package/kodi-pvr-pctv/Config.in
index 255cd4a..1bef551 100644
--- a/package/kodi-pvr-pctv/Config.in
+++ b/package/kodi-pvr-pctv/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_KODI_PVR_PCTV
 	bool "kodi-pvr-pctv"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  PCTV PVR client addon for Kodi
 
 	  https://github.com/kodi-pvr/pvr.vdr.vnsi
+
+comment "kodi-pvr-pctv needs a toolchain w/ gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-- 
2.5.3
