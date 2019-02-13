From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Feb 2019 09:03:54 +0100
Subject: [Buildroot] [git commit] Update for 2019.02-rc1
Message-ID: <20190213080323.1B9D181121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23a288533340c9dd6d5b337ec9c27e96decaf252
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 26 +++++++++++++++++++++++---
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 23 +++++++++++++++++++++++
 4 files changed, 59 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0ef61f5882..215f8e323d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2019.02-rc1, not yet released
+2019.02-rc1, released February 13th, 2019
 
 	Fixes all over the tree and new features.
 
@@ -58,6 +58,9 @@
 	creating a Buildroot package from luarocks, similar to
 	scancpan and scanpypi.
 
+	scanpypi: protect against zip-slip vulnerability in zip/tar
+	handling
+
 	check-package: fix Python 3 support
 
 	get-developers: Fix behaviour when called from elsewhere than
@@ -125,8 +128,25 @@
 	python-wtforms, python3-setuptools, rcw, rtc-tools, shim,
 	utp_com, vmtouch, websocketpp
 
-	Removed packages: fftw, lua 5.2.x, luacrypto, mongodb,
-	perl-time-hires, python-pyqt, qt, qtuio, tn5250
+	Removed packages: fftw, lua 5.2.x, luacrypto, perl-time-hires,
+	python-pyqt, qt, qtuio, tn5250
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10851: Patch to handle numpad Enter key properly
+	#11066: x11r7 X11 S40xorg leads to a black screen on QEMU x86..
+	#11126: Bash Shell Programming using Buildroot
+	#11426: pps-tools bash dependency
+	#11476: stdio2.h error invalid use of __builtin_va_arg_pack
+	#11536: dt-utils building fails with glibc 2.28
+	#11546: open-vm-tools with glibc 2.28
+	#11566: Fix init script
+	#11576: Unable to start apache with event MPM on raspberry pi 3
+	#11591: [pkgconf 1.5.3] xserver OpenGL support is missing
+	#11606: libjpeg has no Config.in
+	#11616: 2018.02.09 fails to build libzlib with full RELRO..
+	#11656: Custom device tree and u-boot boot.scr not integrated..
+	#11666: Touchscreen with (Py)Qt5 should use tslib instead of evdev
 
 2018.11.2, Released January 30th, 2019
 
diff --git a/Makefile b/Makefile
index 0d2659c46e..f736ecfb3e 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02-git
+export BR2_VERSION := 2019.02-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1543701000
+BR2_VERSION_EPOCH = 1550044800
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index e089ad57e6..52c8b1d565 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,38 +75,38 @@
 	  <p><a href="/downloads/buildroot-2018.11.2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2018.11-rc3</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2019.02-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.11-rc3.tar.gz">buildroot-2018.11-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.11-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.02-rc1.tar.gz">buildroot-2019.02-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2019.02-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.11-rc3.tar.bz2">buildroot-2018.11-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.11-rc3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.02-rc1.tar.bz2">buildroot-2019.02-rc1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2019.02-rc1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
@@ -114,7 +114,7 @@
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
   </div>
--->
+
   <div class="panel panel-primary">
     <div class="panel-heading">Source code</div>
     <div class="panel-body">
diff --git a/docs/website/news.html b/docs/website/news.html
index 6f7ebad5d7..d72c6b7fcf 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,29 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.02-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 February 2019</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the
+	  tree, see the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02-rc1">CHANGES</a>
+	  file for details.
+	</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.02-rc1.tar.bz2">2019.02-rc1
+	    release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
