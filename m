From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Feb 2019 15:06:12 +0100
Subject: [Buildroot] [git commit] Update for 2019.02-rc2
Message-ID: <20190223140419.5C8588B66D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=108c8312304a1e2341fa7319ca219cf156241654
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 24 ++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 215f8e323d..d4ecae315a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,27 @@
+2019.02-rc2, released February 23th, 2019
+
+	Fixes all over the tree.
+
+	Removed zynq_zybo defconfig, as it hasn't seen any update
+	since it was added in 2016, and uses a U-Boot version not
+	compatible with openssl-1.1.x.
+
+	Linux: Ignore user supplied downloadable hashes, as no hash
+	checksums are available for those.
+
+	Updated/fixed packages: bind, cryptopp, docker-containerd,
+	dtc, efivar, gdb, imagemagick, ipmiutil, libcpprestsdk,
+	libcurl, libgpiod, libid3tag, libv4l, log4cplus, luvi,
+	madplay, mender, mosquitto, poco, postgresql, proftpd,
+	pulseaudio, python-django, qemu, qt5base, qwt, rabbitmq-c,
+	reaver, safeclip, stress-ng, swupdate, syslog-ng, systemd,
+	tor, unzip, xenomai
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11501: compile sdl2 with enable wayland
+	#11681: .. unable to initialize decompress status for section..
+
 2019.02-rc1, released February 13th, 2019
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index f736ecfb3e..06e49281dd 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02-rc1
+export BR2_VERSION := 2019.02-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1550044800
+BR2_VERSION_EPOCH = 1550930600
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 52c8b1d565..3f304daf30 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2019.02-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2019.02-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.02-rc1.tar.gz">buildroot-2019.02-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2019.02-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.02-rc2.tar.gz">buildroot-2019.02-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2019.02-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.02-rc1.tar.bz2">buildroot-2019.02-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2019.02-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.02-rc2.tar.bz2">buildroot-2019.02-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2019.02-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 87507d5539..45d2eb5535 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.02-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 February 2019</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups
+          and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.02-rc2.tar.bz2">2019.02-rc2
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
