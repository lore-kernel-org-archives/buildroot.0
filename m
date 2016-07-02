From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  2 Jul 2016 15:59:15 +0200
Subject: [Buildroot] [PATCH 9/9] package/systemd: Sort menuconfig
	alphabetically
In-Reply-To: <1467467955-14609-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467467955-14609-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467467955-14609-9-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/Config.in | 262 +++++++++++++++++++++++-----------------------
 1 file changed, 131 insertions(+), 131 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index c870138..da08168 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -69,11 +69,6 @@ if BR2_PACKAGE_SYSTEMD
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
-config BR2_PACKAGE_SYSTEMD_KDBUS
-	bool "enable kdbus support"
-	help
-	  Enable kdbus support for Systemd.
-
 config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 	bool "HTTP server for journal events"
 	select BR2_PACKAGE_LIBMICROHTTPD
@@ -84,16 +79,13 @@ config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
 
-config BR2_PACKAGE_SYSTEMD_HWDB
-	bool "enable hwdb installation"
-	default y
+config BR2_PACKAGE_SYSTEMD_BACKLIGHT
+	bool "enable backlight support"
 	help
-	  Enables hardware database installation to /usr/lib/udev/hwdb.d
-
-	  Disabling this option improves first boot time (or every boot
-	  time in case of initramfs images) and saves several MB space.
+	  systemd-backlight is a service that restores the display
+	  backlight brightness at early boot and saves it at shutdown.
 
-	  https://www.freedesktop.org/software/systemd/man/hwdb.html
+	  http://www.freedesktop.org/software/systemd/man/systemd-backlight at .service.html
 
 config BR2_PACKAGE_SYSTEMD_BINFMT
 	bool "enable binfmt tool"
@@ -103,42 +95,14 @@ config BR2_PACKAGE_SYSTEMD_BINFMT
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-binfmt.service.html
 
-config BR2_PACKAGE_SYSTEMD_VCONSOLE
-	bool "enable vconsole tool"
-	help
-	  systemd-vconsole-setup is an early boot service that
-	  configures the virtual console font and console keymap.
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
-
-config BR2_PACKAGE_SYSTEMD_QUOTACHECK
-	bool "enable quotacheck tools"
-	help
-	  systemd-quotacheck is a service responsible for file system
-	  quota checks. It is run once at boot after all necessary
-	  file systems are mounted. It is pulled in only if at least
-	  one file system has quotas enabled.
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
-
-config BR2_PACKAGE_SYSTEMD_TMPFILES
-	bool "enable tmpfiles support"
-	default y
-	help
-	  systemd-tmpfiles creates, deletes, and cleans up volatile
-	  and temporary files and directories, based on the
-	  configuration file format and location specified in
-	  tmpfiles.d(5).
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
-
-config BR2_PACKAGE_SYSTEMD_SYSUSERS
-	bool "enable sysusers support"
+config BR2_PACKAGE_SYSTEMD_COREDUMP
+	bool "enable coredump hook"
 	help
-	  systemd-sysusers creates system users and groups, based on
-	  the file format and location specified in sysusers.d(5).
+	  systemd-coredump can be used as a helper binary by the
+	  kernel when a user space program receives a fatal signal and
+	  dumps core.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-sysusers.html
+	  http://www.freedesktop.org/software/systemd/man/systemd-coredump.html
 
 config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
 	bool "enable firstboot support"
@@ -149,47 +113,33 @@ config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-firstboot.html
 
-config BR2_PACKAGE_SYSTEMD_RANDOMSEED
-	bool "enable random-seed support"
-	help
-	  systemd-random-seed is a service that restores the random
-	  seed of the system at early boot and saves it at
-	  shutdown. Saving/restoring the random seed across boots
-	  increases the amount of available entropy early at boot.
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
-
-config BR2_PACKAGE_SYSTEMD_BACKLIGHT
-	bool "enable backlight support"
+config BR2_PACKAGE_SYSTEMD_HIBERNATE
+	bool "enable hibernation support"
 	help
-	  systemd-backlight is a service that restores the display
-	  backlight brightness at early boot and saves it at shutdown.
+	  When this features is enabled, additional tools and services
+	  are built to support suspending and resuming the system.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-backlight at .service.html
+	  http://www.freedesktop.org/software/systemd/man/systemd-sleep.html
 
