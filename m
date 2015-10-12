From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:44:20 +0200
Subject: [Buildroot] [git commit] package/tvheadend: add dbus as optional
	dependency
Message-ID: <20151012214430.BBB9181DCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea565bf88ebe9e3888264d9d0115c034c1226d9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dbus is an optional dependency for tvheadend:
https://github.com/tvheadend/tvheadend/commit/9c7b6047d2e3040e14cdba89f46d8acb2a36a115

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 3059805..4ffb357 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -18,6 +18,13 @@ ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
 endif
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+TVHEADEND_DEPENDENCIES += dbus
+TVHEADEND_CONF_OPTS += --enable-dbus-1
+else
+TVHEADEND_CONF_OPTS += --disable-dbus-1
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
 TVHEADEND_DEPENDENCIES += ffmpeg
 TVHEADEND_CONF_OPTS += --enable-libav
