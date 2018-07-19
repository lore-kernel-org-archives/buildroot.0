From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 12:08:41 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] network-manager: sync
 kernel headers comment with actual dependency
Message-ID: <20180719100626.2A25788E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cb8240149416db828874418e15a370576193717
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

In commit 52282828f06dc8aa3f721727f68a5096b9ed8b49
("package/network-manager: add patches to build with kernel headers
3.2"), network-manager was changed to build with kernel headers as old
as 3.2, instead of 3.7 before. The dependency was changed accordingly,
but the Config.in comment was not.

This commit fixes this inconsistency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 760dc48e15110e90b9aebb49ffcd35648b013c5e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 72658c1278..ccf795a743 100644
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
