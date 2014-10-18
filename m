From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Oct 2014 21:44:59 +0200
Subject: [Buildroot] [RFC/PATCH v3 07/11] package/kodi: Enable install to
	STAGING_DIR, needed for audioencoder addons
In-Reply-To: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413661503-5382-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/kodi.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index fc24c4d..57baeed 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -9,6 +9,8 @@ KODI_SOURCE = $(KODI_VERSION).tar.gz
 KODI_SITE = https://github.com/xbmc/xbmc/archive
 KODI_LICENSE = GPLv2
 KODI_LICENSE_FILES = LICENSE.GPL
+# needed for audioencoder addons
+KODI_INSTALL_STAGING = YES
 # Kodi needs host-sdl_image (and therefore host-sdl) for a host tools it builds
 # called TexturePacker. It is responsible to take all the images used in the
 # GUI and pack them in a blob.
-- 
1.7.10.4
