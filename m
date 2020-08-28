From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 23:10:20 +0200
Subject: [Buildroot] [git commit] Update for 2020.08-rc3
Message-ID: <20200828210407.B616486536@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=867986650876b588ea359c9a5cefd7fc892ed076
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 20 ++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 91d68fded1..c9457f469d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,23 @@
+2020.08-rc3, released August 28th, 2020
+
+	Fixes all over the tree.
+
+	Infrastructure: Ensure RPATH entries thay may be needed for
+	dlopen() are not dropped by patchelf.
+
+	Toolchain: Drop old GCC 6 based external Sourcery AMD64
+	toolchain.
+
+	Updated/fixed packages: assimp, davfs2, dillo, glibc,
+	gnuradio, hostapd, ibm-sw-tpm2, ipmitool, json-c, libroxml,
+	linux, mender, netopeer2, openal, openjpeg, python-matplotlib,
+	ripgrep, shadowsocks-libev, trousers, xlib_libX11,
+	xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13141: Target-finalize fail with "depmod: ERROR: Bad version passed"
+
 2020.08-rc2, released August 24th, 2020
 
 	Fixes all over the tree, including a number of fixes for
diff --git a/Makefile b/Makefile
index 2656c3d3ca..59a5b887b6 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.08-rc2
+export BR2_VERSION := 2020.08-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1598278000
+BR2_VERSION_EPOCH = 1598649000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 1caecca17f..6be35c3216 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2020.08-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2020.08-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.08-rc2.tar.gz">buildroot-2020.08-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2020.08-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.08-rc3.tar.gz">buildroot-2020.08-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2020.08-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.08-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.08-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.08-rc2.tar.bz2">buildroot-2020.08-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2020.08-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.08-rc3.tar.bz2">buildroot-2020.08-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2020.08-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 6269c7b60f..c4ef827cf3 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.08-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 August 2020</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.08-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.08-rc3.tar.bz2">2020.08-rc3
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
