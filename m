From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 May 2021 15:42:38 +0200
Subject: [Buildroot] [git commit] Update for 2021.05-rc2
Message-ID: <20210522131401.B5BB2888BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e326fcff64bfb5df5409440bcde7954c4e734c34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 35 +++++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 3 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9f9f5e94ff..53b9020767 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,38 @@
+2021.05-rc2, released May 22th, 2021
+
+	Fixes all over the tree.
+
+	support/scripts/gen-missing-cpe: A script to query the list of
+	CPE IDs for the packages enabled in the current configuration and:
+
+	- for CPE IDs that do not have any matching entry in the CPE
+	  database, it emits a warning
+
+	- for CPE IDs that do have a matching entry, but not with the same
+	  version, it generates a snippet of XML that can be used to propose
+	  an updated version to NIST.
+
+	CPE meta data has been added for a large number of packages
+
+	Updated/fixed packages: assimp, binutils, bitcoin, bullet,
+	cutelyst, dhcp, dmalloc, docker-engine, ebtables,
+	environment-setup, flatcc, gcc, gd, gerbera, hostapd,
+	imx-gpu-viv, intel-microcode, jquery-validation, libdrm,
+	libgeos, libraw, libtirpc, libxml2, libxslt, live555, lmbench,
+	localedef, lvm2, mender, mender-grubenv, modem-manager, mutt,
+	opensbi, openssh, opentyrian, pipewire, postgis, postgresql,
+	prosody, python-bluezero, python-falcon, redis, rocksdb,
+	rt-tests, runc, vlc, waylandpp, webkitgtk, wireshark,
+	wpa_supplicant, wpewebkit, xlib_libX11, xterm
+
+	New packages: jh71xx-tools
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13781: isc dhcp-server package don't create file /usr/bin/dhcpd
+	#13801: toolchainfile.cmake CMAKE_BUILD_TYPE
+	#13806: Building host-localedef fails on fedora 34/gcc 11
+
 2021.05-rc1, released May 12th, 2021
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 9d2c0d8ecb..57322fb586 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.05-rc1
+export BR2_VERSION := 2021.05-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1620809000
+BR2_VERSION_EPOCH = 1621690900
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 96a51e4874..3654285527 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 -->
-      <h3 style="text-align: center;">Latest release candidate: <b>2021.05-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2021.05-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.05-rc1.tar.gz">buildroot-2021.05-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.05-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.05-rc2.tar.gz">buildroot-2021.05-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.05-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.05-rc1.tar.bz2">buildroot-2021.05-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.05-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.05-rc2.tar.bz2">buildroot-2021.05-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.05-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
