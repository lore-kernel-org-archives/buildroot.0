From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 17:58:04 +0100
Subject: [Buildroot] [git commit] package/udpcast: move comment around,
	to keep proper indentation
Message-ID: <20151228165835.11F437F8EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e34e2611aa56811ced9f40b77e0751308c8bf57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Kconfig, when there is an item (like a comment) between a symbol and
its dependees, then the indentation is not in effect.

Move the symbol to the top of the file to guarantee the indentation in
menuconfig.

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
