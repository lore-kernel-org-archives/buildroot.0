From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Mar 2019 12:57:30 +0100
Subject: [Buildroot] [git commit] Update for 2019.02-rc3
Message-ID: <20190301121058.3B3668E699@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdfea8428f1d89ec79e0253b61fe86eb5437532d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 28 ++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 61 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 38a59435d8..8830e7acb1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,31 @@
+2019.02-rc3, released March 1st, 2019
+
+	Fixes all over the tree.
+
+	Openssl support dropped from Qt 5.6, as it isn't compatible
+	with openssl 1.1.x.
+
+	Toolchain: GCC 8.x updated to 8.3.0, fixing a number of
+	issues.
+
+	Dependencies: Require CMake 3.8 or newer to fix compilation
+	issue with certain packages. If not available, host-cmake will
+	instead be built.
+
+	Printvars: Fix performance regression since 2018.02
+
+	Scanypi: Correctly handle underscores in python package names.
+
+	Updated/fixed packages: botan, clamav, cryptopp, i2pd,
+	ibrcommon, iproute2, libcpprestsdk, libssh, lua-curl,
+	luaexpat, qt5base, runc, stress-ng, syslinux, systemd,
+	upmpdcli, zbar
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#9966: util-linux-2.30/.stamp_built' failed
+	#11696: possible typo in board/pc/post-build.sh
+
 2019.02-rc2, released February 23th, 2019
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 06e49281dd..3d95d066fb 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02-rc2
+export BR2_VERSION := 2019.02-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1550930600
+BR2_VERSION_EPOCH = 1551440000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index afb9ef1fa0..3b017e1bee 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2019.02-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2019.02-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.02-rc2.tar.gz">buildroot-2019.02-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2019.02-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.02-rc3.tar.gz">buildroot-2019.02-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2019.02-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.02-rc2.tar.bz2">buildroot-2019.02-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2019.02-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.02-rc3.tar.bz2">buildroot-2019.02-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2019.02-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 00019aa62f..ddb019e562 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.02-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 March 2019</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups
+          and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.02-rc3.tar.bz2">2019.02-rc3
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
