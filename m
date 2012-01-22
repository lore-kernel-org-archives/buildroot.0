From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Jan 2012 16:31:02 +0100
Subject: [Buildroot] [git commit] libv4l: bump version
Message-ID: <20120122200858.5B3BE8FDDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c5be770be0bab1975af3d908299f6c46d83fab1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Jpeg decompression is now done using libjpeg.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libv4l/libv4l.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 4df64fc..dbd8769 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -3,11 +3,12 @@
 # libv4l
 #
 #############################################################
-LIBV4L_VERSION = 0.8.3
+LIBV4L_VERSION = 0.8.5
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils/
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_MAKE_OPTS = PREFIX=/usr
+LIBV4L_DEPENDENCIES = jpeg
 
 LIBV4L_DIRS_y += lib
 LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_DECODE_TM6000)	+= utils/decode_tm6000
