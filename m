From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 22:00:23 +0100
Subject: [Buildroot] [git commit] Update for 2017.02
Message-ID: <20170228210226.64393820FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=083c0735e924e0d534328095a944ae159f661219
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 12 ++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7c9add7..5fedca1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,15 @@
+2017.02, Released February 28th, 2017
+
+	Minor fixes, mainly fixing autobuilder issues.
+
+	Don't use cmake 3.7.x from the build host as it is also
+	affected by the RPATH handling issues, and instead build our
+	own if needed.
+
+	Updated/fixed packages: assimp, classpath, genimage, mplayer,
+	mpv, openocd, python-libconfig, qt5base, qt5quickcontrols,
+	vlc, xterm
+
 2017.02-rc3, Released February 26th, 2017
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 68b2d47..0308f9b 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.02-rc3
+export BR2_VERSION := 2017.02
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1488147000
+BR2_VERSION_EPOCH = 1488315000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 83d618c..929557f 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,40 +8,40 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable release: <b>2016.11.2</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2017.02</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.11.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.11.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2016.11.2.tar.gz">buildroot-2016.11.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2016.11.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.02.tar.gz">buildroot-2017.02.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2017.02.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.11.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.11.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.11.2.tar.bz2">buildroot-2016.11.2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2016.11.2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.02.tar.bz2">buildroot-2017.02.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2017.02.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2017.02-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -75,7 +75,7 @@
 	  <p><a href="/downloads/buildroot-2017.02-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 25d6bce..6b32a80 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2017.02 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 February 2017</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2017.02 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.02">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2017.02.tar.bz2">2017.02 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 89973ce..33ca6b8 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2016.11.2'
+RELEASE='2017.02'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
