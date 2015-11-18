From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 22:22:31 +0100
Subject: [Buildroot] [git commit] package/mplayer: Fix linking with
	libvorbis/libdvdread
Message-ID: <20151118212235.CA50581E68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2619ccbb948c6c7c383e95607e82eb1c304992d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/7f6/7f6e5396e95a3c3b676ca59bedc5317aa88e5f4c/
http://autobuild.buildroot.net/results/6ac/6acd9cf25c3088d313247510db47a214fff30c67/
http://autobuild.buildroot.net/results/a0d/a0da41bb734dbcdb17e13d852cfbdba5e069429e/
http://autobuild.buildroot.net/results/d0c/d0caf60c1ddf4e05086c93f646e32b5ddc75b6ce/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 99fc469..ad2d9dd 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -117,9 +117,10 @@ endif
 # https://github.com/pld-linux/mplayer/blob/master/mplayer-libcdio.patch
 MPLAYER_CONF_OPTS += --disable-libcdio
 
+# We intentionally don't pass --enable-dvdread, to let the
+# autodetection find which library to link with.
 ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
 MPLAYER_CONF_OPTS +=  \
-	--enable-dvdread \
 	--with-dvdread-config=$(STAGING_DIR)/usr/bin/dvdread-config
 MPLAYER_DEPENDENCIES += libdvdread
 endif
@@ -175,9 +176,10 @@ MPLAYER_DEPENDENCIES += tremor
 MPLAYER_CONF_OPTS += --enable-tremor
 endif
 
+# We intentionally don't pass --enable-libvorbis, to let the
+# autodetection find which library to link with.
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
 MPLAYER_DEPENDENCIES += libvorbis
-MPLAYER_CONF_OPTS += --enable-libvorbis
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMAD),y)
