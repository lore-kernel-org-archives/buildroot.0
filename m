From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Dec 2020 23:21:32 +0100
Subject: [Buildroot] [git commit] Update for 2020.11
Message-ID: <20201202221324.6748E8353C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9624a001f9d4314f8bcc9219df717d4c41fb5373
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 13 +++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 45 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 45c7ecc12a..3894193d39 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,16 @@
+2020.11, released December 2nd, 2020
+
+	Various fixes.
+
+	Updated/fixed packages: bustle, docker-containerd, gnuplot,
+	gst1-plugins-good, jemalloc, kmsxx, libcap, libplist,
+	libuhttpd, libxkbcommon, lynx, mariadb, netsurf, privoxy,
+	s390-tools, setserial, xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13276: libcap builds libcap.pc incorrectly
+
 2020.11-rc3, released November 28th, 2020
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 5105cd07ff..34237a2125 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.11-rc3
+export BR2_VERSION := 2020.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1606558000
+BR2_VERSION_EPOCH = 1606948000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index beebbbea92..b971db39be 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,40 +42,40 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2020.08.2</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2020.11</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.08.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.08.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2020.08.2.tar.gz">buildroot-2020.08.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2020.08.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.11.tar.gz">buildroot-2020.11.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2020.11.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.08.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.08.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.08.2.tar.bz2">buildroot-2020.08.2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2020.08.2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.11.tar.bz2">buildroot-2020.11.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2020.11.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2020.11-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2020.11-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index f15637c3bd..d2b5cbe063 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.11 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 December 2020</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2020.11 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.11">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.11.tar.bz2">2020.11 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 53f6012f6e..db2a752c3b 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.08'
+RELEASE='2020.11'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
