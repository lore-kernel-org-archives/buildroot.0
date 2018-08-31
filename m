From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 Sep 2018 00:28:13 +0200
Subject: [Buildroot] [git commit] Update for 2018.08-rc3
Message-ID: <20180831222832.62D32821DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24b5ff16aeeeea37227364219b7f270000cda008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 29 +++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 62 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 36bcfe0bb3..8c2ffb0469 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,32 @@
+2018.08-rc3, Released August 31th, 2018
+
+	Fixes all over the tree.
+
+	linux: additional improvements to the flex / bison dependency
+	handling, use system provided variant if available. Ensure
+	toolchain is available when configuring for 4.18+ support.
+
+	Download: Fix handling of primary sites using file://
+
+	Toolchain: Correct external toolchain musl detection for
+	static toolchains.
+
+	Updated/fixed packages: aircrack-ng, bison, brltty, busybox,
+	cutelyst, dropbear, gr-osmosdr, i2c-tools, json-c, libconfuse,
+	libkcapi, libsoup, libssh, liburiparser, mbedtls, mender,
+	mesa3d, minicom, mjpegtools, mutt, openpowerlink, openssh,
+	oracle-mysql, php, postgresql, pv, qt5base, qt5quickcontrols,
+	rauc, shairport-sync, systemd, xlib_libX11, zeromq,
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11091: BR2_PRIMARY_SITE doesn't work (wget is selected...
+	#11141: WF111 package no longer available
+	#11211: Internal compiler error: Killed (program cc1plus)..
+	#11236: util-linux fails to build on Travis CI when python..
+	#11246: Glibc 2.28 - fails to build host-bison and host-m4
+	#11256: Add python-falcon and python-mimeparse packages
+
 2018.08-rc2, Released August 20th, 2018
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 413ec921cd..9d66bbacf4 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.08-rc2
+export BR2_VERSION := 2018.08-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1534755000
+BR2_VERSION_EPOCH = 1535752000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 34c3221f51..830cf1bffb 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2018.08-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2018.08-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.08-rc2.tar.gz">buildroot-2018.08-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.08-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.08-rc3.tar.gz">buildroot-2018.08-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.08-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.08-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.08-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.08-rc2.tar.bz2">buildroot-2018.08-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.08-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.08-rc3.tar.bz2">buildroot-2018.08-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.08-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 4bd18e91a3..84468351b8 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2018.08-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2018</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups
+          and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.08-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2018.08-rc3.tar.bz2">2018.08-rc3
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
