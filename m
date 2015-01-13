From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Jan 2015 10:10:49 +0100
Subject: [Buildroot] [git commit] poppler: fix select of Qt4 GUI module
Message-ID: <20150113091133.58E67807C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eacb0024146f5126508627dea25d76acac88b3ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some silly reason, the option is named BR2_PACKAGE_QT_GUI_MODULE
and not BR2_PACKAGE_QT_QUI.

Hopefully fixes:

  http://autobuild.buildroot.org/results/47d/47dee003b29f156496492757cbaa4208b002ab65/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poppler/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index 5166e15..fa4ce22 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -15,7 +15,7 @@ if BR2_PACKAGE_POPPLER
 config BR2_PACKAGE_POPPLER_QT
 	bool "Qt support"
 	depends on BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT_GUI
+	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_XML
 	help
 	  Build Qt support into the Poppler library
