From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Jan 2018 15:37:54 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] matchbox-lib: fix
 dependencies
Message-ID: <20180108215441.56EB2838FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=727b7bfdde12b5030201262e253dc4100f05fc86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

matchbox-lib build-depends on xlib_libXext, but forgets to select it.
It also build-depends on expat without selecting it, but it does need
it.

Fix that: select xlib_libXext, remove expat.

Add myself to developpers for matchbox packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 2cfda4704e0fbf486bf1255c0779caed1ffab946)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                           | 1 +
 package/matchbox-lib/Config.in       | 1 +
 package/matchbox-lib/matchbox-lib.mk | 4 ++--
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b25823b..1e58dd6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1763,6 +1763,7 @@ F:	package/libpri/
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
