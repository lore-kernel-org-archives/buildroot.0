From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 17:59:44 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/fbterm: remove
 fontconfig fix
Message-ID: <20200929155307.48E2C8E458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c341688cdd1963c9b8090aeded63ca7078401731
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

The previous patch added a fix for fontconfig.pc.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3f986c8d884c0e769b080c5aec24b5013742dd52)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
