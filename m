From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Nov 2017 22:35:17 +0100
Subject: [Buildroot] [git commit] Update for 2017.11
Message-ID: <20171130212831.D9E898223D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9dd76697ccd2bac65a78fd7687899e1c9ca14465
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 28 ++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 60 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index cdd9481..bca075a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,31 @@
+2017.11, Released November 30, 2017
+
+	Fixes all over the tree.
+
+	Toolchain: Use github mirror for Glibc.
+
+	Defconfigs: Correct boot.cmd for bananapi-m1.
+
+	Makefiles: Workaround include order issues for certain make
+	versions by explicitly sorting the result of wildcard where it
+	matters.
+
+	Download: Ensure subversion runs in non-interactive mode.
+
+	Updated/fixed packages: asterisk, boost, chrony, dovecot,
+	dvb-apps, exim, feh, freerdp, fwup, google-breakpad, jose,
+	kvm-unit-test, lftp, libcurl, libevent, libfastjson, libpjsip,
+	libupnp, linphone, localedef, lttng-tools, mp4v2, mtools,
+	ndisc6, oracle-mysql, parted, pdbg, qt, qt5connectivity,
+	qt5declarative, qt5webkit, rauc, runc, samba4, shairport-sync,
+	systemd-bootchart, webkitgtk, wireguard, xlib_libXcursor,
+	xlib_libXfont, xlib_libXfont2,
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	10501: host-localedef fails to compile on Ubuntu 17.10
+	10506: Changed kernel image type (e.g. zImage to uImage)...
+
 2017.11-rc2, Released November 13th, 2017
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 3ee6abe..a86d764 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2017.11-rc2
+export BR2_VERSION := 2017.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1510608000
+BR2_VERSION_EPOCH = 1512070000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 2ea8890..6f26d67 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,40 +42,40 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2017.08.2</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2017.11</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.08.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.08.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2017.08.2.tar.gz">buildroot-2017.08.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2017.08.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.11.tar.gz">buildroot-2017.11.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2017.11.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.08.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.08.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.08.2.tar.bz2">buildroot-2017.08.2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2017.08.2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.11.tar.bz2">buildroot-2017.11.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2017.11.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2017.11-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2017.11-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index e5b108a..5de000f 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2017.11 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2017</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2017.11 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.11">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2017.11.tar.bz2">2017.11 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index cb41c30..3d833f0 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2017.08'
+RELEASE='2017.11'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
