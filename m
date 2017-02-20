From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Feb 2017 00:20:50 +0100
Subject: [Buildroot] [git commit] Update for 2017.02-rc2
Message-ID: <20170220232111.1122881DAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bedc0ccd7052d063e6ce0ab816b44cad29dbc658
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 32 ++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 65 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index b13f6db..f241f36 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2017.02-rc2, Released February 20th, 2017
+
+	Fixes all over the tree.
+
+	Support for SOURCE_DATE_EPOCH in the toolchain wrapper for
+	older gcc versions for reproducible builds has been
+	(temporarily) reverted because of licensing compatiblity
+	concerns.
+
+	Defconfigs: SD card generation fix for the Udoo Neo board
+
+	Infrastructure to handle .lz compressed tarballs added, and
+	affected packages updated to use it.
+
+	Updated/fixed packages: bctoolbox, bind, canelloni,
+	cbootimage, ccache, classpath, cups, dbus, ddrescue, directfb,
+	ed, erlang, gcc, gdb, glmark2, gstreamer, gstreamer1, hiredis,
+	kmod, kmsxx, lcdapi, libasplib, libgpiod, libnss, libraw,
+	libv4l, mesa3d-headers, mosquitto, mpd, mpv, musl, ntfs-3g,
+	ocrad, openswan, postgresql, qt5base, qt5quickcontrols, redis,
+	riemann-c-client, samba4, sunxi-mali, tcping, trousers,
+	uclibc, util-linux, vim, wavpack, wget, wiringpi, xfsprogs,
+	xserver_xorg-server
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#8941: Valgrind fails to build with stack protection turned on
+	#9291: perl: SysV message queues not configured, even if available
+	#9651: libxcb-1.12 built Error
+	#9656: util-linux: schedutils doesn't build on target w/o enabl...
+	#9666: qt5quickcontrols install fails
+
 2017.02-rc1, Released February 11th, 2017
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 9663d15..b5b431a 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.02-rc1
+export BR2_VERSION := 2017.02-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1486825200
+BR2_VERSION_EPOCH = 1487631000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 8d8aae3..85eb5f0 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2017.02-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2017.02-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.02-rc1.tar.gz">buildroot-2017.02-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2017.02-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.02-rc2.tar.gz">buildroot-2017.02-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2017.02-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.02-rc1.tar.bz2">buildroot-2017.02-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2017.02-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.02-rc2.tar.bz2">buildroot-2017.02-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2017.02-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 96cadfd..38ed846 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2017.02-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 February 2017</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.02-rc2">CHANGES</a>
+	  file for details.
+	</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2017.02-rc2.tar.bz2">2017.02-rc2
+	    release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
