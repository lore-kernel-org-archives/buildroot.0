From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 14:51:08 +0100
Subject: [Buildroot] [git commit branch/next] Update for 2020.11-rc2
Message-ID: <20201117203829.788E67FB0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a33ea03b469a35f0dddcabd6e378819dc731024
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 26 ++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4f7864c0e0..9957622c34 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,29 @@
+2020.11-rc2, released November 14th, 2020
+
+	Fixes all over the tree.
+
+	cve-checker script dropped. Instead the pkg-stats logic has
+	been extended to be able to only generate stats for the
+	configured packages using 'make pkg-stats'
+
+	Removed defconfigs: rock64
+
+	Updated/fixed packages: apparmor, asterisk, bitcoin, busybox,
+	cups-filters, cryptsetup, davfs2, domoticz, elf2flt, freetype,
+	ghostscript, glmark2, go, gst1-plugins-bad, guile, jsoncpp,
+	libcap, libexif, libnetfilter_conntrack, libpam-tacplus,
+	libsigrokdecode, linux-backports, linux-firmware, mesa3d,
+	modem-manager, mp4v2, oniguruma, openntpd, python3,
+	python-lmdb, python-m2crypto, rauc, s390-tools, slirp,
+	stress-ng, suricata, systemd, tcpdump, tmux, tor, webkitgtk,
+	wireguard-linux-compat, wpewebkit, xen
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13281: Raspberry Pi 2: overlays folder missing in genimage-ra..
+	#13291: BR2_DL_DIR is ignored when creating defconfig
+	#13306: wpewebkit build problem in 2020-11-rc1
+
 2020.11-rc1, released November 4th, 2020
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index fa648d5d54..2d911bcee8 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.11-rc1
+export BR2_VERSION := 2020.11-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1604528000
+BR2_VERSION_EPOCH = 1605361000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 7d2a3c1c93..07627d0f34 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2020.11-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2020.11-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.11-rc1.tar.gz">buildroot-2020.11-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2020.11-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.11-rc2.tar.gz">buildroot-2020.11-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2020.11-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.11-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.11-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.11-rc1.tar.bz2">buildroot-2020.11-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2020.11-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.11-rc2.tar.bz2">buildroot-2020.11-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2020.11-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 5c4cea2d40..eab11e2f8a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.11-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 November 2020</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2020.11-rc2 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.11-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.11-rc2.tar.bz2">2020.11-rc2
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
