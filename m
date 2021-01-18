From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:11:41 +0100
Subject: [Buildroot] [git commit] Revert "package/coremark-pro: add
 dependency on threads"
Message-ID: <20210118205304.EB426870BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9dd1b20015caae69a84e7430e80d9c125cb35186
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 6627cea610ee11cbc02649c9b12cbe0b2b8e83b6.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coremark-pro/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/coremark-pro/Config.in b/package/coremark-pro/Config.in
index b0bf16f66f..dd6821056c 100644
--- a/package/coremark-pro/Config.in
+++ b/package/coremark-pro/Config.in
@@ -1,13 +1,8 @@
 config BR2_PACKAGE_COREMARK_PRO
 	bool "coremark-pro"
 	depends on BR2_USE_MMU # perl uses fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_PERL
 	help
 	  CoreMark-PRO is a comprehensive, advanced processor benchmark.
 
 	  https://www.eembc.org/coremark-pro/
-
-comment "coremark-pro needs a toolchain w/ threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
