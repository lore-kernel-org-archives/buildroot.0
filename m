From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Aug 2009 23:21:30 +0200
Subject: [Buildroot] [git commit master] buildroot: update for 2009.08-rc3
Message-ID: <20090826212215.5A660761C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4595a2fc9f72c688a5405292ca69e57afc5a111b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |   25 +++++++++++++++++--------
 Config.in          |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   16 +++++++++++++++-
 4 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index b7f75a1..01f6cb1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,24 +1,33 @@
+2009.08-rc3, Released August 26th, 2009:
+
+	Additional fixes and cleanups.
+
+	Updated/fixed packages: alsa-utils, berkeleydb, busybox, dbus,
+	directfb, enchant, kernel headers.
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#471: Allow directfb compilation with debug
+	#541: Removal of CVS directories in target filesystem broken
+	#547: berkeleydb: Update config.{sub, guess}
+	#549: enchant: Fix dependencies.
+	#569: Fix alsa-utils build for x86 on x86-64
+
 2009.08-rc2, Released August 6th, 2009:
 
 	Additional fixes and new features.
 
 	New packages: libuuid, gcc 4.3.4.
 
-	Updated/fixed packages: busybox, berkeleydb, classpath, dbus,
-	directfb, enchant, gzip, ipsec-tools, jamvm, libusb,
-	microperl, neon, popt, sed, webkit.
+	Updated/fixed packages: busybox, classpath, gzip, ipsec-tools,
+	jamvm, libusb, microperl, neon, popt, sed, webkit.
 
 	Fixed issue with 'make oldconfig'
 
 	Issues resolved (http://bugs.uclibc.org):
 
-	#471: Allow directfb compilation with debug
 	#525: sed broken with external toolchain
 	#537: Fix gzip build with recent glibc
-	#541: Removal of CVS directories in target filesystem broken
-	#547: berkeleydb: Update config.{sub, guess}
-	#549: enchant: Fix dependencies.
-	#569: Fix alsa-utils build for x86 on x86-64
 
 2009.08-rc1, Released August 2nd, 2009:
 
diff --git a/Config.in b/Config.in
index f2e84ac..f8974a0 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2009.08-rc2"
+	default "2009.08-rc3"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/docs/download.html b/docs/download.html
index bae5c6b..4c7e5d5 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2009.05.tar.bz2">buildroot-2009.05.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2009.08-rc2</b>, which can be
+The latest release candidate is <b>2009.08-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2009.08-rc2.tar.gz">buildroot-2009.08-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2009.08-rc3.tar.gz">buildroot-2009.08-rc3.tar.gz</a>
 or
-<a href="/downloads/buildroot-2009.08-rc2.tar.bz2">buildroot-2009.08-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2009.08-rc3.tar.bz2">buildroot-2009.08-rc3.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be dowloaded from
diff --git a/docs/news.html b/docs/news.html
index 8ed4eb9..33712dd 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,9 +5,23 @@
 <p>
 
 <ul>
+  <li><b>26 August 2009 -- 2009.08-rc3 released</b>
+    <p>A number of bugfixes have been added to the tree since RC2
+    (especially thanks to Thomas Petazzoni) - See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08_rc3">CHANGES</a>
+    file for details. This is very much expected to be the final release
+    candidate, so give it a good test and expect a final 2009.08
+    release next weekend unless critical issues are found.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2009.08-rc3.tar.bz2">2009.08-rc3
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>6 August 2009 -- 2009.08-rc2 released</b>
 
-    <p>RC2 is out with more cleanups and bugfixe, see the <a
+    <p>RC2 is out with more cleanups and bugfixes, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08_rc2">CHANGES</a>
     file for details.
 
-- 
1.6.3.3
