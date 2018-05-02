From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 May 2018 08:05:40 +0200
Subject: [Buildroot] [PATCH 4/4] package/transmission: remove
 BR2_PACKAGE_TRANSMISSION_REMOTE
In-Reply-To: <20180502060540.11628-1-bernd.kuhls@t-online.de>
References: <20180502060540.11628-1-bernd.kuhls@t-online.de>
Message-ID: <20180502060540.11628-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream does not provide a configure option --enable-remote.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                     | 7 +++++++
 package/transmission/Config.in       | 5 -----
 package/transmission/transmission.mk | 6 ------
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3d8b28c5fe..418bac3898 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.05"
 
+config BR2_PACKAGE_TRANSMISSION_REMOTE
+	bool "transmission remote tool option removed"
+	select BR2_LEGACY
+	help
+	  Upstream does not provide a configure option for the tool
+	  transmission-remote
+
 config BR2_PACKAGE_IQVLINUX
 	bool "iqvlinux package removed"
 	select BR2_LEGACY
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 2110e52ac6..dac4d1b330 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -32,11 +32,6 @@ config BR2_PACKAGE_TRANSMISSION_DAEMON
 	help
 	  Install transmission daemon.
 
-config BR2_PACKAGE_TRANSMISSION_REMOTE
-	bool "transmission-remote"
-	help
-	  Install transmission remote management tool.
-
 config BR2_PACKAGE_TRANSMISSION_GTK
 	bool "transmission-gtk"
 	depends on BR2_PACKAGE_LIBGTK3 && BR2_SYSTEM_ENABLE_NLS
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index cb1b8f6cdd..00652e7f4c 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -75,12 +75,6 @@ else
 TRANSMISSION_CONF_OPTS += --disable-daemon
 endif
 
-ifeq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
-TRANSMISSION_CONF_OPTS += --enable-remote
-else
-TRANSMISSION_CONF_OPTS += --disable-remote
-endif
-
 ifeq ($(BR2_PACKAGE_TRANSMISSION_GTK),y)
 TRANSMISSION_CONF_OPTS += --with-gtk
 TRANSMISSION_DEPENDENCIES += libgtk3
-- 
2.14.2
