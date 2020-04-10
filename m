From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Apr 2020 08:42:28 +0200
Subject: [Buildroot] [git commit branch/2019.11.x] Update for 2019.11.3
Message-ID: <20200410062907.5A9298E22C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d3fc9d795f757f3191750491555495626e3bfdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 25 +++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 306ec936d4..a53a99705d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,28 @@
+2019.11.3, released April 10th, 2020
+
+	Important / security related fixes.
+
+	core: Fix compatibility with make 4.3+. Also fixup /lib
+	references in libtool .la files, similar to how it is done for
+	/usr/*.
+
+	toolchain: Fix kernel headers validation check for external
+	toolchains.
+
+	fs/initramfs: fix show-info so it also shows the usual
+	rootfs-related variables.
+
+	Updated/fixed packages: barebox-aux, bluez5_utils, busybox,
+	civetweb, cog, collectd, ffmpeg, gcc, gnutls, gssdp, gvfs, haproxy,
+	hiredis, hostapd, kmscube, libical, libopenssl, libsndfile,
+	linux-tools, llvm, monit, ntp, php, pure-ftpd, radvd, redis,
+	samba4, screen, sysdig, syslinux, syslog-ng, tor, uacme,
+	util-linux, vala, vlc, wpa_supplicant, xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12746: "sysdig" package description points to http://sysdig.org, ..
+
 2019.11.2, released March 16th, 2020
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 1136d05c3c..a2253b156d 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.11.2
+export BR2_VERSION := 2019.11.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1584371800
+BR2_VERSION_EPOCH = 1586500000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
