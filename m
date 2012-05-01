From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 22:22:10 +0200
Subject: [Buildroot] [git commit] Add lcdproc config options,
	for driver selection
Message-ID: <20120501203317.1A5FE96C3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=acf2af2d91838b15a645bf17cb4a50688603b2af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a configuration menu item to specify a list of lcdproc drivers to
be built. The list defaults to 'all'.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lcdproc/Config.in  |    7 +++++++
 package/lcdproc/lcdproc.mk |    2 +-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
index 6c8614d..7261105 100644
--- a/package/lcdproc/Config.in
+++ b/package/lcdproc/Config.in
@@ -5,3 +5,10 @@ config BR2_PACKAGE_LCDPROC
          LCD display driver daemon and clients
 
          http://lcdproc.org/
+
+config BR2_PACKAGE_LCDPROC_DRIVERS
+	string "List of drivers to build"
+	default "all"
+	depends on BR2_PACKAGE_LCDPROC
+	help
+	  Specify a comma-separated list of lcdproc drivers to be built
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index e8919e9..745b386 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -7,7 +7,7 @@ LCDPROC_VERSION = 0.5.5
 LCDPROC_SOURCE = lcdproc-$(LCDPROC_VERSION).tar.gz
 LCDPROC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
 
-LCDPROC_CONF_OPT = --enable-drivers=all
+LCDPROC_CONF_OPT = --enable-drivers=$(BR2_PACKAGE_LCDPROC_DRIVERS)
 
 LCDPROC_DEPENDENCIES = ncurses
 
