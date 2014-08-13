From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Wed, 13 Aug 2014 11:02:48 +0530
Subject: [Buildroot] [PATCH] procps-ng: Depends on MMU
Message-ID: <1407907968-2554-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package needs MMU. Hence added dependency on BR2_USE_MMU

Fixes:
http://autobuild.buildroot.net/results/f24/f24aa16857e91fb6b03f9ac7ab0442fedcab8546//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
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
1.7.9.5
