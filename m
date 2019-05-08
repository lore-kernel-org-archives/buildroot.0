From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 May 2019 22:54:44 +0200
Subject: [Buildroot] [git commit] Update for 2019.05-rc1
Message-ID: <20190508204958.42587885D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8b229a75caf84bbf1cbc3eb07df637bf0def6d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 62 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 +--
 docs/website/download.html | 22 ++++++++--------
 docs/website/news.html     | 23 +++++++++++++++++
 4 files changed, 98 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 15cdb0715c..6fb63479ee 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,65 @@
+2019.05-rc1, Released May 8th, 2019
+
+	Fixes all over the tree and new features.
+
+	Architecture: Andes 32-bit (nds32) support added.
+
+	Only build host-lzip / host-xz when really needed by packages,
+	not just when not available on the build host.
+
+	Toolchain: Glibc bumped to 2.29, musl bumped to 1.1.22,
+	binutils 2.32 added, 2.28/2.29 removed, default changed to
+	2.31.1.
+
+	fs: Set FAKEROOTDONTTRYCHOWN environment variable to not
+	forward {f,l,}chown calls to libc when running under fakeroot
+	to fix issues when building in restricted environments
+	(E.G. user namespace with bubblewrap).
+
+	Linux: Also build default make target to ensure extra files
+	like the gdb scripts enabled by CONFIG_GDB_SCRIPTS are also
+	built. Notice: This may mean that extra host utilities like
+	uboot-mkimage are needed.
+
+	Infrastructure: show-info and <pkg>-show-info make targets
+	added to output package metadata in JSON format for external
+	use.
+
+	pkg-generic: Only tweak .la files needing it to ensure they
+	are not included in subsequent package file lists.
+
+	test-pkg: Generate a basic package config if none is
+	specified.
+
+	Gettext-tiny package added as an lightweight replacement for
+	GNU gettext for situations where NLS support is not needed.
+
+	New defconfigs: Andes AE3XX, Freescale imx8mpico / imx8qxpmek
+	/ T2080 QDS RDB, Licheepi zero, Orangepi R1
+
+	Removed defconfigs: Olimx A20 Olinuxino Lime legacy
+
+	New packages: bats-core, bayer2rgb-neon, brickd, cog, dacapo,
+	enet, gettext-tiny, gli, gst1-plugins-bayer2rgb-neon,
+	imx-sc-firmware, intel-mediadriver, intel-mediasdk, libcamera,
+	libhtp, libp11, libwpe, lua-binaryheap, lua-gd, lua-lunitx,
+	mender-artifact, most, oniguruma, openjdk, openjdk-bin,
+	opensbi, optee-benchmark, optee-client, optee-examples,
+	optee-os, optee-test, paho-mqtt-cpp, python-aioblescan,
+	python-aioconsole, python-aiohttp-cors, python-aiomonitor,
+	python-backcall, python-jedi, python-parso, python-pyjwt,
+	python-terminaltables, suricata, tpm2-totp, uftp,
+	wpebackend-fdo, wpewebkit
+
+	Removed packages: libump, lunit, sunxi-mali
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11716: Typo on website, saying latest release is 2018.2.11
+	#11756: package/syslinux: MBR's don't fit because of binutils..
+	#11761: Building custom kernel 5.1-rc3 or later breaks on objtool
+	#11816: Only selected coreutils binaries are installed
+
 2019.02.2, Released April 29th, 2019
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 4da2453288..6dcd3d23e3 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.05-git
+export BR2_VERSION := 2019.05-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1551735000
+BR2_VERSION_EPOCH = 1557349000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index b20a2809e7..a23013dd4c 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2018.11.3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
-      <h3 style="text-align: center;">Latest release candidate: <b>2019.02-rc3</b></h3>
+-->
+      <h3 style="text-align: center;">Latest release candidate: <b>2019.05-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.02-rc3.tar.gz">buildroot-2019.02-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2019.02-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.05-rc1.tar.gz">buildroot-2019.05-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2019.05-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.02-rc3.tar.bz2">buildroot-2019.02-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2019.02-rc3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.05-rc1.tar.bz2">buildroot-2019.05-rc1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2019.05-rc1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 8ebb158a0d..22f397abb7 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,29 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.05-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 May 2019</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the
+	  tree, see the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.05-rc1">CHANGES</a>
+	  file for details.
+	</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.05-rc1.tar.bz2">2019.05-rc1
+	    release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
