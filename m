From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  3 Jul 2018 20:05:18 +0300
Subject: [Buildroot] [PATCH 2/2] kf5-networkmanager-qt: correct dependencies
 comment display conditions
In-Reply-To: <66fdce0c33ee33d5be7a51b8f94deb70b235a43a.1530637518.git.baruch@tkos.co.il>
References: <66fdce0c33ee33d5be7a51b8f94deb70b235a43a.1530637518.git.baruch@tkos.co.il>
Message-ID: <8ebced7b3a34b169b1ee6cc30d11464fc5971810.1530637518.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Display the dependencies comment only when network-manager is enabled.
Otherwise, a toolchain configuration change would not make the package
selectable.

Cc: Pierre Ducroquet <pinaraf@pinaraf.info>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/kf5/kf5-networkmanager-qt/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kf5/kf5-networkmanager-qt/Config.in b/package/kf5/kf5-networkmanager-qt/Config.in
index 277e08866a1b..6b309f08047a 100644
--- a/package/kf5/kf5-networkmanager-qt/Config.in
+++ b/package/kf5/kf5-networkmanager-qt/Config.in
@@ -16,4 +16,5 @@ config BR2_PACKAGE_KF5_NETWORKMANAGER_QT
 
 comment "kf5-networkmanager-qt needs toolchain w/ threads"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_NETWORK_MANAGER
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.18.0
