From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 13:53:56 +0200
Subject: [Buildroot] [git commit] xapp_xinit: point to target's "mcookie"
Message-ID: <20160716115408.ADB7B7FA3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8159b4f80af50580b785c683a40a6572c0cecc32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The X11 package builds the "mcookie" executable, when selected, into
the directory output/host/usr/bin/mcookie. The xapp_init's "configure"
attempts to find the "mcookie" executable using the host's path. If
the host has an installed "mcookie" application in their /bin folder,
it can influence the build. The following patch forces the expected
mcookie location.

Related:
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/50310

Signed-off-by: Yugendra Sai Babu Nadupuru <yugendra.sai.babu.nadupuru@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Thomas:
 - remove conditional on the mcookie package being enabled, since
   xapp_xinit depends on the X.org server, and the X.org server
   selects mcookie.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xinit/xapp_xinit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index a67ba14..a796884 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -10,5 +10,6 @@ XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
 XAPP_XINIT_LICENSE = MIT
 XAPP_XINIT_LICENSE_FILES = COPYING
+XAPP_XINIT_CONF_OPTS = MCOOKIE=/usr/bin/mcookie
 
 $(eval $(autotools-package))
