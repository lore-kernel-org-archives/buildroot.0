From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 11 Apr 2012 12:07:23 +0100
Subject: [Buildroot] [PATCH] Add lcdproc config options, for driver selection
Message-ID: <1334142443-30441-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a configuration menu item to specify a list of lcdproc drivers to
be built. The list defaults to 'all'.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/lcdproc/Config.in  |    6 ++++++
 package/lcdproc/lcdproc.mk |    2 +-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
index 6c8614d..e997e91 100644
--- a/package/lcdproc/Config.in
+++ b/package/lcdproc/Config.in
@@ -5,3 +5,9 @@ config BR2_PACKAGE_LCDPROC
          LCD display driver daemon and clients
 
          http://lcdproc.org/
+
+config BR2_PACKAGE_LCDPROC_DRIVERS
+	string "List of drivers to build"
+	default "all"
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
 
-- 
1.7.5.4
