From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Mar 2019 22:49:56 +0100
Subject: [Buildroot] [git commit] Update for 2019.02
Message-ID: <20190304214755.216698A694@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9674056fbe8d37c1b11ad524075f21dc5deaa15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 10 ++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 21 +++++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 45 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8830e7acb1..365d2bbe4e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,13 @@
+2019.02, released March 4th, 2019
+
+	Minor fixes.
+
+	Libressl support added for Qt 5.6 as a replacement for
+	openssl, as 5.6 is not compatible with openssl 1.1.x.
+
+	Updated/fixed packages: cutelyst, devmem2, gqrx,
+	gst-plugins-bad, libraw, libsoxr, qt5base, runc, systemd, tor
+
 2019.02-rc3, released March 1st, 2019
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 3d95d066fb..2b91d40919 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02-rc3
+export BR2_VERSION := 2019.02
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1551440000
+BR2_VERSION_EPOCH = 1551735000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 3b017e1bee..3fc6c2897f 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,40 +8,40 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest long term support release: <b>2018.02.11</b></h3>
+      <h3 style="text-align: center;">Latest stable / long term support release: <b>2018.02.11</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.02.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.02.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2018.02.11.tar.gz">buildroot-2018.02.11.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.02.11.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.02.tar.gz">buildroot-2019.02.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2019.02.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.02.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.02.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.02.11.tar.bz2">buildroot-2018.02.11.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.02.11.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.02.tar.bz2">buildroot-2019.02.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2019.02.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest stable release: <b>2018.11.3</b></h3>
 
       <div class="row mt centered">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2019.02-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index ddb019e562..6fe12c708a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.02 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 March 2019</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2019.02 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.02.tar.bz2">2019.02 release</a>.</p>
+
+	  <p>Notice that this is a long term support release which will be
+	  supported with security and other important fixes until March 2020.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 1ca5edc647..6168f05810 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2018.11'
+RELEASE='2019.02'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
