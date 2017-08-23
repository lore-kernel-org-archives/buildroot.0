From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 23:38:05 +0200
Subject: [Buildroot] [git commit] Update for 2017.08-rc3
Message-ID: <20170823214006.2FC5B81D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef19f376c7013c41d06c289b7213f330ca4e98ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES                    | 23 +++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 25 +++++++++++++++++++++++++
 4 files changed, 59 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index e0e2b52..74a80ef 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2017.08-rc3, Released August 23rd, 2017
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: alsa-lib, alsa-utils, cc-tool,
+	dbus-cpp, e2fsprogs, elf2flt, faad2, fakeroot, gcc, git, gpsd,
+	gst1-validate, kvmtool, libconfuse, libepoxy, librsync,
+	libspatialindex, libunwind, linux, linux-headers, lua,
+	mariadb, mesa3d, mtd, openocd, python3, syslinux, sysvinit,
+	whois, xen, zmqpp.
+
+	Updated/fixed defconfigs: ci20, socrates_cyclone5,
+	toradex_apalis_imx6.
+
+	Removed defconfig: Armadeus APF9328.
+
+	skeleton-* packages introduced in -rc1 have been renamed to
+	skeleton-init-* instead.
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#10141: Squashfs extended attribute failures
+
 2017.08-rc2, Released August 11th, 2017
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 1b0e36f..65426a0 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2017.08-rc2
+export BR2_VERSION := 2017.08-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1502468000
+BR2_VERSION_EPOCH = 1503524000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 86ff971..3e81713 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2017.08-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2017.08-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.08-rc2.tar.gz">buildroot-2017.08-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2017.08-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.08-rc3.tar.gz">buildroot-2017.08-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2017.08-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.08-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.08-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.08-rc2.tar.bz2">buildroot-2017.08-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2017.08-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.08-rc3.tar.bz2">buildroot-2017.08-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2017.08-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 8310b90..bf05d14 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,31 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2017.08-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 August 2017</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>Another release candidate, on the road to the final 2017.08
+	  release. A number of fixes and cleanups in various packages
+	  and defconfigs. See
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.08-rc3">CHANGES</a>
+	  file for details.
+	</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2017.08-rc3.tar.bz2">2017.08-rc3
+	    release candidate</a>, and report any
+	  problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
