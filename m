From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 May 2018 18:24:30 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] Update for 2018.02.2
Message-ID: <20180504162507.DBD078B6FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4acca318b1630b6aa0e1113948e7678dd902b8a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 31 +++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 09cf7c3f85..c11118efd3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,34 @@
+2018.02.2, Released May 4th, 2018
+
+	Important / security related fixes.
+
+	Tweak package size/file instrumentation to better handle
+	package rebuilds.
+
+	Revert /etc/shells creation when bash is enabled.
+
+	Exclude /lib/firmware from the rpath fixup logic, as it may
+	contain non-native ELF files.
+
+	Scanpypi: Support the new PyPi infrastructure.
+
+	Handle GCC 8.x on the host.
+
+	Ensure timestamp of /usr is updated to support the systemd
+	ConditionNeedsUpdate option.
+
+	Updated/fixed packages: bluez5_utils, flann, gdb, gnupg2,
+	grub2, libcec, libcgi, libglib2, libgpg-error, libgpgme,
+	libtomcrypt, mbedtls, mkpasswd, php, python, python-requests,
+	python-watchdog, qt53d, qt5websockets, sdl2, sdl2_image,
+	syslog-ng, systemd, tcl, tcllib, uclibc, usb_modeswitch,
+	wireguard, wmctrl
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10896: /bin/sh not in /etc/shells
+	#10961: Grub2 fails to build for x86_64 when BR2_SSP_ALL is enabled
+
 2018.02.1, Released April 9th, 2018
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 479ce74dc1..864a15ba0a 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02.1
+export BR2_VERSION := 2018.02.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1523310000
+BR2_VERSION_EPOCH = 1525450000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
