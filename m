From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Sep 2015 19:37:12 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-vmmouse:
	Add optional dependency to udev
Message-ID: <20150927173716.A9FA181801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29c12df3a735ae61891bcf1b90daf0bfd00db7c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Udev support is enabled by default
http://cgit.freedesktop.org/xorg/driver/xf86-input-vmmouse/tree/configure.ac#n113

and only disabled on demand
http://cgit.freedesktop.org/xorg/driver/xf86-input-vmmouse/tree/configure.ac#n115

Fixes
http://autobuild.buildroot.net/results/201/2011ae075db2cc3c22706f96b190de7a4bda99eb/
http://autobuild.buildroot.net/results/cd3/cd3730ed0272c3f335ee90e0cbc4027b07945db3/
http://autobuild.buildroot.net/results/7f7/7f79ca6a35f405b56aa2d619a649ffb367da7790/
http://autobuild.buildroot.net/results/7c9/7c9ab14b22bb14ce70905d3d1471d96241242827/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-input-vmmouse.mk                  |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
index 53ceec8..6e9cf8b 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -11,4 +11,11 @@ XDRIVER_XF86_INPUT_VMMOUSE_LICENSE = MIT
 XDRIVER_XF86_INPUT_VMMOUSE_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+XDRIVER_XF86_INPUT_VMMOUSE_CONF_OPTS += --with-libudev
+XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES += udev
+else
+XDRIVER_XF86_INPUT_VMMOUSE_CONF_OPTS += --without-libudev
+endif
+
 $(eval $(autotools-package))
