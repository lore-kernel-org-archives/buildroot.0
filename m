From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 May 2012 08:55:47 +0200
Subject: [Buildroot] [git commit] xserver-xorg: fix build when Xtst isn't
	available
Message-ID: <20120519065826.7710A96D38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=920544e02b7e050d0160574803167c1c0a36f1cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The optional DMX support (Distributed Multihead X) needs Xtst, which
may or may not be available in the buildroot config. DMX is unlikely
to be needed for a BR system, so simply disable it rather than
forcibly requiring Xtst.

Fixes http://autobuild.buildroot.org/results/df990ded6472de62132e3a089634fafe0e029107/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index df7ba9a..29f7c81 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -58,6 +58,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-xvfb \
+		--disable-dmx \
 		--with-builder-addr=buildroot at uclibc.org \
 		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1" \
 		--with-fontdir=/usr/share/fonts/X11/ --localstatedir=/var
