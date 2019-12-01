From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2019 22:39:47 +0100
Subject: [Buildroot] [git commit] Update for 2019.11
Message-ID: <20191201213230.69ED68369A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=836b84a7743cbf7d6b745efd023217bed47e34e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 32 ++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 19 ++++++++++++++++++-
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 64 insertions(+), 15 deletions(-)

diff --git a/CHANGES b/CHANGES
index d00e72d5fd..f2b34b9a98 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2019.11, released December 1st, 2019
+
+	Various fixes.
+
+	Infrastructure: Make HOST_<pkg>_DL_OPTS inherit from
+	<pkg>_DL_OPTS by default, just like it is done for a number of
+	other package variables.
+
+	Add <pkg>_KEEP_PY_FILES to exclude specific python .py files
+	from the removal done by BR2_PACKAGE_PYTHON{,3}_PYC_ONLY for
+	the (rare) case where the .py files are needed at runtime
+	rather than .pyc.
+
+	Updated/fixed packages: am33x-cm3, bind, collectd, go, gob2,
+	gst1-plugins-bad, haproxy, jasper, jpeg-turbo, libdrm,
+	libftdi, libftdi1, libnss, libselinux, libstrophe, lzma,
+	minicom, network-manager, nodejs, oniguruma, opencv3,
+	openvmtools, perl-gdgraph, perl-gdtextutil, prosody,
+	python-cchardet, systemd, tiff, wolfssl,
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11416: check-uniq-files staging issue
+	#12146: Oprofile runtime issue
+	#12166: Compiling nodejs for SAMA5D3 always crash with illegal inst..
+	#12171: Python-opencv needs config.py and config-3.7.py to run..
+	#12196: duma package
+	#12211: host-nodejs 10.15.3 package fail to build
+	#12316: tzdata fails to install with empty "default local time"
+	#12326: network-manager build fails with missing glib error
+	#12366: Gstreamer1 gst1-plugins-bad do not compile with RPI-Userland
+
 2019.11-rc3, released November 24th, 2019
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 3ac55fafcb..65c703bf61 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.11-rc3
+export BR2_VERSION := 2019.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1574590000
+BR2_VERSION_EPOCH = 1575236000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index efeea3f7e2..4a667f6084 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,40 +42,40 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2019.08.2</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2019.11</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.08.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.08.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2019.08.2.tar.gz">buildroot-2019.08.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2019.08.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.11.tar.gz">buildroot-2019.11.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2019.11.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.08.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.08.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.08.2.tar.bz2">buildroot-2019.08.2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2019.08.2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.11.tar.bz2">buildroot-2019.11.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2019.11.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2019.11-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2019.11-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index e77075a41c..06702e0fc6 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,8 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
-  <li class="timeline-inverted">
   <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.11 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 December 2019</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2019.11 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.11">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.11.tar.bz2">2019.11 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
+  <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
       <div class="timeline-heading">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index ec9cdeb1e3..cac6854dea 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2019.08'
+RELEASE='2019.11'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
