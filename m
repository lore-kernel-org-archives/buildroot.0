From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 18:37:53 +0200
Subject: [Buildroot] [git commit] dialog: fix build failure
Message-ID: <20140614163955.AF2489CFBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c080f34076cdf48bcf72e1a1fbe2024b47a2694
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old ncurses trick is no longer needed for this version, in fact it's
harmful. Switch to proper configure options.
Also disable rpath hackery since it's not required and could be
problematic. Fixes:
http://autobuild.buildroot.net/results/411/411f6171e972eab4486143dedbfd078136886ab0/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dialog/dialog.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 6dc9066..fb00c9c 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -7,9 +7,9 @@
 DIALOG_VERSION = 1.2-20140219
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = ftp://invisible-island.net/dialog
-DIALOG_CONF_OPT = --with-ncurses
-DIALOG_CONF_ENV = ac_cv_path_NCURSES_CONFIG=true LIBS=-lncurses
-DIALOG_DEPENDENCIES = ncurses
+DIALOG_CONF_OPT = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
+	--disable-rpath-hack
+DIALOG_DEPENDENCIES = host-pkgconf ncurses
 DIALOG_LICENSE = LGPLv2.1
 DIALOG_LICENSE_FILES = COPYING
 
