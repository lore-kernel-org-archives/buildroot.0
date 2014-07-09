From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Jul 2014 14:20:54 -0300
Subject: [Buildroot] [PATCH 2/2] mpd: add pulseaudio deps comment,
	stylize libsndfile
In-Reply-To: <1404926454-3860-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404926454-3860-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404926454-3860-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpd/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

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
-- 
1.8.5.5
