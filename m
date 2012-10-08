From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Oct 2012 22:32:44 +0200
Subject: [Buildroot] [git commit] lcdproc: add support for menus
Message-ID: <20121008203434.D3163997FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23467d5e2c36866899bbe644c3adf7409cdba6d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lcdproc/Config.in  |    6 ++++++
 package/lcdproc/lcdproc.mk |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
index 7261105..820f4ea 100644
--- a/package/lcdproc/Config.in
+++ b/package/lcdproc/Config.in
@@ -12,3 +12,9 @@ config BR2_PACKAGE_LCDPROC_DRIVERS
 	depends on BR2_PACKAGE_LCDPROC
 	help
 	  Specify a comma-separated list of lcdproc drivers to be built
+
+config BR2_PACKAGE_LCDPROC_MENUS
+	bool "Menu support"
+	depends on BR2_PACKAGE_LCDPROC
+	help
+	  Enable support for lcdproc menus
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index 7fd8a44..7914c85 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -12,6 +12,10 @@ LCDPROC_MAKE = $(MAKE1)
 
 LCDPROC_CONF_OPT = --enable-drivers=$(BR2_PACKAGE_LCDPROC_DRIVERS)
 
+ifeq ($(BR2_PACKAGE_LCDPROC_MENUS),y)
+LCDPROC_CONF_OPT += --enable-lcdproc-menus
+endif
+
 LCDPROC_DEPENDENCIES = ncurses
 
 $(eval $(autotools-package))
