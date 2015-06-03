From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:35 +0200
Subject: [Buildroot] [PATCH 18/32 v2] package/matchbox: finally add prompts
	to all sub-packages
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <5f4b5cf38761c88677667e03bf7b67f2c699a853.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently do not have that many packages without a prompt, and when
we do, they are limited to system-related packages that can't be
selected or are forcibly selected under various system-specific
conditions.

This is clearly not the case for the matchbox sub-packages, so just give
them a prompt, even when they are forcibly selected by the main matchbox
package, and can't be selected without it.

That will at least tell the user those packages exist and are to be
built.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox-fakekey/Config.in         | 4 +++-
 package/matchbox-lib/Config.in             | 4 +++-
 package/matchbox-startup-monitor/Config.in | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/matchbox-fakekey/Config.in b/package/matchbox-fakekey/Config.in
index 97413ab..1a1f134 100644
--- a/package/matchbox-fakekey/Config.in
+++ b/package/matchbox-fakekey/Config.in
@@ -1,4 +1,6 @@
 config BR2_PACKAGE_MATCHBOX_FAKEKEY
-	bool
+	bool "matchbox-fakekey"
 	select BR2_PACKAGE_MATCHBOX_LIB
 	select BR2_PACKAGE_XLIB_LIBXTST
+	help
+	  Library for simulating key press events under X11.
diff --git a/package/matchbox-lib/Config.in b/package/matchbox-lib/Config.in
index 480e6fe..e50a543 100644
--- a/package/matchbox-lib/Config.in
+++ b/package/matchbox-lib/Config.in
@@ -1,2 +1,4 @@
 config BR2_PACKAGE_MATCHBOX_LIB
-	bool
+	bool "matchbox-lib"
+	help
+	  Matchbox common functionality library.
diff --git a/package/matchbox-startup-monitor/Config.in b/package/matchbox-startup-monitor/Config.in
index 522d7f7..15dac60 100644
--- a/package/matchbox-startup-monitor/Config.in
+++ b/package/matchbox-startup-monitor/Config.in
@@ -1,4 +1,6 @@
 config BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR
-	bool
+	bool "matchbox-startup-monitor"
 	select BR2_PACKAGE_MATCHBOX_LIB
 	default y if BR2_PACKAGE_STARTUP_NOTIFICATION
+	help
+	  Matchbox Panel Startup Monitor Applet.
-- 
1.9.1
