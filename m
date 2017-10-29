From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 15:45:40 +0100
Subject: [Buildroot] [git commit] package/tvheadend: transcoding depends on
	ffmpeg
Message-ID: <20171029143839.0AD32810D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7826807d10a75e4f8890ea06f8fc1d7a528ed64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit
https://git.buildroot.net/buildroot/commit/package/tvheadend?id=a9a14dc4357d32f705a52a5da73c782576ce6bc8
forgot to add the reverse dependency from ffmpeg.

Fixes
http://autobuild.buildroot.net/results/91a/91a08e63690421a0c197e987af15e91e78afb96f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 56a3b38..2cde51d 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -29,6 +29,7 @@ if BR2_PACKAGE_TVHEADEND
 
 config BR2_PACKAGE_TVHEADEND_TRANSCODING
 	bool "transcoding support"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
 	select BR2_PACKAGE_FFMPEG_GPL # needed for x264 support
