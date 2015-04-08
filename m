From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:59:49 +0200
Subject: [Buildroot] [git commit] package/mplayer: add optional faad2 support
Message-ID: <20150408212257.C89A580406@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08cead4e89d48fe0d3d2f68bcc9a1235ff97c73f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index c8f4dd3..46bc2b0 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -118,6 +118,13 @@ else
 MPLAYER_CONF_OPTS += --disable-mencoder
 endif
 
+ifeq ($(BR2_PACKAGE_FAAD2),y)
+MPLAYER_DEPENDENCIES += faad2
+MPLAYER_CONF_OPTS += --enable-faad
+else
+MPLAYER_CONF_OPTS += --disable-faad
+endif
+
 # We intentionally don't pass --disable-ass-internal --enable-ass and
 # let autodetection find which library to link with.
 ifeq ($(BR2_PACKAGE_LIBASS),y)
