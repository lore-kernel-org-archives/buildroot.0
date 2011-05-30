From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2011 23:57:00 +0200
Subject: [Buildroot] [PATCH 5/8] Mark some packages as not usable on non-MMU
	systems
In-Reply-To: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
Message-ID: <35ff9eeb8007f6f1586eaead5e36c1d83a165178.1306792524.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/Config.in               |    2 ++
 package/input-event-daemon/Config.in |    2 ++
 package/kbd/Config.in                |    2 ++
 package/setserial/Config.in          |    2 ++
 package/sysstat/Config.in            |    2 ++
 5 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 5e60bb0..d387abd 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_GPSD
 	bool "gpsd"
+	# Uses fork()
+	depends on BR2_USE_MMU
 	help
 	  gpsd is a service daemon that monitors one or more GPSes or AIS
 	  receivers attached to a host computer through serial or USB ports,
diff --git a/package/input-event-daemon/Config.in b/package/input-event-daemon/Config.in
index edf2886..84177fd 100644
--- a/package/input-event-daemon/Config.in
+++ b/package/input-event-daemon/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_INPUT_EVENT_DAEMON
 	bool "input-event-daemon"
+	# Uses fork()
+	depends on BR2_USE_MMU
 	help
 	  input-event-daemon is a daemon which executes
 	  a user-defined command on input events, such as
diff --git a/package/kbd/Config.in b/package/kbd/Config.in
index 1fe4dff..a23b70a 100644
--- a/package/kbd/Config.in
+++ b/package/kbd/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_KBD
 	bool "kbd"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	# Uses fork()
+	depends on BR2_USE_MMU
 	help
 	  Keytable files and keyboard utilities.
 
diff --git a/package/setserial/Config.in b/package/setserial/Config.in
index 2f6d6ee..cffe50e 100644
--- a/package/setserial/Config.in
+++ b/package/setserial/Config.in
@@ -1,4 +1,6 @@
 config BR2_PACKAGE_SETSERIAL
 	bool "setserial"
+	# Uses fork()
+	depends on BR2_USE_MMU
 	help
 	     Setserial : configuration of serial ports
diff --git a/package/sysstat/Config.in b/package/sysstat/Config.in
index 28274d9..6e62ff1 100644
--- a/package/sysstat/Config.in
+++ b/package/sysstat/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_SYSSTAT
 	bool "sysstat"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	# Uses fork()
+	depends on BR2_USE_MMU
 	help
           The sysstat utilities are a collection of performance
           monitoring tools for Linux. These include sar, sadf, mpstat,
-- 
1.7.1
