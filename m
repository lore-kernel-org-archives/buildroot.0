From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 May 2016 23:26:50 +0200
Subject: [Buildroot] [git commit] Update for 2016.05-rc1
Message-ID: <20160510213331.AA21A81EC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ab737207b411ece4d65492ea782752489574653
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 75 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  2 +-
 docs/website/download.html | 22 +++++++-------
 docs/website/news.html     | 24 +++++++++++++++
 4 files changed, 111 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index c8b6352..1731996 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,78 @@
+2016.05-rc1, Released May 10th, 2016
+
+	Fixes all over the tree and new features.
+
+	Architectures: new ARM variants: Cortex A17 and M4, improved
+	nonmmu (cortex-M) support, m68k has been re-enabled with
+	support for ColdFire. For x86, support for the i386 variant
+	has been dropped.
+
+	Toolchain: Add GCC 6 support, remove GCC 4.5, mark GCC 4.7 as
+	deprecated. Go programming language support, Add Binutils 2.26
+	support. Old Sourcery PowerPC external toolchains removed,
+	Sourcery MIPS 2016.06-8, AMD64 2015.11-139, NiosII 2015.11-130
+	added, Linaro ARM/ARMeb/Aarch64 toolchains updated.
+
+	New defconfigs: Firefly RK3288, Boundary Devices i.MX7 Nitrogen7,
+	STM32F429 and STM32F469 Discovery boards, Hardkernel ODROID-C2,
+	Raspberry Pi Zero and Raspberry Pi 3. Some Qemu defconfigs were
+	added for m68k, eXtensa-nommu and ColdFire.
+
+	Linux: use zImage by default on ARM, subversion repository
+	support (for u-boot as well).
+
+	New packages: aer-inject, android-tools, cannelloni,
+	cbootimage, cgroupfs-mount, connman-gtk, crudini, dt,
+	gmrender-resurrect, flannel, font-awesome, freeswitch, go,
+	go-bootstrap, gr-osmosdr, granite, i7z, imx-uuc,
+	kodi-adsp-basic, kodi-adsp-freesurround,
+	kodi-audiodecoder-opus, kodi-pvr-hdhomerun,
+	kodi-screensaver-asterwave, kodi-screensaver-cpblobs,
+	kodi-screensaver-matrixtrails, kodi-screensaver-planestate,
+	kodi-screensaver-rsxs, kodi-visualisation-fishbmc,
+	kodi-visualisation-fountain, kodi-visualisation-goom, libgee,
+	libimxvpuapi, libpjsip, libtomcrypt, libtommath, libusbgx,
+	lksctp-tools, mali-t76x, mkpimage, mpv, msr-tools, nload,
+	norm, nvme, owfs, pound, privoxy, procrank_linux, putty,
+	python-autobahn, python-characteristic, python-crossbar,
+	python-cryptography, python-iniparse, python-iowait,
+	python-lmdb, python-pexpect, python-ptyprocess,
+	python-pyasn-modules, python-pygments, python-pymysql,
+	python-pynacl, python-pyopenssl, python-pysocks,
+	python-pytrie, python-rpi-gpio, python-service-identity,
+	python-setproctitle, python-shutilwhich, python-treq,
+	python-txaio, python-ujson, python-wsaccel, qt5canvas3d,
+	qt5location, qt5quickcontrols2, qt5serialbus, qt5tools,
+	raptor, scrub, taskd, tegrarcm, turbolua, valijson,
+	wayland-protocols, webkitgtk, wilc1000-firmware, wpan-tools,
+	xdriver_xf86-video-amdgpu
+
+	Removed packages: foomatic-filters, python-m2crypto,
+	qt5quick1, qt5webkit-examples, samba, xdriver_xf86-input-void
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#6830: Qt5: no fonts are installed
+	#7562: musl buildroot-toolchain and BR2_MIPS_SOFT_FLOAT break
+	#7580: Invalid filesystem in Pandaboard defconfig
+	#8346: wf111 package removes all kernel module dependencies
+	#8436: xserver_xorg-server Segmentation fault
+	#8736: IPV6 forced on in busybox
+	#8746: At startup system stops with 'cannot set terminal proces..
+	#8751: make fail [fio does not build on sh]
+	#8766: Compiling host-gcc-final-4.9.3 broken on i386
+	#8771: make savedefconfig modifies sources
+	#8781: Unable to build uboot for imx28evk
+	#8786: gdb fails to build with xz and expat support at the same
+	#8801: Compilation of Buildroot 2016.2 for Raspberry Pi with...
+	#8806: Buildroot 2016.2 for Raspberry Pi requires that ext4...
+	#8836: Can't select Vim in menuconfig
+	#8851: Make sure fio can compile with libaio support if it...
+	#8861: With buildroot 2016.02 trying to build for corei7-avx
+	       fails while trying to build host-binutils
+	#8866: Making an USB flash bootable with extlinux build with
+	        buildroot does not work
+
 2016.02, Released March 1st, 2016
 
 	Minor fixes, mostly security related.
diff --git a/Makefile b/Makefile
index daa32a4..32bbfc4 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.05-git
+export BR2_VERSION := 2016.05-rc1
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 9e1642b..401efcf 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -41,41 +41,41 @@
 	  <p><a href="/downloads/buildroot-2016.02.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2016.02-rc3</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2016.05-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.02-rc3.tar.gz">buildroot-2016.02-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2016.02-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.05-rc1.tar.gz">buildroot-2016.05-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2016.05-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.02-rc3.tar.bz2">buildroot-2016.02-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2016.02-rc3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.05-rc1.tar.bz2">buildroot-2016.05-rc1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2016.05-rc1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 9155e3c..0b97d74 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,30 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2016.05-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 May 2016</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of
+	  changes all over the tree, see
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.05-rc1">CHANGES</a>
+	  file for details.
+	</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2016.05-rc1.tar.bz2">2016.05-rc1
+	    release candidate</a>, and report any
+	  problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
