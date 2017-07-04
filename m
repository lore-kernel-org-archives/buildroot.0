From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:00 +0200
Subject: [Buildroot] [PATCH 020/100] diffutils: use new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-21-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
 
-- 
2.9.4
