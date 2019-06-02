From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jun 2019 10:01:07 +0200
Subject: [Buildroot] [git commit] Update for 2019.05
Message-ID: <20190602080208.08A96889AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d4e26da08dcdfeb16dc980d1b34ab750a00abe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 23 +++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 26 +++++++++++++-------------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 57 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5abe2a8c31..35a094b70f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2019.05, released June 2nd, 2019
+
+	Various fixes.
+
+	Toolchain: Ensure pre-built Andes toolchains can only be
+	selected when x86 32bit support is available on the host.
+	Disallow PowerPC SPE ABI for GCC >= 8.x, as it is no longer
+	supported.
+
+	Infra: pkg-config: Use a dedicated timestamp file rather than
+	.config as that gets touched by linux-4.19+, causing repeated
+	builds.
+
+	Add C-SKY support to our config.sub (gnuconfig)
+
+	Updated/fixed packages: dosfstools, botan, brotli, dropbear,
+	flare-engine, gst1-plugins-bad, libhtp, libnss, libopenssl,
+	linuxptp, matchbox-panel, mender, mutt, netsurf,
+	network-manager, opencv3, openjdk, openmpi, php,
+	python-cython, qt5multimedia, qtwayland, qt5webkit-examples,
+	supertux, suricata, tpm2-totp, v4l2loopback, wireshark,
+	wpewebkit
+
 2019.05-rc3, released May 25th, 2019
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 826b25bdaa..7ff40496d3 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.05-rc3
+export BR2_VERSION := 2019.05
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1558820000
+BR2_VERSION_EPOCH = 1559462000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 7110bf445d..3fe5833727 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,7 +8,7 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable / long term support release: <b>2019.02.2</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2019.02.2</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -41,41 +41,41 @@
 	  <p><a href="/downloads/buildroot-2019.02.2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest stable release: <b>2018.11.3</b></h3>
+
+      <h3 style="text-align: center;">Latest stable release: <b>2019.05</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.11.3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.11.3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2018.11.3.tar.gz">buildroot-2018.11.3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.11.3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.05.tar.gz">buildroot-2019.05.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2019.05.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.11.3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.11.3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.11.3.tar.bz2">buildroot-2018.11.3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.11.3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.05.tar.bz2">buildroot-2019.05.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2019.05.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2019.05-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2019.05-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 6df7e46f16..c2225d1813 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.05 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 June 2019</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2019.05 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.05">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.05.tar.bz2">2019.05 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 6168f05810..39b0e85e79 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2019.02'
+RELEASE='2019.05'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
