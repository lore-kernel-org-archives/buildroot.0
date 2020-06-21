From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:37:46 +0200
Subject: [Buildroot] [PATCH 03/23] package/kodi-inputstream-adaptive: add
 explicit dependency to expat
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Expat is built as a hard-dependency of Kodi already. For the case that
Kodi drops this dependency we need to make sure that this package still
finds its dependencies:
https://github.com/peak3d/inputstream.adaptive/blob/Leia/CMakeLists.txt#L61

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-inputstream-adaptive/Config.in                    | 1 +
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
index f9ba20adcf..90e9a85dd8 100644
--- a/package/kodi-inputstream-adaptive/Config.in
+++ b/package/kodi-inputstream-adaptive/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE
 	# wvdecrypter/cdm/build/build_config.h
 	depends on BR2_aarch64 || BR2_arm || BR2_i386 || BR2_mipsel \
 		|| BR2_mips64el || BR2_x86_64
+	select BR2_PACKAGE_EXPAT
 	help
 	  Kodi inputstream addon for several manifest types
 
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 643d608640..ef382151ff 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -8,6 +8,6 @@ KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.4.5-Leia
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
-KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = kodi
+KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = expat kodi
 
 $(eval $(cmake-package))
-- 
2.26.2
