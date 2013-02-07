From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  7 Feb 2013 07:37:52 -0300
Subject: [Buildroot] [PATCH] coreutils: needs mmu
Message-ID: <1360233472-15279-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/bb975d928c08d31d0c1ecfb9519034865120b244/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/coreutils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index bfd6f26..c416ab1 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_COREUTILS
 	bool "coreutils"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	help
 	  All of the basic file/text/shell utilities.  These are the
 	  core utilities which are expected to exist on every system.
-- 
1.7.12.4
