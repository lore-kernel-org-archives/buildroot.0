From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:33:29 +0200
Subject: [Buildroot] [git commit] xenomai: update LICENSE_FILES
Message-ID: <20170420211016.A50D681F7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e4e0be2d72e982891c50a7878ccff351d47fe49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xenomai sources contain much more license files than we currently list, so
complete the current list.

Based on:
    find | grep -Ei 'copying|license|copyright' | sort

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/xenomai.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 7c0ad34..456f200 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -15,7 +15,12 @@ XENOMAI_SITE = https://xenomai.org/downloads/xenomai/stable
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
 XENOMAI_LICENSE = GPL-2.0+ with exception (headers), LGPL-2.1+ (libraries), GPL-2.0+ (kernel), GFDL-1.2+ (docs), GPL-2.0 (ipipe patch, can driver)
 # GFDL is not included but refers to gnu.org
-XENOMAI_LICENSE_FILES = debian/copyright include/COPYING lib/trank/COPYING kernel/cobalt/COPYING
+XENOMAI_LICENSE_FILES = debian/copyright include/COPYING kernel/cobalt/COPYING \
+	kernel/cobalt/posix/COPYING kernel/cobalt/rtdm/COPYING \
+	lib/alchemy/COPYING lib/analogy/COPYING \
+	lib/boilerplate/iniparser/LICENSE lib/boilerplate/COPYING \
+	lib/cobalt/COPYING lib/copperplate/COPYING lib/psos/COPYING \
+	lib/smokey/COPYING lib/trank/COPYING lib/vxworks/COPYING
 
 XENOMAI_DEPENDENCIES = host-pkgconf
 
