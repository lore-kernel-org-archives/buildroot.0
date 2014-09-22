From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 22 Sep 2014 17:17:15 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: Enable armv6 support for
	Cortex cores
Message-ID: <1411399036-11888-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/cda/cdad51f610c339d2ad4c7d09c282cfb4b10770a0/
http://autobuild.buildroot.net/results/cd5/cd53af973d9722481c3298f484b399c9a2c286cf/
http://autobuild.buildroot.net/results/a9a/a9a2c49d923fd891945a24c9d0d147b3eea9b037/
http://autobuild.buildroot.net/results/d2f/d2f51632aea5727df9404e611e8e379567f03b61/
http://autobuild.buildroot.net/results/a62/a622dd113dcb7b352bcfebe3b3c7ac6ed286d7c7/
http://autobuild.buildroot.net/results/2ea/2eace18d0d32b4cbb6120b06d2bbe79d2b9857a7/
http://autobuild.buildroot.net/results/caa/caad4172db90879db51b66625b98aa0805e39c73/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index c6f305a..e429b35 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -265,7 +265,7 @@ endif
 ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
 FFMPEG_CONF_OPT += --disable-armv5te
 endif
-ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
+ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
 FFMPEG_CONF_OPT += --enable-armv6
 else
 FFMPEG_CONF_OPT += --disable-armv6 --disable-armv6t2
-- 
1.7.10.4
