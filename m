From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 18:34:56 +0100
Subject: [Buildroot] [git commit] Update for 2021.02-rc3
Message-ID: <20210227171315.BFD37866AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c5b27fbef3db3a3dc3628e90d452493729f51aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 23 +++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index b2ac108bd5..ab34fde9ae 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2021.02-rc3, released February 27th, 2021
+
+	Fixes all over the tree.
+
+	utils/scanpypi: Explicitly use python3 to ensure compatiblity
+	with packages having python3-only code in setup.py
+
+	support/download: Ensure sub-second timestamp precision is
+	dropped when creating a tarball from a (subversion) repo, as
+	that is not representable in the PAX tar format
+
+	Updated/fixed packages: babeltrace2, bind, botan, brltty,
+	cegui, elfutils, fakeroot, imagemagick, intel-mediasdk,
+	irqbalance, libglib2, libselinux, libusb, libuwsc, nodejs,
+	open62541, openldap, ply, python-aiohttp, python-django,
+	python3, qemu, readline, rust, screen, taglib, unbound, xterm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13516: utils/scanpypi: Failure when parsing diffoscope
+	#13541: 2021.02.rc2: irqbalance: Daemon couldn't be bound to...
+	#13561: Create a new user defining users-table.txt not working..
+
 2021.02-rc2, released February 16th, 2021
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 7f7727c231..13e98e85be 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02-rc2
+export BR2_VERSION := 2021.02-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1613580000
+BR2_VERSION_EPOCH = 1614447000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 7f3a5e7509..1bc7104a44 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2021.02-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2021.02-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.02-rc2.tar.gz">buildroot-2021.02-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.02-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.02-rc3.tar.gz">buildroot-2021.02-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.02-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.02-rc2.tar.bz2">buildroot-2021.02-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.02-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.02-rc3.tar.bz2">buildroot-2021.02-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.02-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 8c30dafce4..c10230c41b 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.02-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 February 2021</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2021.02-rc3 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.02-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.02-rc3.tar.bz2">2021.02-rc3
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
