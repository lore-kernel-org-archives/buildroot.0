From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Nov 2015 13:31:31 +0100
Subject: [Buildroot] [git commit] Update for 2015.11-rc2
Message-ID: <20151119123546.9716D81F6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfaed966af9c0e853844a36618420c1491ac037d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |   33 +++++++++++++++++++++++++++++++++
 Makefile                   |    2 +-
 docs/website/download.html |   10 +++++-----
 docs/website/news.html     |   13 +++++++++++++
 4 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index d801ac3..c4b6acd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,36 @@
+2015.11-rc2, Released November 19th, 2015
+
+	Fixes all over the tree.
+
+	LD_LIBRARY_PATH is no longer used to ensure host binaries find
+	their libraries, fixing issues on recent Fedora.
+
+	Toolchain fixes for powerpc e5500 / e6500. Fix for an issue
+	with ${TARGET}-cc after the move to use a toolchain wrapper
+	for the internal toolchain.
+
+	Appy-patches.sh now correctly applies all files listed in
+	series files.
+
+	Fixes for merged /usr handling when a custom skeleton is used.
+
+	Updated/fixed packages: axfsutils, boost, busybox, dhcp,
+	directfb, dropbear, ebtables, fastd, ffmpeg, gauche, gcc,
+	gettext, gst1-plugins-bad, hostapd, ibrdtnd, libcurl,
+	libecore, libgudev, libnss, libpng, libserial, libssh2,
+	libuecc, libxml2, linux-headers, liquid-dsp, ltris,
+	lua-periphery, minidlna, mongrel2, mpd, mpg123, mplayer,
+	mysql, opencv, opencv3, package, perl-file-util, php-ssh2,
+	polarssl, pulseaudio, python-protobuf, qemu, qt5base, ranger,
+	ruby, skeleton, slang, squeezelite, strongswan, tovid, uclibc,
+	ushare, wine, wpa_supplicant, x265,
+	xdriver_xf86-video-siliconmotion, zxing-cpp
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#4790: Running udhcpc on a system with NFS root kills NFS
+	#8456: Building host-pkgconf on Fedora 23 fails due to..
+
 2015.11-rc1, Released November, 7th 2015
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 80c264f..71c6836 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.11-rc1
+export BR2_VERSION := 2015.11-rc2
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index a6c2ac0..201e248 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -17,14 +17,14 @@ or
 (<a href="/downloads/buildroot-2015.08.1.tar.bz2.sign">PGP signature</a>).
 
 <p>
-The latest release candidate is <b>2015.11-rc1</b>, which can be
+The latest release candidate is <b>2015.11-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2015.11-rc1.tar.gz">buildroot-2015.11-rc1.tar.gz</a>
-(<a href="/downloads/buildroot-2015.11-rc1.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2015.11-rc2.tar.gz">buildroot-2015.11-rc2.tar.gz</a>
+(<a href="/downloads/buildroot-2015.11-rc2.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2015.11-rc1.tar.bz2">buildroot-2015.11-rc1.tar.bz2</a>
-(<a href="/downloads/buildroot-2015.11-rc1.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2015.11-rc2.tar.bz2">buildroot-2015.11-rc2.tar.bz2</a>
+(<a href="/downloads/buildroot-2015.11-rc2.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
diff --git a/docs/website/news.html b/docs/website/news.html
index ce81378..565e907 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -8,6 +8,19 @@
 <p>
 
 <ul>
+  <li><b>19 November 2015 -- 2015.11-rc2 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11-rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2015.11-rc2.tar.bz2">2015.11-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="support.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>7 November 2015 -- 2015.11-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
