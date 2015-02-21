From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 21 Feb 2015 10:37:33 -0300
Subject: [Buildroot] [PATCH] util-linux: setterm requires ncurses
Message-ID: <1424525853-29212-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/7c0/7c02c0de18059bd1a633267b43a8a5e9ee2fdfdc/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/util-linux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 960a21c..b416a34 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -223,6 +223,7 @@ config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 
 config BR2_PACKAGE_UTIL_LINUX_SETTERM
 	bool "setterm"
+	select BR2_PACKAGE_NCURSES
 	help
 	  Set terminal attributes
 
-- 
2.0.5
