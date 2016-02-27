From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Feb 2016 16:27:01 +0100
Subject: [Buildroot] [PATCH/next v9 11/28] package/freeswitch: enable
	mod_fsv, add optional dependencies to libvpx & libyuv
In-Reply-To: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456586838-21197-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 7662a94..3925573 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -182,6 +182,11 @@ FREESWITCH_DEPENDENCIES += libyaml
 FREESWITCH_ENABLED_MODULES += languages/mod_yaml
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVPX)$(BR2_PACKAGE_LIBYUV),yy)
+FREESWITCH_DEPENDENCIES += libvpx libyuv
+FREESWITCH_ENABLED_MODULES += applications/mod_fsv
+endif
+
 ifeq ($(BR2_PACKAGE_LUA),y)
 FREESWITCH_DEPENDENCIES += lua
 FREESWITCH_ENABLED_MODULES += languages/mod_lua
-- 
2.7.0
