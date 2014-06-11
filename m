From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Jun 2014 19:44:15 +0200
Subject: [Buildroot] [PATCH] pinentry: qt4 backend requires the Qt GUI module
Message-ID: <1402508655-7123-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/1d8/1d8a8ff1880549b2e2a24cc175dced1a51245cde/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pinentry/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index b163735..ae70257 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -44,6 +44,7 @@ config BR2_PACKAGE_PINENTRY_QT4
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# select qt
 	select BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  The pinentry-qt4 tool
 
-- 
2.0.0
