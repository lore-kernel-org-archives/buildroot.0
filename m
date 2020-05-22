From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2020 11:53:24 +0200
Subject: [Buildroot] [git commit] Update for 2020.05-rc2
Message-ID: <20200522093713.15AC591C4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=497e3dff7e13d0651b1e9db7b232b13da37f0108
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 59 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++-------
 docs/website/news.html     | 21 +++++++++++++++++
 4 files changed, 91 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index db27e4138c..4310a11fc5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,62 @@
+2020.05-rc2, released May 22nd 2020
+
+	Fixes all over the tree.
+
+	U-Boot: Support building with Python 3.x instead of Python
+	2.x. Since U-Boot 2020.01, various U-Boot build scripts use
+	Python 3.x instead of Python 2.x, so add an option to pull in
+	host-python3 rather than host-python. Also fix a number of
+	defconfigs to use this new option.
+
+	Updated/fixed packages: apparmor, binutils, bison, brltty,
+	c-icap, cegui, checkpolicy, clamav, crda, cvs, docker-cli,
+	docker-engine, domoticz, elf2flt, exfatprogs, fakeroot,
+	ffmpeg, freerdp, gcc, glibc, gnuconfig, irrlicht, kmod,
+	libexif, libpam-tacplus, libssh2, libv4l, libvncserver,
+	localedef, lrzip, mariadb, matchbox, mbuffer, mesa3d,
+	mesa3d-headers, meson, netsniff-ng, openldap, openocd,
+	optee-os, p7zip, paho-mqtt-c, php, piglit, pigz,
+	python-argon2-cffi, python-attrs, python-future,
+	python-markdown, python-pycryptodomex, python-pyqt5, qt5base,
+	rpi-firmware, rustc, squashfs, squid, stella, suricata,
+	systemd, uacme, uclibc, util-linux, vboot-utils
+
+	New packages: python3-pyelftools
+
+	Removed packages: ezxml, mtdev2tuio, python-pycrypto
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10551: PowerPC SPE and Musl
+	#12256: package tar is outdated (1.29 is 3 years old)
+	#12271: python-iptables runtime dependencies
+	#12321: host-generic-package: PKG_DL_OPTS not used for host package
+	#12391: CMake-based host package fails to include output/host/include
+	#12431: ethernet no detected on nanopi neo 2
+	#12521: RISCV RV32IA selected, RV64GC output
+	#12586: avahi failure
+	#12596: host-e2fsprogs: tune2fs incompatibility on older glibc..
+	#12611: ntp hash is not matching with upstream 4.2.8p13
+	#12626: PHP missing header files within 2020.02
+	#12631: glibc support Power-PC SPE
+	#12656: bison fails to relocate with relocate-sdk.sh
+	#12661: cups problems in buildroot
+	#12686: recipe for target 'install_dev' failed (libcrypto.so:..
+	#12691: host-rust build fails
+	#12761: Buildroot fails when building GCNano binaries for the STM..
+	#12786: Systemd spawns two getty processes when the getty port..
+	#12806: There are multiple issues in buildroot that faults cups..
+	#12826: nodejs-12.16.1: error: 'uv_sleep' was not declared in..
+	#12831: RPI-firmware package: DTB-overlay dependency
+	#12836: libunwind: package does not show up in menuconfig for..
+	#12841: util-linux/sfdisk 2.35.1 fails on sector-size header
+	#12866: should we be disabling bash executable path caching?
+	#12886: GMP built in wrong order (?)
+	#12891: QEMU, libvirt-bin, qemu-kvm Package Support required
+	#12901: GStreamer doesn't build on 2020-05 rc1 with GObject..
+	#12906: qt PrefixPath is wrong on 2020.05-rc1
+	#12921: nodejs-12.16.1: error: overriding 'virtual icu_65::..
+
 2020.05-rc1, released May 7th 2020
 
 	Addition of support for gobject-introspection: both the
diff --git a/Makefile b/Makefile
index 2da34b5305..cb15428406 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.05-rc1
+export BR2_VERSION := 2020.05-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1588882900
+BR2_VERSION_EPOCH = 1590140000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index ece7608f35..a2e14a4a5b 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 -->
-      <h3 style="text-align: center;">Latest release candidate: <b>2020.05-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2020.05-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.05-rc1.tar.gz">buildroot-2020.05-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2020.05-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.05-rc2.tar.gz">buildroot-2020.05-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2020.05-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.05-rc1.tar.bz2">buildroot-2020.05-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2020.05-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.05-rc2.tar.bz2">buildroot-2020.05-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2020.05-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 7cdc8c1e9d..ec49017fd2 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.05-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 May 2020</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.05-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.05-rc2.tar.bz2">2020.05-rc2
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
