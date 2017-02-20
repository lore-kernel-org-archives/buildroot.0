From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:15:00 +0100
Subject: [Buildroot] [git commit] madplay: workaround not needed anymore
Message-ID: <20170301170423.612D380279@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e36f0881bd8aa4b3889c9b68b2976ca873603b20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patches for uClibc-ng are upstream and added to buildroot.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/madplay/madplay.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index 6b13819..2606ac8 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -11,14 +11,6 @@ MADPLAY_LICENSE_FILES = COPYING COPYRIGHT
 MADPLAY_LIBTOOL_PATCH = NO
 MADPLAY_DEPENDENCIES = libmad libid3tag $(if $(BR2_PACKAGE_GETTEXT),gettext)
 
-# Workaround a bug in uClibc-ng, which exposes madvise() but doesn't
-# provide the corresponding MADV_* definitions. Bug reported at
-# http://mailman.uclibc-ng.org/pipermail/devel/2016-December/001306.html. madvise()
-# is anyway useless on noMMU.
-ifeq ($(BR2_USE_MMU),)
-MADPLAY_CONF_ENV += ac_cv_func_madvise=no
-endif
-
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
