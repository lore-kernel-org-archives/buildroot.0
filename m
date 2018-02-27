From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 22:58:57 +0100
Subject: [Buildroot] [git commit] Update for 2018.02-rc3
Message-ID: <20180227220032.4A597813CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5a63f48d71c519736e6378cadedd4f639de16fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 24 ++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index e62bc6c100..f2de1149ce 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,27 @@
+2018.02-rc3, Released February 27th, 2018
+
+	Fixes all over the tree.
+
+	check-bin-arch: skip /lib/modules to allow 32-bit userland
+	with 64bit kernel.
+
+	dependencies: Blacklist tar 1.30+ and build our own host-tar
+	if needed as tar 1.30+ changed the --numeric-owner output for
+	long path names. Build host-tar before other host-dependencies
+	as they need it to extract their source tarballs.
+
+	Update/fixed packages: asterisk, azmq, bluez5_utils, domoticz,
+	e2fsprogs, erlang, exim, glibc, gpsd, jq, libglib2, libvorbis,
+	mariadb, mbedtls, mesa3d, mesa3d-headers, mpv, patch, pcre2,
+	php, qt5, qt5multimedia, qt5wayland, qt5webengine, qt5webkit,
+	systemd, quagga, rustc, uboot, wireguard, zic, zlib-ng
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10726: Current libglib2.mk creates broken libglib2 binary...
+	#10786: Linux fails to build unless make linux-menuconfig...
+	#10796: Cannot generate cpio image without selecting CON...
+
 2018.02-rc2, Released February 15th, 2018
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index ec39bcdb9c..5fe3a34c47 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02-rc2
+export BR2_VERSION := 2018.02-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1518732000
+BR2_VERSION_EPOCH = 1519768000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 4244b169df..c9133eca6a 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2018.02-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2018.02-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.02-rc2.tar.gz">buildroot-2018.02-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.02-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.02-rc3.tar.gz">buildroot-2018.02-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.02-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.02-rc2.tar.bz2">buildroot-2018.02-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.02-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.02-rc3.tar.bz2">buildroot-2018.02-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.02-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 211029461a..fc11572f2d 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2018.02-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 February 2018</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>Release candidate 3 is out with more cleanups and security
+	  / build fixes. See
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02-rc3">CHANGES</a>
+	  file for details.</p>
+	<p>Head to the <a href="/downloads/">downloads page</a> to
+	  pick up
+	  the <a href="/downloads/buildroot-2018.02-rc3.tar.bz2">2018.02-rc3
+	    release candidate</a>, and report any problems found to
+	  the <a href="support.html">mailing list</a>
+	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
