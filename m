From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Jul 2018 21:39:12 +0200
Subject: [Buildroot] [git commit] kf5-modemmanager-qt: correct dependencies
 comment display conditions
Message-ID: <20180703193603.049D084050@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f52f95b1f9a20d4eebcfa56dc66eacfa0fd31c30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Display the dependencies comment only when modem-manager is enabled.
Otherwise, a toolchain configuration change would not make the package
selectable.

Cc: Pierre Ducroquet <pinaraf@pinaraf.info>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kf5/kf5-modemmanager-qt/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kf5/kf5-modemmanager-qt/Config.in b/package/kf5/kf5-modemmanager-qt/Config.in
index c291b886f5..f08de55672 100644
--- a/package/kf5/kf5-modemmanager-qt/Config.in
+++ b/package/kf5/kf5-modemmanager-qt/Config.in
@@ -16,4 +16,5 @@ config BR2_PACKAGE_KF5_MODEMMANAGER_QT
 
 comment "kf5-modemmanager-qt needs toolchain w/ threads"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_MODEM_MANAGER
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
