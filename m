From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:17 +0100
Subject: [Buildroot] [PATCH 25/80 v1] package/udpcast: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <29d5a1718967cb81ab1987c56928e529a7f8ba70.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a bit overkill, as there is only two sub-items. However, this
commit is not about judging whether it makes sense or not to have a
sub-menu, but to cleanup the 'config'+'menu' situation.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/udpcast/Config.in | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index 0424db7..a61829a 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -2,7 +2,7 @@ comment "udpcast needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_UDPCAST
+menuconfig BR2_PACKAGE_UDPCAST
 	bool "udpcast"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
@@ -14,8 +14,6 @@ config BR2_PACKAGE_UDPCAST
 
 if BR2_PACKAGE_UDPCAST
 
-menu "udpcast tools selection"
-
 config BR2_PACKAGE_UDPCAST_SENDER
 	bool "sender"
 	help
@@ -26,6 +24,4 @@ config BR2_PACKAGE_UDPCAST_RECEIVER
 	help
 	  The udpcast receiver.
 
-endmenu
-
 endif
-- 
1.9.1
