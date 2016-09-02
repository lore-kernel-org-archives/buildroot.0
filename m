From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  2 Sep 2016 22:31:28 +0200
Subject: [Buildroot] [PATCH 2/9] package/enlightenment: remove elementary
	dependency
In-Reply-To: <1472848295-13734-1-git-send-email-romain.naour@gmail.com>
References: <1472848295-13734-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1472848295-13734-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

elementary is now provided by efl package, so remove elementary package
dependency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/Config.in        | 1 -
 package/enlightenment/enlightenment.mk | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 05ee6fc..5509e63 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -15,7 +15,6 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	select BR2_PACKAGE_EFL_X_XLIB
 	select BR2_PACKAGE_EFL_JPEG # needed at runtime by enlightenment_start
 	select BR2_PACKAGE_EFL_PNG # needed at runtime by enlightenment_start
-	select BR2_PACKAGE_ELEMENTARY
 	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
 	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 2440cec..b172383 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -14,7 +14,6 @@ ENLIGHTENMENT_DEPENDENCIES = \
 	host-pkgconf \
 	host-efl \
 	efl \
-	elementary \
 	libevas-generic-loaders \
 	xcb-util-keysyms
 
-- 
2.5.5
