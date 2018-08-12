From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:15 +0200
Subject: [Buildroot] [PATCH/next v2 03/23] package/vlc: add optional
 dependency to x264
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 5e5230edc9..bc20e2946e 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -409,6 +409,13 @@ else
 VLC_CONF_OPTS += --disable-udev
 endif
 
+ifeq ($(BR2_PACKAGE_X264),y)
+VLC_CONF_OPTS += --enable-x264
+VLC_DEPENDENCIES += x264
+else
+VLC_CONF_OPTS += --disable-x264
+endif
+
 ifeq ($(BR2_PACKAGE_XCB_UTIL_KEYSYMS),y)
 VLC_CONF_OPTS += --enable-xcb
 VLC_DEPENDENCIES += xcb-util-keysyms
-- 
2.18.0
