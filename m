From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 23:02:12 +0200
Subject: [Buildroot] [git commit] package/mplayer: add optional lame support
Message-ID: <20150408212258.0CF5D80406@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=299fd2e6945e404876a7af0c3469339b4d5b0457
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index ed52adf..dc2dcb6 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -138,6 +138,13 @@ else
 MPLAYER_CONF_OPTS += --disable-faad
 endif
 
+ifeq ($(BR2_PACKAGE_LAME),y)
+MPLAYER_DEPENDENCIES += lame
+MPLAYER_CONF_OPTS += --enable-mp3lame
+else
+MPLAYER_CONF_OPTS += --disable-mp3lame
+endif
+
 # We intentionally don't pass --disable-ass-internal --enable-ass and
 # let autodetection find which library to link with.
 ifeq ($(BR2_PACKAGE_LIBASS),y)
