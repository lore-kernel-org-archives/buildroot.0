From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 22 Jun 2013 23:39:42 -0700
Subject: [Buildroot] [PATCH 1/2] dash: needs mmu
Message-ID: <1371969583-29063-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/9ff/9ffde0aaa717efb6a5c0ef1e4e7f2cdd0621c150/

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/dash/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dash/Config.in b/package/dash/Config.in
index 20970aa..e06087e 100644
--- a/package/dash/Config.in
+++ b/package/dash/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DASH
 	bool "dash"
+	depends on BR2_USE_MMU # fork()
 	help
 	  The Debian/Linux port of the NetBSD version of
 	  ash (the Almquist SHell).
-- 
1.7.10.4
