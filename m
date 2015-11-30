From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2015 23:13:41 +0100
Subject: [Buildroot] [git commit] Update for 2015.11
Message-ID: <20151130221431.28C0981E89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f90e532ff48669873f682a4f0c3b6f0910cb2e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |   18 ++++++++++++++++++
 Makefile                   |    2 +-
 docs/website/download.html |   21 +++++++++++----------
 docs/website/news.html     |   18 ++++++++++++++++++
 4 files changed, 48 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5ef9a20..336b195 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2015.11, Released November 30th, 2015
+
+	Minor fixes.
+
+	Merged/seperate /usr handling is now also performed for
+	staging so cross-gdb / gdbserver can find the libraries.
+
+	Updated/fixed packages: autossh, conntrack-tools, dcron,
+	espeak, gcc, glmark2, gpsd, gstreamer1, libglib2, libsigsegv,
+	libsoc, libv4l, minidlna, mongrel2, opencv, polarssl,
+	rpi-userland, rubix, skeleton, tovid, uemacs, valgrind, yad,
+	zmqpp
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#8441: Invalid directory for X11 fonts in target (RPi2)
+	#8491: libglib2 2.46.1 not Building for armv5 on 2015.11-rc3
+
 2015.11-rc3, Released November 26th, 2015
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 86b9d0a..b345471 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.11-rc3
+export BR2_VERSION := 2015.11
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 76279d6..4f8d67a 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,40 +8,40 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable release: <b>2015.08.1</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2015.11</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2015.08.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2015.08.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2015.08.1.tar.gz">buildroot-2015.08.1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2015.08.1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2015.11.tar.gz">buildroot-2015.11.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2015.11.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2015.08.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2015.08.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2015.08.1.tar.bz2">buildroot-2015.08.1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2015.08.1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2015.11.tar.bz2">buildroot-2015.11.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2015.11.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2015.11-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -75,6 +75,7 @@
 	  <p><a href="/downloads/buildroot-2015.11-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 42fb7a3..4024737 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2015.11 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2015</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2015.11 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2015.11.tar.bz2">2015.11 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
