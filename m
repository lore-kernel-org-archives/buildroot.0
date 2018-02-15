From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Feb 2018 23:03:43 +0100
Subject: [Buildroot] [git commit] Update for 2018.02-rc2
Message-ID: <20180215220419.DB37C87D7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44cec6431c97da810f92d1590292799a17ea9cdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 22 ++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index b897d4f996..e62bc6c100 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,25 @@
+2018.02-rc2, Released February 15th, 2018
+
+	Fixes all over the tree.
+
+	Dependencies: Ensure C++ support is available like for C
+	support for packages needing 32bit host support.
+
+	utils/genrandconfig: Check host dependencies for config.
+
+	Updated/fixed packages: busybox, dnsmasq, dropbear, ffmpeg,
+	glibc, keepalived, libcpprestsdk, libgpiod, libmaxminddb,
+	librsvg, libtasn1, libv4l, libxml2, lightning, ltp-testsuite,
+	mesa3d, mesa3d-demos, mesa3d-headers, nftables, open-lldp,
+	php, postgresql, python-crossbar, qt5, qt53d, qt5enginio,
+	qt5tools, qt5webengine, qt5webkit, rsync, rust-bin, rustc,
+	systemd
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#9781: ti-sgx-km build on kernel >4.1
+	#10141: Squashfs extended attribute failures
+
 2018.02-rc1, Released February 5th, 2018
 
 	The global source-check and per-package <pkg>-source-check
diff --git a/Makefile b/Makefile
index 90019bd764..ec39bcdb9c 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02-rc1
+export BR2_VERSION := 2018.02-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1517840000
+BR2_VERSION_EPOCH = 1518732000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 57c82e2739..4244b169df 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2018.02-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2018.02-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.02-rc1.tar.gz">buildroot-2018.02-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.02-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.02-rc2.tar.gz">buildroot-2018.02-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.02-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.02-rc1.tar.bz2">buildroot-2018.02-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.02-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.02-rc2.tar.bz2">buildroot-2018.02-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.02-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index e194d68b7e..211029461a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2018.02-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 February 2018</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups
+          and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2018.02-rc2.tar.bz2">2018.02-rc2
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
