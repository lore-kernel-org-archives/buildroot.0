From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  3 Apr 2013 07:50:26 -0300
Subject: [Buildroot] [PATCH] dtach: needs mmu
Message-ID: <1364986226-12800-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/b07f6f05552aa9c8850ec8d9f67b2aa666dffbf4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dtach/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dtach/Config.in b/package/dtach/Config.in
index 033536b..bea112b 100644
--- a/package/dtach/Config.in
+++ b/package/dtach/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DTACH
 	bool "dtach"
+	depends on BR2_USE_MMU # fork()
 	help
 	  dtach is a tiny program that emulates the detach feature of screen,
 	  allowing you to run a program in an environment that is protected
-- 
1.8.1.5
