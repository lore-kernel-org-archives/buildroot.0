From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:41:01 +0100
Subject: [Buildroot] [git commit] package/qwt: needs qt5base gui support
Message-ID: <20190215214105.01A9688DA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c80a4d3501dee67c59c608b57f81b7453e6378b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 3e99c8418af904b14b01455d68c84d7b5afd261f ("package/qwt:
remove qt4 support"), the following line was incorrectly dropped:

  select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5

Due to this, qt5base can now be configured with widgets enabled but
gui disabled, causing the following build issue:

  ERROR: Feature 'widgets' was enabled, but the pre-condition 'features.gui' failed.

Re-introduce the proper select, but slightly simplified since only Qt5
is supported now.

Fixes:

  http://autobuild.buildroot.net/results/c771c2d5aac3e21f908e5a118f3755dbc9301a47

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Thomas: rework commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qwt/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index f4132c8638..2e9cec19d7 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QWT
 	bool "qwt"
 	depends on BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS # printsupport
 	select BR2_PACKAGE_QT5BASE_CONCURRENT
 	help
