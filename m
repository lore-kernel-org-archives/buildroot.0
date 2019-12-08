From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2019 08:37:54 +0100
Subject: [Buildroot] [git commit] package/upower: bump to version 0.9.11
Message-ID: <20191208073534.EBDA1886A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79c23dc89a44f1fdd96599384e6cae54c6d2bd74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Add hash for license file
- Drop host-intltool dependency for $(TARGET_NLS_DEPENDENCIES), see
  https://gitlab.freedesktop.org/upower/upower/commit/d15e95f785b21be3ca45e9e2cc7143779c0b5176

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-daemon-fix-get_critical_action.patch      | 34 ----------------------
 package/upower/upower.hash                         |  3 +-
 package/upower/upower.mk                           |  4 +--
 3 files changed, 4 insertions(+), 37 deletions(-)

diff --git a/package/upower/0001-daemon-fix-get_critical_action.patch b/package/upower/0001-daemon-fix-get_critical_action.patch
deleted file mode 100644
index 02fc55c484..0000000000
--- a/package/upower/0001-daemon-fix-get_critical_action.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 28cee8e2845b094488c337c4ecfa84ada0b6be60 Mon Sep 17 00:00:00 2001
-From: Martin Pitt <martin.pitt@ubuntu.com>
-Date: Tue, 23 Feb 2016 09:51:07 +0100
-Subject: [PATCH] daemon: fix get_critical_action()
-
-Fix copy&paste error from e7e9156f that called the wrong _complete_ function
-for up_daemon_get_critical_action().
-
-https://bugs.freedesktop.org/show_bug.cgi?id=94262
-
-[rebase on 0.99.4]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/up-daemon.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/up-daemon.c b/src/up-daemon.c
-index be14cbe..e95f904 100644
---- a/src/up-daemon.c
-+++ b/src/up-daemon.c
-@@ -435,8 +435,8 @@ up_daemon_get_critical_action (UpExportedDaemon *skeleton,
- 			       GDBusMethodInvocation *invocation,
- 			       UpDaemon *daemon)
- {
--	up_exported_daemon_complete_get_display_device (skeleton, invocation,
--							up_backend_get_critical_action (daemon->priv->backend));
-+	up_exported_daemon_complete_get_critical_action (skeleton, invocation,
-+							 up_backend_get_critical_action (daemon->priv->backend));
- 	return TRUE;
- }
- 
--- 
-2.9.3
-
diff --git a/package/upower/upower.hash b/package/upower/upower.hash
index 0df67b449d..e69ad20cbc 100644
--- a/package/upower/upower.hash
+++ b/package/upower/upower.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 9ca325a6ccef505529b268ebbbd9becd0ce65a65f6ac7ee31e2e5b17648037b0  upower-0.99.4.tar.xz
+sha256 64b5ffbfccd5bdb15d925777979a4dbee1a957f9eaeb158dc76175267eddbdef  upower-0.99.11.tar.xz
+sha256 c1753877db41d798d63369a825ad9225bbeb5e10a407be5fcd8de96182f1c50d  COPYING
diff --git a/package/upower/upower.mk b/package/upower/upower.mk
index 79dc5e87f2..8989ca9f5d 100644
--- a/package/upower/upower.mk
+++ b/package/upower/upower.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPOWER_VERSION = 0.99.4
+UPOWER_VERSION = 0.99.11
 UPOWER_SOURCE = upower-$(UPOWER_VERSION).tar.xz
 UPOWER_SITE = https://upower.freedesktop.org/releases
 UPOWER_LICENSE = GPL-2.0+
@@ -14,7 +14,7 @@ UPOWER_LICENSE_FILES = COPYING
 UPOWER_INSTALL_STAGING = YES
 
 UPOWER_DEPENDENCIES = \
-	host-intltool \
+	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf \
 	libgudev \
 	libusb \
