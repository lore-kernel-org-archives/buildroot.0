From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Aug 2012 21:44:15 +0200
Subject: [Buildroot] [git commit branch/next] toolchain-external: microblaze
	toolchains are glibc-based
Message-ID: <20120802195306.0A1BC96CE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f6e2b4a9518b9608f3cc8cc7281bac382da41eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e34802d..f86ed74 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -542,11 +542,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1
 config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	bool "Xilinx Little Endian Microblaze GNU Tools"
 	depends on BR2_microblazeel
-	select BR2_LARGEFILE
-	select BR2_INET_IPV6
-	select BR2_INET_RPC
-	select BR2_ENABLE_LOCALE
-	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	help
 	  Toolchain for the Microblaze architecture, from
 	  http://wiki.xilinx.com/mb-gnu-tools
@@ -554,11 +550,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	bool "Xilinx Big Endian Microblaze GNU Tools"
 	depends on BR2_microblazebe
-	select BR2_LARGEFILE
-	select BR2_INET_IPV6
-	select BR2_INET_RPC
-	select BR2_ENABLE_LOCALE
-	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	help
 	  Toolchain for the Microblaze architecture, from
 	  http://wiki.xilinx.com/mb-gnu-tools
