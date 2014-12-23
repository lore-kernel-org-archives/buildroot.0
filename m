From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 Dec 2014 18:46:37 +0100
Subject: [Buildroot] [PATCH v9 14/18] package/kodi: Enable install to
	STAGING_DIR, needed for audioencoder addons
In-Reply-To: <1419356801-31525-1-git-send-email-bernd.kuhls@t-online.de>
References: <1419356801-31525-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1419356801-31525-15-git-send-email-bernd.kuhls@t-online.de>
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
index cd1f2fb..8a52433 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -8,6 +8,8 @@ KODI_VERSION = 14.0-Helix
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPLv2
 KODI_LICENSE_FILES = LICENSE.GPL
+# needed for audioencoder addons
+KODI_INSTALL_STAGING = YES
 # Kodi needs host-sdl_image (and therefore host-sdl) for a host tools it builds
 # called TexturePacker. It is responsible to take all the images used in the
 # GUI and pack them in a blob.
-- 
1.7.10.4
