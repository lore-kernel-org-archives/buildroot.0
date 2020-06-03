From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Jun 2020 16:55:41 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] Update for 2020.02.3
Message-ID: <20200603145530.7673E82ABB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d42f3adaae24a6aa3abc2de4f39fa8023f971d31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 28 ++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7dda1c47ec..cd7c130cd7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,31 @@
+2020.02.3, released June 3rd, 2020
+
+	Important / security related fixes.
+
+	Fix various build issues of host packages on hosts using GCC
+	10.
+
+	Updated/fixed packages: arm-trusted-firmware, audit, bind,
+	binutils, bison, clamav, crda, dovecot, dtc, efl, elf2flt,
+	erlang, fakeroot, ffmpeg, fmc, fmlib, freerdp, gcc, git,
+	glib-networking, gnupg, leveldb, libexif, libssh2,
+	libusb-compat, linux-headers, lrzip, ltrace, mariadb, mesa3d,
+	mp4v2, openldap, openocd, perl, php, prosody,
+	python-pycryptodomex, python-pyqt5, qemu, rpi-firmware, rustc,
+	speexdsp, sysrepo, systemd, tremor, vboot-utils, wireshark,
+	xen
+
+	Removed packages: python-pycrypto
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12361: Init system (systemd) kills login on Raspberry Pi Zero
+	#12656: bison fails to relocate with relocate-sdk.sh
+	#12671: leveldb won't detect that snappy is present (static..
+	#12691: host-rust build fails
+	#12831: RPI-firmware package: DTB-overlay dependency
+
+
 2020.02.2, released May 12th, 2020
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index cd6d66908f..2ed4551653 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02.2
+export BR2_VERSION := 2020.02.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1589285000
+BR2_VERSION_EPOCH = 1591196000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
