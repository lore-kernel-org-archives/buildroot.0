From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 27 Jan 2020 19:54:12 +0100
Subject: [Buildroot] [PATCH 1/2] package/kodi-visualisation-goom: needs glm
Message-ID: <20200127185413.1760-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See CMakeLists.txt:
https://github.com/xbmc/visualization.goom/blob/Leia/CMakeLists.txt#L7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-goom/Config.in                  | 1 +
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-visualisation-goom/Config.in b/package/kodi-visualisation-goom/Config.in
index de4d2ef2ff..065bc1d773 100644
--- a/package/kodi-visualisation-goom/Config.in
+++ b/package/kodi-visualisation-goom/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KODI_VISUALISATION_GOOM
 	bool "kodi-visualisation-goom"
 	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_GLM
 	help
 	  GOOM visualiser for Kodi
 
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 487a520220..d742e00e5a 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -9,6 +9,6 @@ KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISU
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = src/Main.cpp
 
-KODI_VISUALISATION_GOOM_DEPENDENCIES = kodi
+KODI_VISUALISATION_GOOM_DEPENDENCIES = glm kodi
 
 $(eval $(cmake-package))
-- 
2.20.1
