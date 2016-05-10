From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 May 2016 20:40:20 +0200
Subject: [Buildroot] [PATCH 3/6] package/kodi-screensaver-asterwave: needs
	libglu
In-Reply-To: <1462905623-17739-1-git-send-email-bernd.kuhls@t-online.de>
References: <1462905623-17739-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1462905623-17739-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes

/home/bernd/buildroot/output/build/kodi-screensaver-asterwave-0dc2c48dadb100954eef823e7e3a5f502ce65b1e/src/Water.cpp:25:20:
 fatal error: GL/glu.h: No such file or directory

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-asterwave/Config.in                     | 1 +
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-screensaver-asterwave/Config.in b/package/kodi-screensaver-asterwave/Config.in
index 5e929ca..05ce58a 100644
--- a/package/kodi-screensaver-asterwave/Config.in
+++ b/package/kodi-screensaver-asterwave/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_ASTERWAVE
 	bool "kodi-screensaver-asterwave"
 	depends on BR2_PACKAGE_KODI_GL # libsoil
+	select BR2_PACKAGE_LIBGLU
 	select BR2_PACKAGE_LIBSOIL
 	help
 	  AsterWave screensaver for Kodi
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index 1cb74f3..7c718cc 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -6,6 +6,6 @@
 
 KODI_SCREENSAVER_ASTERWAVE_VERSION = 0dc2c48dadb100954eef823e7e3a5f502ce65b1e
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,notspiff,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
-KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = kodi libsoil
+KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = kodi libglu libsoil
 
 $(eval $(cmake-package))
-- 
2.8.1
