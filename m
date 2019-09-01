From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Sep 2019 23:06:01 +0200
Subject: [Buildroot] [git commit] Update for 2019.08
Message-ID: <20190901210212.0FCE288E5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fcdfbfb8a28b81283575efc3faa92ce4a0d4e56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 18 ++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 50 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index fb21b72bc7..c8e13c3bab 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2019.08, released September 1st, 2019
+
+	Various fixes.
+
+	Defconfigs: Removed nanopc t4, nanopi m4 and neo4, pine64
+	rockpro64 and raxda rock pi4 as they rely on a ARM32 toolchain
+	on the build host to build ATF. These defconfigs will be added
+	back once a package providing such toolchain is
+	available. Also dropped ts4800 defconfig as it does not build
+	with GCC >= 8.x.
+
+	Updated/fixed packages: libxcb, php, python-numpy, webkitgtk,
+	wpewebkit, xfont_font-util
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12156:	buildroot-2019.08-rc3 does not build for Pi Zero W
+
 2019.08-rc3, released August 28th, 2019
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 82c844620a..24ebaa2874 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.08-rc3
+export BR2_VERSION := 2019.08
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1567026000
+BR2_VERSION_EPOCH = 1567371000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 173cc00b72..a7c5acbf15 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,40 +42,40 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2019.05.1</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2019.08</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.05.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.08.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.05.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.08.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2019.05.1.tar.gz">buildroot-2019.05.1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2019.05.1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.08.tar.gz">buildroot-2019.08.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2019.08.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.05.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.08.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.05.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.08.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.05.1.tar.bz2">buildroot-2019.05.1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2019.05.1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.08.tar.bz2">buildroot-2019.08.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2019.08.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2019.08-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2019.08-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 2462191634..4d89802c44 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.08 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 September 2019</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2019.08 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.08">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.08.tar.bz2">2019.08 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 39b0e85e79..ec9cdeb1e3 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2019.05'
+RELEASE='2019.08'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
