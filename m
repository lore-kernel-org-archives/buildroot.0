From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 14:30:50 +0200
Subject: [Buildroot] [git commit branch/2019.05.x]
 package/qt5/qt5enginio/Config.in: depends before select
Message-ID: <20190902122641.9097589020@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ab46770d017a98bfce4378e2e175683c9b52df0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

In Config.in, we put 'depends' lines before 'select' lines, as reported
by check-package.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/273215267

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 71d68f2431d3d6dae7df16a344008410bfd7b150)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
