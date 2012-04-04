From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Apr 2012 22:46:07 +0200
Subject: [Buildroot] [git commit] toolchain/microblaze: fix up big-endian
	characteristics
Message-ID: <20120405111656.2001096A0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1eb46725de8c74f28ed5d3894bd81b7d9ab35272
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The big-endian microblaze external toolchain is missing vital
characteristics being set, such as LARGEFILE support, IPV6 and so on.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Stephan Hoffmann <sho@reLinux.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 991684f..49ea7fa 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -461,6 +461,11 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	bool "Xilinx Big Endian Microblaze GNU Tools"
 	depends on BR2_microblazebe
+	select BR2_LARGEFILE
+	select BR2_INET_IPV6
+	select BR2_INET_RPC
+	select BR2_ENABLE_LOCALE
+	select BR2_USE_WCHAR
 	help
 	  Toolchain for the Microblaze architecture, from
 	  http://wiki.xilinx.com/mb-gnu-tools
