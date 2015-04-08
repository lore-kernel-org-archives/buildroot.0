From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 23:15:50 +0200
Subject: [Buildroot] [git commit] package/mplayer: add optional libmpeg2
	support
Message-ID: <20150408212258.155A680406@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64453db466da123673ad3d63257a7e8713167ca6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index dc2dcb6..55cf421 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -151,6 +151,13 @@ ifeq ($(BR2_PACKAGE_LIBASS),y)
 MPLAYER_DEPENDENCIES += libass
 endif
 
+# We intentionally don't pass --enable-libmpeg2 and let autodetection
+# find which library to link with.
+ifeq ($(BR2_PACKAGE_LIBMPEG2),y)
+MPLAYER_DEPENDENCIES += libmpeg2
+MPLAYER_CONF_OPTS += --disable-libmpeg2-internal
+endif
+
 ifeq ($(BR2_PACKAGE_TREMOR),y)
 MPLAYER_DEPENDENCIES += tremor
 MPLAYER_CONF_OPTS += --disable-tremor-internal --enable-tremor
