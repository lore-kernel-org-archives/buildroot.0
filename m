From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Aug 2014 15:17:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/procps-ng: Depends on MMU
Message-ID: <1407590228-29118-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
  CCLD     pscommand
stacktrace.o: In function `_stack_trace':
stacktrace.c:(.text+0x56): undefined reference to `_fork'
stacktrace.o: In function `_debug':
stacktrace.c:(.text+0x25a): undefined reference to `_fork'

To reproduce use this defconfig
http://autobuild.buildroot.net/results/8d5/8d5ad404fab7ec2a501972ba9c08b0109e420b80/defconfig

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/procps-ng/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 7463fa8..43e8758 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PROCPS_NG
 	bool "procps-ng"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
-- 
1.7.10.4
