From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:24 +0200
Subject: [Buildroot] [git commit] diffutils: use new gettext logic
Message-ID: <20170704233514.1BC2880284@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1bc871b2d415a11ad798fe0299df92ee5bd2447
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/diffutils/Config.in    | 1 -
 package/diffutils/diffutils.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/diffutils/Config.in b/package/diffutils/Config.in
index 97cb38b..3c38f25 100644
--- a/package/diffutils/Config.in
+++ b/package/diffutils/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_DIFFUTILS
 	bool "diffutils"
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  GNU diff. Compare files per line.
 
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 4662e2b..6e5b9b6 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -7,7 +7,7 @@
 DIFFUTILS_VERSION = 3.6
 DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
-DIFFUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 DIFFUTILS_LICENSE = GPL-3.0+
 DIFFUTILS_LICENSE_FILES = COPYING
 
