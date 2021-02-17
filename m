From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 17:50:51 +0100
Subject: [Buildroot] [git commit] Update for 2021.02-rc2
Message-ID: <20210217162929.E340C813ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21eb7775510d76163c2159bca14d3802283119e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 26 ++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 39e5c2b79e..01c2c7688d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,29 @@
+2021.02-rc2, released February 16th, 2021
+
+	Fixes all over the tree.
+
+	Vulnerability scanning: cpedb.py: Drop CPE XML database
+	caching, as it did not speed up processing much and uses a lot
+	of additional memory.
+	pkg-stats: include information about ignored CVEs in JSON
+	output
+
+	Fakeroot: Fix compatibility issue with glibc 2.33
+
+	Updated/fixed packages: can-utils, collectd, dnsmaqs,
+	docker-cli, docker-engine, ebtables, fakeroot, flashrom,
+	gdk-pixbuf, go, gst1-python, jasper, kodi,
+	kodi-inputstream-adaptive, lcms2, libgeos, libgpg-error,
+	libopenssl, mongoose, mpd, ne10, netopeer2, openblas, orc,
+	perl-gd, ply, postgresql, protobuf, subversion, tcpdump,
+	tzdate, uboot-tools, wireshark, webkitgtk, wpewebkit, xterm
+
+	New packages: perl-extutils-pkgconfig
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11706: binman (U-boot tool) cannot find libfdt "binman: No mod..
+
 2021.02-rc1, released February 9th, 2021
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 14e10223ed..7f7727c231 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02-rc1
+export BR2_VERSION := 2021.02-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1612907000
+BR2_VERSION_EPOCH = 1613580000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 9abe2d3c01..c4c6e419d0 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2021.02-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2021.02-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.02-rc1.tar.gz">buildroot-2021.02-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.02-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.02-rc2.tar.gz">buildroot-2021.02-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.02-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.02-rc1.tar.bz2">buildroot-2021.02-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.02-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.02-rc2.tar.bz2">buildroot-2021.02-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.02-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 43e82c3fde..a635b5557a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.02-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 February 2021</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2021.02-rc2 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.02-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.02-rc2.tar.bz2">2021.02-rc2
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
