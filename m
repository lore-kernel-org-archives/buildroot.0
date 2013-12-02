From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 2 Dec 2013 11:45:39 +0000
Subject: [Buildroot] [PATCH v2] qt5script: Disable on MIPS64 n64 ABI
Message-ID: <1385984739-731-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no support for JavaScritCore on MIPS64 n64 ABI so as a quick
fix we can disable the posibility of selecting this package. Meanwhile a
proposed patch has already been sent to Qt:

   https://bugreports.qt-project.org/browse/QTBUG-35191

Fixes:

   http://autobuild.buildroot.net/results/231/231c112a3fc18e6cd7d6d10873e22144525c7280/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/qt5/qt5script/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5script/Config.in b/package/qt5/qt5script/Config.in
index 3c5d60c..4358f95 100644
--- a/package/qt5/qt5script/Config.in
+++ b/package/qt5/qt5script/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QT5SCRIPT
 	bool "qt5script"
+	depends on !BR2_MIPS_NABI64
 	select BR2_PACKAGE_QT5BASE
 	help
 	  Qt is a cross-platform application and UI framework for
-- 
1.7.1
