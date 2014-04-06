From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  6 Apr 2014 11:23:07 +0200
Subject: [Buildroot] [PATCH 1/1] nut: needs mmu
Message-ID: <1396776187-6874-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While investigating on build failure [1], I realized that nut needs mmu since fork() is used.
So, conditions of this build failure are no longer encountered.

[1] http://autobuild.buildroot.net/results/961/96193e18782697c2af8813a7714b66b4ba1f3d1c//build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/nut/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nut/Config.in b/package/nut/Config.in
index 5b47e8b..7045787 100644
--- a/package/nut/Config.in
+++ b/package/nut/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NUT
 	bool "nut"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Network UPS tools
 
-- 
1.9.0
