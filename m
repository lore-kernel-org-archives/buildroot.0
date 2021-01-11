From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 11 Jan 2021 22:13:53 +1300
Subject: [Buildroot] [PATCH] package/coremark-pro: fix build without threads
Message-ID: <20210111091353.6978-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Coremark-pro requires threads so add a depends on
BR2_TOOLCHAIN_HAS_THREADS.

Fixes:
- http://autobuild.buildroot.net/results/ab574485a7856fcf5cd643c154c44b4bfcb34a97/

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/coremark-pro/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/coremark-pro/Config.in b/package/coremark-pro/Config.in
index dd6821056c..362826f47b 100644
--- a/package/coremark-pro/Config.in
+++ b/package/coremark-pro/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_COREMARK_PRO
 	bool "coremark-pro"
 	depends on BR2_USE_MMU # perl uses fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_PERL
 	help
 	  CoreMark-PRO is a comprehensive, advanced processor benchmark.
 
 	  https://www.eembc.org/coremark-pro/
+
+comment "coremark-pro needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
-- 
2.30.0
