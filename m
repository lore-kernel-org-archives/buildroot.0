From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jan 2014 22:03:45 +0100
Subject: [Buildroot] [git commit] libcdio: forcibly disable libcddb support
Message-ID: <20140127210827.A369C9C697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ff91126e63305a10b3464abedcf6410981a92a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't have libcddb in Buildroot, and the detection handling in
configure uses pkg-config, so explicitly disable it so we don't
need to build host-pkgconf just to notice that it isn't available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcdio/libcdio.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index 2e3e2cf..b114809 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -9,7 +9,7 @@ LIBCDIO_SITE = $(BR2_GNU_MIRROR)/libcdio
 LIBCDIO_INSTALL_STAGING = YES
 LIBCDIO_LICENSE = GPLv3+
 LIBCDIO_LICENSE_FILES = COPYING
-LIBCDIO_CONF_OPT = --disable-example-progs
+LIBCDIO_CONF_OPT = --disable-example-progs --disable-cddb
 
 ifeq ($(BR2_ENABLE_LOCALE),)
 LIBCDIO_DEPENDENCIES += libiconv
