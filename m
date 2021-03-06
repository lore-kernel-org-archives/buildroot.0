From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Mar 2021 22:16:45 +0100
Subject: [Buildroot] [git commit] Update for 2021.02
Message-ID: <20210306210003.18DC9815EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2fba6457bd9d9c720540332eaf0c1f8c29eab00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 20 ++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 21 +++++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 55 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index ab34fde9ae..f7b69af806 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,23 @@
+2021.02, released March 6th, 2021
+
+	Various fixes.
+
+	Toolchain: Correct Bootlin xtensa-lx60 dependencies
+
+	Updated/fixed packages: asterisk, belle-sip, bustle, dhcpcd,
+	dovecot, dovecot-pigeonhole, gnuchess, gnuradio,
+	gst1-plugins-bad, haproxy, jasper, kismet, libebml,
+	libeXosip2, libgeos, libhtp, libjpeg, libopenssl, libshout,
+	libstrophe, mosquitto, openblas, openssh, perl, privoxy,
+	prosody, python-pyyaml, python3-pyyaml, quagga, redis,
+	rust-bin, sox, suricata, tpm2-pkcs11, uclibc-ng-test, ushare,
+	util-linux, wolfssl, wpa_supplicant
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13501: 2021.02.rc2: Unicode not work on qt 5.15.2
+	#13581: jpegsrc.v9d.tar.gz has changed hash
+
 2021.02-rc3, released February 27th, 2021
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 13e98e85be..9d6b962477 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02-rc3
+export BR2_VERSION := 2021.02
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1614447000
+BR2_VERSION_EPOCH = 1615065000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 1bc7104a44..bd6499dfce 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,40 +8,40 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest long term support release: <b>2020.02.11</b></h3>
+      <h3 style="text-align: center;">Latest stable / long term support release: <b>2021.02</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.02.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.02.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2020.02.11.tar.gz">buildroot-2020.02.11.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2020.02.11.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.02.tar.gz">buildroot-2021.02.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.02.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.02.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.02.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.02.11.tar.bz2">buildroot-2020.02.11.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2020.02.11.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.02.tar.bz2">buildroot-2021.02.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.02.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest stable release: <b>2020.11.3</b></h3>
 
       <div class="row mt centered">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2021.02-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index c10230c41b..c882664c77 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.02 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 March 2021</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2021.02 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.02">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.02.tar.bz2">2021.02 release</a>.</p>
+
+	  <p>Notice that this is a long term support release which will be
+	  supported with security and other important fixes until March 2022.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 28a74b9929..685d8e3b75 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.11.3'
+RELEASE='2021.02'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
