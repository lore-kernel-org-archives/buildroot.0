From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 6 Jul 2016 07:51:13 +0200
Subject: [Buildroot] [PATCH] bfin: default to bf532,
	disable bf6xx for internal toolchain
Message-ID: <20160706055113.GA25276@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default Blackfin processor in Buildroot isn't supported by
gcc 6.1.0, so use bf532 as default. Disable any bf6xx processors
for internal toolchain users.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 arch/Config.in.bfin | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 415fc89..9ffdb94 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -1,17 +1,21 @@
 choice
 	prompt "Target CPU"
 	depends on BR2_bfin
-	default BR2_bf609
+	default BR2_bf532
 	help
 	  Specify target CPU
 config BR2_bf606
 	bool "bf606"
+	depends on BR2_TOOLCHAIN_EXTERNAL
 config BR2_bf607
 	bool "bf607"
+	depends on BR2_TOOLCHAIN_EXTERNAL
 config BR2_bf608
 	bool "bf608"
+	depends on BR2_TOOLCHAIN_EXTERNAL
 config BR2_bf609
 	bool "bf609"
+	depends on BR2_TOOLCHAIN_EXTERNAL
 config BR2_bf512
 	bool "bf512"
 config BR2_bf514
-- 
2.1.4
