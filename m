From: Dagg Stompler <daggs@gmx.com>
Date: Thu,  9 Jun 2016 10:46:44 +0300
Subject: [Buildroot] [PATCH 2/2] enable amcodec if it is set in the config.
	based on the libreelec implementation.
In-Reply-To: <20160609074644.4976-1-daggs@gmx.com>
References: <20160609074644.4976-1-daggs@gmx.com>
Message-ID: <20160609074644.4976-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/kodi/kodi.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index e163c24..d0b2c22 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -56,6 +56,9 @@ endif
 ifeq ($(BR2_PACKAGE_LIBFSLVPUWRAP),y)
 KODI_DEPENDENCIES += libfslvpuwrap
 KODI_CONF_OPTS += --enable-codec=imxvpu
+else ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
+KODI_DEPENDENCIES += libamcodec
+KODI_CONF_OPTS += --enable-codec=amcodec
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-- 
2.8.3
