From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:28 +0200
Subject: [Buildroot] [PATCH/next v2 16/23] package/vlc: add optional
 dependency to libarchive
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-17-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 7ce1f57cd8..d34ab2a9e0 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -41,7 +41,6 @@ VLC_CONF_OPTS += \
 	--disable-a52 \
 	--disable-addonmanagermodules \
 	--disable-aom \
-	--disable-archive \
 	--disable-aribb25 \
 	--disable-aribsub \
 	--disable-asdcp \
@@ -222,6 +221,13 @@ else
 VLC_CONF_OPTS += --disable-opus
 endif
 
+ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
+VLC_CONF_OPTS += --enable-archive
+VLC_DEPENDENCIES += libarchive
+else
+VLC_CONF_OPTS += --disable-archive
+endif
+
 ifeq ($(BR2_PACKAGE_LIBASS),y)
 VLC_CONF_OPTS += --enable-libass
 VLC_DEPENDENCIES += libass
-- 
2.18.0
