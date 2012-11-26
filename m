From: Chris Zankel <chris@zankel.net>
Date: Mon, 26 Nov 2012 14:49:42 -0800
Subject: [Buildroot] [PATCH 2/2] xtensa: disable package strace for Xtensa
Message-ID: <50b40b38.e9bd440a.495e.ffffea20@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current version of strace does not support the Xtensa architecture.

Signed-off-by: Chris Zankel <chris@zankel.net>
---
 package/strace/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index bbb582a..4b20377 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
+	depends on !BR2_xtensa
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
-- 
1.7.9.5
