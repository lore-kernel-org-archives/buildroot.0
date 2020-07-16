From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 16 Jul 2020 21:36:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvncserver: disable gtk example
Message-ID: <20200716193610.1924967-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gtkvncviewer has been added since version 0.9.13 and
https://github.com/LibVNC/libvncserver/commit/2650cfc17bb7718e42bfff8510c15f011eda1b1f,
disable it as it is only an example

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvncserver/libvncserver.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 96dd51299c..23ab40b7eb 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -16,6 +16,7 @@ LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
 # only used for examples
 LIBVNCSERVER_CONF_OPTS += \
 	-DWITH_FFMPEG=OFF \
+	-DWITH_GTK=OFF \
 	-DWITH_SDL=OFF
 
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.27.0
