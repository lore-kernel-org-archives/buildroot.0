From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Aug 2015 22:20:16 +0200
Subject: [Buildroot] [git commit] Update for 2015.08-rc2
Message-ID: <20150824205427.1BE9B81E5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=985b46be0c1dceba753549e1faf71914baf88540
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES                    |   31 +++++++++++++++++++++++++++++++
 Makefile                   |    2 +-
 docs/website/download.html |   10 +++++-----
 docs/website/news.html     |   13 +++++++++++++
 4 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index ee4aca1..589448c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,34 @@
+2015.08-rc2, Released August, 24th 2015
+
+	Fixes all over the tree.
+
+	Toolchain: fix gcc build on NIOS-II.
+
+	Infrastructure: add <fs>_POST_GEN_HOOKS mechanism to fix
+	hybrid ISO image generation.
+
+	Architectures: add arm1136j-s variant.
+
+	Updated/fixed packages: apitrace, audit, bcusdk, bdwgc,
+	beecrypt, boost, bwm-ng, cdrkit, c-icap, cifs-utils, clapack,
+	c-periphery, cpio, cramfs, czmq, dawgdic, dnsmasq, dosfstools,
+	dropbear, elfutils, empty, eudev, fan-ctrl, filemq, gnutls,
+	guile, haveged, imlib2, libcec, libepoxy, libev, libgpgme,
+	libiio, libnetfilter_queue, libnfnetlink, libpfm4, libpthsem,
+	librtas, libselinux, libsigsegv, libsodium, libv4l, lightning,
+	linux, lirc-tools, lrzsz, mono, mosh, mpd, msmtp, nbd,
+	netatalk, nodejs, ola, opencv, oprofile, php, poco,
+	postgresql, powertop, protobuf, protobuf-c, qt5base,
+	qt5quickcontrols, rapidjson, rng-tools, squid, sysdig,
+	sysstat, tftpd, tinc, tz, util-linux, webkitgtk24, weston,
+	wireshark, wvstreams, xdriver_xf86-input-synaptics, zyre.
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#8276: package/dropbear: symlink resolution incorrect
+	#8286: Error with buildroot
+	#8301: ldconfig parameter in Makefile
+
 2015.08-rc1, Released August, 5th 2015
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index b4cef3f..07fd69b 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.08-rc1
+export BR2_VERSION := 2015.08-rc2
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index aa4d731..935699e 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -17,14 +17,14 @@ or
 (<a href="/downloads/buildroot-2015.05.tar.bz2.sign">PGP signature</a>).
 
 <p>
-The latest release candidate is <b>2015.08-rc1</b>, which can be
+The latest release candidate is <b>2015.08-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2015.08-rc1.tar.gz">buildroot-2015.08-rc1.tar.gz</a>
-(<a href="/downloads/buildroot-2015.08-rc1.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2015.08-rc2.tar.gz">buildroot-2015.08-rc1.tar.gz</a>
+(<a href="/downloads/buildroot-2015.08-rc2.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2015.08-rc1.tar.bz2">buildroot-2015.08-rc1.tar.bz2</a>
-(<a href="/downloads/buildroot-2015.08-rc1.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2015.08-rc2.tar.bz2">buildroot-2015.08-rc1.tar.bz2</a>
+(<a href="/downloads/buildroot-2015.08-rc2.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
diff --git a/docs/website/news.html b/docs/website/news.html
index 633a83a..2d6ad0f 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -8,6 +8,19 @@
 <p>
 
 <ul>
+  <li><b>24 August 2015 -- 2015.08-rc2 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see
+    the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08-rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2015.08-rc2.tar.bz2">2015.08-rc2
+    release candidate</a>, and report any problems found to the
+    <a href="support.html">mailing list</a> or
+    <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>5 August 2015 -- 2015.08-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
