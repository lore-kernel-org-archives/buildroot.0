From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Feb 2016 16:27:03 +0100
Subject: [Buildroot] [PATCH/next v9 13/28] package/freeswitch: enable
	mod_vpx, add optional dependency to libvpx
In-Reply-To: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456586838-21197-14-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mod_vpx delivers native support for these video codecs:

codec,VP8 Video,mod_vpx
codec,VP9 Video,mod_vpx

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 51762cf..6f218dd 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -187,6 +187,11 @@ FREESWITCH_DEPENDENCIES += libyaml
 FREESWITCH_ENABLED_MODULES += languages/mod_yaml
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVPX),y)
+FREESWITCH_DEPENDENCIES += libvpx
+FREESWITCH_ENABLED_MODULES += codecs/mod_vpx
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVPX)$(BR2_PACKAGE_LIBYUV),yy)
 FREESWITCH_DEPENDENCIES += libvpx libyuv
 FREESWITCH_ENABLED_MODULES += applications/mod_fsv
-- 
2.7.0
