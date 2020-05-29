From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 May 2020 22:45:33 +0200
Subject: [Buildroot] [git commit] Update for 2020.05-rc3
Message-ID: <20200529202917.2DF1891DF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e118415151052365c5967687bce152a2c971ef7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 22 ++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 54 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4310a11fc5..85e9828cbf 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,25 @@
+2020.05-rc3, released May 29th, 2020
+
+	Fixes all over the tree.
+
+	Infrastructure: Support checking download hashes for packages
+	coming from Subversion.
+
+	Defconfigs: Increase boot partition size to 64MB for Freescale
+	boards to allow space for bigger kernels.
+
+	Updated/fixed packages: audit, bind, dovecot, efl, erlang,
+	ffmpeg, fio, gerbera, gnupg, leveldb, lrzip, ltrace, matio,
+	mesa3d, mp4v2, prosody, qemu, qt5declarative, speexdsp,
+	systemd, tremor, uboot-tools, unbound, wireshark
+
+	Removed packages: wiringpi
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12361: Init system (systemd) kills login on Raspberry Pi Zero
+	#12686: recipe for target 'install_dev' failed (libcrypto.so..)
+
 2020.05-rc2, released May 22nd 2020
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index cb15428406..374ddb068f 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.05-rc2
+export BR2_VERSION := 2020.05-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1590140000
+BR2_VERSION_EPOCH = 1590784000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index a2e14a4a5b..60308d9e56 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 -->
-      <h3 style="text-align: center;">Latest release candidate: <b>2020.05-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2020.05-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.05-rc2.tar.gz">buildroot-2020.05-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2020.05-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.05-rc3.tar.gz">buildroot-2020.05-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2020.05-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.05-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.05-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.05-rc2.tar.bz2">buildroot-2020.05-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2020.05-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.05-rc3.tar.bz2">buildroot-2020.05-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2020.05-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index ec49017fd2..908a3f4536 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.05-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 May 2020</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.05-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.05-rc3.tar.bz2">2020.05-rc3
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
