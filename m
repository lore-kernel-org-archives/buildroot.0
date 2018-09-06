From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Sep 2018 22:11:06 +0200
Subject: [Buildroot] [git commit] Update for 2018.08
Message-ID: <20180906201034.9132282BB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=339d550e92ac15de8668f32d66d16f198137006c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 31 +++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 63 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8c2ffb0469..a505d7ec69 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,34 @@
+2018.08, Released September 6th, 2018
+
+	Minor fixes.
+
+	Known issues:
+
+	- Glibc 2.28 on the build host breaks compilation of a number
+	  of host packages. 2018.08 contains fixes for some of these
+	  packages, but not all. Consider building on hosts (or in
+	  containers) using older Glibc versions.
+
+	- host-dtc 1.4.7 breaks compilation of older U-Boot and Linux
+          kernel configurations using FDT/DTC. Consider updating the
+          Linux kernel to >= 4.17 and U-Boot to >= 2018.07 or
+          backporting commit 9130ba8846 (scripts/dtc: Update to
+          upstream version v1.4.6-9-gaadd0b65c987) for the Linux
+          kernel / commit db405d1980 for U-Boot.
+	  Alternatively revert commit 7b929ddcf0 (dtc: bump version to
+          1.4.7) and ensure your build host does not have the libfdt
+          development headers installed.
+
+	Updated/fixed packages: busybox, chipmunk, cutelyst,
+	domoticz, gcc, imagemagick, lcms2, libcurl, mediastreamer,
+	moarvm, php, qt, qt5virtualkeyboard, qt5webengine, screen,
+	sdl2, squashfs, uboot, xen
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11261: ccache using wrong cached objects
+	#11276: Understanding the patch for kernel-4.9 and other..
+
 2018.08-rc3, Released August 31th, 2018
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 9d66bbacf4..3e1319c1ea 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.08-rc3
+export BR2_VERSION := 2018.08
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1535752000
+BR2_VERSION_EPOCH = 1536263000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 830cf1bffb..626b67a531 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,40 +42,40 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2018.05.2</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2018.08</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.05.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.08.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.05.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.08.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2018.05.2.tar.gz">buildroot-2018.05.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.05.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.08.tar.gz">buildroot-2018.08.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.08.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.05.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.08.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.05.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.08.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.05.2.tar.bz2">buildroot-2018.05.2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.05.2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.08.tar.bz2">buildroot-2018.08.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.08.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2018.08-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2018.08-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 84468351b8..b46c69660f 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2018.08 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 September 2018</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2018.08 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.08">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2018.08.tar.bz2">2018.08 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index cca0a3db3d..2d550613d5 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2018.05'
+RELEASE='2018.08'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
