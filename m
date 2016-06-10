From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Jun 2016 06:32:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/igmpproxy: uses fork, needs mmu
Message-ID: <1465533178-28513-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/4ee/4ee081212614d86a3b2b74274f38825f7a5b3f6f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/igmpproxy/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/igmpproxy/Config.in b/package/igmpproxy/Config.in
index a9e4c1c..37f39b2 100644
--- a/package/igmpproxy/Config.in
+++ b/package/igmpproxy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IGMPPROXY
 	bool "igmpproxy"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	help
 	  A simple dynamic Multicast Routing Daemon
@@ -10,4 +11,5 @@ config BR2_PACKAGE_IGMPPROXY
 	  http://sourceforge.net/projects/igmpproxy/
 
 comment "igmpproxy needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
-- 
2.8.1
