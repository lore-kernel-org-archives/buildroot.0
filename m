From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 16:02:49 +0200
Subject: [Buildroot] [git commit] package/kodi-screensaver-asterwave: needs
	libglu
Message-ID: <20160511140632.5A0567F9D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7e4eb68e0542987df947db8497bea1fb8651a41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes

/home/bernd/buildroot/output/build/kodi-screensaver-asterwave-0dc2c48dadb100954eef823e7e3a5f502ce65b1e/src/Water.cpp:25:20:
 fatal error: GL/glu.h: No such file or directory

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