-config BR2_PACKAGE_SYSTEMD_RFKILL
-	bool "enable rfkill tools"
+config BR2_PACKAGE_SYSTEMD_HOSTNAMED
+	bool "enable hostname daemon"
+	default y
 	help
-	  systemd-rfkill is a service that restores the RF kill switch
-	  state at early boot and saves it at shutdown.
+	  systemd-hostnamed is a system service that may be used as a
+	  mechanism to change the system's hostname.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-rfkill at .service.html
+	  http://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
 
-config BR2_PACKAGE_SYSTEMD_LOGIND
-	bool "enable login daemon"
+config BR2_PACKAGE_SYSTEMD_HWDB
+	bool "enable hwdb installation"
+	default y
 	help
-	  systemd-logind is a system service that manages user logins.
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-logind.service.html
+	  Enables hardware database installation to /usr/lib/udev/hwdb.d
 
-config BR2_PACKAGE_SYSTEMD_MACHINED
-	bool "enable machine daemon"
-	help
-	  systemd-machined is a system service that keeps track of
-	  virtual machines and containers, and processes belonging to
-	  them.
+	  Disabling this option improves first boot time (or every boot
+	  time in case of initramfs images) and saves several MB space.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-machined.service.html
+	  https://www.freedesktop.org/software/systemd/man/hwdb.html
 
 config BR2_PACKAGE_SYSTEMD_IMPORTD
 	bool "enable import daemon"
@@ -206,14 +156,35 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 
 	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
 
-config BR2_PACKAGE_SYSTEMD_HOSTNAMED
-	bool "enable hostname daemon"
-	default y
+config BR2_PACKAGE_SYSTEMD_KDBUS
+	bool "enable kdbus support"
 	help
-	  systemd-hostnamed is a system service that may be used as a
-	  mechanism to change the system's hostname.
+	  Enable kdbus support for Systemd.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
+config BR2_PACKAGE_SYSTEMD_LOCALED
+	bool "enable locale daemon"
+	help
+	  systemd-localed is a system service that may be used as
+	  mechanism to change the system locale settings, as well as
+	  the console key mapping and default X11 key mapping.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-localed.service.html
+
+config BR2_PACKAGE_SYSTEMD_LOGIND
+	bool "enable login daemon"
+	help
+	  systemd-logind is a system service that manages user logins.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-logind.service.html
+
+config BR2_PACKAGE_SYSTEMD_MACHINED
+	bool "enable machine daemon"
+	help
+	  systemd-machined is a system service that keeps track of
+	  virtual machines and containers, and processes belonging to
+	  them.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-machined.service.html
 
 config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 	bool "enable myhostname NSS plugin"
@@ -226,33 +197,18 @@ config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 
 	  http://www.freedesktop.org/software/systemd/man/nss-myhostname.html
 
-config BR2_PACKAGE_SYSTEMD_TIMEDATED
-	bool "enable timedate daemon"
+config BR2_PACKAGE_SYSTEMD_NETWORKD
+	bool "enable network manager"
 	default y
 	help
-	  systemd-timedated is a system service that may be used as a
-	  mechanism to change the system clock and timezone, as well
-	  as to enable/disable NTP time synchronization.
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-timedated.service.html
-
-config BR2_PACKAGE_SYSTEMD_LOCALED
-	bool "enable locale daemon"
-	help
-	  systemd-localed is a system service that may be used as
-	  mechanism to change the system locale settings, as well as
-	  the console key mapping and default X11 key mapping.
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-localed.service.html
+	  systemd-networkd is a system service that manages networks.
+	  It detects and configures network devices as they appear, as well as
+	  creating virtual network devices.
 
-config BR2_PACKAGE_SYSTEMD_COREDUMP
-	bool "enable coredump hook"
-	help
-	  systemd-coredump can be used as a helper binary by the
-	  kernel when a user space program receives a fatal signal and
-	  dumps core.
+	  This simple network configuration solution is an alternative to
+	  dhcpcd or ISC dhcp.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-coredump.html
+	  http://www.freedesktop.org/software/systemd/man/systemd-networkd.html
 
 config BR2_PACKAGE_SYSTEMD_POLKIT
 	bool "enable polkit support"
