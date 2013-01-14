From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Jan 2013 08:12:20 -0300
Subject: [Buildroot] [PATCH] links: needs mmu
Message-ID: <1358161940-28777-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/1c1456b19d7483475430b390291240733dbbf21b

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/links/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/links/Config.in b/package/links/Config.in
index 474aa6a..141eaf2 100644
--- a/package/links/Config.in
+++ b/package/links/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LINKS
 	bool "links"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Graphics and text mode WWW browser (kind of like lynx).
 
-- 
1.7.12.4
