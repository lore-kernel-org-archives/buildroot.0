From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Sep 2020 13:22:26 +0200
Subject: [Buildroot] [PATCH 2/2] package/fbterm: remove fontconfig fix
In-Reply-To: <20200920112226.1331818-1-bernd.kuhls@t-online.de>
References: <20200920112226.1331818-1-bernd.kuhls@t-online.de>
Message-ID: <20200920112226.1331818-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous patch added a fix for fontconfig.pc.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.27.0
