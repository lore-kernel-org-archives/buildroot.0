From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:03 -0000
Subject: [Buildroot] [git commit] package/vlc: add optional dependency to
 pulseaudio
Message-ID: <20180907111511.423157FB4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f892cad80b5de6cddbcef754c2d17302eca04bf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 14fe3b7861..b90fd602d3 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -362,6 +362,13 @@ else
 VLC_CONF_OPTS += --disable-ncurses
 endif
 
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+VLC_CONF_OPTS += --enable-pulse
+VLC_DEPENDENCIES += pulseaudio
+else
+VLC_CONF_OPTS += --disable-pulse
+endif
+
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 VLC_CONF_OPTS += --enable-qt
 VLC_CONF_ENV += \
