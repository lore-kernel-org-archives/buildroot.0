From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  3 Feb 2015 22:13:21 +0100
Subject: [Buildroot] [PATCH v1] util-linux: target command more needs ncurses
Message-ID: <1422998001-9377-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

configure: error: more selected, but required ncurses, tinfo or termcap
libraries not available

[1] http://autobuild.buildroot.net/results/f3b/f3b318c904b6325fd143a55f2f9fd1c55bb9cfd5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/util-linux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 78648c1..55c10f2 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -160,6 +160,7 @@ comment "nsenter needs a toolchain w/ headers >= 3.0"
 
 config BR2_PACKAGE_UTIL_LINUX_MORE
 	bool "more"
+	select BR2_PACKAGE_NCURSES
 	help
 	  File perusal filter for crt viewing
 
-- 
2.1.4
