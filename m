From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Dec 2017 13:18:45 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/vlc: add optional dependency to
 libupnp18
Message-ID: <20171217121845.16351-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream added support for libupnp-1.8:
http://git.videolan.org/?p=vlc/vlc-2.2.git;a=commit;h=825dca78be3a81e2a1c5d04137aa01b1cb32dfd3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: vlc can be used both with libupnp-1.6 and libupnp-1.8 (Thomas)
    For build-testing http://patchwork.ozlabs.org/patch/849606/ was used

 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 30520c3072..febd9e0319 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -288,6 +288,13 @@ else
 VLC_CONF_OPTS += --disable-upnp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUPNP18),y)
+VLC_CONF_OPTS += --enable-upnp
+VLC_DEPENDENCIES += libupnp18
+else
+VLC_CONF_OPTS += --disable-upnp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVNCSERVER),y)
 VLC_CONF_OPTS += --enable-vnc
 VLC_DEPENDENCIES += libvncserver
-- 
2.11.0
