From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 22:51:45 +0200
Subject: [Buildroot] [git commit] package/mplayer: add optional ncurses
	support
Message-ID: <20150407205207.C6C2780DE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7220d1f2106edd122f034ac767c1fc81fb2d71d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: don't pass --enable-termcap, and rely on autodetection
instead of forcing -lncurses.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 70a8842..06cddf6 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -45,6 +45,15 @@ else
 MPLAYER_CONF_OPTS += --disable-freetype
 endif
 
+# We intentionally don't pass --enable-termcap, in order to let the
+# autodetection find with which library to link with. Otherwise, we
+# would have to pass it manually.
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+MPLAYER_DEPENDENCIES += ncurses
+else
+MPLAYER_CONF_OPTS += --disable-termcap
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
 MPLAYER_CONF_OPTS +=  \
 	--enable-dvdread \
