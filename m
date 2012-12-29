From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Dec 2012 20:39:35 +0100
Subject: [Buildroot] [git commit] taglib: bump to version 1.8
Message-ID: <20121229194003.0A23A9A528@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3874b04f73ae81ab20fabb648ea78bddc4219ef6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/taglib/Config.in |    2 +-
 package/taglib/taglib.mk |    7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/taglib/Config.in b/package/taglib/Config.in
index d172c34..2777d0d 100644
--- a/package/taglib/Config.in
+++ b/package/taglib/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_TAGLIB
           and ID3v2 for MP3 files, Ogg Vorbis comments and ID3 tags and
           Vorbis comments in FLAC, MPC, Speex, WavPack and TrueAudio files.
 
-	  http://developer.kde.org/~wheeler/taglib.html
+	  http://taglib.github.com
 
 config BR2_PACKAGE_TAGLIB_MP4
 	depends on BR2_PACKAGE_TAGLIB
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 268318e..e1e1694 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,10 +4,11 @@
 #
 #############################################################
 
-TAGLIB_VERSION = 1.7.1
-TAGLIB_SOURCE = taglib-$(TAGLIB_VERSION).tar.gz
-TAGLIB_SITE = http://developer.kde.org/~wheeler/files/src
+TAGLIB_VERSION = 1.8
+TAGLIB_SITE = http://github.com/downloads/taglib/taglib
 TAGLIB_INSTALL_STAGING = YES
+TAGLIB_LICENSE = LGPLv2.1 MPL
+TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
 
 ifeq ($(BR2_PACKAGE_TAGLIB_ASF),y)
 TAGLIB_CONF_OPT += -DWITH_ASF=ON
