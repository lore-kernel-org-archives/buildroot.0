From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 10:08:30 +0200
Subject: [Buildroot] [PATCH 10/19] startup-notification: add dependency on
	xlib_libX11
In-Reply-To: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
Message-ID: <362791a7c18bf2c2528334543cb7baf36c4a89fe.1274428596.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/startup-notification/Config.in             |    2 ++
 .../startup-notification/startup-notification.mk   |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/startup-notification/Config.in b/package/startup-notification/Config.in
index 23fdf74..277d300 100644
--- a/package/startup-notification/Config.in
+++ b/package/startup-notification/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_STARTUP_NOTIFICATION
 	bool "startup-notification"
+	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XORG7
 	help
 	  Startup-notification is a library used to monitor application startup.
 
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index 62f067a..f70fcc1 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -9,6 +9,7 @@ STARTUP_NOTIFICATION_SITE = http://freedesktop.org/software/startup-notification
 STARTUP_NOTIFICATION_AUTORECONF = NO
 STARTUP_NOTIFICATION_INSTALL_STAGING = YES
 STARTUP_NOTIFICATION_INSTALL_TARGET = YES
+STARTUP_NOTIFICATION = xlib_libX11
 
 STARTUP_NOTIFICATION_CONF_ENV = lf_cv_sane_realloc=yes
 
-- 
1.6.3.3
