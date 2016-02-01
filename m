From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 17:07:37 +0100
Subject: [Buildroot] [git commit] Revert "madplay: fix musl gettext support
	detection"
Message-ID: <20160201224701.2C0FC7F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28fc73efafe917e4a89c0eb6651555922ee0f4df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit a0a244d26d8e7e7e5465c3e6e9fcd1c31e2c178d.

As this is now handled globally in TARGET_CONFIGURE_ARGS, this can be
reverted here.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/madplay/madplay.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index 65ae4f7..2606ac8 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -11,11 +11,6 @@ MADPLAY_LICENSE_FILES = COPYING COPYRIGHT
 MADPLAY_LIBTOOL_PATCH = NO
 MADPLAY_DEPENDENCIES = libmad libid3tag $(if $(BR2_PACKAGE_GETTEXT),gettext)
 
-# configure script misdetects musl gettext support
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-MADPLAY_CONF_ENV += gt_cv_func_gnugettext1_libc=yes
-endif
-
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
