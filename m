From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 16:11:24 +0200
Subject: [Buildroot] [git commit] Update for 2016.05-rc2
Message-ID: <20160517141204.A5A6D8188E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f3342a581970977f28620f17391d8aaf2204fec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 21 +++++++++++++++++++++
 Makefile                   |  2 +-
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1731996..cac7b2d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,24 @@
+2016.05-rc2, Released May 17th, 2016
+
+	Fixes all over the tree.
+
+	Rootfs overlay handling now refuses to overwrite
+	/{usr,bin,sbin,lib} symlinks from BR2_ROOTFS_MERGED_USR option
+	even if these directories are present in the overlay.
+
+	External toolchain: Unbreak user provided libraries deployment
+	(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS) handling after refactoring.
+
+	QEMU coldfire: Fix for signal handling kernel issue, enable
+	networking support.
+
+	Updated/fixed packages: android-tools, assimp, boost, gcc,
+	glibc, glmark2, gmrender-resurrect, go, go-bootstrap, iputils,
+	jack2, kodi-screensaver-asterwave, kodi-screensaver-rsxs,
+	kodi-visualisation-shadertoy, libarchive, libinput, libpjsip,
+	mali-t76x, mtr, nginx, opencv, openvpn, python-coherence,
+	qt5multimeda, quagga, samba4, sg3-utils, stress-ng, turbolua
+
 2016.05-rc1, Released May 10th, 2016
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 9b0ed05..fb88b0e 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.05-rc1
+export BR2_VERSION := 2016.05-rc2
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 401efcf..e5c5e58 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2016.05-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2016.05-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.05-rc1.tar.gz">buildroot-2016.05-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2016.05-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.05-rc2.tar.gz">buildroot-2016.05-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2016.05-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.05-rc1.tar.bz2">buildroot-2016.05-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2016.05-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.05-rc2.tar.bz2">buildroot-2016.05-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2016.05-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 7a216ef..2bb99d8 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2016.05-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 May 2016</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>Another week, another release candidate with more cleanups
+	  and build fixes. See
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.05-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2016.05-rc2.tar.bz2">2016.05-rc2
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
