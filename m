From: Anatoly Borodin <anatoly.borodin@gmail.com>
Date: Thu, 12 Mar 2020 20:45:17 +0100
Subject: [Buildroot] [PATCH] package/ffmpeg: fix typo "--enable-bsfs" ->
 "--enable-bsf"
Message-ID: <20200312194517.15568-1-anatoly.borodin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix ffmpeg configuration when BR2_PACKAGE_FFMPEG_BSFS is not default ("all"):

	Unknown option "--enable-bsfs=h264_metadata".
	See ./configure --help for available options.
	package/pkg-generic.mk:254: recipe for target '/root/buildroot/output/build/ffmpeg-4.2.2/.stamp_configured' failed

The option is named according to the scheme "--enable-SINGULAR=..." /
"--disable-PLURAL".

The typo is present since the release 2014.02:

https://git.buildroot.net/buildroot/commit/package/ffmpeg/ffmpeg.mk?id=62ab07ef769bd6504fe1db144aaac3fd45db9dad

Signed-off-by: Anatoly Borodin <anatoly.borodin@gmail.com>
---
 package/ffmpeg/ffmpeg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f0047c4e3b13..b7148bbba2dc 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -135,7 +135,7 @@ endif
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_BSFS)),all)
 FFMPEG_CONF_OPTS += --disable-bsfs \
-	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_BSFS)),--enable-bsfs=$(x))
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_BSFS)),--enable-bsf=$(x))
 endif
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_PROTOCOLS)),all)
-- 
2.17.1
