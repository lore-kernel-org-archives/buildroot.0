From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Oct 2017 14:08:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: transcoding depends on
	ffmpeg
Message-ID: <20171029130838.5077-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit
https://git.buildroot.net/buildroot/commit/package/tvheadend?id=a9a14dc4357d32f705a52a5da73c782576ce6bc8
forgot to add the reverse dependency from ffmpeg.

Fixes
http://autobuild.buildroot.net/results/91a/91a08e63690421a0c197e987af15e91e78afb96f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 56a3b385d1..2cde51d88f 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -29,6 +29,7 @@ if BR2_PACKAGE_TVHEADEND
 
 config BR2_PACKAGE_TVHEADEND_TRANSCODING
 	bool "transcoding support"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
 	select BR2_PACKAGE_FFMPEG_GPL # needed for x264 support
-- 
2.11.0
