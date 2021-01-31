From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:58:10 +0100
Subject: [Buildroot] [git commit] package/mpd: disable documentation
Message-ID: <20210131203802.D5D0F81542@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34c948bc60e197eb0a8741dac87ad0932f07296e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable documentation which is enabled by default since version 0.22 and
https://github.com/MusicPlayerDaemon/MPD/commit/2e73e605f78d2e6488e34465a8bfa9e4989a057f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/mpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 3936dfd656..75d1c6edee 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -11,6 +11,7 @@ MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
 MPD_LICENSE = GPL-2.0+
 MPD_LICENSE_FILES = COPYING
+MPD_CONF_OPTS = -Ddocumentation=disabled
 
 # Zeroconf support depends on libdns_sd from avahi.
 ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
