From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Aug 2010 10:15:29 +0200
Subject: [Buildroot] [git commit master 1/1] ncurses: get rid of unused
	BR2_PACKAGE_NCURSES_TARGET_HEADERS handling
Message-ID: <20100830081755.E8DFF88E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=78c67b6ce4fae9a1c43632e7562c7c67379b1a74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option was removed from Config.in in 58508f39c (ncurses: remove
dedicated target-headers option), so remove it from the makefile as
well.

Reported-by: Ian <reg-ian.ridley-buildroot@hydrix.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/ncurses/ncurses.mk |    7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index b6e58ac..6de37aa 100644
--- a/CHANGES
+++ b/CHANGES
@@ -19,7 +19,7 @@
 
 	Updated/fixed packages: busybox, gst-plugins-base,
 	imagemagick, libgail, libglib2, libgtk2, lua, luafilesystem,
-	lzo, netcat, pango, php, pppd, proftpd, qt, samba,
+	lzo, ncurses, netcat, pango, php, pppd, proftpd, qt, samba,
 	startup-notification, swfdec, sysvinit, util-linux
 
 	Removed packages: stunnel
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index ee101f3..0a49887 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -40,11 +40,8 @@ NCURSES_CONF_OPT = \
 	--enable-echo \
 	--enable-const \
 	--enable-overwrite \
-	--enable-broken_linker
-
-ifneq ($(BR2_PACKAGE_NCURSES_TARGET_HEADERS),y)
-NCURSES_CONF_OPT += --disable-static
-endif
+	--enable-broken_linker \
+	--disable-static
 
 ifneq ($(BR2_ENABLE_DEBUG),y)
 NCURSES_CONF_OPT += --without-debug
-- 
1.7.1
