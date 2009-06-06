From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 6 Jun 2009 21:38:07 +0200
Subject: [Buildroot] [git commit] xdriver_xf86-input-synaptics: fix download
	url
Message-ID: <20090606193957.027AE77825@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6fa84f5ff5e4c33f6f9b50a950fa265bd4c3669
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


0.15.0 seems to never have been in Debian (it is atleast not on
snapshot.debian.net), so use the real upstream (freedesktop) instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xdriver_xf86-input-synaptics.mk                |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index 27e7898..9146ba6 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 0.15.0
-XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xfree86-driver-synaptics_$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).orig.tar.gz
-XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://ftp.de.debian.org/debian/pool/main/x/xfree86-driver-synaptics
+XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).tar.bz2
+XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_SYNAPTICS_AUTORECONF = NO
 XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 XDRIVER_XF86_INPUT_SYNAPTICS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-- 
1.6.0.6
