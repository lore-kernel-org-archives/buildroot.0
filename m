From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 15 Apr 2021 08:52:46 +0200
Subject: [Buildroot] [PATCH 5/5] package/x11r7/xserver_xorg-server: remove
 unused configure option --disable-xsdl
In-Reply-To: <20210415065246.276882-1-bernd.kuhls@t-online.de>
References: <20210415065246.276882-1-bernd.kuhls@t-online.de>
Message-ID: <20210415065246.276882-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed this configure option:
https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?h=server-1.20-branch&id=52bc6d944946e66ea2cc685feaeea40bb496ea83

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 0ac34a63b5..ae17dd535e 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -91,8 +91,7 @@ ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE),y)
 XSERVER_XORG_SERVER_CONF_OPTS += \
 	--enable-kdrive \
 	--disable-glx \
-	--disable-dri \
-	--disable-xsdl
+	--disable-dri
 
 else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive
-- 
2.29.2
