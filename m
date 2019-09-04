From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Sep 2019 21:32:22 +0200
Subject: [Buildroot] [git commit] package/snort: bump to version 2.9.14.1
Message-ID: <20190904194019.DE4418B527@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e3347e59521b981f366b5993da6bfb147bdff6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since configure is using PKG_CHECK_MODULES macro, we need to
unconditionally depends on host-pkgconf.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snort/snort.hash | 2 +-
 package/snort/snort.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index abe85920cf..69b3210c02 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 7b02e11987c6cb4f6d79d72799ca9ad2b4bd59cc1d96bb7d6c91549f990d99d0  snort-2.9.12.tar.gz
+sha256 2472989da3aace000d1ea5931ece68f8e5cc0c511e272d65182113a2481e822d  snort-2.9.14.1.tar.gz
 
 # Hash for license files:
 sha256 f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 191ef673d7..bfb6f9f91b 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.12
+SNORT_VERSION = 2.9.14.1
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
 
-SNORT_DEPENDENCIES = libpcap libdnet daq pcre
+SNORT_DEPENDENCIES = libpcap libdnet daq pcre host-pkgconf
 
 # patching configure.in
 SNORT_AUTORECONF = YES
@@ -25,7 +25,7 @@ SNORT_CFLAGS += -O0
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-SNORT_DEPENDENCIES += libtirpc host-pkgconf
+SNORT_DEPENDENCIES += libtirpc
 SNORT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
 SNORT_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
 endif
