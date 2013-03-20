From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:10:59 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-input-synaptics: bump
	revision to X11R7.7
Message-ID: <20130324225141.125869B2B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68ad35ad568f584630fd446021d45ba79b6d8651
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

---
 .../x11r7/xdriver_xf86-input-synaptics/Config.in   |    1 +
 .../xdriver_xf86-input-synaptics.mk                |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-synaptics/Config.in b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
index 9c214b7..6b5e5b6 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/Config.in
+++ b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
@@ -3,5 +3,6 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_SYNAPTICS
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_MTDEV
 	help
 	  X.Org driver for synaptics input devices
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index e66acb5..74a3f86 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.3.0
+XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.6.1
 XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
+XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto mtdev
 
 $(eval $(autotools-package))
