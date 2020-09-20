From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:47:12 +0200
Subject: [Buildroot] [git commit] package/fbterm: remove fontconfig fix
Message-ID: <20200920133758.02E328CA48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f986c8d884c0e769b080c5aec24b5013742dd52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous patch added a fix for fontconfig.pc.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fbterm/fbterm.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
index 712d4f97fa..9964827801 100644
--- a/package/fbterm/fbterm.mk
+++ b/package/fbterm/fbterm.mk
@@ -10,12 +10,6 @@ FBTERM_LICENSE = GPL-2.0+
 FBTERM_LICENSE_FILES = COPYING
 FBTERM_DEPENDENCIES = fontconfig liberation
 
-ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
-# fontconfig uses pthreads if available, but fbterm forgets to link
-# with it breaking static builds
-FBTERM_CONF_ENV += LIBS='-lpthread'
-endif
-
 ifeq ($(BR2_PACKAGE_GPM),y)
 FBTERM_DEPENDENCIES += gpm
 FBTERM_CONF_OPTS += --enable-gpm
