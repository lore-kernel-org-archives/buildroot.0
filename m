From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:05:25 +0200
Subject: [Buildroot] [git commit] package/matchbox-startup-monitor: invert
	dependency chain
Message-ID: <20150609211052.8E13781D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbb13a764387af71bb8a7937bdd37445c9cac6b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously, matchbox-startup-monitor was forcibly enabled whenever
startup-notification was. Now that it has a prompt, it merely defaults
to 'y' in this case, leaving the user the possibility to disable it.
This is not very logical.

Instead, invert the logic, and select startup-notification from
matchbox-startup-monitor.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox-startup-monitor/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
