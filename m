From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2020 00:03:08 +0100
Subject: [Buildroot] [git commit] Update for 2020.02-rc3
Message-ID: <20200302225110.EAA2C8F1EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=338e2b5ba18748e2c88b2173816b2bff3c6a9a93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 23 +++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 34f681596b..50bb4f1c7c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2020.02-rc3, released March 2nd, 2020
+
+	Fixes all over the tree.
+
+	Infrastructure: Rework file list handling to fix race
+	conditions when building with per-package target and host
+	directories and top-level parallel builds.
+
+	Updated/fixed packages: aufs, binutils, blktrace, brltty,
+	cairo, dnsmasq, docker-compose, elf2flt, exim, exiv2, git,
+	kodi-inputstream-adaptive, libarchive, libcgroup, libgdiplus,
+	libssh2, libvncserver, libvorbis, linknx, linux-firmware, lxc,
+	lz4, mosquitto, openjpeg, openrc, poco, proftpd, pure-ftpd,
+	python3, python-multidict, python-setuptools-scm-git-archive,
+	qpdf, qt5tools, rdesktop, rocksdb, shellinabox, squid,
+	suricata, swig, systemd, taglib, util-linux, wireshark, zsh
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12571: ltp-testsuite : Build failure
+	#12576: 2020.02-RC1: error while loading shared libraries: ...
+	#12581: 2020.02-rc1 glibc failing to build on fedora 31
+
 2020.02-rc2, released February 26th, 2020
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index c8017b61ec..10874e9b44 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02-rc2
+export BR2_VERSION := 2020.02-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1582733000
+BR2_VERSION_EPOCH = 1583189900
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index da02c53c38..1ae069fb4e 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2020.02-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2020.02-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.02-rc2.tar.gz">buildroot-2020.02-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2020.02-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.02-rc3.tar.gz">buildroot-2020.02-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2020.02-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.02-rc2.tar.bz2">buildroot-2020.02-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2020.02-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.02-rc3.tar.bz2">buildroot-2020.02-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2020.02-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 168b858fab..91d24c084d 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.02-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 March 2020</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.02-rc3.tar.bz2">2020.02-rc3
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
