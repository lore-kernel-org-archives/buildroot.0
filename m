From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 May 2014 20:17:55 +0200
Subject: [Buildroot] [PATCH 6/8] xbmc: Fix ffmpeg cross compile
In-Reply-To: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
References: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1398968277-9044-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index b1031a9..72eb0e0 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -29,6 +29,7 @@ XBMC_CONF_ENV = \
 	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
 
 XBMC_CONF_OPT +=  \
+	--with-arch=$(BR2_ARCH) \
 	--disable-alsa \
 	--disable-crystalhd \
 	--disable-debug \
-- 
1.7.10.4