@@ -265,18 +221,25 @@ config BR2_PACKAGE_SYSTEMD_POLKIT
 
 	  http://wiki.freedesktop.org/www/Software/polkit/
 
-config BR2_PACKAGE_SYSTEMD_NETWORKD
-	bool "enable network manager"
-	default y
+config BR2_PACKAGE_SYSTEMD_QUOTACHECK
+	bool "enable quotacheck tools"
 	help
-	  systemd-networkd is a system service that manages networks.
-	  It detects and configures network devices as they appear, as well as
-	  creating virtual network devices.
+	  systemd-quotacheck is a service responsible for file system
+	  quota checks. It is run once at boot after all necessary
+	  file systems are mounted. It is pulled in only if at least
+	  one file system has quotas enabled.
 
-	  This simple network configuration solution is an alternative to
-	  dhcpcd or ISC dhcp.
+	  http://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-networkd.html
+config BR2_PACKAGE_SYSTEMD_RANDOMSEED
+	bool "enable random-seed support"
+	help
+	  systemd-random-seed is a service that restores the random
+	  seed of the system at early boot and saves it at
+	  shutdown. Saving/restoring the random seed across boots
+	  increases the amount of available entropy early at boot.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
 
 config BR2_PACKAGE_SYSTEMD_RESOLVED
 	bool "enable resolve daemon"
@@ -288,17 +251,13 @@ config BR2_PACKAGE_SYSTEMD_RESOLVED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-resolved.html
 
-config BR2_PACKAGE_SYSTEMD_TIMESYNCD
-	bool "enable timesync daemon"
-	default y
+config BR2_PACKAGE_SYSTEMD_RFKILL
+	bool "enable rfkill tools"
 	help
-	  systemd-timesyncd is a service that may be used to synchronize the
-	  local system clock with a Network Time Protocol server.
-
-	  This simple NTP solution is an alternative to sntp/ntpd from the ntp
-	  package.
+	  systemd-rfkill is a service that restores the RF kill switch
+	  state at early boot and saves it at shutdown.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-timesyncd.html
+	  http://www.freedesktop.org/software/systemd/man/systemd-rfkill at .service.html
 
 config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	bool "enable SMACK support"
@@ -314,12 +273,53 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	  When this feature is enabled, Systemd mounts smackfs and manages
 	  security labels for sockets.
 
-config BR2_PACKAGE_SYSTEMD_HIBERNATE
-	bool "enable hibernation support"
+config BR2_PACKAGE_SYSTEMD_SYSUSERS
+	bool "enable sysusers support"
 	help
-	  When this features is enabled, additional tools and services
-	  are built to support suspending and resuming the system.
+	  systemd-sysusers creates system users and groups, based on
+	  the file format and location specified in sysusers.d(5).
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-sleep.html
+	  http://www.freedesktop.org/software/systemd/man/systemd-sysusers.html
+
+config BR2_PACKAGE_SYSTEMD_TIMEDATED
+	bool "enable timedate daemon"
+	default y
+	help
+	  systemd-timedated is a system service that may be used as a
+	  mechanism to change the system clock and timezone, as well
+	  as to enable/disable NTP time synchronization.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-timedated.service.html
+
+config BR2_PACKAGE_SYSTEMD_TIMESYNCD
+	bool "enable timesync daemon"
+	default y
+	help
+	  systemd-timesyncd is a service that may be used to synchronize the
+	  local system clock with a Network Time Protocol server.
+
+	  This simple NTP solution is an alternative to sntp/ntpd from the ntp
+	  package.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-timesyncd.html
+
+config BR2_PACKAGE_SYSTEMD_TMPFILES
+	bool "enable tmpfiles support"
+	default y
+	help
+	  systemd-tmpfiles creates, deletes, and cleans up volatile
+	  and temporary files and directories, based on the
+	  configuration file format and location specified in
+	  tmpfiles.d(5).
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
+
+config BR2_PACKAGE_SYSTEMD_VCONSOLE
+	bool "enable vconsole tool"
+	help
+	  systemd-vconsole-setup is an early boot service that
+	  configures the virtual console font and console keymap.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
 
 endif
-- 
2.8.1
