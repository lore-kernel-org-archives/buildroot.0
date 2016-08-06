From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Aug 2016 11:58:00 +0200
Subject: [Buildroot] [PATCH] package/ncdu: needs MMU
Message-ID: <1470477480-10166-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses the system() function, which calls fork().

Fixes:
    http://autobuild.buildroot.org/results/642/642f408d384a32033a677d56e6e3cdf572bd798b/
    http://autobuild.buildroot.org/results/026/026657e624928ed6bede5719f96c2eee797076cf/
    http://autobuild.buildroot.org/results/86b/86b66ed92fb714795ba70c228d4d448a1b61cee0/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
2.7.4
