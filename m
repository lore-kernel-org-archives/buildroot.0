From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:32:04 +0200
Subject: [Buildroot] [git commit] xapp_xcursorgen: add explicit dependencies
	for host variant
Message-ID: <20160703073818.9A5507FD74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4427d03f5649422a2236ec992698942be4139a99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index f9ca39d..4bee26b 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -10,6 +10,8 @@ XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCURSORGEN_LICENSE = MIT
 XAPP_XCURSORGEN_LICENSE_FILES = COPYING
 XAPP_XCURSORGEN_DEPENDENCIES = libpng xlib_libX11 xlib_libXcursor
+HOST_XAPP_XCURSORGEN_DEPENDENCIES = \
+	host-libpng host-xlib_libX11 host-xlib_libXcursor
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
