From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:00 +0100
Subject: [Buildroot] [PATCH 31/84 RFC] package/udpcast: use 'menuconfig'
	instad of 'config'+'menu'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <a268a17eef8f2d9e7b895fea1f8396dda8823987.1451076704.git.yann.morin.1998@free.fr>
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
