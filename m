From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 11 Mar 2012 17:49:24 +0100
Subject: [Buildroot] [PATCH 3/5] Microblaze: Added Xilinx toolchain options
Message-ID: <4F5CD794.7000804@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stephan Hoffmann <sho at relinux.de

---
 toolchain/toolchain-external/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index b417cb7..2093180 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -433,6 +433,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1
 config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	bool "Xilinx Little Endian Microblaze GNU Tools"
 	depends on BR2_microblazeel
+	select BR2_LARGEFILE
+	select BR2_INET_IPV6
+	select BR2_INET_RPC
+	select BR2_ENABLE_LOCALE
+	select BR2_USE_WCHAR
 	help
 	  Toolchain for the Microblaze architecture, from
 	  http://wiki.xilinx.com/mb-gnu-tools
-- 
1.7.0.4



-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho@reLinux.de
