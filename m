From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 Oct 2015 22:47:30 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/kodi-pvr-argustv: add jsoncpp
	reverse dependency
Message-ID: <1443732450-2352-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added missing "select BR2_PACKAGE_JSONCPP" (Baruch)

 package/kodi-pvr-argustv/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/kodi-pvr-argustv/Config.in b/package/kodi-pvr-argustv/Config.in
index 698ff46..7c06296 100644
--- a/package/kodi-pvr-argustv/Config.in
+++ b/package/kodi-pvr-argustv/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_KODI_PVR_ARGUSTV
 	bool "kodi-pvr-argustv"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
+	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  Kodi's ARGUS TV client addon
 
 	  https://github.com/kodi-pvr/pvr.argustv
+
+comment "kodi-pvr-argustv needs a toolchain w/ C++, gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-- 
2.5.3
