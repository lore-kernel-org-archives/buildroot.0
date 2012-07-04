From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  4 Jul 2012 08:34:54 -0300
Subject: [Buildroot] [PATCH] bonnie: needs MMU
Message-ID: <1341401694-28043-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/08cc7fdf21f8e51b793c0cf7a51b3f190ea7668c/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bonnie/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bonnie/Config.in b/package/bonnie/Config.in
index 9dda4b6..91b1e96 100644
--- a/package/bonnie/Config.in
+++ b/package/bonnie/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BONNIE
 	bool "bonnie++"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	help
 	  Filesystem tester
 
-- 
1.7.8.6
