From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 12 Oct 2015 22:39:30 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/tvheadend: add dbus as optional
	dependency
Message-ID: <1444682370-15070-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dbus is an optional dependency for tvheadend:
https://github.com/tvheadend/tvheadend/commit/9c7b6047d2e3040e14cdba89f46d8acb2a36a115

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Added _CONF_OPTS (Thomas)

 package/tvheadend/tvheadend.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 3059805..4ffb357 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -18,6 +18,13 @@ ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
 endif
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+TVHEADEND_DEPENDENCIES += dbus
+TVHEADEND_CONF_OPTS += --enable-dbus-1
+else
+TVHEADEND_CONF_OPTS += --disable-dbus-1
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
 TVHEADEND_DEPENDENCIES += ffmpeg
 TVHEADEND_CONF_OPTS += --enable-libav
-- 
2.6.1
