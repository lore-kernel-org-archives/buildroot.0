From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 11:34:16 +0200
Subject: [Buildroot] [git commit] mpd: remove redundant depends
Message-ID: <20140710093733.077BD9D1A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d10fa1a5eb1f5301d27b2f4f663a67502fb1cce9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/Config.in |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

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
