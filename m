From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 Aug 2016 17:03:38 +0200
Subject: [Buildroot] [PATCH/next v5 3/6] package/ffmpeg: re-enable for
	mips64r2 and mips64r6
In-Reply-To: <1471273421-12076-1-git-send-email-bernd.kuhls@t-online.de>
References: <1471273421-12076-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1471273421-12076-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ffmpeg 3 fixed support for mips64r2 and mips64r6, for details see
http://patchwork.ozlabs.org/patch/626756/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v5: no changes
v4: no changes
v3: no changes
v2: no changes

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
-- 
2.8.1
