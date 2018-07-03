From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Jul 2018 21:39:14 +0200
Subject: [Buildroot] [git commit] kf5-networkmanager-qt: correct
 dependencies comment display conditions
Message-ID: <20180703193603.0D14084050@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa46b41ecd9484bcba9f55ca8ec0a27b65a77900
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Display the dependencies comment only when network-manager is enabled.
Otherwise, a toolchain configuration change would not make the package
selectable.

Cc: Pierre Ducroquet <pinaraf@pinaraf.info>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kf5/kf5-networkmanager-qt/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kf5/kf5-networkmanager-qt/Config.in b/package/kf5/kf5-networkmanager-qt/Config.in
index 277e08866a..6b309f0804 100644
--- a/package/kf5/kf5-networkmanager-qt/Config.in
+++ b/package/kf5/kf5-networkmanager-qt/Config.in
@@ -16,4 +16,5 @@ config BR2_PACKAGE_KF5_NETWORKMANAGER_QT
 
 comment "kf5-networkmanager-qt needs toolchain w/ threads"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_NETWORK_MANAGER
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
