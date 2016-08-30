From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Aug 2016 08:18:50 +0200
Subject: [Buildroot] [git commit] Update for 2016.08-rc3
Message-ID: <20160830062015.BAE08803DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e981ed08580a804ba46eed73fa6b24b35379b7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 39 +++++++++++++++++++++++++++++++++++++++
 Makefile                   |  2 +-
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 71 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2ecee85..eac349a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,42 @@
+2016.08-rc3, Released August 29th, 2016
+
+	Fixes all over the tree.
+
+	Toolchain: C++ support for the internal blackfin toolchain
+	re-enabled.
+
+	Architecture: Default to bf532 CPU variant for blackfin,
+	Fix flat one memory region support for m68k and disable flat
+	seperate data support because of compatibility issues.
+
+	Defconfigs: Minnowboard and Raspberrypi: Fix errors with
+	post-build scripts when systemd is used.
+	Zynq microzed/zc706/zed: Fix u-booot configuration.
+
+	netbsd-queue package extended and renamed to
+	musl-compat-headers. With this, a number of musl compatibility
+	patches are no longer needed.
+
+	Updated/fixed packages: aircrack-ng, android-tools, babeld,
+	bcusdk, binutils, boa, busybox, connman, cpupower,
+	docker-engine, domoticz, elf2flt, ffmpeg, fwup, gcc,
+	glib-networking, gnupg, hplip, igd2-for-linux, imagemagick,
+	imx-uuc, iputils, jack2, kismet, kmsxx, libaio, libamcodec,
+	libconfuse, libffi, libfreeimage, libgcrypt, libgpg-error,
+	libiio, libraw, libsepol, libserialport, libxmlrpc, linknx,
+	linux-pam, lirc-tools, lldpd, logrotate, lshw, musl, ncurses,
+	neon, nettle, norm, ntfs-3g, openblas, openmpi, openswan,
+	pinentry, pixman, protobuf, python-meld3, qlibc, qt, qt5base,
+	quagga, rpcbind, rt-tests, runc, sane-backends, sconeserver,
+	squeezelite, stella, tftpd, tinycbor, tinydtls, trace-cmd,
+	trousers, tstools, uboot-tools, uclibc, ulogd, ustr, vlc,
+	webkitgtk, wireshark, xdriver_xf86-video-intel
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9101: Error on support/download/git with system git older than 1.8.4
+	#9181: Compiling linux kernel fails if BR2_LINUX_KERNEL_TOOL_CPU..
+
 2016.08-rc2, Released August 17th, 2016
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 8def78a..02b65cc 100644
--- a/Makefile
+++ b/Makefile
@@ -46,7 +46,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.08-rc2
+export BR2_VERSION := 2016.08-rc3
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 907503b..80a979b 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2016.08-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2016.08-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.08-rc2.tar.gz">buildroot-2016.08-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2016.08-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.08-rc3.tar.gz">buildroot-2016.08-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2016.08-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.08-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.08-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.08-rc2.tar.bz2">buildroot-2016.08-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2016.08-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.08-rc3.tar.bz2">buildroot-2016.08-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2016.08-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index c6dbc4c..d74a2a8 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2016.08-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 August 2016</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>Release candidate 3 is out with more cleanups and security
+	  / build fixes. See
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.08-rc3">CHANGES</a>
+	  file for details.</p>
+	<p>Head to the <a href="/downloads/">downloads page</a> to
+	  pick up
+	  the <a href="/downloads/buildroot-2016.08-rc3.tar.bz2">2016.08-rc3
+	    release candidate</a>, and report any problems found to
+	  the <a href="support.html">mailing list</a>
+	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
