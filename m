From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Aug 2011 11:21:17 +0200
Subject: [Buildroot] [git commit] Update for 2011.08-rc2
Message-ID: <20110829092402.880AB8D32E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=73f131ce7d9811fcc8c4b7a161e9700266e09695
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |   10 ++++++++--
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   12 ++++++++++++
 4 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1682a55..2225e76 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,11 +1,17 @@
-2011.08, Not yet released:
+2011.08-rc2, Released August 29th, 2011:
 
 	Fixes all over the tree.
 
-	Toolchain: crosstool-NG 1.12.0, use binutils 2.21 of
+	Toolchain: crosstool-NG 1.12.1, use binutils 2.21 on
 	mips/sh/older uClibc, disallow uClibc 0.9.32 on avr32/sh
 	(broken).
 
+	Defconfigs: kernel updates, fix mini2440 serial port config,
+	remove old arm toolchain configs.
+
+	Bootloaders: Fix grub patching, add barebox-{n,x,menuconfig}
+	targets similar to linux/busybox.
+
 	Updated/fixed packages: barebox, directfb, libsoup,
 	libxml-parser-perl, mtd, ncurses, python, ti-utils, udev,
 	usbmount, util-linux, xfont_font-misc-misc
diff --git a/Makefile b/Makefile
index f74a6ac..e975320 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.08-rc1
+export BR2_VERSION:=2011.08-rc2
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index 3977d68..e8b8c48 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2011.05.tar.bz2">buildroot-2011.05.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2011.08-rc1</b>, which can be
+The latest release candidate is <b>2011.08-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2011.08-rc1.tar.gz">buildroot-2011.08-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2011.08-rc2.tar.gz">buildroot-2011.08-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2011.08-rc1.tar.bz2">buildroot-2011.08-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2011.08-rc2.tar.bz2">buildroot-2011.08-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 1abca4d..d957497 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,18 @@
 <p>
 
 <ul>
+  <li><b>29 August 2011 -- 2011.08-rc2 released</b>
+
+    <p>RC2 is out with more bugfixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08_rc2">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2011.08-rc2.tar.bz2">2011.08-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>4 August 2011 -- 2011.08-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
-- 
1.7.3.4
