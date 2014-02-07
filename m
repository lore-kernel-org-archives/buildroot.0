From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Feb 2014 08:41:03 -0300
Subject: [Buildroot] [PATCH] joe: needs mmu
Message-ID: <1391773263-11779-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/f92/f920c85244afffe38497459753bf005946001d0d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/joe/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/joe/Config.in b/package/joe/Config.in
index e15b0f2..7b3df82 100644
--- a/package/joe/Config.in
+++ b/package/joe/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_JOE
 	bool "joe"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Joe's Own Editor
 
-- 
1.8.3.2
