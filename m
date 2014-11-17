From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 17 Nov 2014 10:18:16 +0200
Subject: [Buildroot] [PATCH 3/3] vlc: allow dynamically linking live555
In-Reply-To: <83acc63ec240a462958adbc5bdcfea13758768d5.1416212296.git.baruch@tkos.co.il>
References: <83acc63ec240a462958adbc5bdcfea13758768d5.1416212296.git.baruch@tkos.co.il>
Message-ID: <5411c20c81993fad4a333294c559782915eee169.1416212296.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/vlc/vlc.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index e2c81d6e8959..19f1058dfa47 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -224,9 +224,7 @@ else
 VLC_CONF_OPTS += --disable-libxml2
 endif
 
-# live555 installs a static library only, and vlc tries to link it into a
-# shared library - which doesn't work. So only enable live555 if static.
-ifeq ($(BR2_PACKAGE_LIVE555)$(BR2_PREFER_STATIC_LIB),yy)
+ifeq ($(BR2_PACKAGE_LIVE555),y)
 VLC_CONF_OPTS += --enable-live555
 VLC_DEPENDENCIES += live555
 VLC_CONF_ENV += \
-- 
2.1.3
