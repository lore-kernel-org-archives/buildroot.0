From: Dagg Stompler <daggs@gmx.com>
Date: Fri, 24 Jun 2016 21:22:56 +0300
Subject: [Buildroot] [PATCH 4/4 v3] kodi: allow enablement of libamcodec as
	codec if selected
In-Reply-To: <20160624182256.11909-1-daggs@gmx.com>
References: <20160624182256.11909-1-daggs@gmx.com>
Message-ID: <20160624182256.11909-4-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ported from libreelec

v2 -> v3:
 - fix change after kodi.mk was changed.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/kodi/kodi.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 90c50c3..d426d12 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -56,6 +56,9 @@ endif
 ifeq ($(BR2_PACKAGE_IMX_VPUWRAP),y)
 KODI_DEPENDENCIES += imx-vpuwrap
 KODI_CONF_OPTS += --enable-codec=imxvpu
+else ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
+KODI_DEPENDENCIES += libamcodec
+KODI_CONF_OPTS += --enable-codec=amcodec
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-- 
2.9.0
