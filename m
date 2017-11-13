From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Nov 2017 22:28:15 +0100
Subject: [Buildroot] [git commit] Update for 2017.11-rc2
Message-ID: <20171113212134.2D90280576@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=071cc43892f4a6c0b26b7a145f844acde31e7ee0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 15 +++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 48 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index a9f3365..c0595f6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,18 @@
+2017.11-rc2, Released November 13th, 2017
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: collectd, ffmpeg, freerdp,
+	go-bootstrap, imagemagick, jimtcl, libpjsip, libplist, libuv,
+	mesa3d, nodejs, ntp, openjpeg, postgresql, python-numpy, ruby,
+	snmp++, usb_modeswitch, util-linux, vboot-utils, webkitgtk,
+	wireshark, wpa_supplicant, xapp_xdriinfo
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#10326: mesa3d package fails to build when BR2_SHARED_STATIC_LIBS=y
+	#10491: Cannot output security warning when compiled with buildroot..
+
 2017.11-rc1, Released November 6th, 2017
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 9240d0a..55409b9 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2017.11-rc1
+export BR2_VERSION := 2017.11-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1510000000
+BR2_VERSION_EPOCH = 1510608000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 5c8a51b..a7842b4 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2017.11-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2017.11-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.11-rc1.tar.gz">buildroot-2017.11-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2017.11-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.11-rc2.tar.gz">buildroot-2017.11-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2017.11-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.11-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.11-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.11-rc1.tar.bz2">buildroot-2017.11-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2017.11-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.11-rc2.tar.bz2">buildroot-2017.11-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2017.11-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index bbb4cb9..f2186f2 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2017.11-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 November 2017</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups
+          and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.11-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2017.11-rc2.tar.bz2">2017.11-rc2
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
