From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Feb 2018 16:34:00 +0100
Subject: [Buildroot] [git commit] Update for 2018.02-rc1
Message-ID: <20180205154624.B1B7688424@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30bffce8d58da8087a2fce87eba37f416f7139cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 27 +++++++++++++++------------
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 3 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/CHANGES b/CHANGES
index 022e94f520..61f04ec134 100644
--- a/CHANGES
+++ b/CHANGES
@@ -49,19 +49,22 @@
 	Zlib is now a virtual package, provided by either libzlib or
 	zlib-ng, similar to openssl.
 
+	Support for the Rust programming language.
+
 	New packages: aoetools, armbian-firmware, binaries-marvell,
-	brltty, cups-filters, curlpp, daq, flatbuffers, gconf,
-	glorytun, gstreamer1-mm, imx-m4fwloader, imx-gpu-g2d,
-	json-for-modern-cpp, libcpprestsdk, libgta, libostree,
-	libupnp18, luadbi, luadbi-sqlite3, lua-utf8, lynx, meson,
-	mv-ddr-marvell, nilfs-utils, opentracing-cpp, open-lldp, pimd,
-	proj, python-flask-cors, python-jaraco-classes,
-	python-more-itertools, python-oauthlib, python-raven,
-	python-remi, python-requests-oauthlib, python-schedule,
-	python-secretstorage, python-see, python-tabledata,
-	python-txtorcon, python-xlib, qt5charts, rtl8189fs, rtl8723bu,
-	rygel, safeclib, solatus, tcf-agent, traceroute, waylandpp,
-	wolfssl, zisofs-tools, zlib-ng
+	brltty, cargo, cargo-bin, cups-filters, curlpp, daq,
+	flatbuffers, gconf, glorytun, gstreamer1-mm, imx-m4fwloader,
+	imx-gpu-g2d, json-for-modern-cpp, libcpprestsdk, libgta,
+	libostree, libupnp18, luadbi, luadbi-sqlite3, lua-utf8, lynx,
+	meson, mv-ddr-marvell, nilfs-utils, opentracing-cpp,
+	open-lldp, pimd, proj, python-flask-cors,
+	python-jaraco-classes, python-more-itertools, python-oauthlib,
+	python-raven, python-remi, python-requests-oauthlib,
+	python-schedule, python-secretstorage, python-see,
+	python-tabledata, python-txtorcon, python-xlib, qt5charts,
+	rtl8189fs, rtl8723bu, rust, rustc, rust-bin, rygel, safeclib,
+	solatus, tcf-agent, traceroute, waylandpp, wolfssl,
+	zisofs-tools, zlib-ng
 
 	Removed packages: eeprog
 
diff --git a/Makefile b/Makefile
index e12bcb45b4..90019bd764 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02-git
+export BR2_VERSION := 2018.02-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1512070000
+BR2_VERSION_EPOCH = 1517840000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 097e760a89..57c82e2739 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2017.11.2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2017.11-rc2</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2018.02-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.11-rc2.tar.gz">buildroot-2017.11-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2017.11-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.02-rc1.tar.gz">buildroot-2018.02-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.02-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.11-rc2.tar.bz2">buildroot-2017.11-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2017.11-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.02-rc1.tar.bz2">buildroot-2018.02-rc1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.02-rc1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
