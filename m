From: Dagg <daggs@gmx.com>
Date: Wed,  1 Jun 2016 13:27:20 +0300
Subject: [Buildroot] [PATCH 3/3] allow kodi to select libamlogic if set
In-Reply-To: <20160601102720.3929-1-daggs@gmx.com>
References: <20160601102720.3929-1-daggs@gmx.com>
Message-ID: <20160601102720.3929-3-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this change is  based on the libreelec implementation

Signed-off-by: Dagg <daggs@gmx.com>
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
