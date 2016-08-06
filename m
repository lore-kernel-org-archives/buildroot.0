From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2016 12:12:55 +0200
Subject: [Buildroot] [git commit] package/ncdu: needs MMU
Message-ID: <20160806101316.784F281DA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f8bab11571813a7e641ae1d1193b25abf4270d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It uses the system() function, which calls fork().

Fixes:
    http://autobuild.buildroot.org/results/642/642f408d384a32033a677d56e6e3cdf572bd798b/
    http://autobuild.buildroot.org/results/026/026657e624928ed6bede5719f96c2eee797076cf/
    http://autobuild.buildroot.org/results/86b/86b66ed92fb714795ba70c228d4d448a1b61cee0/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncdu/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncdu/Config.in b/package/ncdu/Config.in
index dac7444..0e44034 100644
--- a/package/ncdu/Config.in
+++ b/package/ncdu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NCDU
 	bool "ncdu"
+	depends on BR2_USE_MMU # system()
 	select BR2_PACKAGE_NCURSES
 	help
 	  ncdu is a disk usage analyzer with an ncurses interface
