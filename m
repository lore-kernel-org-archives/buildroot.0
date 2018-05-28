From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 23:02:21 +0200
Subject: [Buildroot] [git commit] Update for 2018.05-rc3
Message-ID: <20180528210228.9130F822F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bea6b866efb52c3ff7745bbea4aba4562d6877bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 28 ++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 61 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4a51dafab5..e48ac23adc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,31 @@
+2018.05-rc3, Released May 28th, 2018
+
+	Fixes all over the tree.
+
+	Toolchain: ARC tools updated to arc-2018.03-rc2.
+
+	Fs: Ensure hard links in TARGET_DIR are correctly copied for
+	filesystem input. With the recent changes to the file system
+	generation logic, hard links were "expanded" in file system
+	images leading to bloated rootfs images for setups with hard
+	links.
+
+	Infrastructure: Error out for packages using the 'local'
+	method but forgetting to specify <pkg>_SITE.
+
+	Build rpcgen for the host when needed to support distributions
+	no longer shipping rpcgen with glibc (E.G. recent Fedora).
+
+	Updated/fixed packages: autofs, bash-completion, binutils,
+	busybox, cjson, elf2flt, libcoap, libcurl, libtirpc, lrzsz,
+	poppler, procps-ng, qt-webkit-kiosk, quota, samba4, xfsprogs
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11031: ld-elf2flt: host/bin/ld.real': execvp: No such file..
+	#11036: C compiler cannot create executables
+	#11046: Git package binaries are ~180MB (compared to ~20MB in..
+
 2018.05-rc2, Released May 22nd, 2018
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 3415f994bd..7be8a6634b 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.05-rc2
+export BR2_VERSION := 2018.05-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1527024000
+BR2_VERSION_EPOCH = 1527540000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 1ae05e9c62..03f8e1818c 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -77,37 +77,37 @@
       </div>
 -->
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2018.05-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2018.05-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.05-rc2.tar.gz">buildroot-2018.05-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.05-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.05-rc3.tar.gz">buildroot-2018.05-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.05-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.05-rc2.tar.bz2">buildroot-2018.05-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.05-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.05-rc3.tar.bz2">buildroot-2018.05-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.05-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index c14b108d1c..b89e6e27ed 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2018.05-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 May 2018</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>Release candidate 3 is out with more cleanups and security
+	  / build fixes. See
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.05-rc3">CHANGES</a>
+	  file for details.</p>
+	<p>Head to the <a href="/downloads/">downloads page</a> to
+	  pick up
+	  the <a href="/downloads/buildroot-2018.02-rc5.tar.bz2">2018.02-rc5
+	    release candidate</a>, and report any problems found to
+	  the <a href="support.html">mailing list</a>
+	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
