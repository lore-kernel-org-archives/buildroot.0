From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 May 2010 20:13:45 +0200
Subject: [Buildroot] [git commit master] xserver_xorg-server: Use $(MAKE1)
	for make install
Message-ID: <20100530181414.486C612EE61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=41c49b3c9f48958656213ebb28f3f3e1817ed600
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xserver installation fails with parallel make jobs.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 6c6017b..4aba941 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -7,6 +7,7 @@
 XSERVER_XORG_SERVER_VERSION = 1.7.5
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
+XSERVER_XORG_XSERVER_MAKE = $(MAKE1) # make install fails with parallel make
 XSERVER_XORG_SERVER_AUTORECONF = NO
 XSERVER_XORG_SERVER_LIBTOOL_PATCH = NO
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
-- 
1.6.3.3
