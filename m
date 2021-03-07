From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Mar 2021 21:54:46 +0100
Subject: [Buildroot] [git commit] package/frotz: Update to version 2.53
Message-ID: <20210308072140.BCED388918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=807dd03eec9dfc5aab1677d639729ed68f052b2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version should now also compile fine on systems without pthreads,
so we can remove the dependency on BR2_TOOLCHAIN_HAS_THREADS again.

While we're at it, also fix a typo in the description (replace "can not"
with "cannot").

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/frotz/Config.in  | 6 +-----
 package/frotz/frotz.hash | 2 +-
 package/frotz/frotz.mk   | 2 +-
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/frotz/Config.in b/package/frotz/Config.in
index b73beea330..9473f5944d 100644
--- a/package/frotz/Config.in
+++ b/package/frotz/Config.in
@@ -1,14 +1,10 @@
 config BR2_PACKAGE_FROTZ
 	bool "frotz"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NCURSES
 	help
 	  Frotz is an interpreter for old Infocom adventure games and
-	  other Z-code games. Note that frotz can not be run as root.
+	  other Z-code games. Note that frotz cannot be run as root.
 	  You must add a normal user to your buildroot configuration to
 	  be able to use it.
 
 	  https://661.org/proj/if/frotz/
-
-comment "frotz needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/frotz/frotz.hash b/package/frotz/frotz.hash
index 14f1a7fbe2..e5024aa2cd 100644
--- a/package/frotz/frotz.hash
+++ b/package/frotz/frotz.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e488140791259a1a8c9e16a0c467ca69b694b918c28ffe3d83c654bcb253cca  frotz-2.51.tar.bz2
+sha256  8da558828dd74d6d6ee30483bb32276ef918b8b72b7f6e89b4f7cb27e7abf58b  frotz-2.53.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
index ce27bdf0bf..cc0421358c 100644
--- a/package/frotz/frotz.mk
+++ b/package/frotz/frotz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FROTZ_VERSION = 2.51
+FROTZ_VERSION = 2.53
 FROTZ_SOURCE = frotz-$(FROTZ_VERSION).tar.bz2
 FROTZ_SITE = https://gitlab.com/DavidGriffith/frotz/-/archive/$(FROTZ_VERSION)
 FROTZ_DEPENDENCIES = host-pkgconf ncurses
