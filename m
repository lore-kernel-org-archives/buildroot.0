From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 25 Feb 2013 07:20:49 -0300
Subject: [Buildroot] [PATCH] spawn-fcgi: needs mmu
Message-ID: <1361787649-13829-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/cb6605b223642e647981e697f17d89bb97e223a6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/spawn-fcgi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/spawn-fcgi/Config.in b/package/spawn-fcgi/Config.in
index 34cbbb1..59791e8 100644
--- a/package/spawn-fcgi/Config.in
+++ b/package/spawn-fcgi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SPAWN_FCGI
 	bool "spawn-fcgi"
+	depends on BR2_USE_MMU # fork()
 	help
 	  FastCGI process spawner.
 	  Project split from lighttpd.
-- 
1.7.12.4
