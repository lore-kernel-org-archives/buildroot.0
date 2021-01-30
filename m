From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Jan 2021 12:26:46 +0100
Subject: [Buildroot] [PATCH 1/2] package/mpd: disable documentation
Message-ID: <20210130112647.1835553-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable documentation which is enabled by default since version 0.22 and
https://github.com/MusicPlayerDaemon/MPD/commit/2e73e605f78d2e6488e34465a8bfa9e4989a057f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd/mpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index f7a3347b84..76b3a1fa56 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -11,6 +11,7 @@ MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
 MPD_LICENSE = GPL-2.0+
 MPD_LICENSE_FILES = COPYING
+MPD_CONF_OPTS = -Ddocumentation=disabled
 
 ifeq ($(BR2_USE_MMU),y)
 MPD_CONF_OPTS += \
-- 
2.29.2
