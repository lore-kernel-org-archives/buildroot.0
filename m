From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Dec 2010 10:35:04 +0100
Subject: [Buildroot] [PATCH 1/1] xkeyboard-config: bump to 2.0 to fix bug
	2965
In-Reply-To: <cover.1293010496.git.thomas.petazzoni@free-electrons.com>
References: <cover.1293010496.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7d1e217a300ed9ebcee0cea4bdd55d12370d3ef8.1293010496.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some odd reason, xkeyboard-config < 1.8 was creating a symbolic
link from /usr/share/X11/xkb/xkbcomp to the xkbcomp binary. But in
cross-compilation mode, this is absurd as the xkbcomp binary to which
the link is pointing is the one in $(HOST_DIR).

This symbolic link thing has been removed completely starting from
xkeyboard-config 1.9. See
http://cgit.freedesktop.org/xkeyboard-config/commit/?id=f413dff57e77e7b01461508f74b4e92d1dc8defd.

Therefore, we simply bump xkeyboard-config to the latest available
version, 2.0.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index b9f1d62..f5ad44d 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -3,9 +3,9 @@
 # xkeyboard-config
 #
 #############################################################
-XKEYBOARD_CONFIG_VERSION = 1.8
+XKEYBOARD_CONFIG_VERSION = 2.0
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
-XKEYBOARD_CONFIG_SITE = http://xlibs.freedesktop.org/xkbdesc
+XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
 XKEYBOARD_CONFIG_AUTORECONF = NO
 XKEYBOARD_CONFIG_INSTALL_STAGING = NO
 XKEYBOARD_CONFIG_INSTALL_TARGET = YES
-- 
1.7.0.4
