From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 14:04:00 +0100
Subject: [Buildroot] [git commit] package/x11r7/libxcb: really disable docs
Message-ID: <20150221130406.C53EF80506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7905227c5ed89fa3c13f4d28f23fb492e54f15e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/libxcb/libxcb.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index da2f192..f4a3aa9 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -16,8 +16,8 @@ LIBXCB_DEPENDENCIES = \
 	host-libxslt libpthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
 	host-xcb-proto host-python host-pkgconf
 
-LIBXCB_CONF_OPTS = --disable-build-docs
-HOST_LIBXCB_CONF_OPTS = --disable-build-docs
+LIBXCB_CONF_OPTS = --with-doxygen=no
+HOST_LIBXCB_CONF_OPTS = --with-doxygen=no
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
