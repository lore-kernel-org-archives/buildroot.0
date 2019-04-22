From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 09:34:24 +0200
Subject: [Buildroot] [PATCH] package/linux-tools: fix kconfig coding style
Message-ID: <20190422073424.1116-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix coding style introduced in d5edfa6eef (package/linux-tools/perf: add
dependency on 32-bit sync builtins).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
---
 package/linux-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 90b4825fee..1c660f76f5 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -45,8 +45,8 @@ config BR2_PACKAGE_LINUX_TOOLS_PCI
 
 config BR2_PACKAGE_LINUX_TOOLS_PERF
 	bool "perf"
-	select BR2_PACKAGE_LINUX_TOOLS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	select BR2_PACKAGE_LINUX_TOOLS
 	help
 	  perf (sometimes "Perf Events" or perf tools, originally
 	  "Performance Counters for Linux") - is a performance
-- 
2.14.1
