From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 May 2019 23:38:05 +0200
Subject: [Buildroot] [git commit] Update for 2019.05-rc3
Message-ID: <20190525213250.0B5548D1F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c96d648a2922042255b1bb326036fffcc515eb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 18 ++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 50 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5d1d858bd3..5abe2a8c31 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2019.05-rc3, released May 25th, 2019
+
+	Fixes all over the tree.
+
+	check-bin-arch: Ignore /usr/lib/grub, similar to how /lib/grub
+	is ignored.
+
+	check-package: Warn about utf-8 characters in .mk files
+
+	Linux: Default to 5.1.x series
+
+	Updated/fixed packages: assimp, atop, chocolate-doom, cjson,
+	ddrescue, dhcp, ffmpeg, gerbera, glibmm, gpsd, gst-ffmpeg,
+	intel-microcode, jasper, keepalived, kismet, libcpprestsdk,
+	libcurl, libssh2, libupnp18, luarocks, mono-gtksharp3, opus,
+	postgresql, pcsc-lite, python, tslib, webkitgtk,
+	wpebackend-fdo, wpewebkit
+
 2019.05-rc2, released May 15th, 2019
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 7246376cf9..826b25bdaa 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.05-rc2
+export BR2_VERSION := 2019.05-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1557953000
+BR2_VERSION_EPOCH = 1558820000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 9203c60195..7110bf445d 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 -->
-      <h3 style="text-align: center;">Latest release candidate: <b>2019.05-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2019.05-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.05-rc2.tar.gz">buildroot-2019.05-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2019.05-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.05-rc3.tar.gz">buildroot-2019.05-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2019.05-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.05-rc2.tar.bz2">buildroot-2019.05-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2019.05-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.05-rc3.tar.bz2">buildroot-2019.05-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2019.05-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 9913893875..6df7e46f16 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.05-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 May 2019</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.05-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.05-rc3.tar.bz2">2019.05-rc3
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
