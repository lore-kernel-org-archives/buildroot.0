From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Feb 2016 15:34:16 +0100
Subject: [Buildroot] [git commit] Update for 2016.02-rc2
Message-ID: <20160218143714.D3E2481922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cd8cbc6fa7aad86a267fac28345ff7236b61233
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |  5 +++--
 Makefile                   |  2 +-
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index 18624a0..347fa75 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,9 +1,10 @@
-2016.02, Not yet released
+2016.02-rc2, Released February 18th, 2016
 
 	Fixes all over the tree.
 
 	Toolchain: PR19405 backport to binutils 2.25.1 to fix NIOS ld
-	crash. glibc security patches for CVE-2014-8121, CVE-2015-1781
+	crash, backport of Xtensa .init/.fini literals handling.
+	glibc security patches for CVE-2014-8121, CVE-2015-1781
 	and CVE-2015-7547.
 
 	Defconfigs for Acmesystems Arietta g25 added.
diff --git a/Makefile b/Makefile
index 71735b5..90018b4 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.02-rc1
+export BR2_VERSION := 2016.02-rc2
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index c1f89ff..ce51540 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2016.02-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2016.02-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.02-rc1.tar.gz">buildroot-2016.02-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2016.02-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.02-rc2.tar.gz">buildroot-2016.02-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2016.02-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.02-rc1.tar.bz2">buildroot-2016.02-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2016.02-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.02-rc2.tar.bz2">buildroot-2016.02-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2016.02-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 1249b3d..e7252df 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2016.02-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 February 2016</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>Another week, another release candidate with more cleanups
+	  and build fixes. See
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.02-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2016.02-rc2.tar.bz2">2016.02-rc2
+	    release candidate</a>, and report any problems found to
+	  the <a href="support.html">mailing list</a>
+	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
