From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Feb 2011 19:51:21 +0100
Subject: [Buildroot] [git commit master 1/1] mpd: fix alsa dependencies
Message-ID: <20110225185212.06DCE8F751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f83024cf074b3b1770a13dc41b3ce8753e3ec445
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Alsa output support needs pcm and mixer support in alsa-lib.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpd/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index 2b3bacf..9404082 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -18,6 +18,8 @@ config BR2_PACKAGE_MPD_ALSA
 	bool "alsa"
 	default y
 	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_PCM
+	select BR2_PACKAGE_ALSA_LIB_MIXER
 	help
 	  Enable alsa output support.
 
-- 
1.7.3.4
