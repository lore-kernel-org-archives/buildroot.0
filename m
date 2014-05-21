From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 May 2014 17:17:03 +0200
Subject: [Buildroot] [git commit] Update for 2014.05-rc2
Message-ID: <20140521154016.123869CCE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63fbdd5c891b857cebb56d6de1e8c7d169951495
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |   39 +++++++++++++++++++++++++++++++++++++++
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 58 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index e9cdd56..edce6de 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,42 @@
+2014.05-rc2, Released May 21st, 2014
+
+	Fixes all over the tree.
+
+	Stripping using sstrip has been deprecated.
+
+	BR2_EXTERNAL can now also be used to implement custom
+	filesystem types.
+
+	The newly added BR2_GRAPH_DEPTH variable to limit the depth of
+	the generated dependency graph has been renamed to
+	BR2_GRAPH_DEPS_OPTS, so additional options can be supported in
+	the future.
+
+	The virtual package infrastructure will now error out early
+	if multiple packages providing the same virtual package has
+	been enabled (E.G. opengl). This change requires that the
+	packages explicitly declare what virtual package(s) they
+	provide.
+
+	Updated/fixed packages: acpid, armadillo, avahi, bellagio,
+	btrfs-progs, cairo, clapack, directfb, duma, ecryptfs-utils,
+	elfutils, eudev, fbgrab, fio, flann, fluxbox, gdb, gpm,
+	gpu-viv-bin-mx6q, gst1-plugins-good, gst-plugins-good,
+	imagemagick, iprutils, ipsec-tools, jack2, libdvdnav,
+	libdvdread, libnss, libunwind, linux-headers, lsof, lua,
+	luajit, matchbox-keyboard, mesa3d, mpd, mplayer, mtr, mysql,
+	netsnmp, nodejs, openpowerlink, openvpn, pciutils,
+	php-imagick, postgresql, pulseaudio, qt5quick1, rpi-userland,
+	rsyslog, samba, samba4, sane-backends, sunxi-mali, systemd,
+	ti-gfx, tstools, udev, webkit, wpa_supplicant, xbmc,
+	xlib_libXpm, xserver_xorg-server, zyre
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#5396: Boot hangs when starting samba if BR2_ENABLE_LOCALE...
+	#7016: Git issues in resulting buildroot tar
+	#7094: pciutils doesn't build on Blackfin
+
 2014.05-rc1, Released May 13th, 2014
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 4b93805..b7a0721 100644
--- a/Makefile
+++ b/Makefile
@@ -25,7 +25,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION := 2014.05-rc1
+export BR2_VERSION := 2014.05-rc2
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/download.html b/docs/download.html
index 2d18c65..7493980 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -15,14 +15,14 @@ or
 
 <p>
 
-The latest release candidate is <b>2014.05-rc1</b>, which can be
+The latest release candidate is <b>2014.05-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2014.05-rc1.tar.gz">buildroot-2014.05-rc1.tar.gz</a>
-(<a href="/downloads/buildroot-2014.05-rc1.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2014.05-rc2.tar.gz">buildroot-2014.05-rc2.tar.gz</a>
+(<a href="/downloads/buildroot-2014.05-rc2.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2014.05-rc1.tar.bz2">buildroot-2014.05-rc1.tar.bz2</a>
-(<a href="/downloads/buildroot-2014.05-rc1.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2014.05-rc2.tar.bz2">buildroot-2014.05-rc2.tar.bz2</a>
+(<a href="/downloads/buildroot-2014.05-rc2.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 0d549ee..1b04eb8 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -6,6 +6,19 @@
 
 <ul>
 
+  <li><b>21 May 2014 -- 2014.05-rc2 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05-rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2014.05-rc2.tar.bz2">2014.05-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="support.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>13 May 2014 -- 2014.05-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
