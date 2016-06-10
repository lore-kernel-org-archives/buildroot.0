From: Dagg Stompler <daggs@gmx.com>
Date: Fri, 10 Jun 2016 14:51:51 +0300
Subject: [Buildroot] [PATCH 2/2 v2] kodi: enable optional dependency on
	libamcodec
In-Reply-To: <20160610115151.19226-1-daggs@gmx.com>
References: <20160610115151.19226-1-daggs@gmx.com>
Message-ID: <20160610115151.19226-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is based on what LibreELEC is doing.

v1 -> v2:
 - fixed mail title and comment

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
2.8.4
