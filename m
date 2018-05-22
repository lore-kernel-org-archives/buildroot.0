From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 May 2018 23:26:26 +0200
Subject: [Buildroot] [git commit] Update for 2018.05-rc2
Message-ID: <20180522212546.9744B80F97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c11ed3a4d961ed67e2b5845569cbbe214abdaa8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 43 +++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 76 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index c386ef7cc6..4a51dafab5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,46 @@
+2018.05-rc2, Released May 22nd, 2018
+
+	Fixes all over the tree.
+
+	Dependencies: Check that the current working directory (.)
+	isn't listed in PATH as that causes various build issues.
+
+	Manual: Clarify that git branch names may not be used as
+	version identifiers. This has never been supported, but was
+	kind of working (with some limitations) before the git
+	download rework - Now it does not work at all.
+
+	Linux: Ensure host version of ncurses is picked up and not
+	host-ncurses built by buildroot, as that otherwise causes
+	widechar/non-widechar conflicts and corrupted menuconfig
+	menus.
+
+	Packages: Renamed a number of package options not prefixed
+	with BR2_PACKAGE_<pkg> for consstency.
+
+	Download infrastructure: Fix file:// protocol handling after
+	download rework.
+
+	Updated/fixed packages: acl, apr-util, asterisk, attr,
+	bluez5_utils, cifs-utils, clamav, clang, cups-filters,
+	dahdi-linux, exim, faketime, gdb, go, gst1-plugins-bad,
+	imx-mkimage, ipsec-tools, jamvm, janus-gateway,
+	jquery-ui-themes, libcap, libcurl, libftdi, libkcapi, libkrb5,
+	libmediaart, libmodbus, libmodplug, libmpd,
+	libnetfilter_cthelper, libnetfilter_cttimeout, libnfc,
+	libnfnetlink, libnss, liboauth, libogg, libosip2,
+	libpam-radius-auth, libpcap, libpciaccess, llvm, log4cplus,
+	ltrace, lynx, mbedtls, modem-manager, nfs-utils,
+	python-cython, python-websockets, qt5cinex, qt5wayland, rauc,
+	snort, strace, ti-sgx-km, transmission, wavpack, wget, woff2,
+	xen, zmqpp, znc, zstd
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10986: Installing package attr when already supplied by...
+	#11011: BUildroot for Raspberry Pi 2
+	#11016: Wrong compiler used for external user host packages
+
 2018.05-rc1, Released May 9th, 2018
 
 	Toolchain: glibc bumped to 2.27, musl bumped to 1.1.19,
diff --git a/Makefile b/Makefile
index 5fc435a225..3415f994bd 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.05-rc1
+export BR2_VERSION := 2018.05-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1525899000
+BR2_VERSION_EPOCH = 1527024000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 4ac00a27be..1ae05e9c62 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -77,37 +77,37 @@
       </div>
 -->
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2018.05-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2018.05-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.05-rc1.tar.gz">buildroot-2018.05-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.05-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.05-rc2.tar.gz">buildroot-2018.05-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.05-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.05-rc1.tar.bz2">buildroot-2018.05-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.05-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.05-rc2.tar.bz2">buildroot-2018.05-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.05-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index cb70b7119b..c14b108d1c 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2018.05-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 May 2018</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups
+          and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.05-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2018.05-rc2.tar.bz2">2018.05-rc2
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
