From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 13 Feb 2013 07:03:43 -0300
Subject: [Buildroot] [PATCH] thttpd: needs mmu
Message-ID: <1360749823-26295-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/0b73d2b45a5bac94b65893725de46d87a9626b37/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/thttpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/thttpd/Config.in b/package/thttpd/Config.in
index 172a2d6..d359785 100644
--- a/package/thttpd/Config.in
+++ b/package/thttpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_THTTPD
 	bool "thttpd"
+	depends on BR2_USE_MMU # fork()
 	help
 	  thttpd is a simple, small, portable, fast, and secure HTTP server
 
-- 
1.7.12.4
