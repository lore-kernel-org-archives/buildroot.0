From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Mar 2020 22:23:03 +0100
Subject: [Buildroot] [git commit] Update for 2020.02
Message-ID: <20200308211156.5A8798FF81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f5477b0abb1a9d8a455be9b4b29f87345c15721
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 14 ++++++++------
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 21 +++++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 43 insertions(+), 20 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9934f4916a..7433147e3c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,14 +1,16 @@
-2020.02, not yet released
+2020.02, released March 8th, 2020
 
 	Various fixes.
 
 	br2-external: Fix compatibility with make 4.3+
 
-	Updated/fixed packages: bash, bcm2835, cups, erlang-p1-acme,
-	fbgrab, gst1-plugins-base, gst1-validate, gstreamer1, guile,
-	jhead, libdrm, libevdev, libinput, libsndfile, libvncserver,
-	linux-firmware, mesa3d, nodejs, patch, piglit, python-django,
-	ruby, swupdate, thrift, zziplib
+	Updated/fixed packages: bash, bcm2835, binutils, cups,
+	erlang-p1-acme, fbgrab, gr-osmosdr, gst1-plugins-base,
+	gst1-validate, gstreamer1, guile, jhead, libdrm, libevdev,
+	libinput, libnss, libsndfile, libvncserver, linux-firmware,
+	mesa3d, nodejs, openjdk-bin, openvmtools, optee-test, patch,
+	php, piglit, pppd, python-django, qemu, qt5base, ruby,
+	ser2net, swupdate, thrift, zziplib
 
 	Removed packages: classpath, jamvm
 
diff --git a/Makefile b/Makefile
index 09e769f613..c5d66705ce 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02-rc3
+export BR2_VERSION := 2020.02
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1583189900
+BR2_VERSION_EPOCH = 1583701800
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 1ae069fb4e..bc759ae3d1 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,40 +8,40 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest long term support release: <b>2019.02.9</b></h3>
+      <h3 style="text-align: center;">Latest stable / long term support release: <b>2020.02</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.02.9.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.02.9.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2019.02.9.tar.gz">buildroot-2019.02.9.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2019.02.9.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.02.tar.gz">buildroot-2020.02.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2020.02.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.02.9.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.02.9.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.02.9.tar.bz2">buildroot-2019.02.9.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2019.02.9.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.02.tar.bz2">buildroot-2020.02.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2020.02.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest stable release: <b>2019.11.1</b></h3>
 
       <div class="row mt centered">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2020.02-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 91d24c084d..29dcdb3acd 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.02 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 March 2020</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2020.02 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.02.tar.bz2">2020.02 release</a>.</p>
+
+	  <p>Notice that this is a long term support release which will be
+	  supported with security and other important fixes until March 2021.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index cac6854dea..bbb66a5c24 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2019.11'
+RELEASE='2020.02'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
