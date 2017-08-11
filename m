From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Aug 2017 22:36:39 +0200
Subject: [Buildroot] [git commit] Update for 2017.08-rc2
Message-ID: <20170811204306.28D7A80131@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ba4a139f5344a294af8c154980efc0f3db288ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES                    | 27 +++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 25 +++++++++++++++++++++++++
 4 files changed, 63 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8669485..e0e2b52 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,30 @@
+2017.08-rc2, Released August 11th, 2017
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: bind, dbus, erlang-p1-xml, faad2,
+	ficl, gcc, gdb, glibc, jack2, libcurl, linux, linux-headers,
+	lua, mutt, nvme, qt5base, skeleton-common, snappy, stella,
+	swupdate, uclibc, valgrind, webkitgtk.
+
+	Updated/fixed defconfigs: beaglebone_qt5, minnowboard_max,
+	nanopi_m1{, _plus}, olimex_a20_olinuxino_lime, qemu_sparc,
+	qemu_sparc64.
+
+	The cmake-package infrastructure for host packages has been
+	fixed to not incorrectly detect target packages through
+	pkg-config.
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9926:  systemd-resolved.service: Failed at step  NAMESPACE (systemd 233)
+	#10021: libqeglfs-viv-integration.so file is missing for qt5 on armv7
+	#10026: lua-5.3.4: fix lua linker error in swupdate
+	#10146: package/skeleton-common fix recursive variable
+	#10156: glibc compilation fails for X86 32bits  (i386)
+	#10201: toolchain-wrapper.c:192: (error) Memory  leak:
+	#10221: Buildroot Support
+
 2017.08-rc1, Released August 2nd, 2017
 
 	Infrastructure:
diff --git a/Makefile b/Makefile
index 6d4aeca..1b0e36f 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2017.08-rc1
+export BR2_VERSION := 2017.08-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 150170700
+BR2_VERSION_EPOCH = 1502468000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index f7aec42..86ff971 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2017.08-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2017.08-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.08-rc1.tar.gz">buildroot-2017.08-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2017.08-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.08-rc2.tar.gz">buildroot-2017.08-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2017.08-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.08-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.08-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.08-rc1.tar.bz2">buildroot-2017.08-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2017.08-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.08-rc2.tar.bz2">buildroot-2017.08-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2017.08-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 09b4021..8310b90 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,31 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2017.08-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 August 2017</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>Another release candidate, on the road to the final 2017.08
+	  release. A number of fixes and cleanups in various packages
+	  and defconfigs. See
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.08-rc2">CHANGES</a>
+	  file for details.
+	</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2017.08-rc2.tar.bz2">2017.08-rc2
+	    release candidate</a>, and report any
+	  problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
