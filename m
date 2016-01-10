From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2016 21:59:28 +0100
Subject: [Buildroot] [PATCH v5 12/29] package/freeswitch: enable mod_fsv,
	add optional dependencies to libvpx & libyuv
In-Reply-To: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452459585-7085-13-git-send-email-bernd.kuhls@t-online.de>
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
index 9e0d812..23b31c9 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -150,6 +150,11 @@ FREESWITCH_DEPENDENCIES += libyaml
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
2.6.4
