From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 22:21:41 +0100
Subject: [Buildroot] [git commit] package/coremark-pro: add dependency on
 threads
Message-ID: <20210111210308.68DA286DD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6627cea610ee11cbc02649c9b12cbe0b2b8e83b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Coremark-pro requires threads so add a depends on
BR2_TOOLCHAIN_HAS_THREADS.

Fixes:
- http://autobuild.buildroot.net/results/ab574485a7856fcf5cd643c154c44b4bfcb34a97/

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coremark-pro/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/coremark-pro/Config.in b/package/coremark-pro/Config.in
index dd6821056c..b0bf16f66f 100644
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
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
