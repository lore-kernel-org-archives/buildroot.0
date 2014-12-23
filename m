From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 20:53:15 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-intel: Bump version to
	2.99.917
Message-ID: <20141223195431.AB93C7FC1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0244a9b2c7b0f9796e0f3b9299cf2c7573d87872
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-intel.mk                    |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 801cdae..707cedd 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,12 +4,16 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.914
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.917
 XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
 
+# this fixes a getline-related compilation error in src/sna/kgem.c
+XDRIVER_XF86_VIDEO_INTEL_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+
 XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS = \
 	--disable-xvmc \
 	--enable-sna \
