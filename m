From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 22:54:04 +0100
Subject: [Buildroot] [PATCH 18/19] libtheora: bump version to 1.1.1
In-Reply-To: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
Message-ID: <119dea09c29bcb16dd5b1fd39324add5f2693810.1292190675.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to disable the build of the format specification
documentation, which was causing issues in cross-compiling mode.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/libtheora/libtheora.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/libtheora/libtheora.mk b/package/multimedia/libtheora/libtheora.mk
index 81eb83f..e572d1a 100644
--- a/package/multimedia/libtheora/libtheora.mk
+++ b/package/multimedia/libtheora/libtheora.mk
@@ -3,7 +3,7 @@
 # libtheora
 #
 #############################################################
-LIBTHEORA_VERSION = 1.0
+LIBTHEORA_VERSION = 1.1.1
 LIBTHEORA_SOURCE = libtheora-$(LIBTHEORA_VERSION).tar.bz2
 LIBTHEORA_SITE = http://downloads.xiph.org/releases/theora
 LIBTHEORA_INSTALL_STAGING = YES
@@ -12,7 +12,8 @@ LIBTHEORA_CONF_OPT = \
 		--disable-oggtest \
 		--disable-vorbistest \
 		--disable-sdltest \
-		--disable-examples
+		--disable-examples \
+		--disable-spec
 
 LIBTHEORA_DEPENDENCIES = libogg libvorbis host-pkg-config
 
-- 
1.7.0.4
