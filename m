From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sat,  1 Apr 2017 13:43:09 -0300
Subject: [Buildroot] [PATCH] ncurses: drop unneeded trailing backslashes
Message-ID: <20170401164309.23048-1-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 package/ncurses/ncurses.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 955236409..68c77ac61 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -27,8 +27,7 @@ NCURSES_CONF_OPTS = \
 	--enable-pc-files \
 	--with-pkg-config-libdir="/usr/lib/pkgconfig" \
 	$(if $(BR2_PACKAGE_NCURSES_TARGET_PROGS),,--without-progs) \
-	--without-manpages \
-
+	--without-manpages
 
 # Install after busybox for the full-blown versions
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
@@ -64,7 +63,7 @@ NCURSES_TERMINFO_FILES = \
 	v/vt220 \
 	x/xterm \
 	x/xterm-color \
-	x/xterm-xfree86 \
+	x/xterm-xfree86
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NCURSES_CONF_OPTS += --enable-widec
-- 
2.11.0
