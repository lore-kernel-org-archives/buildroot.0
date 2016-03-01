From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Mar 2016 21:47:30 +0100
Subject: [Buildroot] [git commit] Update for 2016.02
Message-ID: <20160301205128.F03C4818A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aaf6c28a5c49251df31b82c48c971bc18183cf6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 12 ++++++++++++
 Makefile                   |  2 +-
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 943047a..c8b6352 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,15 @@
+2016.02, Released March 1st, 2016
+
+	Minor fixes, mostly security related.
+
+	Circular dependency issue with same-as-kernel linux-headers
+	option fixed.
+
+	Updated/fixed packages: bluez5_utils, heirloom-mailx,
+	imx-gpu-viv, kodi-pvr-argustv, kodi-pvr-mediaportal-tvserver,
+	kodi-pvr-nextpvr, libfcgi, openssl, pifmrds, powerpc-utils,
+	python-m2crypto, slang, sox, squid, tn5250, xerces, zsh
+
 2016.02-rc3, Released February 27th, 2016
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 568f5c2..63502d0 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.02-rc3
+export BR2_VERSION := 2016.02
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index dae9b5b..9e1642b 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,40 +8,40 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable release: <b>2015.11.1</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2016.02</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2015.11.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2015.11.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2015.11.1.tar.gz">buildroot-2015.11.1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2015.11.1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.02.tar.gz">buildroot-2016.02.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2016.02.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2015.11.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2015.11.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.02.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2015.11.1.tar.bz2">buildroot-2015.11.1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2015.11.1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.02.tar.bz2">buildroot-2016.02.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2016.02.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2016.02-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -75,7 +75,7 @@
 	  <p><a href="/downloads/buildroot-2016.02-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index f36c259..62f1b5d 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2016.02 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 March 2016</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2016.02 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.02">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2016.02.tar.bz2">2016.02 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index c376837..b8f02af 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2015.11.1'
+RELEASE='2016.02'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
