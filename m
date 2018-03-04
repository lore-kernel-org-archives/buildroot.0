From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Mar 2018 22:28:34 +0100
Subject: [Buildroot] [git commit] Update for 2018.02
Message-ID: <20180304213009.2ACD18154A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a94ff12d232ada68cff5957089a78a1f0b8f192
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 21 +++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 21 +++++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 56 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index f2de1149ce..c7925bdedc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,24 @@
+2018.02, Released March 4th, 2018
+
+	Fixes all over the tree.
+
+	Issues with systemd with a readonly rootfs and DBus fixed.
+
+	Instructure:
+	- check-uniq-files: fix Python 2.6 compatibility.
+	- dependencies.sh: check for external argparse module for
+	  Python 2.6.
+	- Add infrastructure to detect and use a UTF-8 locale on the
+	  host, needed by systemd.
+
+	Update/fixed packages: clamav, dash, dhcp, dovecot, efl,
+	ffmpeg, libv4l, mono, mosquitto, php, postgresql, qt,
+	scanpypi, sdl2, systemd, tor, tvheadend, uboot, wavpack
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10831: qemu_x86_64_defconfig build fails on linux-headers..
+
 2018.02-rc3, Released February 27th, 2018
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 49c03b7008..957ba6634a 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02-rc3
+export BR2_VERSION := 2018.02
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1519768000
+BR2_VERSION_EPOCH = 1520198000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index c9133eca6a..cf99b22cd1 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,40 +8,40 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest long term support release: <b>2017.02.10</b></h3>
+      <h3 style="text-align: center;">Latest stable / long term support release: <b>2018.02</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.02.10.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.02.10.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2017.02.10.tar.gz">buildroot-2017.02.10.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2017.02.10.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.02.tar.gz">buildroot-2018.02.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.02.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.02.10.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.02.10.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.02.10.tar.bz2">buildroot-2017.02.10.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2017.02.10.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.02.tar.bz2">buildroot-2018.02.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.02.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest stable release: <b>2017.11.2</b></h3>
 
       <div class="row mt centered">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2018.02-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index fc11572f2d..f729a59543 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2018.02 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 March 2018</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2018.02 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2018.02.tar.bz2">2018.02 release</a>.</p>
+
+	  <p>Notice that this is a long term support release which will be
+	  supported with security and other important fixes until February 2019.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 3d833f09fc..54b45da69e 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2017.11'
+RELEASE='2018.02'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
