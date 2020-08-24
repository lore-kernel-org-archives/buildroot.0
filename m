From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Aug 2020 16:19:07 +0200
Subject: [Buildroot] [git commit] Update for 2020.08-rc2
Message-ID: <20200824141220.A0CC5821CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30ccc0e3f0f66b6345e602148d10f11e6a1831bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 44 ++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 76 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index d102856e69..91d68fded1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,47 @@
+2020.08-rc2, released August 24th, 2020
+
+	Fixes all over the tree, including a number of fixes for
+	compilation with GCC-10.
+
+	Toolchain: Disallow building uClibc-ng for RISC-V 64-bit,
+	because of issues with a missing __riscv_flush_icache()
+	implementation.
+
+	Defconfigs: CI20: Use mainline Linux and U-boot. Update
+	Microchip sama5d27_wlsom1_ek_mmc_dev to use bluez5-utils
+	instead of (the removed) legacy bluez-utils
+
+	Updated/fixed packages: 18xx-ti-utils, aircrack-ng, apache,
+	atest, bandwidthd, bellagio, bind, bird, bluez-alsa, boost,
+	c-periphery, capnproto, chrony, collectd, cpio, cvs,
+	dieharder, domoticz, dovecot, dovecot-pigeonhole, drbd-utils,
+	dump1090, efl, elixir, f2fs-tools, feh, fluidsynth, fping,
+	gdbm, gdk-pixbuf, ghostscript, gst1-plugins-bad,
+	gstreamer1-editing-services, htop, ibm-sw-tpm2, ifplugd,
+	iftop, igd2-for-linux, ima-evm-utils, iprutils, iputils,
+	keepalived, kmsxx, libabseil-cpp, libcamera, libcurl,
+	libfuse3, libnss, librtlsdr, libubox, libunwind, live555,
+	lttng-tools, luabitop, mender-artifact, minizip,
+	mjpg-streamer, mpd, mpv, mtd, ncftp, open-lldp, openal,
+	opencv, opencv3, openfpgaloader, optee-os, owfs, php,
+	pistache, prosody, pulseview, python-decorator,
+	python-gunicorn, python-rpi-gpio, python-spidev,
+	python3-decorator, python3-mako, python3-pyselftools, qt5,
+	qt5webengine, rauc, redis, ripgrep, rtl8188eu, rtl8821au,
+	setools, smstools3, supertux, tftpd, tpm2-abrmd,
+	wpa_supplicant, xen, xlib_libX11, xserver_xorg-server
+
+	New packages: python3-cython, python3-pycryptodomex
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12876: nodejs fails to build when host-icu has been built before
+	#13111: python-gunicorn: missing dependency on python-setuptools
+	#12121: wpa_supplicant fails to build without libopenssl enabled
+	#13146: raspberrypi3_defconfig: "Inappropriate ioctl for device"..
+	#13156: package live555 new license
+	#13166: python-rpi-gpio: does not work against aarch64, unint..
+
 2020.08-rc1, released August 6th, 2020
 
 	Toolchain:
diff --git a/Makefile b/Makefile
index faef1a1be3..2656c3d3ca 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.08-rc1
+export BR2_VERSION := 2020.08-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1596746400
+BR2_VERSION_EPOCH = 1598278000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 69d63ef961..1caecca17f 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2020.08-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2020.08-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.08-rc1.tar.gz">buildroot-2020.08-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2020.08-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.08-rc2.tar.gz">buildroot-2020.08-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2020.08-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.08-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.08-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.08-rc1.tar.bz2">buildroot-2020.08-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2020.08-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.08-rc2.tar.bz2">buildroot-2020.08-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2020.08-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 164c5e0843..af4bd6c86e 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.08-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 August 2020</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2020.08-rc2 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.08-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.08-rc2.tar.bz2">2020.08-rc2
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
