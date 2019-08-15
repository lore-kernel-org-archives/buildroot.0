From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Aug 2019 22:43:41 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5enginio/Config.in: depends
 before select
Message-ID: <20190815204341.29566-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In Config.in, we put 'depends' lines before 'select' lines, as reported
by check-package.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/273215267

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Tsk tsk, Thomas, committing stuff without running check-package :-)
---
 package/qt5/qt5enginio/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
index e5b4782040..f84d234771 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_QT5ENGINIO
 	bool "qt5enginio"
+	depends on BR2_PACKAGE_QT5BASE_OPENSSL
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_NETWORK
-	depends on BR2_PACKAGE_QT5BASE_OPENSSL
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
-- 
2.21.0
