From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 Dec 2018 23:06:49 +0100
Subject: [Buildroot] [git commit] Update for 2018.11
Message-ID: <20181201220400.EAC568A2E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9089a9ff307045bb5fd42ab76ad0a739b5221416
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |  6 ++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index e88f7258bb..edefd4bab8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,9 @@
+2018.11, Released December 1st, 2018
+
+	Minor fixes.
+
+	Updated/fixed packages: c-ares, quagga, squid
+
 2018.11-rc3, released November 30th, 2018
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index ea44994c6e..c4c34b0ff2 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.11-rc3
+export BR2_VERSION := 2018.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1543580000
+BR2_VERSION_EPOCH = 1543701000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 0662199e9e..b447251a10 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,40 +42,40 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2018.08.3</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2018.11</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.08.3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.08.3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2018.08.3.tar.gz">buildroot-2018.08.3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.08.3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.11.tar.gz">buildroot-2018.11.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.11.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.08.3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.08.3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.08.3.tar.bz2">buildroot-2018.08.3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.08.3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.11.tar.bz2">buildroot-2018.11.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.11.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2018.11-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -114,7 +114,7 @@
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
   </div>
-
+-->
   <div class="panel panel-primary">
     <div class="panel-heading">Source code</div>
     <div class="panel-body">
diff --git a/docs/website/news.html b/docs/website/news.html
index 5322b5723e..dc495e8d83 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2018.11 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 December 2018</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2018.11 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.11">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2018.11.tar.bz2">2018.11 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 400eca0f30..1ca5edc647 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2018.08'
+RELEASE='2018.11'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
