From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:34:03 +0200
Subject: [Buildroot] [git commit] psmisc: use the new gettext logic
Message-ID: <20170704233518.977527F8C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48a851d1bb909ef49885db14c5b35a08e9c2d123
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 
