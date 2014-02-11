From: Anton Kolesov <anton.kolesov@synopsys.com>
Date: Tue, 11 Feb 2014 13:19:12 +0400
Subject: [Buildroot] [PATCH] libsigsegv: disable for ARC
Message-ID: <1392110352-29340-1-git-send-email-anton.kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ARC uClibc port doesn't provide ucontext_i.sym file required to enable
context manipulation routines that libsigsegv needs.

Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
---
 package/libsigsegv/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index 563ca27..4abb2a4 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSIGSEGV
 	bool "libsigsegv"
 	depends on !BR2_xtensa
+	depends on !BR2_arc
 	help
 	  Library for handling page faults in user mode.
 
-- 
1.8.4.1
