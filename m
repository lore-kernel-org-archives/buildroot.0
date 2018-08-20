From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Aug 2018 10:55:03 +0200
Subject: [Buildroot] [git commit] Update for 2018.08-rc2
Message-ID: <20180820084817.23F188DE6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a907ab7db518ce60deabb016b45619125361c569
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 31 +++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 64 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 351f6f80ce..d0744353bc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,34 @@
+2018.08-rc2, Released August 20th, 2018
+
+	Fixes all over the tree.
+
+	pkg-kconfig: Support dependencies needed to run the
+	configurator, E.G. recent Linux kernel versions needing flex
+	and bison.
+
+	Defconfigs: ARM Juno: Bump ATF to fix a build
+	issue. Raspberrypi2: Bump rootfs size. Snps_archs38_vdk:
+	Correct /etc/inittab. Technologic ts7680: Correct genimage
+	configuration. Orange PI PC / Zero, Sheevaplug: Bump U-boot to
+	2018.07 to fix build issue. Ensure host-openssl is pulled in
+	for kernel builds where needed.
+
+	Updated/fixed packages: aircrack-ng, bind, boost,
+	boot-wrapper-aarch64, bzip2, busybox, chrony, cryptsetup,
+	dahdi-tools, dbus, domoticz, eigen, ipsec-tools, libarchive,
+	libfuse, libgit2, libopenssl, libselinux, lighttpd, lvm2, m4,
+	makedevs, mariadb, mesa3d-headers, mono, ncmpc, ncurses,
+	nodejs, php, python-django, python-pyqt5, qt5base,
+	qt5serialbus, ruby, samba4, uboot-tools, uclibc, vlc,
+	waylandpp, wireless_tools, wireshark, wpa_supplicant, mtd,
+	xdriver_xf86-video-ati, xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10781: cryptsetup luksOpen container_file container causes..
+	#10996: bogus musl ARM toolchain
+	#11191: xattr and check-package issue
+
 2018.08-rc1, Released August 5th, 2018
 
 	Toolchain:
diff --git a/Makefile b/Makefile
index f79d39fd26..413ec921cd 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.08-rc1
+export BR2_VERSION := 2018.08-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1533476000
+BR2_VERSION_EPOCH = 1534755000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 3a6e08ca91..4e8a40f6ce 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2018.08-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2018.08-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.08-rc1.tar.gz">buildroot-2018.08-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.08-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.08-rc2.tar.gz">buildroot-2018.08-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.08-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.08-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.08-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.08-rc1.tar.bz2">buildroot-2018.08-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.08-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.08-rc2.tar.bz2">buildroot-2018.08-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.08-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 0535f96497..7461d3f5ea 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2018.08-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 August 2018</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups
+          and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.08-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2018.08-rc2.tar.bz2">2018.08-rc2
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
