From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 22:23:54 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] matchbox-lib: fix
 dependencies
Message-ID: <20180129213708.71A5788014@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8de952490cc8cfc0d0d564184d6724954d9af93f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
index 09a0a6e85b..b21176e561 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1624,6 +1624,7 @@ F:	package/libinput/
 F:	package/libiscsi/
 F:	package/libseccomp/
 F:	package/linux-tools/
+F:	package/matchbox*
 F:	package/mesa3d-headers/
 F:	package/mke2img/
 F:	package/nut/
diff --git a/package/matchbox-lib/Config.in b/package/matchbox-lib/Config.in
index e50a5436c1..d758ab35a8 100644
--- a/package/matchbox-lib/Config.in
+++ b/package/matchbox-lib/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_MATCHBOX_LIB
 	bool "matchbox-lib"
+	select BR2_PACKAGE_XLIB_LIBXEXT
 	help
 	  Matchbox common functionality library.
diff --git a/package/matchbox-lib/matchbox-lib.mk b/package/matchbox-lib/matchbox-lib.mk
index 451279e6d4..8c909e676c 100644
--- a/package/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox-lib/matchbox-lib.mk
@@ -10,8 +10,8 @@ MATCHBOX_LIB_SITE = http://downloads.yoctoproject.org/releases/matchbox/libmatch
 MATCHBOX_LIB_LICENSE = LGPLv2.1+
 MATCHBOX_LIB_LICENSE_FILES = COPYING
 MATCHBOX_LIB_INSTALL_STAGING = YES
-MATCHBOX_LIB_DEPENDENCIES = host-pkgconf expat xlib_libXext
-MATCHBOX_LIB_CONF_OPTS = --enable-expat --disable-doxygen-docs
+MATCHBOX_LIB_DEPENDENCIES = host-pkgconf xlib_libXext
+MATCHBOX_LIB_CONF_OPTS = --disable-doxygen-docs
 MATCHBOX_LIB_CONF_ENV = LIBS="-lX11"
 
 define MATCHBOX_LIB_POST_INSTALL_FIXES
