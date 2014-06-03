From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jun 2014 23:50:33 +0200
Subject: [Buildroot] [git commit] mpd: add optional avahi support
Message-ID: <20140603223417.4D3BD9C3C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12b674148a473e19361c9c1d2a75091b96bc137b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 0e8a510..2f0b37e 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -13,6 +13,11 @@ MPD_LICENSE = GPLv2+
 MPD_LICENSE_FILES = COPYING
 
 # Some options need an explicit --disable or --enable
+ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
+MPD_DEPENDENCIES += avahi
+else
+MPD_CONF_OPT += --with-zeroconf=no
+endif
 
 ifeq ($(BR2_PACKAGE_MPD_ALSA),y)
 MPD_DEPENDENCIES += alsa-lib
