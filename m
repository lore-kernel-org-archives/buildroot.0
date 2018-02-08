From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 22:21:10 +0100
Subject: [Buildroot] [git commit branch/next] ncurses: fix build failure
 with ncurses 6.1
Message-ID: <20180208212139.151DF8859A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ab611c40ff08bd4a7922456fed22af6953af3b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Ncurses 6.1 introduced the config option --disable-stripping which is
set to no by default.

Set this option to ensure that ncurses doesn't try to strip the
executables.

Fixes:

  http://autobuild.buildroot.net/results/3a5ddfcf7cd3a5c2bc068e3e33c823d6bcd3e79b

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
