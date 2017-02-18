From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Feb 2017 15:52:57 +0100
Subject: [Buildroot] [PATCH 1/2] package/sunxi-mali: reorder select/depends
Message-ID: <20170218145258.10213-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From [1]:
"Even though the ordering has absolutely no consequences in Kconfig, it
is not logical (when reading). It is more logical and far easier to
understand when depends come first, followed by the selects."

Also, the Config.in example in the manual suggests to use this coding
style [2].

[1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
[2] https://buildroot.org/downloads/manual/manual.html#writing-rules-config-in

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/sunxi-mali/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index 5e3ae4c..c6754c2 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_SUNXI_MALI
 	bool "sunxi-mali"
+	depends on BR2_arm
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_LIBUMP
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_arm
 	help
 	  Install the ARM Mali drivers for sunxi based systems (i.e
 	  systems based on ARM Allwinner SoCs). This driver requires
-- 
2.9.3
