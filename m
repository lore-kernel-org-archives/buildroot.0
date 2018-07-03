From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  3 Jul 2018 20:05:17 +0300
Subject: [Buildroot] [PATCH 1/2] kf5-modemmanager-qt: correct dependencies
 comment display conditions
Message-ID: <66fdce0c33ee33d5be7a51b8f94deb70b235a43a.1530637518.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Display the dependencies comment only when modem-manager is enabled.
Otherwise, a toolchain configuration change would not make the package
selectable.

Cc: Pierre Ducroquet <pinaraf@pinaraf.info>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/kf5/kf5-modemmanager-qt/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kf5/kf5-modemmanager-qt/Config.in b/package/kf5/kf5-modemmanager-qt/Config.in
index c291b886f5cd..f08de5567220 100644
--- a/package/kf5/kf5-modemmanager-qt/Config.in
+++ b/package/kf5/kf5-modemmanager-qt/Config.in
@@ -16,4 +16,5 @@ config BR2_PACKAGE_KF5_MODEMMANAGER_QT
 
 comment "kf5-modemmanager-qt needs toolchain w/ threads"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_MODEM_MANAGER
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.18.0
