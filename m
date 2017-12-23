From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Dec 2017 17:15:39 +0100
Subject: [Buildroot] [PATCH 1/2 v2] matchbox-lib: fix dependencies
In-Reply-To: <cover.1514045682.git.yann.morin.1998@free.fr>
References: <cover.1514045682.git.yann.morin.1998@free.fr>
Message-ID: <e3786800a171331ae1ffe69c1fcda35ca833a1c6.1514045682.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

matchbox-lib build-depends on xlib_libXext, but forgets to select it.
It also build-depends on expat without selecting it, but it does need
it.

Fix that: select xlib_libXext, remove expat.

Add myself to developpers for matchbox packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - drop the expat dependency  (Arnout)
---
 DEVELOPERS                           | 1 +
 package/matchbox-lib/Config.in       | 1 +
 package/matchbox-lib/matchbox-lib.mk | 4 ++--
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9f4f282203..61c26b0f53 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1843,6 +1843,7 @@ F:	package/libpri/
 F:	package/libseccomp/
 F:	package/libss7/
 F:	package/linux-tools/
+F:	package/matchbox*
 F:	package/mesa3d-headers/
 F:	package/nbd/
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
index ee206b6d82..18204d2d0b 100644
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
-- 
2.11.0
