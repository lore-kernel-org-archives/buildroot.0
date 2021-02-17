From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 19:24:35 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] Update for 2020.11.3
Message-ID: <20210217180409.206D3860CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=610e67b1fc4ac44e0c4a7ba437c917ad6d63f481
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 24 ++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7e1e5a58ce..c42e658cd6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,27 @@
+2020.11.3, released February 17th, 2021
+
+	meson: Fix ccache detection handling when per-package builds
+	are used.
+
+	Fakeroot: Fix compatibility issue with glibc 2.33
+
+	Updated/fixed packages: atftp, binutils, busybox, cereal,
+	chartjs, connman, dhcpcd, dnsmasq, docker-cli, docker-engine,
+	ebtables, fakeroot, flashrom, go, gst1-python, guile,
+	intel-mediadriver, intel-microcode, jasper,
+	kodi-inputstream-adaptive, lcms2, libbsd, libopenssl,
+	makedumpfile, memtester, mosquitto, ne10, openblas, orc, php,
+	postgresql, privoxy, pugixml, python-bottle, python-django,
+	python3, rauc, sox, stress-ng, subversion, tzdate,
+	uboot-tools, uclibc, webkitgtk, wireguard-linux-compat,
+	wireshark, wpa_supplicant, wpewebkit, xenomai,
+	xserver_xorg-server, xterm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11706: binman (U-boot tool) cannot find libfdt "binman: No mod..
+	#13506: BR2_PACKAGE_DHCPCD missing directory creation
+
 2020.11.2, released January 31st, 2021
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 293b5880f5..c7e7ca4bc5 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.11.2
+export BR2_VERSION := 2020.11.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1612125000
+BR2_VERSION_EPOCH = 1613586000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index ed12abd2f0..28a74b9929 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.11.2'
+RELEASE='2020.11.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
