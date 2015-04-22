From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:29 +0200
Subject: [Buildroot] [PATCH 18/30] package/matchbox: finally add prompts to
	all sub-packages
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <a90f4e35e2853ec395a481fbd2a504212a3591ae.1429725549.git.yann.morin.1998@free.fr>
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
 package/matchbox/matchbox-fakekey/Config.in         | 4 +++-
 package/matchbox/matchbox-lib/Config.in             | 4 +++-
 package/matchbox/matchbox-startup-monitor/Config.in | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/matchbox/matchbox-fakekey/Config.in b/package/matchbox/matchbox-fakekey/Config.in
index 4708292..889d039 100644
--- a/package/matchbox/matchbox-fakekey/Config.in
+++ b/package/matchbox/matchbox-fakekey/Config.in
@@ -1,3 +1,5 @@
 config BR2_PACKAGE_MATCHBOX_FAKEKEY
-	bool
+	bool "matchbox-fakekey"
 	select BR2_PACKAGE_XLIB_LIBXTST
+	help
+	  Library for simulating key press events under X11.
diff --git a/package/matchbox/matchbox-lib/Config.in b/package/matchbox/matchbox-lib/Config.in
index 480e6fe..e50a543 100644
--- a/package/matchbox/matchbox-lib/Config.in
+++ b/package/matchbox/matchbox-lib/Config.in
@@ -1,2 +1,4 @@
 config BR2_PACKAGE_MATCHBOX_LIB
-	bool
+	bool "matchbox-lib"
+	help
+	  Matchbox common functionality library.
diff --git a/package/matchbox/matchbox-startup-monitor/Config.in b/package/matchbox/matchbox-startup-monitor/Config.in
index 92a1241..744e2b6 100644
--- a/package/matchbox/matchbox-startup-monitor/Config.in
+++ b/package/matchbox/matchbox-startup-monitor/Config.in
@@ -1,3 +1,5 @@
 config BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR
-	bool
+	bool "matchbox-startup-monitor"
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
+	help
+	  Matchbox Panel Startup Monitor Applet.
-- 
1.9.1
