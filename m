From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Jul 2014 14:20:53 -0300
Subject: [Buildroot] [PATCH 1/2] mpd: remove redundant depends
Message-ID: <1404926454-3860-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpd/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 1bf7ad1..6f201aa 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -27,7 +27,6 @@ config BR2_PACKAGE_MPD_ALSA
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	select BR2_PACKAGE_ALSA_LIB_MIXER
-	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	help
 	  Enable alsa output support.
 
@@ -46,9 +45,7 @@ config BR2_PACKAGE_MPD_AUDIOFILE
 
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
-	depends on BR2_USE_MMU # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  Enable pulseaudio output support.
-- 
1.8.5.5
