From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 17:18:34 +0100
Subject: [Buildroot] [git commit] Update for 2020.02-rc2
Message-ID: <20200226160718.3A6AD8E9F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b36e2eca2084a69b61a089bf319ae852632178df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 23 +++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index d883bb393e..34f681596b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2020.02-rc2, released February 26th, 2020
+
+	Fixes all over the tree.
+
+	Toolchain: Ensure strong SSP can only be enabled if the
+	(external) toolchain supports it.
+
+	Fix a race condition related to creating the output/staging
+	symlink on systems with coreutils < 8.27.
+
+	Drop support for the (end of life) Qt 5.6 variant.
+
+	Updated/fixed packages: at, armadillo, audiofile, bash,
+	busybox, erlang, fail2ban, fluidsynth, ipsec-tools, jpeg-turbo,
+	kvm-unit-tests, libftdi1, libinput, libsvgtiny, libtomcrypt,
+	libupnpp, libxml2, linux-tools, luv, mbedtls, mesa3d, minicom,
+	openvmtools, php, qt5, qt5webengine, qwt, radvd, rcw,
+	sdbusplus, systemd, tpm2-tss, vorbis-tools
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12581: 2020.02-rc1 glibc failing to build on fedora 31
+
 2020.02-rc1, released February 18th, 2020
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 40e71ffbf4..e9c2741fed 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02-rc1
+export BR2_VERSION := 2020.02-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1582065000
+BR2_VERSION_EPOCH = 1582733000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 2e003da71c..da02c53c38 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2020.02-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2020.02-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.02-rc1.tar.gz">buildroot-2020.02-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2020.02-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.02-rc2.tar.gz">buildroot-2020.02-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2020.02-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.02-rc1.tar.bz2">buildroot-2020.02-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2020.02-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.02-rc2.tar.bz2">buildroot-2020.02-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2020.02-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index b6584b572a..168b858fab 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.02-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 February 2020</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.02-rc2.tar.bz2">2020.02-rc2
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
