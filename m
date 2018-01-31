From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 20:19:39 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] Update for 2017.02.10
Message-ID: <20180131192239.9464C881BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91850b34977440182e56c9eeb6d57ce34e5c8adc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 30 ++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index a632a93675..d006d9365b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,33 @@
+2017.02.10, Released January 31st, 2018
+
+	Important / security related fixes.
+
+	nconfig: Fix for ncurses/ncursesw linking issue causing crashes.
+
+	System: Only show getty options when busybox init or sysvinit
+	are used.
+
+	Infrastructure: Fix build issue for autotools based packages
+	checking for C++ support on toolchains without C++ support and
+	on a distro lacking /lib/cpp (E.G. Arch Linux).
+
+	Updated/fixed packages: avahi, berkeleydb, bind, busybox,
+	ccache, clamav, coreutils, dovecot, eeprog, eudev, fis,
+	intel-microcode, iputils, irssi, kmsxx, liberation, libiio,
+	lz4, mariadb, matchbox-lib, mcookie, openocd, php, pound,
+	rpcbind, squid, tar, ti-cgt-pru, transmission, util-linux,
+	webkitgtk, wireshark, xen
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9996: lz4 package does not install lz4 binaries in target
+	#10176: Rsyslog's S01logging is deleted by Busybox.mk from...
+	#10216: package/x11r7/mcookie/mcookie.c:207: bad size ?
+	#10301: systemd/getty unused options
+	#10331: kmsxx, host installation fails with BR2_SHARED_...
+	#10536: Finding non-relative paths in the ccache
+	#10641: avahi-autoipd not starting when using systemd-tmpfiles
+
 2017.02.9, Released January 1st, 2018
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index f35b0a0acd..7d609ed8d9 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.02.9
+export BR2_VERSION := 2017.02.10
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1514805000
+BR2_VERSION_EPOCH = 1517426000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
