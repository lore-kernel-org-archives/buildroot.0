From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jul 2018 00:19:15 +0200
Subject: [Buildroot] [PATCH] network-manager: sync kernel headers comment
 with actual dependency
Message-ID: <20180630221915.448-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 52282828f06dc8aa3f721727f68a5096b9ed8b49
("package/network-manager: add patches to build with kernel headers
3.2"), network-manager was changed to build with kernel headers as old
as 3.2, instead of 3.7 before. The dependency was changed accordingly,
but the Config.in comment was not.

This commit fixes this inconsistency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 9602cc4a1a..ca508185f0 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -64,8 +64,8 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 
 endif
 
-comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.7, dynamic library"
+comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || \
 		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS
-- 
2.14.4
