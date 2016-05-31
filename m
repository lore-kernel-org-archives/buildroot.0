From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 23:52:36 +0200
Subject: [Buildroot] [git commit] Update for 2016.05
Message-ID: <20160531215411.28F14818D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa6fd11feebffe16d0b0396e0e7ad421ec061272
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 13 +++++++++++++
 Makefile                   |  2 +-
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 44 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7fd84ea..193b4df 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,16 @@
+2016.05, Released May 31st, 2016
+
+	Minor fixes.
+
+	External toolchain: Fix for symlink handling when copying
+	links to target.
+
+	Updated/fixed packages: gcc, grantlee, gst-ffmpeg,
+	ipsec-tools, iptraf-ng, libcurl, libdrm, libsigsegv, ltris,
+	lttng-babeltrace, mbedtls, mesa3d, moarvm, mplayer, mtools,
+	net-tools, openpowerlink, pulseview, rpm, tinyalsa,
+	xdriver_xf86-video-fbturbo, xserver_xorg-server
+
 2016.05-rc3, Released May 26th, 2016
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 7532382..f175965 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.05-rc3
+export BR2_VERSION := 2016.05
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 10fb457..5900da0 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,40 +8,40 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable release: <b>2016.02</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2016.05</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2016.02.tar.gz">buildroot-2016.02.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2016.02.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.05.tar.gz">buildroot-2016.05.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2016.05.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.02.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.02.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.02.tar.bz2">buildroot-2016.02.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2016.02.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.05.tar.bz2">buildroot-2016.05.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2016.05.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2016.05-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -75,7 +75,7 @@
 	  <p><a href="/downloads/buildroot-2016.05-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 8387ea6..6bab9aa 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2016.05 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 March 2016</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2016.05 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.05">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2016.05.tar.bz2">2016.05 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index b8f02af..d42a394 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2016.02'
+RELEASE='2016.05'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
