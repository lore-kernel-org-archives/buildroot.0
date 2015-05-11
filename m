From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2015 13:28:26 +0200
Subject: [Buildroot] [git commit] Update for 2015.05-rc2
Message-ID: <20150511113319.1B1427F9A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f2435f6ddb52ad4bb21885dbf7d9395ff6428de2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |   24 ++++++++++++++++++++++++
 Makefile                   |    2 +-
 docs/website/download.html |   10 +++++-----
 docs/website/news.html     |   13 +++++++++++++
 4 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index e28eef7..11895e6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,27 @@
+2015.05-rc2, Released May 11th, 2015
+
+	Minor fixes.
+
+	Toolchain: PR56780 backport to GCC 4.8.4 to fix GDB linking
+	issues. Context functions enabled for uClibc snapshot /
+	uClibc-NG.
+
+	Architectures: Endian handling symbol for Xtensa, binutils
+	fixes.
+
+	Infrastructure: Fix for kernel module stripping when
+	localversion contains spaces.
+
+	Updated/fixed packages: at, autoconf-archive, binutils,
+	cc-tool, cryptsetup, dstat, expedite, freerdp, giflib,
+	gnuchess, guile, ipmiutil, iproute2, mono, monolite, neard,
+	ola, poppler, postgresql, python-qt, qt, sqlite, valgrind,
+	xlib_libXfont
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#8086: Cannot select systemd as init with Linaro 2014.09...
+
 2015.05-rc1, Released May 4th, 2015
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index b0e6915..5c4293b 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.05-rc1
+export BR2_VERSION := 2015.05-rc2
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/website/download.html b/docs/website/download.html
index 6a880c6..9362ccf 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -18,14 +18,14 @@ or
 
 <p>
 
-The latest release candidate is <b>2015.05-rc1</b>, which can be
+The latest release candidate is <b>2015.05-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2015.05-rc1.tar.gz">buildroot-2015.05-rc1.tar.gz</a>
-(<a href="/downloads/buildroot-2015.05-rc1.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2015.05-rc2.tar.gz">buildroot-2015.05-rc2.tar.gz</a>
+(<a href="/downloads/buildroot-2015.05-rc2.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2015.05-rc1.tar.bz2">buildroot-2015.05-rc1.tar.bz2</a>
-(<a href="/downloads/buildroot-2015.05-rc1.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2015.05-rc2.tar.bz2">buildroot-2015.05-rc2.tar.bz2</a>
+(<a href="/downloads/buildroot-2015.05-rc2.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
diff --git a/docs/website/news.html b/docs/website/news.html
index 91bafd4..6ca5647 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -8,6 +8,19 @@
 <p>
 
 <ul>
+  <li><b>11 May 2015 -- 2015.05-rc2 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05-rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2015.05-rc2.tar.bz2">2015.05-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="support.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>4 May 2015 -- 2015.05-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
