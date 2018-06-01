From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jun 2018 22:22:57 +0200
Subject: [Buildroot] [git commit] Update for 2018.05
Message-ID: <20180601202138.B7ADC8373E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3d114a1effd8a6ef773bee14fe49ea6d8d7c350
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 14 ++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 27 +++++++++++++--------------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 48 insertions(+), 17 deletions(-)

diff --git a/CHANGES b/CHANGES
index e48ac23adc..baa85622ae 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,17 @@
+2018.05, Released June 1st, 2018
+
+	Minor fixes.
+
+	Download: Work around for hanging connections for packages
+	from CVS, by adding a 10 minute max timeout.
+
+	Updated/fixed packages: binutils, clang, dash, expect, git,
+	glibc, jpeg-turbo, libjpeg, log4cplus, openvmtools, xen,
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11051: runtime issue on STM32 with usage of binutils 2.29.x
+
 2018.05-rc3, Released May 28th, 2018
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 7be8a6634b..9f32c96001 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.05-rc3
+export BR2_VERSION := 2018.05
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1527540000
+BR2_VERSION_EPOCH = 1527884000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 03f8e1818c..fd08093783 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,7 +8,7 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable / long term support release: <b>2018.02.2</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2018.02.2</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -41,42 +41,41 @@
 	  <p><a href="/downloads/buildroot-2018.02.2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest stable release: <b>2017.11.2</b></h3>
+
+      <h3 style="text-align: center;">Latest stable release: <b>2018.05</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.11.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.11.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2017.11.2.tar.gz">buildroot-2017.11.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2017.11.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.05.tar.gz">buildroot-2018.05.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.05.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.11.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.11.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.11.2.tar.bz2">buildroot-2017.11.2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2017.11.2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.05.tar.bz2">buildroot-2018.05.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.05.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2018.05-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -115,7 +114,7 @@
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
   </div>
-
+-->
   <div class="panel panel-primary">
     <div class="panel-heading">Source code</div>
     <div class="panel-body">
diff --git a/docs/website/news.html b/docs/website/news.html
index a4d83e144d..b2d097b1df 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2018.05 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 June 2018</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2018.05 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.05">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2018.05.tar.bz2">2018.05 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 54b45da69e..cca0a3db3d 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2018.02'
+RELEASE='2018.05'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
