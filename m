From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 15 Feb 2019 21:25:04 +0100
Subject: [Buildroot] [PATCH v1] package/qwt: needs qt5base gui support
Message-ID: <20190215202504.24205-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following qt5base configure error ([1]):

  ERROR: Feature 'widgets' was enabled, but the pre-condition 'features.gui' failed.

[1] http://autobuild.buildroot.net/results/c771c2d5aac3e21f908e5a118f3755dbc9301a47

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-- 
2.20.1
