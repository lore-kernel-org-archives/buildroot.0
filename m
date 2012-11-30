From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 11:54:03 -0800
Subject: [Buildroot] [git commit] matchbox-lib: Append -lX11 to the linker
Message-ID: <20121130195703.2F8608017A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc6da8b28ef6b6dde2eaaaf40d21f366508221ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes building with binutils-2.22
http://autobuild.buildroot.net/results/b4b26dd9c7d7bebe45638ba125fb49a5f5d0cc14/build-end.log

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/matchbox/matchbox-lib/matchbox-lib.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index de11dfc..339f512 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -10,6 +10,7 @@ MATCHBOX_LIB_SITE = http://matchbox-project.org/sources/libmatchbox/$(MATCHBOX_L
 MATCHBOX_LIB_INSTALL_STAGING = YES
 MATCHBOX_LIB_DEPENDENCIES = host-pkgconf expat xlib_libXext
 MATCHBOX_LIB_CONF_OPT = --enable-expat --disable-doxygen-docs
+MATCHBOX_LIB_CONF_ENV = LIBS="-lX11"
 
 define MATCHBOX_LIB_POST_INSTALL_FIXES
  $(SED) 's:-I[^$$].*/usr/include/freetype2:-I/usr/include/freetype2:' $(STAGING_DIR)/usr/lib/pkgconfig/libmb.pc
