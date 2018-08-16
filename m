From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 12:00:26 +0200
Subject: [Buildroot] [git commit branch/next] package/vlc: add optional
 dependency to ncurses
Message-ID: <20180816113141.38651812A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b63c3af947b2a8e8f63ffd52fe2b401b3b227cb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 7e496688b9..ecc5c6cafe 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -355,6 +355,13 @@ else
 VLC_CONF_OPTS += --disable-mpc
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+VLC_CONF_OPTS += --enable-ncurses
+VLC_DEPENDENCIES += ncurses
+else
+VLC_CONF_OPTS += --disable-ncurses
+endif
+
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 VLC_CONF_OPTS += --enable-qt
 VLC_CONF_ENV += \
