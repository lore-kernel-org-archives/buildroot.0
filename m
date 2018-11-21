From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Nov 2018 08:44:25 +0100
Subject: [Buildroot] [git commit] Update for 2018.11-rc2
Message-ID: <20181121074214.48F3F83DDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc89c1a834cd8a1a74e71522029ec827bf0aec92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 38 ++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 71 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 703728a728..dedd2755a0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,41 @@
+2018.11-rc2, released November 21th, 2018
+
+	Fixes all over the tree.
+
+	fs: Drop intermediate tarball from the filesystem handling to
+	fix an issue with xattrs handling related to fakeroot. Ensure
+	tarball target includes xattrs.
+
+	download: Fix confusion in git submodule handling if dl/ is a
+	symlink.
+
+	genrandconfig: Fix missing newline in BR2_WGET handling,
+	causing the following line to be ignored. This would affect
+	BR2_ENABLE_DEBUG, BR2_INIT_BUSYBOX, BR2_INIT_SYSTEMD,
+	BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV, BR2_STATIC_LIBS or
+	BR2_PACKAGE_PYTHON_PY_ONLY depending on the randomization.
+
+	show-build-order: Also include the dependencies of
+	rootfs-common.
+
+	Fix a number of build issues in packages for the recently
+	merged RISC-V architecture support.
+
+	Updated/fixed packages: dt-utils, easydbus, elfutils,
+	flare-engine, flatcc, glibc, gstreamer, gstreamer1, imx-uuc,
+	libassuan, libcorrect, libiscsi, libkrb5, libmicrohttpd,
+	libnftnl, libnspr, libnss, libsemanage, libsigsegv, libv4l,
+	ltp-testsuite, luv, luvi, make, ncmpc, netplug, openocd,
+	prosody, qemu, rpm, sconeserver, shadowsocks-libev,
+	supertuxcart, syslinux, systemd, trace-cmd, uclibc,
+	uclibc-ng-test, vtun, webkitgtk, weston, wireshark, xen,
+	xlib_libfontenc
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11086: download/git submodule breaks on symlinked dl folder
+	#11216: Capabilities not applied to filesystem
+
 2018.11-rc1, released November 9th, 2018
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 94adff3406..69cbd7868d 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.11-rc1
+export BR2_VERSION := 2018.11-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1541800000
+BR2_VERSION_EPOCH = 1542786000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 59bd8bae29..209197e31c 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2018.11-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2018.11-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.11-rc1.tar.gz">buildroot-2018.11-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.11-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.11-rc2.tar.gz">buildroot-2018.11-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.11-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.11-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.11-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.11-rc1.tar.bz2">buildroot-2018.11-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.11-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.11-rc2.tar.bz2">buildroot-2018.11-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.11-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 1f2bd2867c..78037421b5 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2018.11-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 November 2018</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups
+          and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.11-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2018.11-rc2.tar.bz2">2018.11-rc2
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
