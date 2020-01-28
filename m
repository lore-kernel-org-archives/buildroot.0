From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2020 15:57:57 +0100
Subject: [Buildroot] [git commit] package/kodi-visualisation-goom: needs glm
Message-ID: <20200128144851.58FBA83D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d8979f660cf6a6042e1baae6991dc696c243930
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See CMakeLists.txt:
https://github.com/xbmc/visualization.goom/blob/Leia/CMakeLists.txt#L7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
