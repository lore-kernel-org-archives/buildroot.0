From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 17:40:11 +0100
Subject: [Buildroot] [PATCH 8/8] package/links: add --with/--without-libjpeg
In-Reply-To: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455986411-14273-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/links/links.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index f42f21c..b62889f 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -28,7 +28,10 @@ else
 LINKS_CONF_OPTS += --without-directfb
 endif
 ifeq ($(BR2_PACKAGE_JPEG),y)
+LINKS_CONF_OPTS += --with-libjpeg
 LINKS_DEPENDENCIES += jpeg
+else
+LINKS_CONF_OPTS += --without-libjpeg
 endif
 ifeq ($(BR2_PACKAGE_TIFF),y)
 LINKS_CONF_OPTS += --with-libtiff
-- 
2.7.0
