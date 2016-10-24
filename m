From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 22:42:34 +0200
Subject: [Buildroot] [git commit] util-linux: select ncurses when "pg" is
	selected
Message-ID: <20161024204247.6E9D081E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b976195d995ecd2d82c5cf76af2e4f0ef8521133
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/63374203f32d2e9407531b53cd5d8f2665944fbe
http://autobuild.buildroot.net/results/6279cd6f45f54ed5857a2fc08a21d9e257b6bc4b
http://autobuild.buildroot.net/results/5604c56c0c92483d28e51eb4e70a9741c3c4effe

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
