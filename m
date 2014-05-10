From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 May 2014 12:02:43 +0200
Subject: [Buildroot] [PATCH v6 31/32] xbmc: Fix ffmpeg cross compile
In-Reply-To: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
References: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1399716164-6452-32-git-send-email-bernd.kuhls@t-online.de>
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
index 99e78d4..46d969a 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -29,6 +29,7 @@ XBMC_CONF_ENV = \
 	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
 
 XBMC_CONF_OPT +=  \
+	--with-arch=$(BR2_ARCH) \
 	--disable-crystalhd \
 	--disable-debug \
 	--disable-dvdcss \
-- 
1.7.10.4
