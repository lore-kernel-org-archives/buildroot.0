From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 24 Oct 2016 16:51:06 -0200
Subject: [Buildroot] [PATCH] util-linux: select ncurses when "pg" is selected
Message-ID: <1477335066-14783-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/63374203f32d2e9407531b53cd5d8f2665944fbe
http://autobuild.buildroot.net/results/6279cd6f45f54ed5857a2fc08a21d9e257b6bc4b
http://autobuild.buildroot.net/results/5604c56c0c92483d28e51eb4e70a9741c3c4effe

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/util-linux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 0c33919..9b70f9f 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -252,6 +252,7 @@ comment "nsenter needs a toolchain w/ headers >= 3.0"
 config BR2_PACKAGE_UTIL_LINUX_PG
 	bool "pg"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_NCURSES
 	help
 	  Browse pagewise through text files
 
-- 
2.7.4
