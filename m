From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 20:20:51 +0200
Subject: [Buildroot] [git commit] Remove unsupported libcue from package mpd
Message-ID: <20140731182239.9CFB79D32D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bff0fa1beb09afec489758cacc886043c515914
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for libcue has been removed for mpd since version 0.17.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in |    6 ------
 package/mpd/mpd.mk    |    6 ------
 2 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index e09be0b..f5f5b34 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -96,12 +96,6 @@ config BR2_PACKAGE_MPD_LAME
 	help
 	  Enable lame (mp3) encoding support.
 
-config BR2_PACKAGE_MPD_LIBCUE
-	bool "libcue"
-	select BR2_PACKAGE_LIBCUE
-	help
-	  Enable cue file support.
-
 config BR2_PACKAGE_MPD_LIBSAMPLERATE
 	bool "libsamplerate"
 	select BR2_PACKAGE_LIBSAMPLERATE
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 7cad806..e2ee760 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -69,12 +69,6 @@ else
 MPD_CONF_OPT += --disable-lame-encoder
 endif
 
-ifeq ($(BR2_PACKAGE_MPD_LIBCUE),y)
-MPD_DEPENDENCIES += libcue
-else
-MPD_CONF_OPT += --disable-cue
-endif
-
 ifeq ($(BR2_PACKAGE_MPD_LIBSAMPLERATE),y)
 MPD_DEPENDENCIES += libsamplerate
 else
