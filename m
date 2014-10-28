From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 22:01:16 +0100
Subject: [Buildroot] [git commit] package/tvheadend: Needs iconv()
Message-ID: <20141028210157.20D05B1D94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=299741c485616ef033d220c24726ff3d54a9709f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
CC              src/intlconv.o
src/intlconv.c:1:19: fatal error: iconv.h: No such file or directory
 #include <iconv.h>

with this defconfig

BR2_arm=y
BR2_cortex_a15=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_TVHEADEND=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index bb71d81..f7182a1 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_TVHEADEND
 	# architecture is avr32, which uses gcc 4.2.
 	depends on !BR2_avr32
 	select BR2_PACKAGE_DTV_SCAN_TABLES
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Tvheadend is a TV streaming server for Linux supporting DVB-S,
