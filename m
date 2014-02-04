From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  4 Feb 2014 20:41:44 +0200
Subject: [Buildroot] [PATCH] libsigsegv: disable for xtensa
Message-ID: <cde857be269d16821c13a0714b7d5a922edc4940.1391539304.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The xtensa uClibc port does not provide the ucontext.h context manipulation
routines that libsigsegv needs.

Fixes:
http://autobuild.buildroot.net/results/06d/06d091f2ea8d08a900dd7304bab5eeeeb85f7353/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libsigsegv/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index c46bb92ece94..563ca272d74e 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBSIGSEGV
 	bool "libsigsegv"
+	depends on !BR2_xtensa
 	help
 	  Library for handling page faults in user mode.
 
-- 
1.8.5.3
