From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:32 +0200
Subject: [Buildroot] [PATCH 15/32 v2] package/matchbox: add missing
	dependencies to matchbox-lib
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <3473149613cc8c75e6d05319977f07bcd3c74937.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Most of the matchbox packages build-depend on matchbox-lib, but were not
selecting it from their Config.in.

Fix that.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/matchbox-common/Config.in          | 1 +
 package/matchbox-desktop/Config.in         | 1 +
 package/matchbox-fakekey/Config.in         | 1 +
 package/matchbox-keyboard/Config.in        | 1 +
 package/matchbox-startup-monitor/Config.in | 1 +
 5 files changed, 5 insertions(+)

diff --git a/package/matchbox-common/Config.in b/package/matchbox-common/Config.in
index f1c4ce3..33d6cc4 100644
--- a/package/matchbox-common/Config.in
+++ b/package/matchbox-common/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MATCHBOX_COMMON
 	bool "matchbox-common"
+	select BR2_PACKAGE_MATCHBOX_LIB
 	depends on BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
 	help
 	  Common desktop folders and matchbox-session script.
diff --git a/package/matchbox-desktop/Config.in b/package/matchbox-desktop/Config.in
index ed80c22..22c568b 100644
--- a/package/matchbox-desktop/Config.in
+++ b/package/matchbox-desktop/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MATCHBOX_DESKTOP
 	bool "matchbox-desktop"
+	select BR2_PACKAGE_MATCHBOX_LIB
 	select BR2_PACKAGE_ZLIB
 	help
 	  A PDA style application launcher or 'item browser'.
diff --git a/package/matchbox-fakekey/Config.in b/package/matchbox-fakekey/Config.in
index 334f3a2..c0cde42 100644
--- a/package/matchbox-fakekey/Config.in
+++ b/package/matchbox-fakekey/Config.in
@@ -1,2 +1,3 @@
 config BR2_PACKAGE_MATCHBOX_FAKEKEY
 	bool
+	select BR2_PACKAGE_MATCHBOX_LIB
diff --git a/package/matchbox-keyboard/Config.in b/package/matchbox-keyboard/Config.in
index 056a255..8bd2a79 100644
--- a/package/matchbox-keyboard/Config.in
+++ b/package/matchbox-keyboard/Config.in
@@ -3,5 +3,6 @@ config BR2_PACKAGE_MATCHBOX_KEYBOARD
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_MATCHBOX_FAKEKEY
+	select BR2_PACKAGE_MATCHBOX_LIB
 	help
 	  Virtual Keyboard
diff --git a/package/matchbox-startup-monitor/Config.in b/package/matchbox-startup-monitor/Config.in
index 95af5fc..522d7f7 100644
--- a/package/matchbox-startup-monitor/Config.in
+++ b/package/matchbox-startup-monitor/Config.in
@@ -1,3 +1,4 @@
 config BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR
 	bool
+	select BR2_PACKAGE_MATCHBOX_LIB
 	default y if BR2_PACKAGE_STARTUP_NOTIFICATION
-- 
1.9.1
