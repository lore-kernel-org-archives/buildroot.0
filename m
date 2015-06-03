From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:36 +0200
Subject: [Buildroot] [PATCH 19/32 v2] package/matchbox-startup-monitor:
	invert dependency chain
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <67858d3bb5b7c4c7f5aafdc99d6342ae835922f6.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously, matchbox-startup-monitor was forcibly enabled whenever
startup-notification was. Now that it has a prompt, it merely defaults
to 'y' in this case, leaving the user the possibility to disable it.
This is not very logical.

Instead, invert the logic, and select startup-notification from
matchbox-startup-monitor.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/matchbox-startup-monitor/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/matchbox-startup-monitor/Config.in b/package/matchbox-startup-monitor/Config.in
index 15dac60..9dce60e 100644
--- a/package/matchbox-startup-monitor/Config.in
+++ b/package/matchbox-startup-monitor/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR
 	bool "matchbox-startup-monitor"
 	select BR2_PACKAGE_MATCHBOX_LIB
-	default y if BR2_PACKAGE_STARTUP_NOTIFICATION
+	select BR2_PACKAGE_STARTUP_NOTIFICATION
 	help
 	  Matchbox Panel Startup Monitor Applet.
-- 
1.9.1
