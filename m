From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Jun 2021 23:21:08 +0200
Subject: [Buildroot] [git commit] Update for 2021.05
Message-ID: <20210606205211.D52AA815AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69f79f2a2ee1417e19c1ead2c9226e11753c06cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 19 +++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 26 +++++++++++++-------------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 53 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index 95b3a38024..c7ae5fbfc3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,22 @@
+2021.05, released June 6th, 2021
+
+	Various fixes.
+
+	Disable PIC/PIE support for Nios2 because of glibc issues
+
+	Defconfigs: Minnowboard max: Fix X11 and mesa3d configuration
+
+	Updated/fixed packages: apache, beaglev-ddrinit,
+	beaglev-secondboot, capnproto, dc3dd, directfb, efibootmgr,
+	ffmpeg, gptfdisk, go, gupnp, hostapd, iftop,
+	intel-mediadriver, libcamera, libcutl, libesmtp, libkcapi,
+	libraw, lttng-tools, lvm2, mimic, mono-gtksharp3, mpv,
+	netperf, odb, qt5base, uclibc, uftrace, unscd, vlc,
+	xdriver_xf86-video-fbturbo
+
+	New packages: python3-cffi, python3-cryptography, python3-pip,
+	python3-pycparser, python3-six
+
 2021.05-rc3, released May 31th, 2021
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 29250a232d..08e4a4104d 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.05-rc3
+export BR2_VERSION := 2021.05
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1622496000
+BR2_VERSION_EPOCH = 1623014000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index ea3af3bfb0..540b973e13 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,7 +8,7 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable / long term support release: <b>2021.02.2</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2021.02.2</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -41,41 +41,41 @@
 	  <p><a href="/downloads/buildroot-2021.02.2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest stable release: <b>2020.11.3</b></h3>
+
+      <h3 style="text-align: center;">Latest stable release: <b>2021.05</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.11.3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.11.3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2020.11.3.tar.gz">buildroot-2020.11.3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2020.11.3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.05.tar.gz">buildroot-2021.05.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.05.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.11.3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.11.3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.11.3.tar.bz2">buildroot-2020.11.3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2020.11.3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.05.tar.bz2">buildroot-2021.05.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.05.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2021.05-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2021.05-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index d2099adc18..2a27508bde 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.05 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 June 2021</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2021.05 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.05">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.05.tar.bz2">2021.05 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 3c1f55033d..84803ed250 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02.2'
+RELEASE='2021.05'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
