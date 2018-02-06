From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  6 Feb 2018 12:40:35 -0500
Subject: [Buildroot] [PATCH 1/1] ncurses-next: fix build failure with 6.1
Message-ID: <20180206174035.1683-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ncurses 6.1 introduces the config option --disable-stripping which is set
to no by default.

Set this option to ensure that ncurses doesn't try to strip the executables.

Fixes:
http://autobuild.buildroot.net/results/3a5/3a5ddfcf7cd3a5c2bc068e3e33c823d6bcd3e79b
Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/ncurses/ncurses.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index eccfbecb8b..90cf4a4dc5 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -25,6 +25,7 @@ NCURSES_CONF_OPTS = \
 	--enable-const \
 	--enable-overwrite \
 	--enable-pc-files \
+	--disable-stripping \
 	--with-pkg-config-libdir="/usr/lib/pkgconfig" \
 	$(if $(BR2_PACKAGE_NCURSES_TARGET_PROGS),,--without-progs) \
 	--without-manpages
-- 
2.14.3
