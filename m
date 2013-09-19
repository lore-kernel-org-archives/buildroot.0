From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 21:14:55 +0200
Subject: [Buildroot] [git commit] libcdaudio: disable autoreconf
Message-ID: <20130919193857.A511B9B7F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32b869c32407ede709ab9657b42f32ac3da5b4e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's no stated purpose and it breaks with automake 1.12+
If it breaks in some scenario ping me, i've got a patch to fix the
autoreconf issue and re-enable it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcdaudio/libcdaudio.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/libcdaudio/libcdaudio.mk b/package/libcdaudio/libcdaudio.mk
index 151bb8c..06f8926 100644
--- a/package/libcdaudio/libcdaudio.mk
+++ b/package/libcdaudio/libcdaudio.mk
@@ -5,10 +5,7 @@
 ################################################################################
 
 LIBCDAUDIO_VERSION = 0.99.12p2
-LIBCDAUDIO_SOURCE = libcdaudio-$(LIBCDAUDIO_VERSION).tar.gz
 LIBCDAUDIO_SITE = http://downloads.sourceforge.net/project/libcdaudio/libcdaudio/$(LIBCDAUDIO_VERSION)/
-LIBCDAUDIO_AUTORECONF = YES
-LIBCDAUDIO_LIBTOOL_PATCH = YES
 LIBCDAUDIO_INSTALL_STAGING = YES
 LIBCDAUDIO_CONFIG_SCRIPTS = libcdaudio-config
 
