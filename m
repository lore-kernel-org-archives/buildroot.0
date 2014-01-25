From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 25 Jan 2014 18:53:14 +0100
Subject: [Buildroot] [PATCH 1/1] libcdio: cdda-player depends on ncurses
Message-ID: <BLU0-SMTP165077B84E7AC3D05661A36D9A00@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/libcdio/libcdio.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index 07cb987..2e3e2cf 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -15,4 +15,10 @@ ifeq ($(BR2_ENABLE_LOCALE),)
 LIBCDIO_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+LIBCDIO_DEPENDENCIES += ncurses
+else
+LIBCDIO_CONF_OPT += --without-cdda-player
+endif
+
 $(eval $(autotools-package))
-- 
1.7.9.5
