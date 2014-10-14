From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Oct 2014 17:27:45 +0200
Subject: [Buildroot] [git commit] libv4l: bump version
Message-ID: <20141015125351.8FA8EB2DF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdaa661f5d660f185e4146b31c3f17bcee3faece
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add tarball hashes.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libv4l/libv4l.hash |    3 +++
 package/libv4l/libv4l.mk   |   10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
new file mode 100644
index 0000000..80e677a
--- /dev/null
+++ b/package/libv4l/libv4l.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha1	e0b74818e6f4a4b8974e152f4c00bec6c62265e5  v4l-utils-1.6.0.tar.bz2
+sha256	6054d3120c67a1524993e699b3b02036c817bb000b742c332682163966dc7605  v4l-utils-1.6.0.tar.bz2
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index a4d52fa..0512e49 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.0.1
+LIBV4L_VERSION = 1.6.0
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
+LIBV4L_CONF_OPTS = --disable-doxygen-doc
 
 # v4l-utils components have different licences, see v4l-utils.spec for details
 LIBV4L_LICENSE = GPLv2+ (utilities), LGPLv2.1+ (libraries)
@@ -26,6 +27,13 @@ else
 LIBV4L_CONF_OPTS += --without-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+LIBV4L_CONF_OPTS += --with-libudev
+LIBV4L_DEPENDENCIES += udev
+else
+LIBV4L_CONF_OPTS += --without-libudev
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
 LIBV4L_CONF_OPTS += --enable-v4l-utils
 else
