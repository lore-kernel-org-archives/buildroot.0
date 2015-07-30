From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:29:23 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi: Add option for
	lirc support
Message-ID: <20150808105650.690EF7F9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0818a6551fbd4f04478e443ec85d57ac70150f0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/xbmc/xbmc/commit/b641e1eea54b4b9ab7f1b95092ab0a755abc63be

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in |    5 +++++
 package/kodi/kodi.mk   |    6 ++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e8c9244..8dd3794 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -164,6 +164,11 @@ config BR2_PACKAGE_KODI_LIBCEC
 comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV
 
+config BR2_PACKAGE_KODI_LIRC
+	bool "lirc"
+	help
+	  Enable lirc support
+
 config BR2_PACKAGE_KODI_LIBMICROHTTPD
 	bool "web server"
 	select BR2_PACKAGE_LIBMICROHTTPD
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index e5304ab..6399ff1 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -186,6 +186,12 @@ else
 KODI_CONF_OPTS += --disable-libcec
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_LIRC),y)
+KODI_CONF_OPTS += --enable-lirc
+else
+KODI_CONF_OPTS += --disable-lirc
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_WAVPACK),y)
 KODI_DEPENDENCIES += wavpack
 endif
