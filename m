From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Nov 2019 23:02:26 +0100
Subject: [Buildroot] [git commit] Update for 2019.11-rc2
Message-ID: <20191116215532.4CF358EF85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ab7e0c6f3eba58aba87fafecd6f8b920342c0d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 24 ++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 56 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index b3bef0d234..60126c9a10 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,27 @@
+2019.11-rc2, released November 16th, 2019
+
+	Fixes all over the tree.
+
+	Toolchain: ARC tools bumped to arc-2019.09-rc1, ensure
+	external toolchain kernel headers version check correctly stop
+	the build on mismatch
+
+	Meson: Fix generation of global cross-compilation.conf
+
+	Download: Also use the package download method for extra
+	downloads from the same site, so it does not get confused by
+	URLs containing '+'
+
+	Defconfigs: Fix boot issue for beaglebone
+
+	Updated/fixed packages: bird, chrony, connman, dhcp, domoticz,
+	dropwatch, dtc, elf2flt, gettext-tiny, glog, intel-microcode,
+	ipsec-tools, jailhouse, kodi, libfribi, libmbim, libressl,
+	libsigrokdecode, libsvgtiny, linux-serial-test, ltp-testsuite,
+	lvm2, lxc, mariadb, mesa3d, minizip, ndisc6, neardal, ninja,
+	ofono, openvmtools, oracle-mysql, qt5wayland, safeclib, socat,
+	sudo, systemd, wpewebkit, xserver_xorg-server
+
 2019.11-rc1, released November 5th, 2019
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index c78c2cbcf6..a415ad6ab8 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.11-rc1
+export BR2_VERSION := 2019.11-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1572993000
+BR2_VERSION_EPOCH = 1573941000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 0c831f9166..fea38db76b 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2019.11-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2019.11-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.11-rc1.tar.gz">buildroot-2019.11-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2019.11-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.11-rc2.tar.gz">buildroot-2019.11-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2019.11-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.11-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.11-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.11-rc1.tar.bz2">buildroot-2019.11-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2019.11-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.11-rc2.tar.bz2">buildroot-2019.11-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2019.11-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 8528713847..1bb9d2676a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.11-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 November 2019</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.11-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.11-rc2.tar.bz2">2019.11-rc2
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
