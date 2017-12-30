From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 18:33:53 +0100
Subject: [Buildroot] [git commit] matchbox-lib: fix dependencies
Message-ID: <20171230173508.251F683593@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cfda4704e0fbf486bf1255c0779caed1ffab946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

matchbox-lib build-depends on xlib_libXext, but forgets to select it.
It also build-depends on expat without selecting it, but it does need
it.

Fix that: select xlib_libXext, remove expat.

Add myself to developpers for matchbox packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                           | 1 +
 package/matchbox-lib/Config.in       | 1 +
 package/matchbox-lib/matchbox-lib.mk | 4 ++--
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b6cc7a0..f00329c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1845,6 +1845,7 @@ F:	package/libpri/
 F:	package/libseccomp/
 F:	package/libss7/
 F:	package/linux-tools/
+F:	package/matchbox*
 F:	package/mesa3d-headers/
 F:	package/nbd/
 F:	package/nut/
diff --git a/package/matchbox-lib/Config.in b/package/matchbox-lib/Config.in
index e50a543..d758ab3 100644
--- a/package/matchbox-lib/Config.in
+++ b/package/matchbox-lib/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_MATCHBOX_LIB
 	bool "matchbox-lib"
+	select BR2_PACKAGE_XLIB_LIBXEXT
 	help
 	  Matchbox common functionality library.
diff --git a/package/matchbox-lib/matchbox-lib.mk b/package/matchbox-lib/matchbox-lib.mk
index ee206b6..18204d2 100644
--- a/package/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox-lib/matchbox-lib.mk
@@ -10,8 +10,8 @@ MATCHBOX_LIB_SITE = http://downloads.yoctoproject.org/releases/matchbox/libmatch
 MATCHBOX_LIB_LICENSE = LGPL-2.1+
 MATCHBOX_LIB_LICENSE_FILES = COPYING
 MATCHBOX_LIB_INSTALL_STAGING = YES
-MATCHBOX_LIB_DEPENDENCIES = host-pkgconf expat xlib_libXext
-MATCHBOX_LIB_CONF_OPTS = --enable-expat --disable-doxygen-docs
+MATCHBOX_LIB_DEPENDENCIES = host-pkgconf xlib_libXext
+MATCHBOX_LIB_CONF_OPTS = --disable-doxygen-docs
 MATCHBOX_LIB_CONF_ENV = LIBS="-lX11"
 
 define MATCHBOX_LIB_POST_INSTALL_FIXES
