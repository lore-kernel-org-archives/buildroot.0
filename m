From: Aleksander Morgado <aleksander@aleksander.es>
Date: Tue,  5 May 2020 14:06:06 +0200
Subject: [Buildroot] [PATCH] package/network-manager: don't explicitly
 select QMI/MBIM support
Message-ID: <20200505120606.258656-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When NetworkManager is built with ModemManager support, it should only
require the generic ModemManager dependency; it shouldn't configure
which features ModemManager provides.

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/network-manager/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index e6a3f5f04f..7d44768460 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -40,8 +40,6 @@ config BR2_PACKAGE_NETWORK_MANAGER_TUI
 config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
 	bool "modem-manager support"
 	select BR2_PACKAGE_MODEM_MANAGER
-	select BR2_PACKAGE_MODEM_MANAGER_LIBMBIM
-	select BR2_PACKAGE_MODEM_MANAGER_LIBQMI
 	help
 	  This option enables support for ModemManager
 
-- 
2.26.1
