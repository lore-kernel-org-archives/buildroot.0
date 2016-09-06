From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:41:37 +0200
Subject: [Buildroot] [git commit] package/enlightenment: remove
	libevas-generic-loaders dependency
Message-ID: <20160906195112.0E3AE8226D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e29907ade90bb65aaef1650d030de3f20548393d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libevas-generic-loaders is now provided by efl package, so remove
libevas-generic-loaders package dependency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/enlightenment/Config.in        | 3 +--
 package/enlightenment/enlightenment.mk | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 5509e63..b5d889b 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -15,8 +15,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	select BR2_PACKAGE_EFL_X_XLIB
 	select BR2_PACKAGE_EFL_JPEG # needed at runtime by enlightenment_start
 	select BR2_PACKAGE_EFL_PNG # needed at runtime by enlightenment_start
-	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
-	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
+	select BR2_PACKAGE_EFL_SVG
 	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
 	help
 	  Enlightenment, also known simply as E, is a stacking window
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index b172383..34c4f21 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -14,7 +14,6 @@ ENLIGHTENMENT_DEPENDENCIES = \
 	host-pkgconf \
 	host-efl \
 	efl \
-	libevas-generic-loaders \
 	xcb-util-keysyms
 
 ENLIGHTENMENT_CONF_OPTS = \
