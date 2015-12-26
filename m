From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Dec 2015 16:09:53 +0100
Subject: [Buildroot] [git commit] package/mpd: bump to version 0.19.12
Message-ID: <20151226150957.E163981E8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b27773735ff407d2333bb206702bfa7122fea61b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch "Makefile.am: fix static build with alsa" - applied upstream.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/0003-fix-static-build-with-alsa.patch | 32 -----------------------
 package/mpd/mpd.hash                              |  2 +-
 package/mpd/mpd.mk                                |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/package/mpd/0003-fix-static-build-with-alsa.patch b/package/mpd/0003-fix-static-build-with-alsa.patch
deleted file mode 100644
index 4ba0449..0000000
--- a/package/mpd/0003-fix-static-build-with-alsa.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From bba7b8e5fed79a7fecacf5468ade35a3ae0a0f8e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Sat, 21 Nov 2015 23:51:43 +0100
-Subject: [PATCH 1/1] Makefile.am: fix static build with alsa
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Add ALSA_LIBS to MIXER_LIBS, otherwise building mpd in a static context fails
-with lot of undefined references to alsa-lib (libasound) required by
-src/mixer/plugins/AlsaMixerPlugin.cxx.
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index 89819de..307fcba 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1219,6 +1219,7 @@ liboutput_plugins_a_SOURCES = \
- 
- MIXER_LIBS = \
- 	libmixer_plugins.a \
-+	$(ALSA_LIBS) \
- 	$(PULSE_LIBS)
- 
- MIXER_API_SRC = \
--- 
-2.6.2
-
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 1b6c80b..bc4792a 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7a5c66aa5af97a5b7af3dc49e3d2594071dafd62a14e2e9f7c9a5a86342836c6	mpd-0.19.11.tar.xz
+sha256	7b6fe6c7ce72f5f80a276d680072b524ecb395e546e252b8f3a0756377e1e875	mpd-0.19.12.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 7e6b60f..c794e82 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).11
+MPD_VERSION = $(MPD_VERSION_MAJOR).12
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
