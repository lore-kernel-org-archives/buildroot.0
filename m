From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:47 +0200
Subject: [Buildroot] [PATCH 067/100] psmisc: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-68-thomas.petazzoni@free-electrons.com>
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
 package/psmisc/Config.in | 1 -
 package/psmisc/psmisc.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/psmisc/Config.in b/package/psmisc/Config.in
index 2b66bcf..0d1d061 100644
--- a/package/psmisc/Config.in
+++ b/package/psmisc/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PSMISC
 	bool "psmisc"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Helpful /proc related utilities such as pstree, fuser, and killall
 
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 408c047..3d9a804 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -9,7 +9,7 @@ PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
 PSMISC_SOURCE = psmisc-$(PSMISC_VERSION).tar.xz
 PSMISC_LICENSE = GPL-2.0
 PSMISC_LICENSE_FILES = COPYING
-PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+PSMISC_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 # Patching Makefile.am
 PSMISC_AUTORECONF = YES
 
-- 
2.9.4
