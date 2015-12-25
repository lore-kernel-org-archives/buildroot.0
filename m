From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:35 +0100
Subject: [Buildroot] [PATCH 06/84 RFC] package/udpcast: move comment around,
	to keep proper indentation
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <74a8a5112b7988d2c41d3083a5bbe171887f770d.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In Kconfig, when there is an item (lie a comment) between a symbol and
its dependees, then the indentation is not in effect.

Move the symbol to the top of the file to guarantee the indentation in
the menuconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/udpcast/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index 2f98610..0424db7 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -1,3 +1,7 @@
+comment "udpcast needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_UDPCAST
 	bool "udpcast"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -8,10 +12,6 @@ config BR2_PACKAGE_UDPCAST
 
 	  http://www.udpcast.linux.lu/
 
-comment "udpcast needs a toolchain w/ threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 if BR2_PACKAGE_UDPCAST
 
 menu "udpcast tools selection"
-- 
1.9.1
