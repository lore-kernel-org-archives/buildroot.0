From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 17:16:54 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: re-enable for mips64r2 and
	mips64r6
Message-ID: <20160902142940.8CE758253D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02f749b5b2f4532c5b2daed539b4b5634b28a260
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ffmpeg 3 fixed support for mips64r2 and mips64r6, for details see
http://patchwork.ozlabs.org/patch/626756/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 096ff95..6b7a6e7 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	bool
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
-	# ffmpeg's configure script only supports mips64 (r1) variant
-	default y if !BR2_nios2 && !BR2_mips_64r2 && !BR2_mips_64r6
+	default y if !BR2_nios2
 
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
