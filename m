From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 11:34:23 +0200
Subject: [Buildroot] [git commit] mpd: add pulseaudio deps comment,
	stylize libsndfile
Message-ID: <20140710093733.0D9799D1F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e55e674c0b5b1298ed9deae7cd8fccd9d08fa33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/Config.in |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 6f201aa..489b49d 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -50,6 +50,9 @@ config BR2_PACKAGE_MPD_PULSEAUDIO
 	help
 	  Enable pulseaudio output support.
 
+comment "pulseaudio support needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
+
 config BR2_PACKAGE_MPD_BZIP2
 	bool "bzip2"
 	select BR2_PACKAGE_BZIP2
@@ -115,7 +118,7 @@ config BR2_PACKAGE_MPD_LIBSNDFILE
 	  Enable libsndfile input/streaming support.
 	  Select this if you want to play back WAV files.
 
-comment "mpd-libsndfile needs a toolchain w/ largefile"
+comment "libsndfile support needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_MPD_MAD
