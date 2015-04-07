From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 23:12:15 +0200
Subject: [Buildroot] [git commit] package/mplayer: add optional fontconfig
	support
Message-ID: <20150407212927.A49D57FF84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11d2bf0bb651593a010f9c0f88d4481483ab4616
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: rely on autodetection.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index b685a38..7a88b74 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -45,6 +45,14 @@ else
 MPLAYER_CONF_OPTS += --disable-freetype
 endif
 
+# We intentionally don't pass --enable-fontconfig, to let the
+# autodetection find which library to link with.
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+MPLAYER_DEPENDENCIES += fontconfig
+else
+MPLAYER_CONF_OPTS += --disable-fontconfig
+endif
+
 # We intentionally don't pass --enable-termcap, in order to let the
 # autodetection find with which library to link with. Otherwise, we
 # would have to pass it manually.
