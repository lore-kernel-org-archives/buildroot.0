From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 26 Feb 2014 23:18:29 +0100
Subject: [Buildroot] [PATCH] website: brand new version !
Message-ID: <1393453109-22443-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

A brand new identify for buildroot.org
This should at least give us a few years before we need to it again.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 README                                     |   59 +
 docs/README                                |   59 -
 docs/about.html                            |   11 +-
 docs/contribute.html                       |   39 +
 docs/copyright.txt                         |    2 +-
 docs/css/bootstrap-responsive.css          | 1092 +++++
 docs/css/bootstrap-responsive.min.css      |    9 +
 docs/css/bootstrap.css                     | 6039 ++++++++++++++++++++++++++++
 docs/css/bootstrap.min.css                 |  882 ++++
 docs/css/bootswatch.less                   |  181 +
 docs/css/variables.less                    |  301 ++
 docs/developer.html                        |   47 -
 docs/docs.html                             |    4 +-
 docs/download.html                         |   46 +-
 docs/footer.html                           |   24 +-
 docs/git.html                              |   44 -
 docs/header.html                           |  102 +-
 docs/images/glyphicons-halflings-white.png |  Bin 0 -> 8777 bytes
 docs/images/glyphicons-halflings.png       |  Bin 0 -> 12799 bytes
 docs/images/logo.png                       |  Bin 129459 -> 117499 bytes
 docs/images/menuconfig.png                 |  Bin 9087 -> 8604 bytes
 docs/index.html                            |   34 +-
 docs/js/bootstrap.js                       | 2159 ++++++++++
 docs/js/bootstrap.min.js                   |    6 +
 docs/js/buildroot.js                       |   56 +
 docs/js/jquery-1.10.2.min.js               |    6 +
 docs/lists.html                            |   40 -
 docs/news.html                             |  115 +-
 docs/sponsors.html                         |    2 +-
 docs/stylesheet.css                        |   75 -
 docs/support.html                          |   45 +
 31 files changed, 11060 insertions(+), 419 deletions(-)
 create mode 100644 README
 delete mode 100644 docs/README
 create mode 100644 docs/contribute.html
 create mode 100644 docs/css/bootstrap-responsive.css
 create mode 100644 docs/css/bootstrap-responsive.min.css
 create mode 100644 docs/css/bootstrap.css
 create mode 100644 docs/css/bootstrap.min.css
 create mode 100644 docs/css/bootswatch.less
 create mode 100644 docs/css/variables.less
 delete mode 100644 docs/developer.html
 delete mode 100644 docs/git.html
 create mode 100644 docs/images/glyphicons-halflings-white.png
 create mode 100644 docs/images/glyphicons-halflings.png
 create mode 100644 docs/js/bootstrap.js
 create mode 100644 docs/js/bootstrap.min.js
 create mode 100644 docs/js/buildroot.js
 create mode 100644 docs/js/jquery-1.10.2.min.js
 delete mode 100644 docs/lists.html
 delete mode 100644 docs/stylesheet.css
 create mode 100644 docs/support.html

diff --git a/README b/README
new file mode 100644
index 0000000..974adeb
--- /dev/null
+++ b/README
@@ -0,0 +1,59 @@
+To build and use the buildroot stuff, do the following:
+
+1) run 'make menuconfig'
+2) select the packages you wish to compile
+3) run 'make'
+4) wait while it compiles
+5) Use your shiny new root filesystem. Depending on which sort of
+    root filesystem you selected, you may want to loop mount it,
+    chroot into it, nfs mount it on your target device, burn it
+    to flash, or whatever is appropriate for your target system.
+
+You do not need to be root to build or run buildroot.  Have fun!
+
+Offline build:
+==============
+
+In order to do an offline-build (not connected to the net), fetch all
+selected source by issuing a
+$ make source
+
+before you disconnect.
+If your build-host is never connected, then you have to copy buildroot
+and your toplevel .config to a machine that has an internet-connection
+and issue "make source" there, then copy the content of your dl/ dir to
+the build-host.
+
+Building out-of-tree:
+=====================
+
+Buildroot supports building out of tree with a syntax similar
+to the Linux kernel. To use it, add O=<directory> to the
+make command line, E.G.:
+
+$ make O=/tmp/build
+
+And all the output files (including .config) will be located under /tmp/build.
+
+More finegrained configuration:
+===============================
+
+You can specify a config-file for uClibc:
+$ make UCLIBC_CONFIG_FILE=/my/uClibc.config
+
+And you can specify a config-file for busybox:
+$ make BUSYBOX_CONFIG_FILE=/my/busybox.config
+
+To use a non-standard host-compiler (if you do not have 'gcc'),
+make sure that the compiler is in your PATH and that the library paths are
+setup properly, if your compiler is built dynamically:
+$ make HOSTCC=gcc-4.3.orig HOSTCXX=gcc-4.3-mine
+
+Depending on your configuration, there are some targets you can use to
+use menuconfig of certain packages. This includes:
+$ make HOSTCC=gcc-4.3 linux-menuconfig
+$ make HOSTCC=gcc-4.3 uclibc-menuconfig
+$ make HOSTCC=gcc-4.3 busybox-menuconfig
+
+Please feed suggestions, bug reports, insults, and bribes back to the
+buildroot mailing list: buildroot at uclibc.org
diff --git a/docs/README b/docs/README
deleted file mode 100644
index 974adeb..0000000
--- a/docs/README
+++ /dev/null
@@ -1,59 +0,0 @@
-To build and use the buildroot stuff, do the following:
-
-1) run 'make menuconfig'
-2) select the packages you wish to compile
-3) run 'make'
-4) wait while it compiles
-5) Use your shiny new root filesystem. Depending on which sort of
-    root filesystem you selected, you may want to loop mount it,
-    chroot into it, nfs mount it on your target device, burn it
-    to flash, or whatever is appropriate for your target system.
-
-You do not need to be root to build or run buildroot.  Have fun!
-
-Offline build:
-==============
-
-In order to do an offline-build (not connected to the net), fetch all
-selected source by issuing a
-$ make source
-
-before you disconnect.
-If your build-host is never connected, then you have to copy buildroot
-and your toplevel .config to a machine that has an internet-connection
-and issue "make source" there, then copy the content of your dl/ dir to
-the build-host.
-
-Building out-of-tree:
-=====================
-
-Buildroot supports building out of tree with a syntax similar
-to the Linux kernel. To use it, add O=<directory> to the
-make command line, E.G.:
-
-$ make O=/tmp/build
-
-And all the output files (including .config) will be located under /tmp/build.
-
-More finegrained configuration:
-===============================
-
-You can specify a config-file for uClibc:
-$ make UCLIBC_CONFIG_FILE=/my/uClibc.config
-
-And you can specify a config-file for busybox:
-$ make BUSYBOX_CONFIG_FILE=/my/busybox.config
-
-To use a non-standard host-compiler (if you do not have 'gcc'),
-make sure that the compiler is in your PATH and that the library paths are
-setup properly, if your compiler is built dynamically:
-$ make HOSTCC=gcc-4.3.orig HOSTCXX=gcc-4.3-mine
-
-Depending on your configuration, there are some targets you can use to
-use menuconfig of certain packages. This includes:
-$ make HOSTCC=gcc-4.3 linux-menuconfig
-$ make HOSTCC=gcc-4.3 uclibc-menuconfig
-$ make HOSTCC=gcc-4.3 busybox-menuconfig
-
-Please feed suggestions, bug reports, insults, and bribes back to the
-buildroot mailing list: buildroot at uclibc.org
diff --git a/docs/about.html b/docs/about.html
index ae409fc..79b1c04 100644
--- a/docs/about.html
+++ b/docs/about.html
@@ -1,15 +1,7 @@
 <!--#include file="header.html" -->
 
-
-<!-- Begin Introduction section -->
-
-<h3>Buildroot: making Embedded Linux easy</h3>
-
 <div align="center">
-<a href="images/menuconfig.png">
- <img src="images/menuconfig_small.png" width="340" height="220"
- alt="Buildroot menuconfig" border="0">
-</a>
+  <img src="img/menuconfig.png" width="340" height="220" alt="Buildroot menuconfig" border="0">
 </div>
 
 <p>Buildroot is a set of Makefiles and patches that makes it easy to
@@ -60,5 +52,4 @@ cross-compilation process.</p>
 GENERAL PUBLIC LICENSE V2 (Or later)</a>. Stable releases are
 delivered every three months.</p>
 
-
 <!--#include file="footer.html" -->
diff --git a/docs/contribute.html b/docs/contribute.html
new file mode 100644
index 0000000..d7f5dfc
--- /dev/null
+++ b/docs/contribute.html
@@ -0,0 +1,39 @@
+<!--#include file="header.html" -->
+
+<h2>Contribute</h2>
+
+Buildroot is an open source project and if you want to contribute, here a few
+pointers to get you started.
+
+<p>Don't forget to look at <a href="./support.html">Support</a> if you need any
+help.
+And thanks for your help !</p>
+
+<h3>Autobuilder</h3>
+
+The <a href="http://autobuild.buildroot.org/">Autobuilder</a> are used to test
+Buildroot with a lot of differents settings (toolchains, various packages, etc)
+on all the supported platforms.
+
+<p>But despite our best effort sometimes, it fails..</p>
+<p>That's where you can help ! Look at a package that fails and try to fix it !</p>
+
+<h3>Wiki</h3>
+
+Have a look at the <a href="http://elinux.org/Buildroot">eLinux Wiki</a> a todo
+list is available there, which can help you find out what you could do to help
+Buildroot.
+
+<h3>Patchwork</h3>
+
+The <a href="http://patchwork.ozlabs.org/project/buildroot/list/">Patchwork</a>
+is a patch tracking system, if you submit a patch, they will appear here.
+
+<p>You can have a look at a patch that interest you and test it on your machine,
+if it succeed, you can send a <a
+  href="http://buildroot.org/downloads/manual/manual.html#_reviewing_testing_patches">"Tested-by"</a>,
+if it fails, you can also send a mail on the <a
+  href="http://buildroot.org/downloads/manual/manual.html#_mailing_list">mailing
+  list</a> and report what has happened to you.</p>
+
+<!--#include file="footer.html" -->
diff --git a/docs/copyright.txt b/docs/copyright.txt
index 4617d8e..0939b74 100644
--- a/docs/copyright.txt
+++ b/docs/copyright.txt
@@ -25,6 +25,6 @@ HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
 
 You have been warned.
 
-You can contact the webmaster at <buildroot@uclibc.org> if you have some sort
+You can contact the webmaster at <buildroot@buildroot.org> if you have some sort
 of problem with this.
 
diff --git a/docs/css/bootstrap-responsive.css b/docs/css/bootstrap-responsive.css
new file mode 100644
index 0000000..a3352d7
--- /dev/null
+++ b/docs/css/bootstrap-responsive.css
@@ -0,0 +1,1092 @@
+/*!
+ * Bootstrap Responsive v2.2.2
+ *
+ * Copyright 2012 Twitter, Inc
+ * Licensed under the Apache License v2.0
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Designed and built with all the love in the world @twitter by @mdo and @fat.
+ */
+
+ at -ms-viewport {
+  width: device-width;
+}
+
+.clearfix {
+  *zoom: 1;
+}
+
+.clearfix:before,
+.clearfix:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.clearfix:after {
+  clear: both;
+}
+
+.hide-text {
+  font: 0/0 a;
+  color: transparent;
+  text-shadow: none;
+  background-color: transparent;
+  border: 0;
+}
+
+.input-block-level {
+  display: block;
+  width: 100%;
+  min-height: 30px;
+  -webkit-box-sizing: border-box;
+     -moz-box-sizing: border-box;
+          box-sizing: border-box;
+}
+
+.hidden {
+  display: none;
+  visibility: hidden;
+}
+
+.visible-phone {
+  display: none !important;
+}
+
+.visible-tablet {
+  display: none !important;
+}
+
+.hidden-desktop {
+  display: none !important;
+}
+
+.visible-desktop {
+  display: inherit !important;
+}
+
+ at media (min-width: 768px) and (max-width: 979px) {
+  .hidden-desktop {
+    display: inherit !important;
+  }
+  .visible-desktop {
+    display: none !important ;
+  }
+  .visible-tablet {
+    display: inherit !important;
+  }
+  .hidden-tablet {
+    display: none !important;
+  }
+}
+
+ at media (max-width: 767px) {
+  .hidden-desktop {
+    display: inherit !important;
+  }
+  .visible-desktop {
+    display: none !important;
+  }
+  .visible-phone {
+    display: inherit !important;
+  }
+  .hidden-phone {
+    display: none !important;
+  }
+}
+
+ at media (min-width: 1200px) {
+  .row {
+    margin-left: -30px;
+    *zoom: 1;
+  }
+  .row:before,
+  .row:after {
+    display: table;
+    line-height: 0;
+    content: "";
+  }
+  .row:after {
+    clear: both;
+  }
+  [class*="span"] {
+    float: left;
+    min-height: 1px;
+    margin-left: 30px;
+  }
+  .container,
+  .navbar-static-top .container,
+  .navbar-fixed-top .container,
+  .navbar-fixed-bottom .container {
+    width: 1170px;
+  }
+  .span12 {
+    width: 1170px;
+  }
+  .span11 {
+    width: 1070px;
+  }
+  .span10 {
+    width: 970px;
+  }
+  .span9 {
+    width: 870px;
+  }
+  .span8 {
+    width: 770px;
+  }
+  .span7 {
+    width: 670px;
+  }
+  .span6 {
+    width: 570px;
+  }
+  .span5 {
+    width: 470px;
+  }
+  .span4 {
+    width: 370px;
+  }
+  .span3 {
+    width: 270px;
+  }
+  .span2 {
+    width: 170px;
+  }
+  .span1 {
+    width: 70px;
+  }
+  .offset12 {
+    margin-left: 1230px;
+  }
+  .offset11 {
+    margin-left: 1130px;
+  }
+  .offset10 {
+    margin-left: 1030px;
+  }
+  .offset9 {
+    margin-left: 930px;
+  }
+  .offset8 {
+    margin-left: 830px;
+  }
+  .offset7 {
+    margin-left: 730px;
+  }
+  .offset6 {
+    margin-left: 630px;
+  }
+  .offset5 {
+    margin-left: 530px;
+  }
+  .offset4 {
+    margin-left: 430px;
+  }
+  .offset3 {
+    margin-left: 330px;
+  }
+  .offset2 {
+    margin-left: 230px;
+  }
+  .offset1 {
+    margin-left: 130px;
+  }
+  .row-fluid {
+    width: 100%;
+    *zoom: 1;
+  }
+  .row-fluid:before,
+  .row-fluid:after {
+    display: table;
+    line-height: 0;
+    content: "";
+  }
+  .row-fluid:after {
+    clear: both;
+  }
+  .row-fluid [class*="span"] {
+    display: block;
+    float: left;
+    width: 100%;
+    min-height: 30px;
+    margin-left: 2.564102564102564%;
+    *margin-left: 2.5109110747408616%;
+    -webkit-box-sizing: border-box;
+       -moz-box-sizing: border-box;
+            box-sizing: border-box;
+  }
+  .row-fluid [class*="span"]:first-child {
+    margin-left: 0;
+  }
+  .row-fluid .controls-row [class*="span"] + [class*="span"] {
+    margin-left: 2.564102564102564%;
+  }
+  .row-fluid .span12 {
+    width: 100%;
+    *width: 99.94680851063829%;
+  }
+  .row-fluid .span11 {
+    width: 91.45299145299145%;
+    *width: 91.39979996362975%;
+  }
+  .row-fluid .span10 {
+    width: 82.90598290598291%;
+    *width: 82.8527914166212%;
+  }
+  .row-fluid .span9 {
+    width: 74.35897435897436%;
+    *width: 74.30578286961266%;
+  }
+  .row-fluid .span8 {
+    width: 65.81196581196582%;
+    *width: 65.75877432260411%;
+  }
+  .row-fluid .span7 {
+    width: 57.26495726495726%;
+    *width: 57.21176577559556%;
+  }
+  .row-fluid .span6 {
+    width: 48.717948717948715%;
+    *width: 48.664757228587014%;
+  }
+  .row-fluid .span5 {
+    width: 40.17094017094017%;
+    *width: 40.11774868157847%;
+  }
+  .row-fluid .span4 {
+    width: 31.623931623931625%;
+    *width: 31.570740134569924%;
+  }
+  .row-fluid .span3 {
+    width: 23.076923076923077%;
+    *width: 23.023731587561375%;
+  }
+  .row-fluid .span2 {
+    width: 14.52991452991453%;
+    *width: 14.476723040552828%;
+  }
+  .row-fluid .span1 {
+    width: 5.982905982905983%;
+    *width: 5.929714493544281%;
+  }
+  .row-fluid .offset12 {
+    margin-left: 105.12820512820512%;
+    *margin-left: 105.02182214948171%;
+  }
+  .row-fluid .offset12:first-child {
+    margin-left: 102.56410256410257%;
+    *margin-left: 102.45771958537915%;
+  }
+  .row-fluid .offset11 {
+    margin-left: 96.58119658119658%;
+    *margin-left: 96.47481360247316%;
+  }
+  .row-fluid .offset11:first-child {
+    margin-left: 94.01709401709402%;
+    *margin-left: 93.91071103837061%;
+  }
+  .row-fluid .offset10 {
+    margin-left: 88.03418803418803%;
+    *margin-left: 87.92780505546462%;
+  }
+  .row-fluid .offset10:first-child {
+    margin-left: 85.47008547008548%;
+    *margin-left: 85.36370249136206%;
+  }
+  .row-fluid .offset9 {
+    margin-left: 79.48717948717949%;
+    *margin-left: 79.38079650845607%;
+  }
+  .row-fluid .offset9:first-child {
+    margin-left: 76.92307692307693%;
+    *margin-left: 76.81669394435352%;
+  }
+  .row-fluid .offset8 {
+    margin-left: 70.94017094017094%;
+    *margin-left: 70.83378796144753%;
+  }
+  .row-fluid .offset8:first-child {
+    margin-left: 68.37606837606839%;
+    *margin-left: 68.26968539734497%;
+  }
+  .row-fluid .offset7 {
+    margin-left: 62.393162393162385%;
+    *margin-left: 62.28677941443899%;
+  }
+  .row-fluid .offset7:first-child {
+    margin-left: 59.82905982905982%;
+    *margin-left: 59.72267685033642%;
+  }
+  .row-fluid .offset6 {
+    margin-left: 53.84615384615384%;
+    *margin-left: 53.739770867430444%;
+  }
+  .row-fluid .offset6:first-child {
+    margin-left: 51.28205128205128%;
+    *margin-left: 51.175668303327875%;
+  }
+  .row-fluid .offset5 {
+    margin-left: 45.299145299145295%;
+    *margin-left: 45.1927623204219%;
+  }
+  .row-fluid .offset5:first-child {
+    margin-left: 42.73504273504273%;
+    *margin-left: 42.62865975631933%;
+  }
+  .row-fluid .offset4 {
+    margin-left: 36.75213675213675%;
+    *margin-left: 36.645753773413354%;
+  }
+  .row-fluid .offset4:first-child {
+    margin-left: 34.18803418803419%;
+    *margin-left: 34.081651209310785%;
+  }
+  .row-fluid .offset3 {
+    margin-left: 28.205128205128204%;
+    *margin-left: 28.0987452264048%;
+  }
+  .row-fluid .offset3:first-child {
+    margin-left: 25.641025641025642%;
+    *margin-left: 25.53464266230224%;
+  }
+  .row-fluid .offset2 {
+    margin-left: 19.65811965811966%;
+    *margin-left: 19.551736679396257%;
+  }
+  .row-fluid .offset2:first-child {
+    margin-left: 17.094017094017094%;
+    *margin-left: 16.98763411529369%;
+  }
+  .row-fluid .offset1 {
+    margin-left: 11.11111111111111%;
+    *margin-left: 11.004728132387708%;
+  }
+  .row-fluid .offset1:first-child {
+    margin-left: 8.547008547008547%;
+    *margin-left: 8.440625568285142%;
+  }
+  input,
+  textarea,
+  .uneditable-input {
+    margin-left: 0;
+  }
+  .controls-row [class*="span"] + [class*="span"] {
+    margin-left: 30px;
+  }
+  input.span12,
+  textarea.span12,
+  .uneditable-input.span12 {
+    width: 1156px;
+  }
+  input.span11,
+  textarea.span11,
+  .uneditable-input.span11 {
+    width: 1056px;
+  }
+  input.span10,
+  textarea.span10,
+  .uneditable-input.span10 {
+    width: 956px;
+  }
+  input.span9,
+  textarea.span9,
+  .uneditable-input.span9 {
+    width: 856px;
+  }
+  input.span8,
+  textarea.span8,
+  .uneditable-input.span8 {
+    width: 756px;
+  }
+  input.span7,
+  textarea.span7,
+  .uneditable-input.span7 {
+    width: 656px;
+  }
+  input.span6,
+  textarea.span6,
+  .uneditable-input.span6 {
+    width: 556px;
+  }
+  input.span5,
+  textarea.span5,
+  .uneditable-input.span5 {
+    width: 456px;
+  }
+  input.span4,
+  textarea.span4,
+  .uneditable-input.span4 {
+    width: 356px;
+  }
+  input.span3,
+  textarea.span3,
+  .uneditable-input.span3 {
+    width: 256px;
+  }
+  input.span2,
+  textarea.span2,
+  .uneditable-input.span2 {
+    width: 156px;
+  }
+  input.span1,
+  textarea.span1,
+  .uneditable-input.span1 {
+    width: 56px;
+  }
+  .thumbnails {
+    margin-left: -30px;
+  }
+  .thumbnails > li {
+    margin-left: 30px;
+  }
+  .row-fluid .thumbnails {
+    margin-left: 0;
+  }
+}
+
+ at media (min-width: 768px) and (max-width: 979px) {
+  .row {
+    margin-left: -20px;
+    *zoom: 1;
+  }
+  .row:before,
+  .row:after {
+    display: table;
+    line-height: 0;
+    content: "";
+  }
+  .row:after {
+    clear: both;
+  }
+  [class*="span"] {
+    float: left;
+    min-height: 1px;
+    margin-left: 20px;
+  }
+  .container,
+  .navbar-static-top .container,
+  .navbar-fixed-top .container,
+  .navbar-fixed-bottom .container {
+    width: 724px;
+  }
+  .span12 {
+    width: 724px;
+  }
+  .span11 {
+    width: 662px;
+  }
+  .span10 {
+    width: 600px;
+  }
+  .span9 {
+    width: 538px;
+  }
+  .span8 {
+    width: 476px;
+  }
+  .span7 {
+    width: 414px;
+  }
+  .span6 {
+    width: 352px;
+  }
+  .span5 {
+    width: 290px;
+  }
+  .span4 {
+    width: 228px;
+  }
+  .span3 {
+    width: 166px;
+  }
+  .span2 {
+    width: 104px;
+  }
+  .span1 {
+    width: 42px;
+  }
+  .offset12 {
+    margin-left: 764px;
+  }
+  .offset11 {
+    margin-left: 702px;
+  }
+  .offset10 {
+    margin-left: 640px;
+  }
+  .offset9 {
+    margin-left: 578px;
+  }
+  .offset8 {
+    margin-left: 516px;
+  }
+  .offset7 {
+    margin-left: 454px;
+  }
+  .offset6 {
+    margin-left: 392px;
+  }
+  .offset5 {
+    margin-left: 330px;
+  }
+  .offset4 {
+    margin-left: 268px;
+  }
+  .offset3 {
+    margin-left: 206px;
+  }
+  .offset2 {
+    margin-left: 144px;
+  }
+  .offset1 {
+    margin-left: 82px;
+  }
+  .row-fluid {
+    width: 100%;
+    *zoom: 1;
+  }
+  .row-fluid:before,
+  .row-fluid:after {
+    display: table;
+    line-height: 0;
+    content: "";
+  }
+  .row-fluid:after {
+    clear: both;
+  }
+  .row-fluid [class*="span"] {
+    display: block;
+    float: left;
+    width: 100%;
+    min-height: 30px;
+    margin-left: 2.7624309392265194%;
+    *margin-left: 2.709239449864817%;
+    -webkit-box-sizing: border-box;
+       -moz-box-sizing: border-box;
+            box-sizing: border-box;
+  }
+  .row-fluid [class*="span"]:first-child {
+    margin-left: 0;
+  }
+  .row-fluid .controls-row [class*="span"] + [class*="span"] {
+    margin-left: 2.7624309392265194%;
+  }
+  .row-fluid .span12 {
+    width: 100%;
+    *width: 99.94680851063829%;
+  }
+  .row-fluid .span11 {
+    width: 91.43646408839778%;
+    *width: 91.38327259903608%;
+  }
+  .row-fluid .span10 {
+    width: 82.87292817679558%;
+    *width: 82.81973668743387%;
+  }
+  .row-fluid .span9 {
+    width: 74.30939226519337%;
+    *width: 74.25620077583166%;
+  }
+  .row-fluid .span8 {
+    width: 65.74585635359117%;
+    *width: 65.69266486422946%;
+  }
+  .row-fluid .span7 {
+    width: 57.18232044198895%;
+    *width: 57.12912895262725%;
+  }
+  .row-fluid .span6 {
+    width: 48.61878453038674%;
+    *width: 48.56559304102504%;
+  }
+  .row-fluid .span5 {
+    width: 40.05524861878453%;
+    *width: 40.00205712942283%;
+  }
+  .row-fluid .span4 {
+    width: 31.491712707182323%;
+    *width: 31.43852121782062%;
+  }
+  .row-fluid .span3 {
+    width: 22.92817679558011%;
+    *width: 22.87498530621841%;
+  }
+  .row-fluid .span2 {
+    width: 14.3646408839779%;
+    *width: 14.311449394616199%;
+  }
+  .row-fluid .span1 {
+    width: 5.801104972375691%;
+    *width: 5.747913483013988%;
+  }
+  .row-fluid .offset12 {
+    margin-left: 105.52486187845304%;
+    *margin-left: 105.41847889972962%;
+  }
+  .row-fluid .offset12:first-child {
+    margin-left: 102.76243093922652%;
+    *margin-left: 102.6560479605031%;
+  }
+  .row-fluid .offset11 {
+    margin-left: 96.96132596685082%;
+    *margin-left: 96.8549429881274%;
+  }
+  .row-fluid .offset11:first-child {
+    margin-left: 94.1988950276243%;
+    *margin-left: 94.09251204890089%;
+  }
+  .row-fluid .offset10 {
+    margin-left: 88.39779005524862%;
+    *margin-left: 88.2914070765252%;
+  }
+  .row-fluid .offset10:first-child {
+    margin-left: 85.6353591160221%;
+    *margin-left: 85.52897613729868%;
+  }
+  .row-fluid .offset9 {
+    margin-left: 79.8342541436464%;
+    *margin-left: 79.72787116492299%;
+  }
+  .row-fluid .offset9:first-child {
+    margin-left: 77.07182320441989%;
+    *margin-left: 76.96544022569647%;
+  }
+  .row-fluid .offset8 {
+    margin-left: 71.2707182320442%;
+    *margin-left: 71.16433525332079%;
+  }
+  .row-fluid .offset8:first-child {
+    margin-left: 68.50828729281768%;
+    *margin-left: 68.40190431409427%;
+  }
+  .row-fluid .offset7 {
+    margin-left: 62.70718232044199%;
+    *margin-left: 62.600799341718584%;
+  }
+  .row-fluid .offset7:first-child {
+    margin-left: 59.94475138121547%;
+    *margin-left: 59.838368402492065%;
+  }
+  .row-fluid .offset6 {
+    margin-left: 54.14364640883978%;
+    *margin-left: 54.037263430116376%;
+  }
+  .row-fluid .offset6:first-child {
+    margin-left: 51.38121546961326%;
+    *margin-left: 51.27483249088986%;
+  }
+  .row-fluid .offset5 {
+    margin-left: 45.58011049723757%;
+    *margin-left: 45.47372751851417%;
+  }
+  .row-fluid .offset5:first-child {
+    margin-left: 42.81767955801105%;
+    *margin-left: 42.71129657928765%;
+  }
+  .row-fluid .offset4 {
+    margin-left: 37.01657458563536%;
+    *margin-left: 36.91019160691196%;
+  }
+  .row-fluid .offset4:first-child {
+    margin-left: 34.25414364640884%;
+    *margin-left: 34.14776066768544%;
+  }
+  .row-fluid .offset3 {
+    margin-left: 28.45303867403315%;
+    *margin-left: 28.346655695309746%;
+  }
+  .row-fluid .offset3:first-child {
+    margin-left: 25.69060773480663%;
+    *margin-left: 25.584224756083227%;
+  }
+  .row-fluid .offset2 {
+    margin-left: 19.88950276243094%;
+    *margin-left: 19.783119783707537%;
+  }
+  .row-fluid .offset2:first-child {
+    margin-left: 17.12707182320442%;
+    *margin-left: 17.02068884448102%;
+  }
+  .row-fluid .offset1 {
+    margin-left: 11.32596685082873%;
+    *margin-left: 11.219583872105325%;
+  }
+  .row-fluid .offset1:first-child {
+    margin-left: 8.56353591160221%;
+    *margin-left: 8.457152932878806%;
+  }
+  input,
+  textarea,
+  .uneditable-input {
+    margin-left: 0;
+  }
+  .controls-row [class*="span"] + [class*="span"] {
+    margin-left: 20px;
+  }
+  input.span12,
+  textarea.span12,
+  .uneditable-input.span12 {
+    width: 710px;
+  }
+  input.span11,
+  textarea.span11,
+  .uneditable-input.span11 {
+    width: 648px;
+  }
+  input.span10,
+  textarea.span10,
+  .uneditable-input.span10 {
+    width: 586px;
+  }
+  input.span9,
+  textarea.span9,
+  .uneditable-input.span9 {
+    width: 524px;
+  }
+  input.span8,
+  textarea.span8,
+  .uneditable-input.span8 {
+    width: 462px;
+  }
+  input.span7,
+  textarea.span7,
+  .uneditable-input.span7 {
+    width: 400px;
+  }
+  input.span6,
+  textarea.span6,
+  .uneditable-input.span6 {
+    width: 338px;
+  }
+  input.span5,
+  textarea.span5,
+  .uneditable-input.span5 {
+    width: 276px;
+  }
+  input.span4,
+  textarea.span4,
+  .uneditable-input.span4 {
+    width: 214px;
+  }
+  input.span3,
+  textarea.span3,
+  .uneditable-input.span3 {
+    width: 152px;
+  }
+  input.span2,
+  textarea.span2,
+  .uneditable-input.span2 {
+    width: 90px;
+  }
+  input.span1,
+  textarea.span1,
+  .uneditable-input.span1 {
+    width: 28px;
+  }
+}
+
+ at media (max-width: 767px) {
+  body {
+    padding-right: 20px;
+    padding-left: 20px;
+  }
+  .navbar-fixed-top,
+  .navbar-fixed-bottom,
+  .navbar-static-top {
+    margin-right: -20px;
+    margin-left: -20px;
+  }
+  .container-fluid {
+    padding: 0;
+  }
+  .dl-horizontal dt {
+    float: none;
+    width: auto;
+    clear: none;
+    text-align: left;
+  }
+  .dl-horizontal dd {
+    margin-left: 0;
+  }
+  .container {
+    width: auto;
+  }
+  .row-fluid {
+    width: 100%;
+  }
+  .row,
+  .thumbnails {
+    margin-left: 0;
+  }
+  .thumbnails > li {
+    float: none;
+    margin-left: 0;
+  }
+  [class*="span"],
+  .uneditable-input[class*="span"],
+  .row-fluid [class*="span"] {
+    display: block;
+    float: none;
+    width: 100%;
+    margin-left: 0;
+    -webkit-box-sizing: border-box;
+       -moz-box-sizing: border-box;
+            box-sizing: border-box;
+  }
+  .span12,
+  .row-fluid .span12 {
+    width: 100%;
+    -webkit-box-sizing: border-box;
+       -moz-box-sizing: border-box;
+            box-sizing: border-box;
+  }
+  .row-fluid [class*="offset"]:first-child {
+    margin-left: 0;
+  }
+  .input-large,
+  .input-xlarge,
+  .input-xxlarge,
+  input[class*="span"],
+  select[class*="span"],
+  textarea[class*="span"],
+  .uneditable-input {
+    display: block;
+    width: 100%;
+    min-height: 30px;
+    -webkit-box-sizing: border-box;
+       -moz-box-sizing: border-box;
+            box-sizing: border-box;
+  }
+  .input-prepend input,
+  .input-append input,
+  .input-prepend input[class*="span"],
+  .input-append input[class*="span"] {
+    display: inline-block;
+    width: auto;
+  }
+  .controls-row [class*="span"] + [class*="span"] {
+    margin-left: 0;
+  }
+  .modal {
+    position: fixed;
+    top: 20px;
+    right: 20px;
+    left: 20px;
+    width: auto;
+    margin: 0;
+  }
+  .modal.fade {
+    top: -100px;
+  }
+  .modal.fade.in {
+    top: 20px;
+  }
+}
+
+ at media (max-width: 480px) {
+  .nav-collapse {
+    -webkit-transform: translate3d(0, 0, 0);
+  }
+  .page-header h1 small {
+    display: block;
+    line-height: 20px;
+  }
+  input[type="checkbox"],
+  input[type="radio"] {
+    border: 1px solid #ccc;
+  }
+  .form-horizontal .control-label {
+    float: none;
+    width: auto;
+    padding-top: 0;
+    text-align: left;
+  }
+  .form-horizontal .controls {
+    margin-left: 0;
+  }
+  .form-horizontal .control-list {
+    padding-top: 0;
+  }
+  .form-horizontal .form-actions {
+    padding-right: 10px;
+    padding-left: 10px;
+  }
+  .media .pull-left,
+  .media .pull-right {
+    display: block;
+    float: none;
+    margin-bottom: 10px;
+  }
+  .media-object {
+    margin-right: 0;
+    margin-left: 0;
+  }
+  .modal {
+    top: 10px;
+    right: 10px;
+    left: 10px;
+  }
+  .modal-header .close {
+    padding: 10px;
+    margin: -10px;
+  }
+  .carousel-caption {
+    position: static;
+  }
+}
+
+ at media (max-width: 979px) {
+  body {
+    padding-top: 0;
+  }
+  .navbar-fixed-top,
+  .navbar-fixed-bottom {
+    position: static;
+  }
+  .navbar-fixed-top {
+    margin-bottom: 20px;
+  }
+  .navbar-fixed-bottom {
+    margin-top: 20px;
+  }
+  .navbar-fixed-top .navbar-inner,
+  .navbar-fixed-bottom .navbar-inner {
+    padding: 5px;
+  }
+  .navbar .container {
+    width: auto;
+    padding: 0;
+  }
+  .navbar .brand {
+    padding-right: 10px;
+    padding-left: 10px;
+    margin: 0 0 0 -5px;
+  }
+  .nav-collapse {
+    clear: both;
+  }
+  .nav-collapse .nav {
+    float: none;
+    margin: 0 0 10px;
+  }
+  .nav-collapse .nav > li {
+    float: none;
+  }
+  .nav-collapse .nav > li > a {
+    margin-bottom: 2px;
+  }
+  .nav-collapse .nav > .divider-vertical {
+    display: none;
+  }
+  .nav-collapse .nav .nav-header {
+    color: #777777;
+    text-shadow: none;
+  }
+  .nav-collapse .nav > li > a,
+  .nav-collapse .dropdown-menu a {
+    padding: 9px 15px;
+    font-weight: bold;
+    color: #777777;
+    -webkit-border-radius: 3px;
+       -moz-border-radius: 3px;
+            border-radius: 3px;
+  }
+  .nav-collapse .btn {
+    padding: 4px 10px 4px;
+    font-weight: normal;
+    -webkit-border-radius: 4px;
+       -moz-border-radius: 4px;
+            border-radius: 4px;
+  }
+  .nav-collapse .dropdown-menu li + li a {
+    margin-bottom: 2px;
+  }
+  .nav-collapse .nav > li > a:hover,
+  .nav-collapse .dropdown-menu a:hover {
+    background-color: #f2f2f2;
+  }
+  .navbar-inverse .nav-collapse .nav > li > a,
+  .navbar-inverse .nav-collapse .dropdown-menu a {
+    color: #999999;
+  }
+  .navbar-inverse .nav-collapse .nav > li > a:hover,
+  .navbar-inverse .nav-collapse .dropdown-menu a:hover {
+    background-color: #111111;
+  }
+  .nav-collapse.in .btn-group {
+    padding: 0;
+    margin-top: 5px;
+  }
+  .nav-collapse .dropdown-menu {
+    position: static;
+    top: auto;
+    left: auto;
+    display: none;
+    float: none;
+    max-width: none;
+    padding: 0;
+    margin: 0 15px;
+    background-color: transparent;
+    border: none;
+    -webkit-border-radius: 0;
+       -moz-border-radius: 0;
+            border-radius: 0;
+    -webkit-box-shadow: none;
+       -moz-box-shadow: none;
+            box-shadow: none;
+  }
+  .nav-collapse .open > .dropdown-menu {
+    display: block;
+  }
+  .nav-collapse .dropdown-menu:before,
+  .nav-collapse .dropdown-menu:after {
+    display: none;
+  }
+  .nav-collapse .dropdown-menu .divider {
+    display: none;
+  }
+  .nav-collapse .nav > li > .dropdown-menu:before,
+  .nav-collapse .nav > li > .dropdown-menu:after {
+    display: none;
+  }
+  .nav-collapse .navbar-form,
+  .nav-collapse .navbar-search {
+    float: none;
+    padding: 10px 15px;
+    margin: 10px 0;
+    border-top: 1px solid #f2f2f2;
+    border-bottom: 1px solid #f2f2f2;
+    -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.1);
+       -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.1);
+            box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.1);
+  }
+  .navbar-inverse .nav-collapse .navbar-form,
+  .navbar-inverse .nav-collapse .navbar-search {
+    border-top-color: #111111;
+    border-bottom-color: #111111;
+  }
+  .navbar .nav-collapse .nav.pull-right {
+    float: none;
+    margin-left: 0;
+  }
+  .nav-collapse,
+  .nav-collapse.collapse {
+    height: 0;
+    overflow: hidden;
+  }
+  .navbar .btn-navbar {
+    display: block;
+  }
+  .navbar-static .navbar-inner {
+    padding-right: 10px;
+    padding-left: 10px;
+  }
+}
+
+ at media (min-width: 980px) {
+  .nav-collapse.collapse {
+    height: auto !important;
+    overflow: visible !important;
+  }
+}
diff --git a/docs/css/bootstrap-responsive.min.css b/docs/css/bootstrap-responsive.min.css
new file mode 100644
index 0000000..5cb833f
--- /dev/null
+++ b/docs/css/bootstrap-responsive.min.css
@@ -0,0 +1,9 @@
+/*!
+ * Bootstrap Responsive v2.2.2
+ *
+ * Copyright 2012 Twitter, Inc
+ * Licensed under the Apache License v2.0
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Designed and built with all the love in the world @twitter by @mdo and @fat.
+ */@-ms-viewport{width:device-width}.clearfix{*zoom:1}.clearfix:before,.clearfix:after{display:table;line-height:0;content:""}.clearfix:after{clear:both}.hide-text{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}.input-block-level{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.hidden{display:none;visibility:hidden}.visible-phone{display:none!important}.visible-tablet{display:none!important}.hidden-desktop{display:none!important}.visible-desktop{display:inherit!important}@media(min-width:768px) and (max-width:979px){.hidden-desktop{display:inherit!important}.visible-desktop{display:none!important}.visible-tablet{display:inherit!important}.hidden-tablet{display:none!important}}@media(max-width:767px){.hidden-desktop{display:inherit!important}.visible-desktop{display:none!important}.visible-phone{display:inherit!important}.hidden-phone{display:none!important}}@media(min
 -width:1200px){.row{margin-left:-30px;*zoom:1}.row:before,.row:after{display:table;line-height:0;content:""}.row:after{clear:both}[class*="span"]{float:left;min-height:1px;margin-left:30px}.container,.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:1170px}.span12{width:1170px}.span11{width:1070px}.span10{width:970px}.span9{width:870px}.span8{width:770px}.span7{width:670px}.span6{width:570px}.span5{width:470px}.span4{width:370px}.span3{width:270px}.span2{width:170px}.span1{width:70px}.offset12{margin-left:1230px}.offset11{margin-left:1130px}.offset10{margin-left:1030px}.offset9{margin-left:930px}.offset8{margin-left:830px}.offset7{margin-left:730px}.offset6{margin-left:630px}.offset5{margin-left:530px}.offset4{margin-left:430px}.offset3{margin-left:330px}.offset2{margin-left:230px}.offset1{margin-left:130px}.row-fluid{width:100%;*zoom:1}.row-fluid:before,.row-fluid:after{display:table;line-height:0;content:""}.row-fluid:after{cl
 ear:both}.row-fluid [class*="span"]{display:block;float:left;width:100%;min-height:30px;margin-left:2.564102564102564%;*margin-left:2.5109110747408616%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid [class*="span"]:first-child{margin-left:0}.row-fluid .controls-row [class*="span"]+[class*="span"]{margin-left:2.564102564102564%}.row-fluid .span12{width:100%;*width:99.94680851063829%}.row-fluid .span11{width:91.45299145299145%;*width:91.39979996362975%}.row-fluid .span10{width:82.90598290598291%;*width:82.8527914166212%}.row-fluid .span9{width:74.35897435897436%;*width:74.30578286961266%}.row-fluid .span8{width:65.81196581196582%;*width:65.75877432260411%}.row-fluid .span7{width:57.26495726495726%;*width:57.21176577559556%}.row-fluid .span6{width:48.717948717948715%;*width:48.664757228587014%}.row-fluid .span5{width:40.17094017094017%;*width:40.11774868157847%}.row-fluid .span4{width:31.623931623931625%;*width:31.570740134569924%}.row
 -fluid .span3{width:23.076923076923077%;*width:23.023731587561375%}.row-fluid .span2{width:14.52991452991453%;*width:14.476723040552828%}.row-fluid .span1{width:5.982905982905983%;*width:5.929714493544281%}.row-fluid .offset12{margin-left:105.12820512820512%;*margin-left:105.02182214948171%}.row-fluid .offset12:first-child{margin-left:102.56410256410257%;*margin-left:102.45771958537915%}.row-fluid .offset11{margin-left:96.58119658119658%;*margin-left:96.47481360247316%}.row-fluid .offset11:first-child{margin-left:94.01709401709402%;*margin-left:93.91071103837061%}.row-fluid .offset10{margin-left:88.03418803418803%;*margin-left:87.92780505546462%}.row-fluid .offset10:first-child{margin-left:85.47008547008548%;*margin-left:85.36370249136206%}.row-fluid .offset9{margin-left:79.48717948717949%;*margin-left:79.38079650845607%}.row-fluid .offset9:first-child{margin-left:76.92307692307693%;*margin-left:76.81669394435352%}.row-fluid .offset8{margin-left:70.94017094017094%;*margin-le
 ft:70.83378796144753%}.row-fluid .offset8:first-child{margin-left:68.37606837606839%;*margin-left:68.26968539734497%}.row-fluid .offset7{margin-left:62.393162393162385%;*margin-left:62.28677941443899%}.row-fluid .offset7:first-child{margin-left:59.82905982905982%;*margin-left:59.72267685033642%}.row-fluid .offset6{margin-left:53.84615384615384%;*margin-left:53.739770867430444%}.row-fluid .offset6:first-child{margin-left:51.28205128205128%;*margin-left:51.175668303327875%}.row-fluid .offset5{margin-left:45.299145299145295%;*margin-left:45.1927623204219%}.row-fluid .offset5:first-child{margin-left:42.73504273504273%;*margin-left:42.62865975631933%}.row-fluid .offset4{margin-left:36.75213675213675%;*margin-left:36.645753773413354%}.row-fluid .offset4:first-child{margin-left:34.18803418803419%;*margin-left:34.081651209310785%}.row-fluid .offset3{margin-left:28.205128205128204%;*margin-left:28.0987452264048%}.row-fluid .offset3:first-child{margin-left:25.641025641025642%;*margin-
 left:25.53464266230224%}.row-fluid .offset2{margin-left:19.65811965811966%;*margin-left:19.551736679396257%}.row-fluid .offset2:first-child{margin-left:17.094017094017094%;*margin-left:16.98763411529369%}.row-fluid .offset1{margin-left:11.11111111111111%;*margin-left:11.004728132387708%}.row-fluid .offset1:first-child{margin-left:8.547008547008547%;*margin-left:8.440625568285142%}input,textarea,.uneditable-input{margin-left:0}.controls-row [class*="span"]+[class*="span"]{margin-left:30px}input.span12,textarea.span12,.uneditable-input.span12{width:1156px}input.span11,textarea.span11,.uneditable-input.span11{width:1056px}input.span10,textarea.span10,.uneditable-input.span10{width:956px}input.span9,textarea.span9,.uneditable-input.span9{width:856px}input.span8,textarea.span8,.uneditable-input.span8{width:756px}input.span7,textarea.span7,.uneditable-input.span7{width:656px}input.span6,textarea.span6,.uneditable-input.span6{width:556px}input.span5,textarea.span5,.uneditable-input
 .span5{width:456px}input.span4,textarea.span4,.uneditable-input.span4{width:356px}input.span3,textarea.span3,.uneditable-input.span3{width:256px}input.span2,textarea.span2,.uneditable-input.span2{width:156px}input.span1,textarea.span1,.uneditable-input.span1{width:56px}.thumbnails{margin-left:-30px}.thumbnails>li{margin-left:30px}.row-fluid .thumbnails{margin-left:0}}@media(min-width:768px) and (max-width:979px){.row{margin-left:-20px;*zoom:1}.row:before,.row:after{display:table;line-height:0;content:""}.row:after{clear:both}[class*="span"]{float:left;min-height:1px;margin-left:20px}.container,.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:724px}.span12{width:724px}.span11{width:662px}.span10{width:600px}.span9{width:538px}.span8{width:476px}.span7{width:414px}.span6{width:352px}.span5{width:290px}.span4{width:228px}.span3{width:166px}.span2{width:104px}.span1{width:42px}.offset12{margin-left:764px}.offset11{margin-left:702px
 }.offset10{margin-left:640px}.offset9{margin-left:578px}.offset8{margin-left:516px}.offset7{margin-left:454px}.offset6{margin-left:392px}.offset5{margin-left:330px}.offset4{margin-left:268px}.offset3{margin-left:206px}.offset2{margin-left:144px}.offset1{margin-left:82px}.row-fluid{width:100%;*zoom:1}.row-fluid:before,.row-fluid:after{display:table;line-height:0;content:""}.row-fluid:after{clear:both}.row-fluid [class*="span"]{display:block;float:left;width:100%;min-height:30px;margin-left:2.7624309392265194%;*margin-left:2.709239449864817%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid [class*="span"]:first-child{margin-left:0}.row-fluid .controls-row [class*="span"]+[class*="span"]{margin-left:2.7624309392265194%}.row-fluid .span12{width:100%;*width:99.94680851063829%}.row-fluid .span11{width:91.43646408839778%;*width:91.38327259903608%}.row-fluid .span10{width:82.87292817679558%;*width:82.81973668743387%}.row-fluid .span9{width:74
 .30939226519337%;*width:74.25620077583166%}.row-fluid .span8{width:65.74585635359117%;*width:65.69266486422946%}.row-fluid .span7{width:57.18232044198895%;*width:57.12912895262725%}.row-fluid .span6{width:48.61878453038674%;*width:48.56559304102504%}.row-fluid .span5{width:40.05524861878453%;*width:40.00205712942283%}.row-fluid .span4{width:31.491712707182323%;*width:31.43852121782062%}.row-fluid .span3{width:22.92817679558011%;*width:22.87498530621841%}.row-fluid .span2{width:14.3646408839779%;*width:14.311449394616199%}.row-fluid .span1{width:5.801104972375691%;*width:5.747913483013988%}.row-fluid .offset12{margin-left:105.52486187845304%;*margin-left:105.41847889972962%}.row-fluid .offset12:first-child{margin-left:102.76243093922652%;*margin-left:102.6560479605031%}.row-fluid .offset11{margin-left:96.96132596685082%;*margin-left:96.8549429881274%}.row-fluid .offset11:first-child{margin-left:94.1988950276243%;*margin-left:94.09251204890089%}.row-fluid .offset10{margin-left
 :88.39779005524862%;*margin-left:88.2914070765252%}.row-fluid .offset10:first-child{margin-left:85.6353591160221%;*margin-left:85.52897613729868%}.row-fluid .offset9{margin-left:79.8342541436464%;*margin-left:79.72787116492299%}.row-fluid .offset9:first-child{margin-left:77.07182320441989%;*margin-left:76.96544022569647%}.row-fluid .offset8{margin-left:71.2707182320442%;*margin-left:71.16433525332079%}.row-fluid .offset8:first-child{margin-left:68.50828729281768%;*margin-left:68.40190431409427%}.row-fluid .offset7{margin-left:62.70718232044199%;*margin-left:62.600799341718584%}.row-fluid .offset7:first-child{margin-left:59.94475138121547%;*margin-left:59.838368402492065%}.row-fluid .offset6{margin-left:54.14364640883978%;*margin-left:54.037263430116376%}.row-fluid .offset6:first-child{margin-left:51.38121546961326%;*margin-left:51.27483249088986%}.row-fluid .offset5{margin-left:45.58011049723757%;*margin-left:45.47372751851417%}.row-fluid .offset5:first-child{margin-left:42.
 81767955801105%;*margin-left:42.71129657928765%}.row-fluid .offset4{margin-left:37.01657458563536%;*margin-left:36.91019160691196%}.row-fluid .offset4:first-child{margin-left:34.25414364640884%;*margin-left:34.14776066768544%}.row-fluid .offset3{margin-left:28.45303867403315%;*margin-left:28.346655695309746%}.row-fluid .offset3:first-child{margin-left:25.69060773480663%;*margin-left:25.584224756083227%}.row-fluid .offset2{margin-left:19.88950276243094%;*margin-left:19.783119783707537%}.row-fluid .offset2:first-child{margin-left:17.12707182320442%;*margin-left:17.02068884448102%}.row-fluid .offset1{margin-left:11.32596685082873%;*margin-left:11.219583872105325%}.row-fluid .offset1:first-child{margin-left:8.56353591160221%;*margin-left:8.457152932878806%}input,textarea,.uneditable-input{margin-left:0}.controls-row [class*="span"]+[class*="span"]{margin-left:20px}input.span12,textarea.span12,.uneditable-input.span12{width:710px}input.span11,textarea.span11,.uneditable-input.spa
 n11{width:648px}input.span10,textarea.span10,.uneditable-input.span10{width:586px}input.span9,textarea.span9,.uneditable-input.span9{width:524px}input.span8,textarea.span8,.uneditable-input.span8{width:462px}input.span7,textarea.span7,.uneditable-input.span7{width:400px}input.span6,textarea.span6,.uneditable-input.span6{width:338px}input.span5,textarea.span5,.uneditable-input.span5{width:276px}input.span4,textarea.span4,.uneditable-input.span4{width:214px}input.span3,textarea.span3,.uneditable-input.span3{width:152px}input.span2,textarea.span2,.uneditable-input.span2{width:90px}input.span1,textarea.span1,.uneditable-input.span1{width:28px}}@media(max-width:767px){body{padding-right:20px;padding-left:20px}.navbar-fixed-top,.navbar-fixed-bottom,.navbar-static-top{margin-right:-20px;margin-left:-20px}.container-fluid{padding:0}.dl-horizontal dt{float:none;width:auto;clear:none;text-align:left}.dl-horizontal dd{margin-left:0}.container{width:auto}.row-fluid{width:100%}.row,.thum
 bnails{margin-left:0}.thumbnails>li{float:none;margin-left:0}[class*="span"],.uneditable-input[class*="span"],.row-fluid [class*="span"]{display:block;float:none;width:100%;margin-left:0;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.span12,.row-fluid .span12{width:100%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid [class*="offset"]:first-child{margin-left:0}.input-large,.input-xlarge,.input-xxlarge,input[class*="span"],select[class*="span"],textarea[class*="span"],.uneditable-input{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.input-prepend input,.input-append input,.input-prepend input[class*="span"],.input-append input[class*="span"]{display:inline-block;width:auto}.controls-row [class*="span"]+[class*="span"]{margin-left:0}.modal{position:fixed;top:20px;right:20px;left:20px;width:auto;margin:0}.modal.fade{top:-100px}.moda
 l.fade.in{top:20px}}@media(max-width:480px){.nav-collapse{-webkit-transform:translate3d(0,0,0)}.page-header h1 small{display:block;line-height:20px}input[type="checkbox"],input[type="radio"]{border:1px solid #ccc}.form-horizontal .control-label{float:none;width:auto;padding-top:0;text-align:left}.form-horizontal .controls{margin-left:0}.form-horizontal .control-list{padding-top:0}.form-horizontal .form-actions{padding-right:10px;padding-left:10px}.media .pull-left,.media .pull-right{display:block;float:none;margin-bottom:10px}.media-object{margin-right:0;margin-left:0}.modal{top:10px;right:10px;left:10px}.modal-header .close{padding:10px;margin:-10px}.carousel-caption{position:static}}@media(max-width:979px){body{padding-top:0}.navbar-fixed-top,.navbar-fixed-bottom{position:static}.navbar-fixed-top{margin-bottom:20px}.navbar-fixed-bottom{margin-top:20px}.navbar-fixed-top .navbar-inner,.navbar-fixed-bottom .navbar-inner{padding:5px}.navbar .container{width:auto;padding:0}.nav
 bar .brand{padding-right:10px;padding-left:10px;margin:0 0 0 -5px}.nav-collapse{clear:both}.nav-collapse .nav{float:none;margin:0 0 10px}.nav-collapse .nav>li{float:none}.nav-collapse .nav>li>a{margin-bottom:2px}.nav-collapse .nav>.divider-vertical{display:none}.nav-collapse .nav .nav-header{color:#777;text-shadow:none}.nav-collapse .nav>li>a,.nav-collapse .dropdown-menu a{padding:9px 15px;font-weight:bold;color:#777;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}.nav-collapse .btn{padding:4px 10px 4px;font-weight:normal;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.nav-collapse .dropdown-menu li+li a{margin-bottom:2px}.nav-collapse .nav>li>a:hover,.nav-collapse .dropdown-menu a:hover{background-color:#f2f2f2}.navbar-inverse .nav-collapse .nav>li>a,.navbar-inverse .nav-collapse .dropdown-menu a{color:#999}.navbar-inverse .nav-collapse .nav>li>a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:hover{background-color:#111}.nav-coll
 apse.in .btn-group{padding:0;margin-top:5px}.nav-collapse .dropdown-menu{position:static;top:auto;left:auto;display:none;float:none;max-width:none;padding:0;margin:0 15px;background-color:transparent;border:0;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}.nav-collapse .open>.dropdown-menu{display:block}.nav-collapse .dropdown-menu:before,.nav-collapse .dropdown-menu:after{display:none}.nav-collapse .dropdown-menu .divider{display:none}.nav-collapse .nav>li>.dropdown-menu:before,.nav-collapse .nav>li>.dropdown-menu:after{display:none}.nav-collapse .navbar-form,.nav-collapse .navbar-search{float:none;padding:10px 15px;margin:10px 0;border-top:1px solid #f2f2f2;border-bottom:1px solid #f2f2f2;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,0.1),0 1px 0 rgba(255,255,255,0.1);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,0.1),0 1px 0 rgba(255,255,255,0.1);box-shadow:inset 0 1px 0 rgba(255,255,255,0.1),
 0 1px 0 rgba(255,255,255,0.1)}.navbar-inverse .nav-collapse .navbar-form,.navbar-inverse .nav-collapse .navbar-search{border-top-color:#111;border-bottom-color:#111}.navbar .nav-collapse .nav.pull-right{float:none;margin-left:0}.nav-collapse,.nav-collapse.collapse{height:0;overflow:hidden}.navbar .btn-navbar{display:block}.navbar-static .navbar-inner{padding-right:10px;padding-left:10px}}@media(min-width:980px){.nav-collapse.collapse{height:auto!important;overflow:visible!important}}
diff --git a/docs/css/bootstrap.css b/docs/css/bootstrap.css
new file mode 100644
index 0000000..903718b
--- /dev/null
+++ b/docs/css/bootstrap.css
@@ -0,0 +1,6039 @@
+/*!
+ * Bootstrap v2.2.2
+ *
+ * Copyright 2012 Twitter, Inc
+ * Licensed under the Apache License v2.0
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Designed and built with all the love in the world @twitter by @mdo and @fat.
+ */
+
+article,
+aside,
+details,
+figcaption,
+figure,
+footer,
+header,
+hgroup,
+nav,
+section {
+  display: block;
+}
+
+audio,
+canvas,
+video {
+  display: inline-block;
+  *display: inline;
+  *zoom: 1;
+}
+
+audio:not([controls]) {
+  display: none;
+}
+
+html {
+  font-size: 100%;
+  -webkit-text-size-adjust: 100%;
+      -ms-text-size-adjust: 100%;
+}
+
+a:focus {
+  outline: thin dotted #333;
+  outline: 5px auto -webkit-focus-ring-color;
+  outline-offset: -2px;
+}
+
+a:hover,
+a:active {
+  outline: 0;
+}
+
+sub,
+sup {
+  position: relative;
+  font-size: 75%;
+  line-height: 0;
+  vertical-align: baseline;
+}
+
+sup {
+  top: -0.5em;
+}
+
+sub {
+  bottom: -0.25em;
+}
+
+img {
+  width: auto\9;
+  height: auto;
+  max-width: 100%;
+  vertical-align: middle;
+  border: 0;
+  -ms-interpolation-mode: bicubic;
+}
+
+#map_canvas img,
+.google-maps img {
+  max-width: none;
+}
+
+button,
+input,
+select,
+textarea {
+  margin: 0;
+  font-size: 100%;
+  vertical-align: middle;
+}
+
+button,
+input {
+  *overflow: visible;
+  line-height: normal;
+}
+
+button::-moz-focus-inner,
+input::-moz-focus-inner {
+  padding: 0;
+  border: 0;
+}
+
+button,
+html input[type="button"],
+input[type="reset"],
+input[type="submit"] {
+  cursor: pointer;
+  -webkit-appearance: button;
+}
+
+label,
+select,
+button,
+input[type="button"],
+input[type="reset"],
+input[type="submit"],
+input[type="radio"],
+input[type="checkbox"] {
+  cursor: pointer;
+}
+
+input[type="search"] {
+  -webkit-box-sizing: content-box;
+     -moz-box-sizing: content-box;
+          box-sizing: content-box;
+  -webkit-appearance: textfield;
+}
+
+input[type="search"]::-webkit-search-decoration,
+input[type="search"]::-webkit-search-cancel-button {
+  -webkit-appearance: none;
+}
+
+textarea {
+  overflow: auto;
+  vertical-align: top;
+}
+
+ at media print {
+  * {
+    color: #000 !important;
+    text-shadow: none !important;
+    background: transparent !important;
+    box-shadow: none !important;
+  }
+  a,
+  a:visited {
+    text-decoration: underline;
+  }
+  a[href]:after {
+    content: " (" attr(href) ")";
+  }
+  abbr[title]:after {
+    content: " (" attr(title) ")";
+  }
+  .ir a:after,
+  a[href^="javascript:"]:after,
+  a[href^="#"]:after {
+    content: "";
+  }
+  pre,
+  blockquote {
+    border: 1px solid #999;
+    page-break-inside: avoid;
+  }
+  thead {
+    display: table-header-group;
+  }
+  tr,
+  img {
+    page-break-inside: avoid;
+  }
+  img {
+    max-width: 100% !important;
+  }
+  @page  {
+    margin: 0.5cm;
+  }
+  p,
+  h2,
+  h3 {
+    orphans: 3;
+    widows: 3;
+  }
+  h2,
+  h3 {
+    page-break-after: avoid;
+  }
+}
+
+.clearfix {
+  *zoom: 1;
+}
+
+.clearfix:before,
+.clearfix:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.clearfix:after {
+  clear: both;
+}
+
+.hide-text {
+  font: 0/0 a;
+  color: transparent;
+  text-shadow: none;
+  background-color: transparent;
+  border: 0;
+}
+
+.input-block-level {
+  display: block;
+  width: 100%;
+  min-height: 30px;
+  -webkit-box-sizing: border-box;
+     -moz-box-sizing: border-box;
+          box-sizing: border-box;
+}
+
+body {
+  margin: 0;
+  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
+  font-size: 14px;
+  line-height: 20px;
+  color: #333333;
+  background-color: #ffffff;
+}
+
+a {
+  color: #0088cc;
+  text-decoration: none;
+}
+
+a:hover {
+  color: #005580;
+  text-decoration: underline;
+}
+
+.img-rounded {
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+}
+
+.img-polaroid {
+  padding: 4px;
+  background-color: #fff;
+  border: 1px solid #ccc;
+  border: 1px solid rgba(0, 0, 0, 0.2);
+  -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
+     -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
+          box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
+}
+
+.img-circle {
+  -webkit-border-radius: 500px;
+     -moz-border-radius: 500px;
+          border-radius: 500px;
+}
+
+.row {
+  margin-left: -20px;
+  *zoom: 1;
+}
+
+.row:before,
+.row:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.row:after {
+  clear: both;
+}
+
+[class*="span"] {
+  float: left;
+  min-height: 1px;
+  margin-left: 20px;
+}
+
+.container,
+.navbar-static-top .container,
+.navbar-fixed-top .container,
+.navbar-fixed-bottom .container {
+  width: 940px;
+}
+
+.span12 {
+  width: 940px;
+}
+
+.span11 {
+  width: 860px;
+}
+
+.span10 {
+  width: 780px;
+}
+
+.span9 {
+  width: 700px;
+}
+
+.span8 {
+  width: 620px;
+}
+
+.span7 {
+  width: 540px;
+}
+
+.span6 {
+  width: 460px;
+}
+
+.span5 {
+  width: 380px;
+}
+
+.span4 {
+  width: 300px;
+}
+
+.span3 {
+  width: 220px;
+}
+
+.span2 {
+  width: 140px;
+}
+
+.span1 {
+  width: 60px;
+}
+
+.offset12 {
+  margin-left: 980px;
+}
+
+.offset11 {
+  margin-left: 900px;
+}
+
+.offset10 {
+  margin-left: 820px;
+}
+
+.offset9 {
+  margin-left: 740px;
+}
+
+.offset8 {
+  margin-left: 660px;
+}
+
+.offset7 {
+  margin-left: 580px;
+}
+
+.offset6 {
+  margin-left: 500px;
+}
+
+.offset5 {
+  margin-left: 420px;
+}
+
+.offset4 {
+  margin-left: 340px;
+}
+
+.offset3 {
+  margin-left: 260px;
+}
+
+.offset2 {
+  margin-left: 180px;
+}
+
+.offset1 {
+  margin-left: 100px;
+}
+
+.row-fluid {
+  width: 100%;
+  *zoom: 1;
+}
+
+.row-fluid:before,
+.row-fluid:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.row-fluid:after {
+  clear: both;
+}
+
+.row-fluid [class*="span"] {
+  display: block;
+  float: left;
+  width: 100%;
+  min-height: 30px;
+  margin-left: 2.127659574468085%;
+  *margin-left: 2.074468085106383%;
+  -webkit-box-sizing: border-box;
+     -moz-box-sizing: border-box;
+          box-sizing: border-box;
+}
+
+.row-fluid [class*="span"]:first-child {
+  margin-left: 0;
+}
+
+.row-fluid .controls-row [class*="span"] + [class*="span"] {
+  margin-left: 2.127659574468085%;
+}
+
+.row-fluid .span12 {
+  width: 100%;
+  *width: 99.94680851063829%;
+}
+
+.row-fluid .span11 {
+  width: 91.48936170212765%;
+  *width: 91.43617021276594%;
+}
+
+.row-fluid .span10 {
+  width: 82.97872340425532%;
+  *width: 82.92553191489361%;
+}
+
+.row-fluid .span9 {
+  width: 74.46808510638297%;
+  *width: 74.41489361702126%;
+}
+
+.row-fluid .span8 {
+  width: 65.95744680851064%;
+  *width: 65.90425531914893%;
+}
+
+.row-fluid .span7 {
+  width: 57.44680851063829%;
+  *width: 57.39361702127659%;
+}
+
+.row-fluid .span6 {
+  width: 48.93617021276595%;
+  *width: 48.88297872340425%;
+}
+
+.row-fluid .span5 {
+  width: 40.42553191489362%;
+  *width: 40.37234042553192%;
+}
+
+.row-fluid .span4 {
+  width: 31.914893617021278%;
+  *width: 31.861702127659576%;
+}
+
+.row-fluid .span3 {
+  width: 23.404255319148934%;
+  *width: 23.351063829787233%;
+}
+
+.row-fluid .span2 {
+  width: 14.893617021276595%;
+  *width: 14.840425531914894%;
+}
+
+.row-fluid .span1 {
+  width: 6.382978723404255%;
+  *width: 6.329787234042553%;
+}
+
+.row-fluid .offset12 {
+  margin-left: 104.25531914893617%;
+  *margin-left: 104.14893617021275%;
+}
+
+.row-fluid .offset12:first-child {
+  margin-left: 102.12765957446808%;
+  *margin-left: 102.02127659574467%;
+}
+
+.row-fluid .offset11 {
+  margin-left: 95.74468085106382%;
+  *margin-left: 95.6382978723404%;
+}
+
+.row-fluid .offset11:first-child {
+  margin-left: 93.61702127659574%;
+  *margin-left: 93.51063829787232%;
+}
+
+.row-fluid .offset10 {
+  margin-left: 87.23404255319149%;
+  *margin-left: 87.12765957446807%;
+}
+
+.row-fluid .offset10:first-child {
+  margin-left: 85.1063829787234%;
+  *margin-left: 84.99999999999999%;
+}
+
+.row-fluid .offset9 {
+  margin-left: 78.72340425531914%;
+  *margin-left: 78.61702127659572%;
+}
+
+.row-fluid .offset9:first-child {
+  margin-left: 76.59574468085106%;
+  *margin-left: 76.48936170212764%;
+}
+
+.row-fluid .offset8 {
+  margin-left: 70.2127659574468%;
+  *margin-left: 70.10638297872339%;
+}
+
+.row-fluid .offset8:first-child {
+  margin-left: 68.08510638297872%;
+  *margin-left: 67.9787234042553%;
+}
+
+.row-fluid .offset7 {
+  margin-left: 61.70212765957446%;
+  *margin-left: 61.59574468085106%;
+}
+
+.row-fluid .offset7:first-child {
+  margin-left: 59.574468085106375%;
+  *margin-left: 59.46808510638297%;
+}
+
+.row-fluid .offset6 {
+  margin-left: 53.191489361702125%;
+  *margin-left: 53.085106382978715%;
+}
+
+.row-fluid .offset6:first-child {
+  margin-left: 51.063829787234035%;
+  *margin-left: 50.95744680851063%;
+}
+
+.row-fluid .offset5 {
+  margin-left: 44.68085106382979%;
+  *margin-left: 44.57446808510638%;
+}
+
+.row-fluid .offset5:first-child {
+  margin-left: 42.5531914893617%;
+  *margin-left: 42.4468085106383%;
+}
+
+.row-fluid .offset4 {
+  margin-left: 36.170212765957444%;
+  *margin-left: 36.06382978723405%;
+}
+
+.row-fluid .offset4:first-child {
+  margin-left: 34.04255319148936%;
+  *margin-left: 33.93617021276596%;
+}
+
+.row-fluid .offset3 {
+  margin-left: 27.659574468085104%;
+  *margin-left: 27.5531914893617%;
+}
+
+.row-fluid .offset3:first-child {
+  margin-left: 25.53191489361702%;
+  *margin-left: 25.425531914893618%;
+}
+
+.row-fluid .offset2 {
+  margin-left: 19.148936170212764%;
+  *margin-left: 19.04255319148936%;
+}
+
+.row-fluid .offset2:first-child {
+  margin-left: 17.02127659574468%;
+  *margin-left: 16.914893617021278%;
+}
+
+.row-fluid .offset1 {
+  margin-left: 10.638297872340425%;
+  *margin-left: 10.53191489361702%;
+}
+
+.row-fluid .offset1:first-child {
+  margin-left: 8.51063829787234%;
+  *margin-left: 8.404255319148938%;
+}
+
+[class*="span"].hide,
+.row-fluid [class*="span"].hide {
+  display: none;
+}
+
+[class*="span"].pull-right,
+.row-fluid [class*="span"].pull-right {
+  float: right;
+}
+
+.container {
+  margin-right: auto;
+  margin-left: auto;
+  *zoom: 1;
+}
+
+.container:before,
+.container:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.container:after {
+  clear: both;
+}
+
+.container-fluid {
+  padding-right: 20px;
+  padding-left: 20px;
+  *zoom: 1;
+}
+
+.container-fluid:before,
+.container-fluid:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.container-fluid:after {
+  clear: both;
+}
+
+p {
+  margin: 0 0 10px;
+}
+
+.lead {
+  margin-bottom: 20px;
+  font-size: 21px;
+  font-weight: 200;
+  line-height: 30px;
+}
+
+small {
+  font-size: 85%;
+}
+
+strong {
+  font-weight: bold;
+}
+
+em {
+  font-style: italic;
+}
+
+cite {
+  font-style: normal;
+}
+
+.muted {
+  color: #999999;
+}
+
+a.muted:hover {
+  color: #808080;
+}
+
+.text-warning {
+  color: #c09853;
+}
+
+a.text-warning:hover {
+  color: #a47e3c;
+}
+
+.text-error {
+  color: #b94a48;
+}
+
+a.text-error:hover {
+  color: #953b39;
+}
+
+.text-info {
+  color: #3a87ad;
+}
+
+a.text-info:hover {
+  color: #2d6987;
+}
+
+.text-success {
+  color: #468847;
+}
+
+a.text-success:hover {
+  color: #356635;
+}
+
+h1,
+h2,
+h3,
+h4,
+h5,
+h6 {
+  margin: 10px 0;
+  font-family: inherit;
+  font-weight: bold;
+  line-height: 20px;
+  color: inherit;
+  text-rendering: optimizelegibility;
+}
+
+h1 small,
+h2 small,
+h3 small,
+h4 small,
+h5 small,
+h6 small {
+  font-weight: normal;
+  line-height: 1;
+  color: #999999;
+}
+
+h1,
+h2,
+h3 {
+  line-height: 40px;
+}
+
+h1 {
+  font-size: 38.5px;
+}
+
+h2 {
+  font-size: 31.5px;
+}
+
+h3 {
+  font-size: 24.5px;
+}
+
+h4 {
+  font-size: 17.5px;
+}
+
+h5 {
+  font-size: 14px;
+}
+
+h6 {
+  font-size: 11.9px;
+}
+
+h1 small {
+  font-size: 24.5px;
+}
+
+h2 small {
+  font-size: 17.5px;
+}
+
+h3 small {
+  font-size: 14px;
+}
+
+h4 small {
+  font-size: 14px;
+}
+
+.page-header {
+  padding-bottom: 9px;
+  margin: 20px 0 30px;
+  border-bottom: 1px solid #eeeeee;
+}
+
+ul,
+ol {
+  padding: 0;
+  margin: 0 0 10px 25px;
+}
+
+ul ul,
+ul ol,
+ol ol,
+ol ul {
+  margin-bottom: 0;
+}
+
+li {
+  line-height: 20px;
+}
+
+ul.unstyled,
+ol.unstyled {
+  margin-left: 0;
+  list-style: none;
+}
+
+ul.inline,
+ol.inline {
+  margin-left: 0;
+  list-style: none;
+}
+
+ul.inline > li,
+ol.inline > li {
+  display: inline-block;
+  padding-right: 5px;
+  padding-left: 5px;
+}
+
+dl {
+  margin-bottom: 20px;
+}
+
+dt,
+dd {
+  line-height: 20px;
+}
+
+dt {
+  font-weight: bold;
+}
+
+dd {
+  margin-left: 10px;
+}
+
+.dl-horizontal {
+  *zoom: 1;
+}
+
+.dl-horizontal:before,
+.dl-horizontal:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.dl-horizontal:after {
+  clear: both;
+}
+
+.dl-horizontal dt {
+  float: left;
+  width: 160px;
+  overflow: hidden;
+  clear: left;
+  text-align: right;
+  text-overflow: ellipsis;
+  white-space: nowrap;
+}
+
+.dl-horizontal dd {
+  margin-left: 180px;
+}
+
+hr {
+  margin: 20px 0;
+  border: 0;
+  border-top: 1px solid #eeeeee;
+  border-bottom: 1px solid #ffffff;
+}
+
+abbr[title],
+abbr[data-original-title] {
+  cursor: help;
+  border-bottom: 1px dotted #999999;
+}
+
+abbr.initialism {
+  font-size: 90%;
+  text-transform: uppercase;
+}
+
+blockquote {
+  padding: 0 0 0 15px;
+  margin: 0 0 20px;
+  border-left: 5px solid #eeeeee;
+}
+
+blockquote p {
+  margin-bottom: 0;
+  font-size: 16px;
+  font-weight: 300;
+  line-height: 25px;
+}
+
+blockquote small {
+  display: block;
+  line-height: 20px;
+  color: #999999;
+}
+
+blockquote small:before {
+  content: '\2014 \00A0';
+}
+
+blockquote.pull-right {
+  float: right;
+  padding-right: 15px;
+  padding-left: 0;
+  border-right: 5px solid #eeeeee;
+  border-left: 0;
+}
+
+blockquote.pull-right p,
+blockquote.pull-right small {
+  text-align: right;
+}
+
+blockquote.pull-right small:before {
+  content: '';
+}
+
+blockquote.pull-right small:after {
+  content: '\00A0 \2014';
+}
+
+q:before,
+q:after,
+blockquote:before,
+blockquote:after {
+  content: "";
+}
+
+address {
+  display: block;
+  margin-bottom: 20px;
+  font-style: normal;
+  line-height: 20px;
+}
+
+code,
+pre {
+  padding: 0 3px 2px;
+  font-family: Monaco, Menlo, Consolas, "Courier New", monospace;
+  font-size: 12px;
+  color: #333333;
+  -webkit-border-radius: 3px;
+     -moz-border-radius: 3px;
+          border-radius: 3px;
+}
+
+code {
+  padding: 2px 4px;
+  color: #d14;
+  white-space: nowrap;
+  background-color: #f7f7f9;
+  border: 1px solid #e1e1e8;
+}
+
+pre {
+  display: block;
+  padding: 9.5px;
+  margin: 0 0 10px;
+  font-size: 13px;
+  line-height: 20px;
+  word-break: break-all;
+  word-wrap: break-word;
+  white-space: pre;
+  white-space: pre-wrap;
+  background-color: #f5f5f5;
+  border: 1px solid #ccc;
+  border: 1px solid rgba(0, 0, 0, 0.15);
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+pre.prettyprint {
+  margin-bottom: 20px;
+}
+
+pre code {
+  padding: 0;
+  color: inherit;
+  white-space: pre;
+  white-space: pre-wrap;
+  background-color: transparent;
+  border: 0;
+}
+
+.pre-scrollable {
+  max-height: 340px;
+  overflow-y: scroll;
+}
+
+form {
+  margin: 0 0 20px;
+}
+
+fieldset {
+  padding: 0;
+  margin: 0;
+  border: 0;
+}
+
+legend {
+  display: block;
+  width: 100%;
+  padding: 0;
+  margin-bottom: 20px;
+  font-size: 21px;
+  line-height: 40px;
+  color: #333333;
+  border: 0;
+  border-bottom: 1px solid #e5e5e5;
+}
+
+legend small {
+  font-size: 15px;
+  color: #999999;
+}
+
+label,
+input,
+button,
+select,
+textarea {
+  font-size: 14px;
+  font-weight: normal;
+  line-height: 20px;
+}
+
+input,
+button,
+select,
+textarea {
+  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
+}
+
+label {
+  display: block;
+  margin-bottom: 5px;
+}
+
+select,
+textarea,
+input[type="text"],
+input[type="password"],
+input[type="datetime"],
+input[type="datetime-local"],
+input[type="date"],
+input[type="month"],
+input[type="time"],
+input[type="week"],
+input[type="number"],
+input[type="email"],
+input[type="url"],
+input[type="search"],
+input[type="tel"],
+input[type="color"],
+.uneditable-input {
+  display: inline-block;
+  height: 20px;
+  padding: 4px 6px;
+  margin-bottom: 10px;
+  font-size: 14px;
+  line-height: 20px;
+  color: #555555;
+  vertical-align: middle;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+input,
+textarea,
+.uneditable-input {
+  width: 206px;
+}
+
+textarea {
+  height: auto;
+}
+
+textarea,
+input[type="text"],
+input[type="password"],
+input[type="datetime"],
+input[type="datetime-local"],
+input[type="date"],
+input[type="month"],
+input[type="time"],
+input[type="week"],
+input[type="number"],
+input[type="email"],
+input[type="url"],
+input[type="search"],
+input[type="tel"],
+input[type="color"],
+.uneditable-input {
+  background-color: #ffffff;
+  border: 1px solid #cccccc;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+  -webkit-transition: border linear 0.2s, box-shadow linear 0.2s;
+     -moz-transition: border linear 0.2s, box-shadow linear 0.2s;
+       -o-transition: border linear 0.2s, box-shadow linear 0.2s;
+          transition: border linear 0.2s, box-shadow linear 0.2s;
+}
+
+textarea:focus,
+input[type="text"]:focus,
+input[type="password"]:focus,
+input[type="datetime"]:focus,
+input[type="datetime-local"]:focus,
+input[type="date"]:focus,
+input[type="month"]:focus,
+input[type="time"]:focus,
+input[type="week"]:focus,
+input[type="number"]:focus,
+input[type="email"]:focus,
+input[type="url"]:focus,
+input[type="search"]:focus,
+input[type="tel"]:focus,
+input[type="color"]:focus,
+.uneditable-input:focus {
+  border-color: rgba(82, 168, 236, 0.8);
+  outline: 0;
+  outline: thin dotted \9;
+  /* IE6-9 */
+
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
+}
+
+input[type="radio"],
+input[type="checkbox"] {
+  margin: 4px 0 0;
+  margin-top: 1px \9;
+  *margin-top: 0;
+  line-height: normal;
+}
+
+input[type="file"],
+input[type="image"],
+input[type="submit"],
+input[type="reset"],
+input[type="button"],
+input[type="radio"],
+input[type="checkbox"] {
+  width: auto;
+}
+
+select,
+input[type="file"] {
+  height: 30px;
+  /* In IE7, the height of the select element cannot be changed by height, only font-size */
+
+  *margin-top: 4px;
+  /* For IE7, add top margin to align select with labels */
+
+  line-height: 30px;
+}
+
+select {
+  width: 220px;
+  background-color: #ffffff;
+  border: 1px solid #cccccc;
+}
+
+select[multiple],
+select[size] {
+  height: auto;
+}
+
+select:focus,
+input[type="file"]:focus,
+input[type="radio"]:focus,
+input[type="checkbox"]:focus {
+  outline: thin dotted #333;
+  outline: 5px auto -webkit-focus-ring-color;
+  outline-offset: -2px;
+}
+
+.uneditable-input,
+.uneditable-textarea {
+  color: #999999;
+  cursor: not-allowed;
+  background-color: #fcfcfc;
+  border-color: #cccccc;
+  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.025);
+     -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.025);
+          box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.025);
+}
+
+.uneditable-input {
+  overflow: hidden;
+  white-space: nowrap;
+}
+
+.uneditable-textarea {
+  width: auto;
+  height: auto;
+}
+
+input:-moz-placeholder,
+textarea:-moz-placeholder {
+  color: #999999;
+}
+
+input:-ms-input-placeholder,
+textarea:-ms-input-placeholder {
+  color: #999999;
+}
+
+input::-webkit-input-placeholder,
+textarea::-webkit-input-placeholder {
+  color: #999999;
+}
+
+.radio,
+.checkbox {
+  min-height: 20px;
+  padding-left: 20px;
+}
+
+.radio input[type="radio"],
+.checkbox input[type="checkbox"] {
+  float: left;
+  margin-left: -20px;
+}
+
+.controls > .radio:first-child,
+.controls > .checkbox:first-child {
+  padding-top: 5px;
+}
+
+.radio.inline,
+.checkbox.inline {
+  display: inline-block;
+  padding-top: 5px;
+  margin-bottom: 0;
+  vertical-align: middle;
+}
+
+.radio.inline + .radio.inline,
+.checkbox.inline + .checkbox.inline {
+  margin-left: 10px;
+}
+
+.input-mini {
+  width: 60px;
+}
+
+.input-small {
+  width: 90px;
+}
+
+.input-medium {
+  width: 150px;
+}
+
+.input-large {
+  width: 210px;
+}
+
+.input-xlarge {
+  width: 270px;
+}
+
+.input-xxlarge {
+  width: 530px;
+}
+
+input[class*="span"],
+select[class*="span"],
+textarea[class*="span"],
+.uneditable-input[class*="span"],
+.row-fluid input[class*="span"],
+.row-fluid select[class*="span"],
+.row-fluid textarea[class*="span"],
+.row-fluid .uneditable-input[class*="span"] {
+  float: none;
+  margin-left: 0;
+}
+
+.input-append input[class*="span"],
+.input-append .uneditable-input[class*="span"],
+.input-prepend input[class*="span"],
+.input-prepend .uneditable-input[class*="span"],
+.row-fluid input[class*="span"],
+.row-fluid select[class*="span"],
+.row-fluid textarea[class*="span"],
+.row-fluid .uneditable-input[class*="span"],
+.row-fluid .input-prepend [class*="span"],
+.row-fluid .input-append [class*="span"] {
+  display: inline-block;
+}
+
+input,
+textarea,
+.uneditable-input {
+  margin-left: 0;
+}
+
+.controls-row [class*="span"] + [class*="span"] {
+  margin-left: 20px;
+}
+
+input.span12,
+textarea.span12,
+.uneditable-input.span12 {
+  width: 926px;
+}
+
+input.span11,
+textarea.span11,
+.uneditable-input.span11 {
+  width: 846px;
+}
+
+input.span10,
+textarea.span10,
+.uneditable-input.span10 {
+  width: 766px;
+}
+
+input.span9,
+textarea.span9,
+.uneditable-input.span9 {
+  width: 686px;
+}
+
+input.span8,
+textarea.span8,
+.uneditable-input.span8 {
+  width: 606px;
+}
+
+input.span7,
+textarea.span7,
+.uneditable-input.span7 {
+  width: 526px;
+}
+
+input.span6,
+textarea.span6,
+.uneditable-input.span6 {
+  width: 446px;
+}
+
+input.span5,
+textarea.span5,
+.uneditable-input.span5 {
+  width: 366px;
+}
+
+input.span4,
+textarea.span4,
+.uneditable-input.span4 {
+  width: 286px;
+}
+
+input.span3,
+textarea.span3,
+.uneditable-input.span3 {
+  width: 206px;
+}
+
+input.span2,
+textarea.span2,
+.uneditable-input.span2 {
+  width: 126px;
+}
+
+input.span1,
+textarea.span1,
+.uneditable-input.span1 {
+  width: 46px;
+}
+
+.controls-row {
+  *zoom: 1;
+}
+
+.controls-row:before,
+.controls-row:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.controls-row:after {
+  clear: both;
+}
+
+.controls-row [class*="span"],
+.row-fluid .controls-row [class*="span"] {
+  float: left;
+}
+
+.controls-row .checkbox[class*="span"],
+.controls-row .radio[class*="span"] {
+  padding-top: 5px;
+}
+
+input[disabled],
+select[disabled],
+textarea[disabled],
+input[readonly],
+select[readonly],
+textarea[readonly] {
+  cursor: not-allowed;
+  background-color: #eeeeee;
+}
+
+input[type="radio"][disabled],
+input[type="checkbox"][disabled],
+input[type="radio"][readonly],
+input[type="checkbox"][readonly] {
+  background-color: transparent;
+}
+
+.control-group.warning .control-label,
+.control-group.warning .help-block,
+.control-group.warning .help-inline {
+  color: #c09853;
+}
+
+.control-group.warning .checkbox,
+.control-group.warning .radio,
+.control-group.warning input,
+.control-group.warning select,
+.control-group.warning textarea {
+  color: #c09853;
+}
+
+.control-group.warning input,
+.control-group.warning select,
+.control-group.warning textarea {
+  border-color: #c09853;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+}
+
+.control-group.warning input:focus,
+.control-group.warning select:focus,
+.control-group.warning textarea:focus {
+  border-color: #a47e3c;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e;
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e;
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e;
+}
+
+.control-group.warning .input-prepend .add-on,
+.control-group.warning .input-append .add-on {
+  color: #c09853;
+  background-color: #fcf8e3;
+  border-color: #c09853;
+}
+
+.control-group.error .control-label,
+.control-group.error .help-block,
+.control-group.error .help-inline {
+  color: #b94a48;
+}
+
+.control-group.error .checkbox,
+.control-group.error .radio,
+.control-group.error input,
+.control-group.error select,
+.control-group.error textarea {
+  color: #b94a48;
+}
+
+.control-group.error input,
+.control-group.error select,
+.control-group.error textarea {
+  border-color: #b94a48;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+}
+
+.control-group.error input:focus,
+.control-group.error select:focus,
+.control-group.error textarea:focus {
+  border-color: #953b39;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
+}
+
+.control-group.error .input-prepend .add-on,
+.control-group.error .input-append .add-on {
+  color: #b94a48;
+  background-color: #f2dede;
+  border-color: #b94a48;
+}
+
+.control-group.success .control-label,
+.control-group.success .help-block,
+.control-group.success .help-inline {
+  color: #468847;
+}
+
+.control-group.success .checkbox,
+.control-group.success .radio,
+.control-group.success input,
+.control-group.success select,
+.control-group.success textarea {
+  color: #468847;
+}
+
+.control-group.success input,
+.control-group.success select,
+.control-group.success textarea {
+  border-color: #468847;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+}
+
+.control-group.success input:focus,
+.control-group.success select:focus,
+.control-group.success textarea:focus {
+  border-color: #356635;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b;
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b;
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b;
+}
+
+.control-group.success .input-prepend .add-on,
+.control-group.success .input-append .add-on {
+  color: #468847;
+  background-color: #dff0d8;
+  border-color: #468847;
+}
+
+.control-group.info .control-label,
+.control-group.info .help-block,
+.control-group.info .help-inline {
+  color: #3a87ad;
+}
+
+.control-group.info .checkbox,
+.control-group.info .radio,
+.control-group.info input,
+.control-group.info select,
+.control-group.info textarea {
+  color: #3a87ad;
+}
+
+.control-group.info input,
+.control-group.info select,
+.control-group.info textarea {
+  border-color: #3a87ad;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+}
+
+.control-group.info input:focus,
+.control-group.info select:focus,
+.control-group.info textarea:focus {
+  border-color: #2d6987;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
+}
+
+.control-group.info .input-prepend .add-on,
+.control-group.info .input-append .add-on {
+  color: #3a87ad;
+  background-color: #d9edf7;
+  border-color: #3a87ad;
+}
+
+input:focus:invalid,
+textarea:focus:invalid,
+select:focus:invalid {
+  color: #b94a48;
+  border-color: #ee5f5b;
+}
+
+input:focus:invalid:focus,
+textarea:focus:invalid:focus,
+select:focus:invalid:focus {
+  border-color: #e9322d;
+  -webkit-box-shadow: 0 0 6px #f8b9b7;
+     -moz-box-shadow: 0 0 6px #f8b9b7;
+          box-shadow: 0 0 6px #f8b9b7;
+}
+
+.form-actions {
+  padding: 19px 20px 20px;
+  margin-top: 20px;
+  margin-bottom: 20px;
+  background-color: #f5f5f5;
+  border-top: 1px solid #e5e5e5;
+  *zoom: 1;
+}
+
+.form-actions:before,
+.form-actions:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.form-actions:after {
+  clear: both;
+}
+
+.help-block,
+.help-inline {
+  color: #595959;
+}
+
+.help-block {
+  display: block;
+  margin-bottom: 10px;
+}
+
+.help-inline {
+  display: inline-block;
+  *display: inline;
+  padding-left: 5px;
+  vertical-align: middle;
+  *zoom: 1;
+}
+
+.input-append,
+.input-prepend {
+  margin-bottom: 5px;
+  font-size: 0;
+  white-space: nowrap;
+}
+
+.input-append input,
+.input-prepend input,
+.input-append select,
+.input-prepend select,
+.input-append .uneditable-input,
+.input-prepend .uneditable-input,
+.input-append .dropdown-menu,
+.input-prepend .dropdown-menu {
+  font-size: 14px;
+}
+
+.input-append input,
+.input-prepend input,
+.input-append select,
+.input-prepend select,
+.input-append .uneditable-input,
+.input-prepend .uneditable-input {
+  position: relative;
+  margin-bottom: 0;
+  *margin-left: 0;
+  vertical-align: top;
+  -webkit-border-radius: 0 4px 4px 0;
+     -moz-border-radius: 0 4px 4px 0;
+          border-radius: 0 4px 4px 0;
+}
+
+.input-append input:focus,
+.input-prepend input:focus,
+.input-append select:focus,
+.input-prepend select:focus,
+.input-append .uneditable-input:focus,
+.input-prepend .uneditable-input:focus {
+  z-index: 2;
+}
+
+.input-append .add-on,
+.input-prepend .add-on {
+  display: inline-block;
+  width: auto;
+  height: 20px;
+  min-width: 16px;
+  padding: 4px 5px;
+  font-size: 14px;
+  font-weight: normal;
+  line-height: 20px;
+  text-align: center;
+  text-shadow: 0 1px 0 #ffffff;
+  background-color: #eeeeee;
+  border: 1px solid #ccc;
+}
+
+.input-append .add-on,
+.input-prepend .add-on,
+.input-append .btn,
+.input-prepend .btn,
+.input-append .btn-group > .dropdown-toggle,
+.input-prepend .btn-group > .dropdown-toggle {
+  vertical-align: top;
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.input-append .active,
+.input-prepend .active {
+  background-color: #a9dba9;
+  border-color: #46a546;
+}
+
+.input-prepend .add-on,
+.input-prepend .btn {
+  margin-right: -1px;
+}
+
+.input-prepend .add-on:first-child,
+.input-prepend .btn:first-child {
+  -webkit-border-radius: 4px 0 0 4px;
+     -moz-border-radius: 4px 0 0 4px;
+          border-radius: 4px 0 0 4px;
+}
+
+.input-append input,
+.input-append select,
+.input-append .uneditable-input {
+  -webkit-border-radius: 4px 0 0 4px;
+     -moz-border-radius: 4px 0 0 4px;
+          border-radius: 4px 0 0 4px;
+}
+
+.input-append input + .btn-group .btn:last-child,
+.input-append select + .btn-group .btn:last-child,
+.input-append .uneditable-input + .btn-group .btn:last-child {
+  -webkit-border-radius: 0 4px 4px 0;
+     -moz-border-radius: 0 4px 4px 0;
+          border-radius: 0 4px 4px 0;
+}
+
+.input-append .add-on,
+.input-append .btn,
+.input-append .btn-group {
+  margin-left: -1px;
+}
+
+.input-append .add-on:last-child,
+.input-append .btn:last-child,
+.input-append .btn-group:last-child > .dropdown-toggle {
+  -webkit-border-radius: 0 4px 4px 0;
+     -moz-border-radius: 0 4px 4px 0;
+          border-radius: 0 4px 4px 0;
+}
+
+.input-prepend.input-append input,
+.input-prepend.input-append select,
+.input-prepend.input-append .uneditable-input {
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.input-prepend.input-append input + .btn-group .btn,
+.input-prepend.input-append select + .btn-group .btn,
+.input-prepend.input-append .uneditable-input + .btn-group .btn {
+  -webkit-border-radius: 0 4px 4px 0;
+     -moz-border-radius: 0 4px 4px 0;
+          border-radius: 0 4px 4px 0;
+}
+
+.input-prepend.input-append .add-on:first-child,
+.input-prepend.input-append .btn:first-child {
+  margin-right: -1px;
+  -webkit-border-radius: 4px 0 0 4px;
+     -moz-border-radius: 4px 0 0 4px;
+          border-radius: 4px 0 0 4px;
+}
+
+.input-prepend.input-append .add-on:last-child,
+.input-prepend.input-append .btn:last-child {
+  margin-left: -1px;
+  -webkit-border-radius: 0 4px 4px 0;
+     -moz-border-radius: 0 4px 4px 0;
+          border-radius: 0 4px 4px 0;
+}
+
+.input-prepend.input-append .btn-group:first-child {
+  margin-left: 0;
+}
+
+input.search-query {
+  padding-right: 14px;
+  padding-right: 4px \9;
+  padding-left: 14px;
+  padding-left: 4px \9;
+  /* IE7-8 doesn't have border-radius, so don't indent the padding */
+
+  margin-bottom: 0;
+  -webkit-border-radius: 15px;
+     -moz-border-radius: 15px;
+          border-radius: 15px;
+}
+
+/* Allow for input prepend/append in search forms */
+
+.form-search .input-append .search-query,
+.form-search .input-prepend .search-query {
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.form-search .input-append .search-query {
+  -webkit-border-radius: 14px 0 0 14px;
+     -moz-border-radius: 14px 0 0 14px;
+          border-radius: 14px 0 0 14px;
+}
+
+.form-search .input-append .btn {
+  -webkit-border-radius: 0 14px 14px 0;
+     -moz-border-radius: 0 14px 14px 0;
+          border-radius: 0 14px 14px 0;
+}
+
+.form-search .input-prepend .search-query {
+  -webkit-border-radius: 0 14px 14px 0;
+     -moz-border-radius: 0 14px 14px 0;
+          border-radius: 0 14px 14px 0;
+}
+
+.form-search .input-prepend .btn {
+  -webkit-border-radius: 14px 0 0 14px;
+     -moz-border-radius: 14px 0 0 14px;
+          border-radius: 14px 0 0 14px;
+}
+
+.form-search input,
+.form-inline input,
+.form-horizontal input,
+.form-search textarea,
+.form-inline textarea,
+.form-horizontal textarea,
+.form-search select,
+.form-inline select,
+.form-horizontal select,
+.form-search .help-inline,
+.form-inline .help-inline,
+.form-horizontal .help-inline,
+.form-search .uneditable-input,
+.form-inline .uneditable-input,
+.form-horizontal .uneditable-input,
+.form-search .input-prepend,
+.form-inline .input-prepend,
+.form-horizontal .input-prepend,
+.form-search .input-append,
+.form-inline .input-append,
+.form-horizontal .input-append {
+  display: inline-block;
+  *display: inline;
+  margin-bottom: 0;
+  vertical-align: middle;
+  *zoom: 1;
+}
+
+.form-search .hide,
+.form-inline .hide,
+.form-horizontal .hide {
+  display: none;
+}
+
+.form-search label,
+.form-inline label,
+.form-search .btn-group,
+.form-inline .btn-group {
+  display: inline-block;
+}
+
+.form-search .input-append,
+.form-inline .input-append,
+.form-search .input-prepend,
+.form-inline .input-prepend {
+  margin-bottom: 0;
+}
+
+.form-search .radio,
+.form-search .checkbox,
+.form-inline .radio,
+.form-inline .checkbox {
+  padding-left: 0;
+  margin-bottom: 0;
+  vertical-align: middle;
+}
+
+.form-search .radio input[type="radio"],
+.form-search .checkbox input[type="checkbox"],
+.form-inline .radio input[type="radio"],
+.form-inline .checkbox input[type="checkbox"] {
+  float: left;
+  margin-right: 3px;
+  margin-left: 0;
+}
+
+.control-group {
+  margin-bottom: 10px;
+}
+
+legend + .control-group {
+  margin-top: 20px;
+  -webkit-margin-top-collapse: separate;
+}
+
+.form-horizontal .control-group {
+  margin-bottom: 20px;
+  *zoom: 1;
+}
+
+.form-horizontal .control-group:before,
+.form-horizontal .control-group:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.form-horizontal .control-group:after {
+  clear: both;
+}
+
+.form-horizontal .control-label {
+  float: left;
+  width: 160px;
+  padding-top: 5px;
+  text-align: right;
+}
+
+.form-horizontal .controls {
+  *display: inline-block;
+  *padding-left: 20px;
+  margin-left: 180px;
+  *margin-left: 0;
+}
+
+.form-horizontal .controls:first-child {
+  *padding-left: 180px;
+}
+
+.form-horizontal .help-block {
+  margin-bottom: 0;
+}
+
+.form-horizontal input + .help-block,
+.form-horizontal select + .help-block,
+.form-horizontal textarea + .help-block,
+.form-horizontal .uneditable-input + .help-block,
+.form-horizontal .input-prepend + .help-block,
+.form-horizontal .input-append + .help-block {
+  margin-top: 10px;
+}
+
+.form-horizontal .form-actions {
+  padding-left: 180px;
+}
+
+table {
+  max-width: 100%;
+  background-color: transparent;
+  border-collapse: collapse;
+  border-spacing: 0;
+}
+
+.table {
+  width: 100%;
+  margin-bottom: 20px;
+}
+
+.table th,
+.table td {
+  padding: 8px;
+  line-height: 20px;
+  text-align: left;
+  vertical-align: top;
+  border-top: 1px solid #dddddd;
+}
+
+.table th {
+  font-weight: bold;
+}
+
+.table thead th {
+  vertical-align: bottom;
+}
+
+.table caption + thead tr:first-child th,
+.table caption + thead tr:first-child td,
+.table colgroup + thead tr:first-child th,
+.table colgroup + thead tr:first-child td,
+.table thead:first-child tr:first-child th,
+.table thead:first-child tr:first-child td {
+  border-top: 0;
+}
+
+.table tbody + tbody {
+  border-top: 2px solid #dddddd;
+}
+
+.table .table {
+  background-color: #ffffff;
+}
+
+.table-condensed th,
+.table-condensed td {
+  padding: 4px 5px;
+}
+
+.table-bordered {
+  border: 1px solid #dddddd;
+  border-collapse: separate;
+  *border-collapse: collapse;
+  border-left: 0;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+.table-bordered th,
+.table-bordered td {
+  border-left: 1px solid #dddddd;
+}
+
+.table-bordered caption + thead tr:first-child th,
+.table-bordered caption + tbody tr:first-child th,
+.table-bordered caption + tbody tr:first-child td,
+.table-bordered colgroup + thead tr:first-child th,
+.table-bordered colgroup + tbody tr:first-child th,
+.table-bordered colgroup + tbody tr:first-child td,
+.table-bordered thead:first-child tr:first-child th,
+.table-bordered tbody:first-child tr:first-child th,
+.table-bordered tbody:first-child tr:first-child td {
+  border-top: 0;
+}
+
+.table-bordered thead:first-child tr:first-child > th:first-child,
+.table-bordered tbody:first-child tr:first-child > td:first-child {
+  -webkit-border-top-left-radius: 4px;
+          border-top-left-radius: 4px;
+  -moz-border-radius-topleft: 4px;
+}
+
+.table-bordered thead:first-child tr:first-child > th:last-child,
+.table-bordered tbody:first-child tr:first-child > td:last-child {
+  -webkit-border-top-right-radius: 4px;
+          border-top-right-radius: 4px;
+  -moz-border-radius-topright: 4px;
+}
+
+.table-bordered thead:last-child tr:last-child > th:first-child,
+.table-bordered tbody:last-child tr:last-child > td:first-child,
+.table-bordered tfoot:last-child tr:last-child > td:first-child {
+  -webkit-border-bottom-left-radius: 4px;
+          border-bottom-left-radius: 4px;
+  -moz-border-radius-bottomleft: 4px;
+}
+
+.table-bordered thead:last-child tr:last-child > th:last-child,
+.table-bordered tbody:last-child tr:last-child > td:last-child,
+.table-bordered tfoot:last-child tr:last-child > td:last-child {
+  -webkit-border-bottom-right-radius: 4px;
+          border-bottom-right-radius: 4px;
+  -moz-border-radius-bottomright: 4px;
+}
+
+.table-bordered tfoot + tbody:last-child tr:last-child td:first-child {
+  -webkit-border-bottom-left-radius: 0;
+          border-bottom-left-radius: 0;
+  -moz-border-radius-bottomleft: 0;
+}
+
+.table-bordered tfoot + tbody:last-child tr:last-child td:last-child {
+  -webkit-border-bottom-right-radius: 0;
+          border-bottom-right-radius: 0;
+  -moz-border-radius-bottomright: 0;
+}
+
+.table-bordered caption + thead tr:first-child th:first-child,
+.table-bordered caption + tbody tr:first-child td:first-child,
+.table-bordered colgroup + thead tr:first-child th:first-child,
+.table-bordered colgroup + tbody tr:first-child td:first-child {
+  -webkit-border-top-left-radius: 4px;
+          border-top-left-radius: 4px;
+  -moz-border-radius-topleft: 4px;
+}
+
+.table-bordered caption + thead tr:first-child th:last-child,
+.table-bordered caption + tbody tr:first-child td:last-child,
+.table-bordered colgroup + thead tr:first-child th:last-child,
+.table-bordered colgroup + tbody tr:first-child td:last-child {
+  -webkit-border-top-right-radius: 4px;
+          border-top-right-radius: 4px;
+  -moz-border-radius-topright: 4px;
+}
+
+.table-striped tbody > tr:nth-child(odd) > td,
+.table-striped tbody > tr:nth-child(odd) > th {
+  background-color: #f9f9f9;
+}
+
+.table-hover tbody tr:hover td,
+.table-hover tbody tr:hover th {
+  background-color: #f5f5f5;
+}
+
+table td[class*="span"],
+table th[class*="span"],
+.row-fluid table td[class*="span"],
+.row-fluid table th[class*="span"] {
+  display: table-cell;
+  float: none;
+  margin-left: 0;
+}
+
+.table td.span1,
+.table th.span1 {
+  float: none;
+  width: 44px;
+  margin-left: 0;
+}
+
+.table td.span2,
+.table th.span2 {
+  float: none;
+  width: 124px;
+  margin-left: 0;
+}
+
+.table td.span3,
+.table th.span3 {
+  float: none;
+  width: 204px;
+  margin-left: 0;
+}
+
+.table td.span4,
+.table th.span4 {
+  float: none;
+  width: 284px;
+  margin-left: 0;
+}
+
+.table td.span5,
+.table th.span5 {
+  float: none;
+  width: 364px;
+  margin-left: 0;
+}
+
+.table td.span6,
+.table th.span6 {
+  float: none;
+  width: 444px;
+  margin-left: 0;
+}
+
+.table td.span7,
+.table th.span7 {
+  float: none;
+  width: 524px;
+  margin-left: 0;
+}
+
+.table td.span8,
+.table th.span8 {
+  float: none;
+  width: 604px;
+  margin-left: 0;
+}
+
+.table td.span9,
+.table th.span9 {
+  float: none;
+  width: 684px;
+  margin-left: 0;
+}
+
+.table td.span10,
+.table th.span10 {
+  float: none;
+  width: 764px;
+  margin-left: 0;
+}
+
+.table td.span11,
+.table th.span11 {
+  float: none;
+  width: 844px;
+  margin-left: 0;
+}
+
+.table td.span12,
+.table th.span12 {
+  float: none;
+  width: 924px;
+  margin-left: 0;
+}
+
+.table tbody tr.success td {
+  background-color: #dff0d8;
+}
+
+.table tbody tr.error td {
+  background-color: #f2dede;
+}
+
+.table tbody tr.warning td {
+  background-color: #fcf8e3;
+}
+
+.table tbody tr.info td {
+  background-color: #d9edf7;
+}
+
+.table-hover tbody tr.success:hover td {
+  background-color: #d0e9c6;
+}
+
+.table-hover tbody tr.error:hover td {
+  background-color: #ebcccc;
+}
+
+.table-hover tbody tr.warning:hover td {
+  background-color: #faf2cc;
+}
+
+.table-hover tbody tr.info:hover td {
+  background-color: #c4e3f3;
+}
+
+[class^="icon-"],
+[class*=" icon-"] {
+  display: inline-block;
+  width: 14px;
+  height: 14px;
+  margin-top: 1px;
+  *margin-right: .3em;
+  line-height: 14px;
+  vertical-align: text-top;
+  background-image: url("../image/glyphicons-halflings.png");
+  background-position: 14px 14px;
+  background-repeat: no-repeat;
+}
+
+/* White icons with optional class, or on hover/active states of certain elements */
+
+.icon-white,
+.nav-pills > .active > a > [class^="icon-"],
+.nav-pills > .active > a > [class*=" icon-"],
+.nav-list > .active > a > [class^="icon-"],
+.nav-list > .active > a > [class*=" icon-"],
+.navbar-inverse .nav > .active > a > [class^="icon-"],
+.navbar-inverse .nav > .active > a > [class*=" icon-"],
+.dropdown-menu > li > a:hover > [class^="icon-"],
+.dropdown-menu > li > a:hover > [class*=" icon-"],
+.dropdown-menu > .active > a > [class^="icon-"],
+.dropdown-menu > .active > a > [class*=" icon-"],
+.dropdown-submenu:hover > a > [class^="icon-"],
+.dropdown-submenu:hover > a > [class*=" icon-"] {
+  background-image: url("../image/glyphicons-halflings-white.png");
+}
+
+.icon-glass {
+  background-position: 0      0;
+}
+
+.icon-music {
+  background-position: -24px 0;
+}
+
+.icon-search {
+  background-position: -48px 0;
+}
+
+.icon-envelope {
+  background-position: -72px 0;
+}
+
+.icon-heart {
+  background-position: -96px 0;
+}
+
+.icon-star {
+  background-position: -120px 0;
+}
+
+.icon-star-empty {
+  background-position: -144px 0;
+}
+
+.icon-user {
+  background-position: -168px 0;
+}
+
+.icon-film {
+  background-position: -192px 0;
+}
+
+.icon-th-large {
+  background-position: -216px 0;
+}
+
+.icon-th {
+  background-position: -240px 0;
+}
+
+.icon-th-list {
+  background-position: -264px 0;
+}
+
+.icon-ok {
+  background-position: -288px 0;
+}
+
+.icon-remove {
+  background-position: -312px 0;
+}
+
+.icon-zoom-in {
+  background-position: -336px 0;
+}
+
+.icon-zoom-out {
+  background-position: -360px 0;
+}
+
+.icon-off {
+  background-position: -384px 0;
+}
+
+.icon-signal {
+  background-position: -408px 0;
+}
+
+.icon-cog {
+  background-position: -432px 0;
+}
+
+.icon-trash {
+  background-position: -456px 0;
+}
+
+.icon-home {
+  background-position: 0 -24px;
+}
+
+.icon-file {
+  background-position: -24px -24px;
+}
+
+.icon-time {
+  background-position: -48px -24px;
+}
+
+.icon-road {
+  background-position: -72px -24px;
+}
+
+.icon-download-alt {
+  background-position: -96px -24px;
+}
+
+.icon-download {
+  background-position: -120px -24px;
+}
+
+.icon-upload {
+  background-position: -144px -24px;
+}
+
+.icon-inbox {
+  background-position: -168px -24px;
+}
+
+.icon-play-circle {
+  background-position: -192px -24px;
+}
+
+.icon-repeat {
+  background-position: -216px -24px;
+}
+
+.icon-refresh {
+  background-position: -240px -24px;
+}
+
+.icon-list-alt {
+  background-position: -264px -24px;
+}
+
+.icon-lock {
+  background-position: -287px -24px;
+}
+
+.icon-flag {
+  background-position: -312px -24px;
+}
+
+.icon-headphones {
+  background-position: -336px -24px;
+}
+
+.icon-volume-off {
+  background-position: -360px -24px;
+}
+
+.icon-volume-down {
+  background-position: -384px -24px;
+}
+
+.icon-volume-up {
+  background-position: -408px -24px;
+}
+
+.icon-qrcode {
+  background-position: -432px -24px;
+}
+
+.icon-barcode {
+  background-position: -456px -24px;
+}
+
+.icon-tag {
+  background-position: 0 -48px;
+}
+
+.icon-tags {
+  background-position: -25px -48px;
+}
+
+.icon-book {
+  background-position: -48px -48px;
+}
+
+.icon-bookmark {
+  background-position: -72px -48px;
+}
+
+.icon-print {
+  background-position: -96px -48px;
+}
+
+.icon-camera {
+  background-position: -120px -48px;
+}
+
+.icon-font {
+  background-position: -144px -48px;
+}
+
+.icon-bold {
+  background-position: -167px -48px;
+}
+
+.icon-italic {
+  background-position: -192px -48px;
+}
+
+.icon-text-height {
+  background-position: -216px -48px;
+}
+
+.icon-text-width {
+  background-position: -240px -48px;
+}
+
+.icon-align-left {
+  background-position: -264px -48px;
+}
+
+.icon-align-center {
+  background-position: -288px -48px;
+}
+
+.icon-align-right {
+  background-position: -312px -48px;
+}
+
+.icon-align-justify {
+  background-position: -336px -48px;
+}
+
+.icon-list {
+  background-position: -360px -48px;
+}
+
+.icon-indent-left {
+  background-position: -384px -48px;
+}
+
+.icon-indent-right {
+  background-position: -408px -48px;
+}
+
+.icon-facetime-video {
+  background-position: -432px -48px;
+}
+
+.icon-picture {
+  background-position: -456px -48px;
+}
+
+.icon-pencil {
+  background-position: 0 -72px;
+}
+
+.icon-map-marker {
+  background-position: -24px -72px;
+}
+
+.icon-adjust {
+  background-position: -48px -72px;
+}
+
+.icon-tint {
+  background-position: -72px -72px;
+}
+
+.icon-edit {
+  background-position: -96px -72px;
+}
+
+.icon-share {
+  background-position: -120px -72px;
+}
+
+.icon-check {
+  background-position: -144px -72px;
+}
+
+.icon-move {
+  background-position: -168px -72px;
+}
+
+.icon-step-backward {
+  background-position: -192px -72px;
+}
+
+.icon-fast-backward {
+  background-position: -216px -72px;
+}
+
+.icon-backward {
+  background-position: -240px -72px;
+}
+
+.icon-play {
+  background-position: -264px -72px;
+}
+
+.icon-pause {
+  background-position: -288px -72px;
+}
+
+.icon-stop {
+  background-position: -312px -72px;
+}
+
+.icon-forward {
+  background-position: -336px -72px;
+}
+
+.icon-fast-forward {
+  background-position: -360px -72px;
+}
+
+.icon-step-forward {
+  background-position: -384px -72px;
+}
+
+.icon-eject {
+  background-position: -408px -72px;
+}
+
+.icon-chevron-left {
+  background-position: -432px -72px;
+}
+
+.icon-chevron-right {
+  background-position: -456px -72px;
+}
+
+.icon-plus-sign {
+  background-position: 0 -96px;
+}
+
+.icon-minus-sign {
+  background-position: -24px -96px;
+}
+
+.icon-remove-sign {
+  background-position: -48px -96px;
+}
+
+.icon-ok-sign {
+  background-position: -72px -96px;
+}
+
+.icon-question-sign {
+  background-position: -96px -96px;
+}
+
+.icon-info-sign {
+  background-position: -120px -96px;
+}
+
+.icon-screenshot {
+  background-position: -144px -96px;
+}
+
+.icon-remove-circle {
+  background-position: -168px -96px;
+}
+
+.icon-ok-circle {
+  background-position: -192px -96px;
+}
+
+.icon-ban-circle {
+  background-position: -216px -96px;
+}
+
+.icon-arrow-left {
+  background-position: -240px -96px;
+}
+
+.icon-arrow-right {
+  background-position: -264px -96px;
+}
+
+.icon-arrow-up {
+  background-position: -289px -96px;
+}
+
+.icon-arrow-down {
+  background-position: -312px -96px;
+}
+
+.icon-share-alt {
+  background-position: -336px -96px;
+}
+
+.icon-resize-full {
+  background-position: -360px -96px;
+}
+
+.icon-resize-small {
+  background-position: -384px -96px;
+}
+
+.icon-plus {
+  background-position: -408px -96px;
+}
+
+.icon-minus {
+  background-position: -433px -96px;
+}
+
+.icon-asterisk {
+  background-position: -456px -96px;
+}
+
+.icon-exclamation-sign {
+  background-position: 0 -120px;
+}
+
+.icon-gift {
+  background-position: -24px -120px;
+}
+
+.icon-leaf {
+  background-position: -48px -120px;
+}
+
+.icon-fire {
+  background-position: -72px -120px;
+}
+
+.icon-eye-open {
+  background-position: -96px -120px;
+}
+
+.icon-eye-close {
+  background-position: -120px -120px;
+}
+
+.icon-warning-sign {
+  background-position: -144px -120px;
+}
+
+.icon-plane {
+  background-position: -168px -120px;
+}
+
+.icon-calendar {
+  background-position: -192px -120px;
+}
+
+.icon-random {
+  width: 16px;
+  background-position: -216px -120px;
+}
+
+.icon-comment {
+  background-position: -240px -120px;
+}
+
+.icon-magnet {
+  background-position: -264px -120px;
+}
+
+.icon-chevron-up {
+  background-position: -288px -120px;
+}
+
+.icon-chevron-down {
+  background-position: -313px -119px;
+}
+
+.icon-retweet {
+  background-position: -336px -120px;
+}
+
+.icon-shopping-cart {
+  background-position: -360px -120px;
+}
+
+.icon-folder-close {
+  background-position: -384px -120px;
+}
+
+.icon-folder-open {
+  width: 16px;
+  background-position: -408px -120px;
+}
+
+.icon-resize-vertical {
+  background-position: -432px -119px;
+}
+
+.icon-resize-horizontal {
+  background-position: -456px -118px;
+}
+
+.icon-hdd {
+  background-position: 0 -144px;
+}
+
+.icon-bullhorn {
+  background-position: -24px -144px;
+}
+
+.icon-bell {
+  background-position: -48px -144px;
+}
+
+.icon-certificate {
+  background-position: -72px -144px;
+}
+
+.icon-thumbs-up {
+  background-position: -96px -144px;
+}
+
+.icon-thumbs-down {
+  background-position: -120px -144px;
+}
+
+.icon-hand-right {
+  background-position: -144px -144px;
+}
+
+.icon-hand-left {
+  background-position: -168px -144px;
+}
+
+.icon-hand-up {
+  background-position: -192px -144px;
+}
+
+.icon-hand-down {
+  background-position: -216px -144px;
+}
+
+.icon-circle-arrow-right {
+  background-position: -240px -144px;
+}
+
+.icon-circle-arrow-left {
+  background-position: -264px -144px;
+}
+
+.icon-circle-arrow-up {
+  background-position: -288px -144px;
+}
+
+.icon-circle-arrow-down {
+  background-position: -312px -144px;
+}
+
+.icon-globe {
+  background-position: -336px -144px;
+}
+
+.icon-wrench {
+  background-position: -360px -144px;
+}
+
+.icon-tasks {
+  background-position: -384px -144px;
+}
+
+.icon-filter {
+  background-position: -408px -144px;
+}
+
+.icon-briefcase {
+  background-position: -432px -144px;
+}
+
+.icon-fullscreen {
+  background-position: -456px -144px;
+}
+
+.dropup,
+.dropdown {
+  position: relative;
+}
+
+.dropdown-toggle {
+  *margin-bottom: -3px;
+}
+
+.dropdown-toggle:active,
+.open .dropdown-toggle {
+  outline: 0;
+}
+
+.caret {
+  display: inline-block;
+  width: 0;
+  height: 0;
+  vertical-align: top;
+  border-top: 4px solid #000000;
+  border-right: 4px solid transparent;
+  border-left: 4px solid transparent;
+  content: "";
+}
+
+.dropdown .caret {
+  margin-top: 8px;
+  margin-left: 2px;
+}
+
+.dropdown-menu {
+  position: absolute;
+  top: 100%;
+  left: 0;
+  z-index: 1000;
+  display: none;
+  float: left;
+  min-width: 160px;
+  padding: 5px 0;
+  margin: 2px 0 0;
+  list-style: none;
+  background-color: #ffffff;
+  border: 1px solid #ccc;
+  border: 1px solid rgba(0, 0, 0, 0.2);
+  *border-right-width: 2px;
+  *border-bottom-width: 2px;
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+  -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
+     -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
+          box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
+  -webkit-background-clip: padding-box;
+     -moz-background-clip: padding;
+          background-clip: padding-box;
+}
+
+.dropdown-menu.pull-right {
+  right: 0;
+  left: auto;
+}
+
+.dropdown-menu .divider {
+  *width: 100%;
+  height: 1px;
+  margin: 9px 1px;
+  *margin: -5px 0 5px;
+  overflow: hidden;
+  background-color: #e5e5e5;
+  border-bottom: 1px solid #ffffff;
+}
+
+.dropdown-menu li > a {
+  display: block;
+  padding: 3px 20px;
+  clear: both;
+  font-weight: normal;
+  line-height: 20px;
+  color: #333333;
+  white-space: nowrap;
+}
+
+.dropdown-menu li > a:hover,
+.dropdown-menu li > a:focus,
+.dropdown-submenu:hover > a {
+  color: #ffffff;
+  text-decoration: none;
+  background-color: #0081c2;
+  background-image: -moz-linear-gradient(top, #0088cc, #0077b3);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0077b3));
+  background-image: -webkit-linear-gradient(top, #0088cc, #0077b3);
+  background-image: -o-linear-gradient(top, #0088cc, #0077b3);
+  background-image: linear-gradient(to bottom, #0088cc, #0077b3);
+  background-repeat: repeat-x;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0077b3', GradientType=0);
+}
+
+.dropdown-menu .active > a,
+.dropdown-menu .active > a:hover {
+  color: #ffffff;
+  text-decoration: none;
+  background-color: #0081c2;
+  background-image: -moz-linear-gradient(top, #0088cc, #0077b3);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0077b3));
+  background-image: -webkit-linear-gradient(top, #0088cc, #0077b3);
+  background-image: -o-linear-gradient(top, #0088cc, #0077b3);
+  background-image: linear-gradient(to bottom, #0088cc, #0077b3);
+  background-repeat: repeat-x;
+  outline: 0;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0077b3', GradientType=0);
+}
+
+.dropdown-menu .disabled > a,
+.dropdown-menu .disabled > a:hover {
+  color: #999999;
+}
+
+.dropdown-menu .disabled > a:hover {
+  text-decoration: none;
+  cursor: default;
+  background-color: transparent;
+  background-image: none;
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.open {
+  *z-index: 1000;
+}
+
+.open > .dropdown-menu {
+  display: block;
+}
+
+.pull-right > .dropdown-menu {
+  right: 0;
+  left: auto;
+}
+
+.dropup .caret,
+.navbar-fixed-bottom .dropdown .caret {
+  border-top: 0;
+  border-bottom: 4px solid #000000;
+  content: "";
+}
+
+.dropup .dropdown-menu,
+.navbar-fixed-bottom .dropdown .dropdown-menu {
+  top: auto;
+  bottom: 100%;
+  margin-bottom: 1px;
+}
+
+.dropdown-submenu {
+  position: relative;
+}
+
+.dropdown-submenu > .dropdown-menu {
+  top: 0;
+  left: 100%;
+  margin-top: -6px;
+  margin-left: -1px;
+  -webkit-border-radius: 0 6px 6px 6px;
+     -moz-border-radius: 0 6px 6px 6px;
+          border-radius: 0 6px 6px 6px;
+}
+
+.dropdown-submenu:hover > .dropdown-menu {
+  display: block;
+}
+
+.dropup .dropdown-submenu > .dropdown-menu {
+  top: auto;
+  bottom: 0;
+  margin-top: 0;
+  margin-bottom: -2px;
+  -webkit-border-radius: 5px 5px 5px 0;
+     -moz-border-radius: 5px 5px 5px 0;
+          border-radius: 5px 5px 5px 0;
+}
+
+.dropdown-submenu > a:after {
+  display: block;
+  float: right;
+  width: 0;
+  height: 0;
+  margin-top: 5px;
+  margin-right: -10px;
+  border-color: transparent;
+  border-left-color: #cccccc;
+  border-style: solid;
+  border-width: 5px 0 5px 5px;
+  content: " ";
+}
+
+.dropdown-submenu:hover > a:after {
+  border-left-color: #ffffff;
+}
+
+.dropdown-submenu.pull-left {
+  float: none;
+}
+
+.dropdown-submenu.pull-left > .dropdown-menu {
+  left: -100%;
+  margin-left: 10px;
+  -webkit-border-radius: 6px 0 6px 6px;
+     -moz-border-radius: 6px 0 6px 6px;
+          border-radius: 6px 0 6px 6px;
+}
+
+.dropdown .dropdown-menu .nav-header {
+  padding-right: 20px;
+  padding-left: 20px;
+}
+
+.typeahead {
+  z-index: 1051;
+  margin-top: 2px;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+.well {
+  min-height: 20px;
+  padding: 19px;
+  margin-bottom: 20px;
+  background-color: #f5f5f5;
+  border: 1px solid #e3e3e3;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
+}
+
+.well blockquote {
+  border-color: #ddd;
+  border-color: rgba(0, 0, 0, 0.15);
+}
+
+.well-large {
+  padding: 24px;
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+}
+
+.well-small {
+  padding: 9px;
+  -webkit-border-radius: 3px;
+     -moz-border-radius: 3px;
+          border-radius: 3px;
+}
+
+.fade {
+  opacity: 0;
+  -webkit-transition: opacity 0.15s linear;
+     -moz-transition: opacity 0.15s linear;
+       -o-transition: opacity 0.15s linear;
+          transition: opacity 0.15s linear;
+}
+
+.fade.in {
+  opacity: 1;
+}
+
+.collapse {
+  position: relative;
+  height: 0;
+  overflow: hidden;
+  -webkit-transition: height 0.35s ease;
+     -moz-transition: height 0.35s ease;
+       -o-transition: height 0.35s ease;
+          transition: height 0.35s ease;
+}
+
+.collapse.in {
+  height: auto;
+}
+
+.close {
+  float: right;
+  font-size: 20px;
+  font-weight: bold;
+  line-height: 20px;
+  color: #000000;
+  text-shadow: 0 1px 0 #ffffff;
+  opacity: 0.2;
+  filter: alpha(opacity=20);
+}
+
+.close:hover {
+  color: #000000;
+  text-decoration: none;
+  cursor: pointer;
+  opacity: 0.4;
+  filter: alpha(opacity=40);
+}
+
+button.close {
+  padding: 0;
+  cursor: pointer;
+  background: transparent;
+  border: 0;
+  -webkit-appearance: none;
+}
+
+.btn {
+  display: inline-block;
+  *display: inline;
+  padding: 4px 12px;
+  margin-bottom: 0;
+  *margin-left: .3em;
+  font-size: 14px;
+  line-height: 20px;
+  color: #333333;
+  text-align: center;
+  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
+  vertical-align: middle;
+  cursor: pointer;
+  background-color: #f5f5f5;
+  *background-color: #e6e6e6;
+  background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
+  background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
+  background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
+  background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
+  background-repeat: repeat-x;
+  border: 1px solid #bbbbbb;
+  *border: 0;
+  border-color: #e6e6e6 #e6e6e6 #bfbfbf;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  border-bottom-color: #a2a2a2;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+  *zoom: 1;
+  -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
+     -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
+          box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
+}
+
+.btn:hover,
+.btn:active,
+.btn.active,
+.btn.disabled,
+.btn[disabled] {
+  color: #333333;
+  background-color: #e6e6e6;
+  *background-color: #d9d9d9;
+}
+
+.btn:active,
+.btn.active {
+  background-color: #cccccc \9;
+}
+
+.btn:first-child {
+  *margin-left: 0;
+}
+
+.btn:hover {
+  color: #333333;
+  text-decoration: none;
+  background-position: 0 -15px;
+  -webkit-transition: background-position 0.1s linear;
+     -moz-transition: background-position 0.1s linear;
+       -o-transition: background-position 0.1s linear;
+          transition: background-position 0.1s linear;
+}
+
+.btn:focus {
+  outline: thin dotted #333;
+  outline: 5px auto -webkit-focus-ring-color;
+  outline-offset: -2px;
+}
+
+.btn.active,
+.btn:active {
+  background-image: none;
+  outline: 0;
+  -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
+     -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
+          box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
+}
+
+.btn.disabled,
+.btn[disabled] {
+  cursor: default;
+  background-image: none;
+  opacity: 0.65;
+  filter: alpha(opacity=65);
+  -webkit-box-shadow: none;
+     -moz-box-shadow: none;
+          box-shadow: none;
+}
+
+.btn-large {
+  padding: 11px 19px;
+  font-size: 17.5px;
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+}
+
+.btn-large [class^="icon-"],
+.btn-large [class*=" icon-"] {
+  margin-top: 4px;
+}
+
+.btn-small {
+  padding: 2px 10px;
+  font-size: 11.9px;
+  -webkit-border-radius: 3px;
+     -moz-border-radius: 3px;
+          border-radius: 3px;
+}
+
+.btn-small [class^="icon-"],
+.btn-small [class*=" icon-"] {
+  margin-top: 0;
+}
+
+.btn-mini [class^="icon-"],
+.btn-mini [class*=" icon-"] {
+  margin-top: -1px;
+}
+
+.btn-mini {
+  padding: 0 6px;
+  font-size: 10.5px;
+  -webkit-border-radius: 3px;
+     -moz-border-radius: 3px;
+          border-radius: 3px;
+}
+
+.btn-block {
+  display: block;
+  width: 100%;
+  padding-right: 0;
+  padding-left: 0;
+  -webkit-box-sizing: border-box;
+     -moz-box-sizing: border-box;
+          box-sizing: border-box;
+}
+
+.btn-block + .btn-block {
+  margin-top: 5px;
+}
+
+input[type="submit"].btn-block,
+input[type="reset"].btn-block,
+input[type="button"].btn-block {
+  width: 100%;
+}
+
+.btn-primary.active,
+.btn-warning.active,
+.btn-danger.active,
+.btn-success.active,
+.btn-info.active,
+.btn-inverse.active {
+  color: rgba(255, 255, 255, 0.75);
+}
+
+.btn {
+  border-color: #c5c5c5;
+  border-color: rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.25);
+}
+
+.btn-primary {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #006dcc;
+  *background-color: #0044cc;
+  background-image: -moz-linear-gradient(top, #0088cc, #0044cc);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0044cc));
+  background-image: -webkit-linear-gradient(top, #0088cc, #0044cc);
+  background-image: -o-linear-gradient(top, #0088cc, #0044cc);
+  background-image: linear-gradient(to bottom, #0088cc, #0044cc);
+  background-repeat: repeat-x;
+  border-color: #0044cc #0044cc #002a80;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0044cc', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.btn-primary:hover,
+.btn-primary:active,
+.btn-primary.active,
+.btn-primary.disabled,
+.btn-primary[disabled] {
+  color: #ffffff;
+  background-color: #0044cc;
+  *background-color: #003bb3;
+}
+
+.btn-primary:active,
+.btn-primary.active {
+  background-color: #003399 \9;
+}
+
+.btn-warning {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #faa732;
+  *background-color: #f89406;
+  background-image: -moz-linear-gradient(top, #fbb450, #f89406);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fbb450), to(#f89406));
+  background-image: -webkit-linear-gradient(top, #fbb450, #f89406);
+  background-image: -o-linear-gradient(top, #fbb450, #f89406);
+  background-image: linear-gradient(to bottom, #fbb450, #f89406);
+  background-repeat: repeat-x;
+  border-color: #f89406 #f89406 #ad6704;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fffbb450', endColorstr='#fff89406', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.btn-warning:hover,
+.btn-warning:active,
+.btn-warning.active,
+.btn-warning.disabled,
+.btn-warning[disabled] {
+  color: #ffffff;
+  background-color: #f89406;
+  *background-color: #df8505;
+}
+
+.btn-warning:active,
+.btn-warning.active {
+  background-color: #c67605 \9;
+}
+
+.btn-danger {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #da4f49;
+  *background-color: #bd362f;
+  background-image: -moz-linear-gradient(top, #ee5f5b, #bd362f);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ee5f5b), to(#bd362f));
+  background-image: -webkit-linear-gradient(top, #ee5f5b, #bd362f);
+  background-image: -o-linear-gradient(top, #ee5f5b, #bd362f);
+  background-image: linear-gradient(to bottom, #ee5f5b, #bd362f);
+  background-repeat: repeat-x;
+  border-color: #bd362f #bd362f #802420;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffee5f5b', endColorstr='#ffbd362f', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.btn-danger:hover,
+.btn-danger:active,
+.btn-danger.active,
+.btn-danger.disabled,
+.btn-danger[disabled] {
+  color: #ffffff;
+  background-color: #bd362f;
+  *background-color: #a9302a;
+}
+
+.btn-danger:active,
+.btn-danger.active {
+  background-color: #942a25 \9;
+}
+
+.btn-success {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #5bb75b;
+  *background-color: #51a351;
+  background-image: -moz-linear-gradient(top, #62c462, #51a351);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#62c462), to(#51a351));
+  background-image: -webkit-linear-gradient(top, #62c462, #51a351);
+  background-image: -o-linear-gradient(top, #62c462, #51a351);
+  background-image: linear-gradient(to bottom, #62c462, #51a351);
+  background-repeat: repeat-x;
+  border-color: #51a351 #51a351 #387038;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462', endColorstr='#ff51a351', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.btn-success:hover,
+.btn-success:active,
+.btn-success.active,
+.btn-success.disabled,
+.btn-success[disabled] {
+  color: #ffffff;
+  background-color: #51a351;
+  *background-color: #499249;
+}
+
+.btn-success:active,
+.btn-success.active {
+  background-color: #408140 \9;
+}
+
+.btn-info {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #49afcd;
+  *background-color: #2f96b4;
+  background-image: -moz-linear-gradient(top, #5bc0de, #2f96b4);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#5bc0de), to(#2f96b4));
+  background-image: -webkit-linear-gradient(top, #5bc0de, #2f96b4);
+  background-image: -o-linear-gradient(top, #5bc0de, #2f96b4);
+  background-image: linear-gradient(to bottom, #5bc0de, #2f96b4);
+  background-repeat: repeat-x;
+  border-color: #2f96b4 #2f96b4 #1f6377;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff2f96b4', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.btn-info:hover,
+.btn-info:active,
+.btn-info.active,
+.btn-info.disabled,
+.btn-info[disabled] {
+  color: #ffffff;
+  background-color: #2f96b4;
+  *background-color: #2a85a0;
+}
+
+.btn-info:active,
+.btn-info.active {
+  background-color: #24748c \9;
+}
+
+.btn-inverse {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #363636;
+  *background-color: #222222;
+  background-image: -moz-linear-gradient(top, #444444, #222222);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#444444), to(#222222));
+  background-image: -webkit-linear-gradient(top, #444444, #222222);
+  background-image: -o-linear-gradient(top, #444444, #222222);
+  background-image: linear-gradient(to bottom, #444444, #222222);
+  background-repeat: repeat-x;
+  border-color: #222222 #222222 #000000;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff444444', endColorstr='#ff222222', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.btn-inverse:hover,
+.btn-inverse:active,
+.btn-inverse.active,
+.btn-inverse.disabled,
+.btn-inverse[disabled] {
+  color: #ffffff;
+  background-color: #222222;
+  *background-color: #151515;
+}
+
+.btn-inverse:active,
+.btn-inverse.active {
+  background-color: #080808 \9;
+}
+
+button.btn,
+input[type="submit"].btn {
+  *padding-top: 3px;
+  *padding-bottom: 3px;
+}
+
+button.btn::-moz-focus-inner,
+input[type="submit"].btn::-moz-focus-inner {
+  padding: 0;
+  border: 0;
+}
+
+button.btn.btn-large,
+input[type="submit"].btn.btn-large {
+  *padding-top: 7px;
+  *padding-bottom: 7px;
+}
+
+button.btn.btn-small,
+input[type="submit"].btn.btn-small {
+  *padding-top: 3px;
+  *padding-bottom: 3px;
+}
+
+button.btn.btn-mini,
+input[type="submit"].btn.btn-mini {
+  *padding-top: 1px;
+  *padding-bottom: 1px;
+}
+
+.btn-link,
+.btn-link:active,
+.btn-link[disabled] {
+  background-color: transparent;
+  background-image: none;
+  -webkit-box-shadow: none;
+     -moz-box-shadow: none;
+          box-shadow: none;
+}
+
+.btn-link {
+  color: #0088cc;
+  cursor: pointer;
+  border-color: transparent;
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.btn-link:hover {
+  color: #005580;
+  text-decoration: underline;
+  background-color: transparent;
+}
+
+.btn-link[disabled]:hover {
+  color: #333333;
+  text-decoration: none;
+}
+
+.btn-group {
+  position: relative;
+  display: inline-block;
+  *display: inline;
+  *margin-left: .3em;
+  font-size: 0;
+  white-space: nowrap;
+  vertical-align: middle;
+  *zoom: 1;
+}
+
+.btn-group:first-child {
+  *margin-left: 0;
+}
+
+.btn-group + .btn-group {
+  margin-left: 5px;
+}
+
+.btn-toolbar {
+  margin-top: 10px;
+  margin-bottom: 10px;
+  font-size: 0;
+}
+
+.btn-toolbar > .btn + .btn,
+.btn-toolbar > .btn-group + .btn,
+.btn-toolbar > .btn + .btn-group {
+  margin-left: 5px;
+}
+
+.btn-group > .btn {
+  position: relative;
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.btn-group > .btn + .btn {
+  margin-left: -1px;
+}
+
+.btn-group > .btn,
+.btn-group > .dropdown-menu,
+.btn-group > .popover {
+  font-size: 14px;
+}
+
+.btn-group > .btn-mini {
+  font-size: 10.5px;
+}
+
+.btn-group > .btn-small {
+  font-size: 11.9px;
+}
+
+.btn-group > .btn-large {
+  font-size: 17.5px;
+}
+
+.btn-group > .btn:first-child {
+  margin-left: 0;
+  -webkit-border-bottom-left-radius: 4px;
+          border-bottom-left-radius: 4px;
+  -webkit-border-top-left-radius: 4px;
+          border-top-left-radius: 4px;
+  -moz-border-radius-bottomleft: 4px;
+  -moz-border-radius-topleft: 4px;
+}
+
+.btn-group > .btn:last-child,
+.btn-group > .dropdown-toggle {
+  -webkit-border-top-right-radius: 4px;
+          border-top-right-radius: 4px;
+  -webkit-border-bottom-right-radius: 4px;
+          border-bottom-right-radius: 4px;
+  -moz-border-radius-topright: 4px;
+  -moz-border-radius-bottomright: 4px;
+}
+
+.btn-group > .btn.large:first-child {
+  margin-left: 0;
+  -webkit-border-bottom-left-radius: 6px;
+          border-bottom-left-radius: 6px;
+  -webkit-border-top-left-radius: 6px;
+          border-top-left-radius: 6px;
+  -moz-border-radius-bottomleft: 6px;
+  -moz-border-radius-topleft: 6px;
+}
+
+.btn-group > .btn.large:last-child,
+.btn-group > .large.dropdown-toggle {
+  -webkit-border-top-right-radius: 6px;
+          border-top-right-radius: 6px;
+  -webkit-border-bottom-right-radius: 6px;
+          border-bottom-right-radius: 6px;
+  -moz-border-radius-topright: 6px;
+  -moz-border-radius-bottomright: 6px;
+}
+
+.btn-group > .btn:hover,
+.btn-group > .btn:focus,
+.btn-group > .btn:active,
+.btn-group > .btn.active {
+  z-index: 2;
+}
+
+.btn-group .dropdown-toggle:active,
+.btn-group.open .dropdown-toggle {
+  outline: 0;
+}
+
+.btn-group > .btn + .dropdown-toggle {
+  *padding-top: 5px;
+  padding-right: 8px;
+  *padding-bottom: 5px;
+  padding-left: 8px;
+  -webkit-box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
+     -moz-box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
+          box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
+}
+
+.btn-group > .btn-mini + .dropdown-toggle {
+  *padding-top: 2px;
+  padding-right: 5px;
+  *padding-bottom: 2px;
+  padding-left: 5px;
+}
+
+.btn-group > .btn-small + .dropdown-toggle {
+  *padding-top: 5px;
+  *padding-bottom: 4px;
+}
+
+.btn-group > .btn-large + .dropdown-toggle {
+  *padding-top: 7px;
+  padding-right: 12px;
+  *padding-bottom: 7px;
+  padding-left: 12px;
+}
+
+.btn-group.open .dropdown-toggle {
+  background-image: none;
+  -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
+     -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
+          box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
+}
+
+.btn-group.open .btn.dropdown-toggle {
+  background-color: #e6e6e6;
+}
+
+.btn-group.open .btn-primary.dropdown-toggle {
+  background-color: #0044cc;
+}
+
+.btn-group.open .btn-warning.dropdown-toggle {
+  background-color: #f89406;
+}
+
+.btn-group.open .btn-danger.dropdown-toggle {
+  background-color: #bd362f;
+}
+
+.btn-group.open .btn-success.dropdown-toggle {
+  background-color: #51a351;
+}
+
+.btn-group.open .btn-info.dropdown-toggle {
+  background-color: #2f96b4;
+}
+
+.btn-group.open .btn-inverse.dropdown-toggle {
+  background-color: #222222;
+}
+
+.btn .caret {
+  margin-top: 8px;
+  margin-left: 0;
+}
+
+.btn-mini .caret,
+.btn-small .caret,
+.btn-large .caret {
+  margin-top: 6px;
+}
+
+.btn-large .caret {
+  border-top-width: 5px;
+  border-right-width: 5px;
+  border-left-width: 5px;
+}
+
+.dropup .btn-large .caret {
+  border-bottom-width: 5px;
+}
+
+.btn-primary .caret,
+.btn-warning .caret,
+.btn-danger .caret,
+.btn-info .caret,
+.btn-success .caret,
+.btn-inverse .caret {
+  border-top-color: #ffffff;
+  border-bottom-color: #ffffff;
+}
+
+.btn-group-vertical {
+  display: inline-block;
+  *display: inline;
+  /* IE7 inline-block hack */
+
+  *zoom: 1;
+}
+
+.btn-group-vertical > .btn {
+  display: block;
+  float: none;
+  max-width: 100%;
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.btn-group-vertical > .btn + .btn {
+  margin-top: -1px;
+  margin-left: 0;
+}
+
+.btn-group-vertical > .btn:first-child {
+  -webkit-border-radius: 4px 4px 0 0;
+     -moz-border-radius: 4px 4px 0 0;
+          border-radius: 4px 4px 0 0;
+}
+
+.btn-group-vertical > .btn:last-child {
+  -webkit-border-radius: 0 0 4px 4px;
+     -moz-border-radius: 0 0 4px 4px;
+          border-radius: 0 0 4px 4px;
+}
+
+.btn-group-vertical > .btn-large:first-child {
+  -webkit-border-radius: 6px 6px 0 0;
+     -moz-border-radius: 6px 6px 0 0;
+          border-radius: 6px 6px 0 0;
+}
+
+.btn-group-vertical > .btn-large:last-child {
+  -webkit-border-radius: 0 0 6px 6px;
+     -moz-border-radius: 0 0 6px 6px;
+          border-radius: 0 0 6px 6px;
+}
+
+.alert {
+  padding: 8px 35px 8px 14px;
+  margin-bottom: 20px;
+  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
+  background-color: #fcf8e3;
+  border: 1px solid #fbeed5;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+.alert,
+.alert h4 {
+  color: #c09853;
+}
+
+.alert h4 {
+  margin: 0;
+}
+
+.alert .close {
+  position: relative;
+  top: -2px;
+  right: -21px;
+  line-height: 20px;
+}
+
+.alert-success {
+  color: #468847;
+  background-color: #dff0d8;
+  border-color: #d6e9c6;
+}
+
+.alert-success h4 {
+  color: #468847;
+}
+
+.alert-danger,
+.alert-error {
+  color: #b94a48;
+  background-color: #f2dede;
+  border-color: #eed3d7;
+}
+
+.alert-danger h4,
+.alert-error h4 {
+  color: #b94a48;
+}
+
+.alert-info {
+  color: #3a87ad;
+  background-color: #d9edf7;
+  border-color: #bce8f1;
+}
+
+.alert-info h4 {
+  color: #3a87ad;
+}
+
+.alert-block {
+  padding-top: 14px;
+  padding-bottom: 14px;
+}
+
+.alert-block > p,
+.alert-block > ul {
+  margin-bottom: 0;
+}
+
+.alert-block p + p {
+  margin-top: 5px;
+}
+
+.nav {
+  margin-bottom: 20px;
+  margin-left: 0;
+  list-style: none;
+}
+
+.nav > li > a {
+  display: block;
+}
+
+.nav > li > a:hover {
+  text-decoration: none;
+  background-color: #eeeeee;
+}
+
+.nav > li > a > img {
+  max-width: none;
+}
+
+.nav > .pull-right {
+  float: right;
+}
+
+.nav-header {
+  display: block;
+  padding: 3px 15px;
+  font-size: 11px;
+  font-weight: bold;
+  line-height: 20px;
+  color: #999999;
+  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
+  text-transform: uppercase;
+}
+
+.nav li + .nav-header {
+  margin-top: 9px;
+}
+
+.nav-list {
+  padding-right: 15px;
+  padding-left: 15px;
+  margin-bottom: 0;
+}
+
+.nav-list > li > a,
+.nav-list .nav-header {
+  margin-right: -15px;
+  margin-left: -15px;
+  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
+}
+
+.nav-list > li > a {
+  padding: 3px 15px;
+}
+
+.nav-list > .active > a,
+.nav-list > .active > a:hover {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.2);
+  background-color: #0088cc;
+}
+
+.nav-list [class^="icon-"],
+.nav-list [class*=" icon-"] {
+  margin-right: 2px;
+}
+
+.nav-list .divider {
+  *width: 100%;
+  height: 1px;
+  margin: 9px 1px;
+  *margin: -5px 0 5px;
+  overflow: hidden;
+  background-color: #e5e5e5;
+  border-bottom: 1px solid #ffffff;
+}
+
+.nav-tabs,
+.nav-pills {
+  *zoom: 1;
+}
+
+.nav-tabs:before,
+.nav-pills:before,
+.nav-tabs:after,
+.nav-pills:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.nav-tabs:after,
+.nav-pills:after {
+  clear: both;
+}
+
+.nav-tabs > li,
+.nav-pills > li {
+  float: left;
+}
+
+.nav-tabs > li > a,
+.nav-pills > li > a {
+  padding-right: 12px;
+  padding-left: 12px;
+  margin-right: 2px;
+  line-height: 14px;
+}
+
+.nav-tabs {
+  border-bottom: 1px solid #ddd;
+}
+
+.nav-tabs > li {
+  margin-bottom: -1px;
+}
+
+.nav-tabs > li > a {
+  padding-top: 8px;
+  padding-bottom: 8px;
+  line-height: 20px;
+  border: 1px solid transparent;
+  -webkit-border-radius: 4px 4px 0 0;
+     -moz-border-radius: 4px 4px 0 0;
+          border-radius: 4px 4px 0 0;
+}
+
+.nav-tabs > li > a:hover {
+  border-color: #eeeeee #eeeeee #dddddd;
+}
+
+.nav-tabs > .active > a,
+.nav-tabs > .active > a:hover {
+  color: #555555;
+  cursor: default;
+  background-color: #ffffff;
+  border: 1px solid #ddd;
+  border-bottom-color: transparent;
+}
+
+.nav-pills > li > a {
+  padding-top: 8px;
+  padding-bottom: 8px;
+  margin-top: 2px;
+  margin-bottom: 2px;
+  -webkit-border-radius: 5px;
+     -moz-border-radius: 5px;
+          border-radius: 5px;
+}
+
+.nav-pills > .active > a,
+.nav-pills > .active > a:hover {
+  color: #ffffff;
+  background-color: #0088cc;
+}
+
+.nav-stacked > li {
+  float: none;
+}
+
+.nav-stacked > li > a {
+  margin-right: 0;
+}
+
+.nav-tabs.nav-stacked {
+  border-bottom: 0;
+}
+
+.nav-tabs.nav-stacked > li > a {
+  border: 1px solid #ddd;
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.nav-tabs.nav-stacked > li:first-child > a {
+  -webkit-border-top-right-radius: 4px;
+          border-top-right-radius: 4px;
+  -webkit-border-top-left-radius: 4px;
+          border-top-left-radius: 4px;
+  -moz-border-radius-topright: 4px;
+  -moz-border-radius-topleft: 4px;
+}
+
+.nav-tabs.nav-stacked > li:last-child > a {
+  -webkit-border-bottom-right-radius: 4px;
+          border-bottom-right-radius: 4px;
+  -webkit-border-bottom-left-radius: 4px;
+          border-bottom-left-radius: 4px;
+  -moz-border-radius-bottomright: 4px;
+  -moz-border-radius-bottomleft: 4px;
+}
+
+.nav-tabs.nav-stacked > li > a:hover {
+  z-index: 2;
+  border-color: #ddd;
+}
+
+.nav-pills.nav-stacked > li > a {
+  margin-bottom: 3px;
+}
+
+.nav-pills.nav-stacked > li:last-child > a {
+  margin-bottom: 1px;
+}
+
+.nav-tabs .dropdown-menu {
+  -webkit-border-radius: 0 0 6px 6px;
+     -moz-border-radius: 0 0 6px 6px;
+          border-radius: 0 0 6px 6px;
+}
+
+.nav-pills .dropdown-menu {
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+}
+
+.nav .dropdown-toggle .caret {
+  margin-top: 6px;
+  border-top-color: #0088cc;
+  border-bottom-color: #0088cc;
+}
+
+.nav .dropdown-toggle:hover .caret {
+  border-top-color: #005580;
+  border-bottom-color: #005580;
+}
+
+/* move down carets for tabs */
+
+.nav-tabs .dropdown-toggle .caret {
+  margin-top: 8px;
+}
+
+.nav .active .dropdown-toggle .caret {
+  border-top-color: #fff;
+  border-bottom-color: #fff;
+}
+
+.nav-tabs .active .dropdown-toggle .caret {
+  border-top-color: #555555;
+  border-bottom-color: #555555;
+}
+
+.nav > .dropdown.active > a:hover {
+  cursor: pointer;
+}
+
+.nav-tabs .open .dropdown-toggle,
+.nav-pills .open .dropdown-toggle,
+.nav > li.dropdown.open.active > a:hover {
+  color: #ffffff;
+  background-color: #999999;
+  border-color: #999999;
+}
+
+.nav li.dropdown.open .caret,
+.nav li.dropdown.open.active .caret,
+.nav li.dropdown.open a:hover .caret {
+  border-top-color: #ffffff;
+  border-bottom-color: #ffffff;
+  opacity: 1;
+  filter: alpha(opacity=100);
+}
+
+.tabs-stacked .open > a:hover {
+  border-color: #999999;
+}
+
+.tabbable {
+  *zoom: 1;
+}
+
+.tabbable:before,
+.tabbable:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.tabbable:after {
+  clear: both;
+}
+
+.tab-content {
+  overflow: auto;
+}
+
+.tabs-below > .nav-tabs,
+.tabs-right > .nav-tabs,
+.tabs-left > .nav-tabs {
+  border-bottom: 0;
+}
+
+.tab-content > .tab-pane,
+.pill-content > .pill-pane {
+  display: none;
+}
+
+.tab-content > .active,
+.pill-content > .active {
+  display: block;
+}
+
+.tabs-below > .nav-tabs {
+  border-top: 1px solid #ddd;
+}
+
+.tabs-below > .nav-tabs > li {
+  margin-top: -1px;
+  margin-bottom: 0;
+}
+
+.tabs-below > .nav-tabs > li > a {
+  -webkit-border-radius: 0 0 4px 4px;
+     -moz-border-radius: 0 0 4px 4px;
+          border-radius: 0 0 4px 4px;
+}
+
+.tabs-below > .nav-tabs > li > a:hover {
+  border-top-color: #ddd;
+  border-bottom-color: transparent;
+}
+
+.tabs-below > .nav-tabs > .active > a,
+.tabs-below > .nav-tabs > .active > a:hover {
+  border-color: transparent #ddd #ddd #ddd;
+}
+
+.tabs-left > .nav-tabs > li,
+.tabs-right > .nav-tabs > li {
+  float: none;
+}
+
+.tabs-left > .nav-tabs > li > a,
+.tabs-right > .nav-tabs > li > a {
+  min-width: 74px;
+  margin-right: 0;
+  margin-bottom: 3px;
+}
+
+.tabs-left > .nav-tabs {
+  float: left;
+  margin-right: 19px;
+  border-right: 1px solid #ddd;
+}
+
+.tabs-left > .nav-tabs > li > a {
+  margin-right: -1px;
+  -webkit-border-radius: 4px 0 0 4px;
+     -moz-border-radius: 4px 0 0 4px;
+          border-radius: 4px 0 0 4px;
+}
+
+.tabs-left > .nav-tabs > li > a:hover {
+  border-color: #eeeeee #dddddd #eeeeee #eeeeee;
+}
+
+.tabs-left > .nav-tabs .active > a,
+.tabs-left > .nav-tabs .active > a:hover {
+  border-color: #ddd transparent #ddd #ddd;
+  *border-right-color: #ffffff;
+}
+
+.tabs-right > .nav-tabs {
+  float: right;
+  margin-left: 19px;
+  border-left: 1px solid #ddd;
+}
+
+.tabs-right > .nav-tabs > li > a {
+  margin-left: -1px;
+  -webkit-border-radius: 0 4px 4px 0;
+     -moz-border-radius: 0 4px 4px 0;
+          border-radius: 0 4px 4px 0;
+}
+
+.tabs-right > .nav-tabs > li > a:hover {
+  border-color: #eeeeee #eeeeee #eeeeee #dddddd;
+}
+
+.tabs-right > .nav-tabs .active > a,
+.tabs-right > .nav-tabs .active > a:hover {
+  border-color: #ddd #ddd #ddd transparent;
+  *border-left-color: #ffffff;
+}
+
+.nav > .disabled > a {
+  color: #999999;
+}
+
+.nav > .disabled > a:hover {
+  text-decoration: none;
+  cursor: default;
+  background-color: transparent;
+}
+
+.navbar {
+  *position: relative;
+  *z-index: 2;
+  margin-bottom: 20px;
+  overflow: visible;
+}
+
+.navbar-inner {
+  min-height: 40px;
+  padding-right: 20px;
+  padding-left: 20px;
+  background-color: #fafafa;
+  background-image: -moz-linear-gradient(top, #ffffff, #f2f2f2);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#f2f2f2));
+  background-image: -webkit-linear-gradient(top, #ffffff, #f2f2f2);
+  background-image: -o-linear-gradient(top, #ffffff, #f2f2f2);
+  background-image: linear-gradient(to bottom, #ffffff, #f2f2f2);
+  background-repeat: repeat-x;
+  border: 1px solid #d4d4d4;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#fff2f2f2', GradientType=0);
+  *zoom: 1;
+  -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
+     -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
+          box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
+}
+
+.navbar-inner:before,
+.navbar-inner:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.navbar-inner:after {
+  clear: both;
+}
+
+.navbar .container {
+  width: auto;
+}
+
+.nav-collapse.collapse {
+  height: auto;
+  overflow: visible;
+}
+
+.navbar .brand {
+  display: block;
+  float: left;
+  padding: 10px 20px 10px;
+  margin-left: -20px;
+  font-size: 20px;
+  font-weight: 200;
+  color: #777777;
+  text-shadow: 0 1px 0 #ffffff;
+}
+
+.navbar .brand:hover {
+  text-decoration: none;
+}
+
+.navbar-text {
+  margin-bottom: 0;
+  line-height: 40px;
+  color: #777777;
+}
+
+.navbar-link {
+  color: #777777;
+}
+
+.navbar-link:hover {
+  color: #333333;
+}
+
+.navbar .divider-vertical {
+  height: 40px;
+  margin: 0 9px;
+  border-right: 1px solid #ffffff;
+  border-left: 1px solid #f2f2f2;
+}
+
+.navbar .btn,
+.navbar .btn-group {
+  margin-top: 5px;
+}
+
+.navbar .btn-group .btn,
+.navbar .input-prepend .btn,
+.navbar .input-append .btn {
+  margin-top: 0;
+}
+
+.navbar-form {
+  margin-bottom: 0;
+  *zoom: 1;
+}
+
+.navbar-form:before,
+.navbar-form:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.navbar-form:after {
+  clear: both;
+}
+
+.navbar-form input,
+.navbar-form select,
+.navbar-form .radio,
+.navbar-form .checkbox {
+  margin-top: 5px;
+}
+
+.navbar-form input,
+.navbar-form select,
+.navbar-form .btn {
+  display: inline-block;
+  margin-bottom: 0;
+}
+
+.navbar-form input[type="image"],
+.navbar-form input[type="checkbox"],
+.navbar-form input[type="radio"] {
+  margin-top: 3px;
+}
+
+.navbar-form .input-append,
+.navbar-form .input-prepend {
+  margin-top: 5px;
+  white-space: nowrap;
+}
+
+.navbar-form .input-append input,
+.navbar-form .input-prepend input {
+  margin-top: 0;
+}
+
+.navbar-search {
+  position: relative;
+  float: left;
+  margin-top: 5px;
+  margin-bottom: 0;
+}
+
+.navbar-search .search-query {
+  padding: 4px 14px;
+  margin-bottom: 0;
+  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
+  font-size: 13px;
+  font-weight: normal;
+  line-height: 1;
+  -webkit-border-radius: 15px;
+     -moz-border-radius: 15px;
+          border-radius: 15px;
+}
+
+.navbar-static-top {
+  position: static;
+  margin-bottom: 0;
+}
+
+.navbar-static-top .navbar-inner {
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.navbar-fixed-top,
+.navbar-fixed-bottom {
+  position: fixed;
+  right: 0;
+  left: 0;
+  z-index: 1030;
+  margin-bottom: 0;
+}
+
+.navbar-fixed-top .navbar-inner,
+.navbar-static-top .navbar-inner {
+  border-width: 0 0 1px;
+}
+
+.navbar-fixed-bottom .navbar-inner {
+  border-width: 1px 0 0;
+}
+
+.navbar-fixed-top .navbar-inner,
+.navbar-fixed-bottom .navbar-inner {
+  padding-right: 0;
+  padding-left: 0;
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.navbar-static-top .container,
+.navbar-fixed-top .container,
+.navbar-fixed-bottom .container {
+  width: 940px;
+}
+
+.navbar-fixed-top {
+  top: 0;
+}
+
+.navbar-fixed-top .navbar-inner,
+.navbar-static-top .navbar-inner {
+  -webkit-box-shadow: 0 1px 10px rgba(0, 0, 0, 0.1);
+     -moz-box-shadow: 0 1px 10px rgba(0, 0, 0, 0.1);
+          box-shadow: 0 1px 10px rgba(0, 0, 0, 0.1);
+}
+
+.navbar-fixed-bottom {
+  bottom: 0;
+}
+
+.navbar-fixed-bottom .navbar-inner {
+  -webkit-box-shadow: 0 -1px 10px rgba(0, 0, 0, 0.1);
+     -moz-box-shadow: 0 -1px 10px rgba(0, 0, 0, 0.1);
+          box-shadow: 0 -1px 10px rgba(0, 0, 0, 0.1);
+}
+
+.navbar .nav {
+  position: relative;
+  left: 0;
+  display: block;
+  float: left;
+  margin: 0 10px 0 0;
+}
+
+.navbar .nav.pull-right {
+  float: right;
+  margin-right: 0;
+}
+
+.navbar .nav > li {
+  float: left;
+}
+
+.navbar .nav > li > a {
+  float: none;
+  padding: 10px 15px 10px;
+  color: #777777;
+  text-decoration: none;
+  text-shadow: 0 1px 0 #ffffff;
+}
+
+.navbar .nav .dropdown-toggle .caret {
+  margin-top: 8px;
+}
+
+.navbar .nav > li > a:focus,
+.navbar .nav > li > a:hover {
+  color: #333333;
+  text-decoration: none;
+  background-color: transparent;
+}
+
+.navbar .nav > .active > a,
+.navbar .nav > .active > a:hover,
+.navbar .nav > .active > a:focus {
+  color: #555555;
+  text-decoration: none;
+  background-color: #e5e5e5;
+  -webkit-box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
+     -moz-box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
+          box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
+}
+
+.navbar .btn-navbar {
+  display: none;
+  float: right;
+  padding: 7px 10px;
+  margin-right: 5px;
+  margin-left: 5px;
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #ededed;
+  *background-color: #e5e5e5;
+  background-image: -moz-linear-gradient(top, #f2f2f2, #e5e5e5);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f2f2f2), to(#e5e5e5));
+  background-image: -webkit-linear-gradient(top, #f2f2f2, #e5e5e5);
+  background-image: -o-linear-gradient(top, #f2f2f2, #e5e5e5);
+  background-image: linear-gradient(to bottom, #f2f2f2, #e5e5e5);
+  background-repeat: repeat-x;
+  border-color: #e5e5e5 #e5e5e5 #bfbfbf;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff2f2f2', endColorstr='#ffe5e5e5', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+  -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.075);
+     -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.075);
+          box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.075);
+}
+
+.navbar .btn-navbar:hover,
+.navbar .btn-navbar:active,
+.navbar .btn-navbar.active,
+.navbar .btn-navbar.disabled,
+.navbar .btn-navbar[disabled] {
+  color: #ffffff;
+  background-color: #e5e5e5;
+  *background-color: #d9d9d9;
+}
+
+.navbar .btn-navbar:active,
+.navbar .btn-navbar.active {
+  background-color: #cccccc \9;
+}
+
+.navbar .btn-navbar .icon-bar {
+  display: block;
+  width: 18px;
+  height: 2px;
+  background-color: #f5f5f5;
+  -webkit-border-radius: 1px;
+     -moz-border-radius: 1px;
+          border-radius: 1px;
+  -webkit-box-shadow: 0 1px 0 rgba(0, 0, 0, 0.25);
+     -moz-box-shadow: 0 1px 0 rgba(0, 0, 0, 0.25);
+          box-shadow: 0 1px 0 rgba(0, 0, 0, 0.25);
+}
+
+.btn-navbar .icon-bar + .icon-bar {
+  margin-top: 3px;
+}
+
+.navbar .nav > li > .dropdown-menu:before {
+  position: absolute;
+  top: -7px;
+  left: 9px;
+  display: inline-block;
+  border-right: 7px solid transparent;
+  border-bottom: 7px solid #ccc;
+  border-left: 7px solid transparent;
+  border-bottom-color: rgba(0, 0, 0, 0.2);
+  content: '';
+}
+
+.navbar .nav > li > .dropdown-menu:after {
+  position: absolute;
+  top: -6px;
+  left: 10px;
+  display: inline-block;
+  border-right: 6px solid transparent;
+  border-bottom: 6px solid #ffffff;
+  border-left: 6px solid transparent;
+  content: '';
+}
+
+.navbar-fixed-bottom .nav > li > .dropdown-menu:before {
+  top: auto;
+  bottom: -7px;
+  border-top: 7px solid #ccc;
+  border-bottom: 0;
+  border-top-color: rgba(0, 0, 0, 0.2);
+}
+
+.navbar-fixed-bottom .nav > li > .dropdown-menu:after {
+  top: auto;
+  bottom: -6px;
+  border-top: 6px solid #ffffff;
+  border-bottom: 0;
+}
+
+.navbar .nav li.dropdown > a:hover .caret {
+  border-top-color: #555555;
+  border-bottom-color: #555555;
+}
+
+.navbar .nav li.dropdown.open > .dropdown-toggle,
+.navbar .nav li.dropdown.active > .dropdown-toggle,
+.navbar .nav li.dropdown.open.active > .dropdown-toggle {
+  color: #555555;
+  background-color: #e5e5e5;
+}
+
+.navbar .nav li.dropdown > .dropdown-toggle .caret {
+  border-top-color: #777777;
+  border-bottom-color: #777777;
+}
+
+.navbar .nav li.dropdown.open > .dropdown-toggle .caret,
+.navbar .nav li.dropdown.active > .dropdown-toggle .caret,
+.navbar .nav li.dropdown.open.active > .dropdown-toggle .caret {
+  border-top-color: #555555;
+  border-bottom-color: #555555;
+}
+
+.navbar .pull-right > li > .dropdown-menu,
+.navbar .nav > li > .dropdown-menu.pull-right {
+  right: 0;
+  left: auto;
+}
+
+.navbar .pull-right > li > .dropdown-menu:before,
+.navbar .nav > li > .dropdown-menu.pull-right:before {
+  right: 12px;
+  left: auto;
+}
+
+.navbar .pull-right > li > .dropdown-menu:after,
+.navbar .nav > li > .dropdown-menu.pull-right:after {
+  right: 13px;
+  left: auto;
+}
+
+.navbar .pull-right > li > .dropdown-menu .dropdown-menu,
+.navbar .nav > li > .dropdown-menu.pull-right .dropdown-menu {
+  right: 100%;
+  left: auto;
+  margin-right: -1px;
+  margin-left: 0;
+  -webkit-border-radius: 6px 0 6px 6px;
+     -moz-border-radius: 6px 0 6px 6px;
+          border-radius: 6px 0 6px 6px;
+}
+
+.navbar-inverse .navbar-inner {
+  background-color: #1b1b1b;
+  background-image: -moz-linear-gradient(top, #222222, #111111);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#222222), to(#111111));
+  background-image: -webkit-linear-gradient(top, #222222, #111111);
+  background-image: -o-linear-gradient(top, #222222, #111111);
+  background-image: linear-gradient(to bottom, #222222, #111111);
+  background-repeat: repeat-x;
+  border-color: #252525;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff222222', endColorstr='#ff111111', GradientType=0);
+}
+
+.navbar-inverse .brand,
+.navbar-inverse .nav > li > a {
+  color: #999999;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+}
+
+.navbar-inverse .brand:hover,
+.navbar-inverse .nav > li > a:hover {
+  color: #ffffff;
+}
+
+.navbar-inverse .brand {
+  color: #999999;
+}
+
+.navbar-inverse .navbar-text {
+  color: #999999;
+}
+
+.navbar-inverse .nav > li > a:focus,
+.navbar-inverse .nav > li > a:hover {
+  color: #ffffff;
+  background-color: transparent;
+}
+
+.navbar-inverse .nav .active > a,
+.navbar-inverse .nav .active > a:hover,
+.navbar-inverse .nav .active > a:focus {
+  color: #ffffff;
+  background-color: #111111;
+}
+
+.navbar-inverse .navbar-link {
+  color: #999999;
+}
+
+.navbar-inverse .navbar-link:hover {
+  color: #ffffff;
+}
+
+.navbar-inverse .divider-vertical {
+  border-right-color: #222222;
+  border-left-color: #111111;
+}
+
+.navbar-inverse .nav li.dropdown.open > .dropdown-toggle,
+.navbar-inverse .nav li.dropdown.active > .dropdown-toggle,
+.navbar-inverse .nav li.dropdown.open.active > .dropdown-toggle {
+  color: #ffffff;
+  background-color: #111111;
+}
+
+.navbar-inverse .nav li.dropdown > a:hover .caret {
+  border-top-color: #ffffff;
+  border-bottom-color: #ffffff;
+}
+
+.navbar-inverse .nav li.dropdown > .dropdown-toggle .caret {
+  border-top-color: #999999;
+  border-bottom-color: #999999;
+}
+
+.navbar-inverse .nav li.dropdown.open > .dropdown-toggle .caret,
+.navbar-inverse .nav li.dropdown.active > .dropdown-toggle .caret,
+.navbar-inverse .nav li.dropdown.open.active > .dropdown-toggle .caret {
+  border-top-color: #ffffff;
+  border-bottom-color: #ffffff;
+}
+
+.navbar-inverse .navbar-search .search-query {
+  color: #ffffff;
+  background-color: #515151;
+  border-color: #111111;
+  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1), 0 1px 0 rgba(255, 255, 255, 0.15);
+     -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1), 0 1px 0 rgba(255, 255, 255, 0.15);
+          box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1), 0 1px 0 rgba(255, 255, 255, 0.15);
+  -webkit-transition: none;
+     -moz-transition: none;
+       -o-transition: none;
+          transition: none;
+}
+
+.navbar-inverse .navbar-search .search-query:-moz-placeholder {
+  color: #cccccc;
+}
+
+.navbar-inverse .navbar-search .search-query:-ms-input-placeholder {
+  color: #cccccc;
+}
+
+.navbar-inverse .navbar-search .search-query::-webkit-input-placeholder {
+  color: #cccccc;
+}
+
+.navbar-inverse .navbar-search .search-query:focus,
+.navbar-inverse .navbar-search .search-query.focused {
+  padding: 5px 15px;
+  color: #333333;
+  text-shadow: 0 1px 0 #ffffff;
+  background-color: #ffffff;
+  border: 0;
+  outline: 0;
+  -webkit-box-shadow: 0 0 3px rgba(0, 0, 0, 0.15);
+     -moz-box-shadow: 0 0 3px rgba(0, 0, 0, 0.15);
+          box-shadow: 0 0 3px rgba(0, 0, 0, 0.15);
+}
+
+.navbar-inverse .btn-navbar {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #0e0e0e;
+  *background-color: #040404;
+  background-image: -moz-linear-gradient(top, #151515, #040404);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#151515), to(#040404));
+  background-image: -webkit-linear-gradient(top, #151515, #040404);
+  background-image: -o-linear-gradient(top, #151515, #040404);
+  background-image: linear-gradient(to bottom, #151515, #040404);
+  background-repeat: repeat-x;
+  border-color: #040404 #040404 #000000;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff151515', endColorstr='#ff040404', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.navbar-inverse .btn-navbar:hover,
+.navbar-inverse .btn-navbar:active,
+.navbar-inverse .btn-navbar.active,
+.navbar-inverse .btn-navbar.disabled,
+.navbar-inverse .btn-navbar[disabled] {
+  color: #ffffff;
+  background-color: #040404;
+  *background-color: #000000;
+}
+
+.navbar-inverse .btn-navbar:active,
+.navbar-inverse .btn-navbar.active {
+  background-color: #000000 \9;
+}
+
+.breadcrumb {
+  padding: 8px 15px;
+  margin: 0 0 20px;
+  list-style: none;
+  background-color: #f5f5f5;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+.breadcrumb > li {
+  display: inline-block;
+  *display: inline;
+  text-shadow: 0 1px 0 #ffffff;
+  *zoom: 1;
+}
+
+.breadcrumb > li > .divider {
+  padding: 0 5px;
+  color: #ccc;
+}
+
+.breadcrumb > .active {
+  color: #999999;
+}
+
+.pagination {
+  margin: 20px 0;
+}
+
+.pagination ul {
+  display: inline-block;
+  *display: inline;
+  margin-bottom: 0;
+  margin-left: 0;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+  *zoom: 1;
+  -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
+     -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
+          box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
+}
+
+.pagination ul > li {
+  display: inline;
+}
+
+.pagination ul > li > a,
+.pagination ul > li > span {
+  float: left;
+  padding: 4px 12px;
+  line-height: 20px;
+  text-decoration: none;
+  background-color: #ffffff;
+  border: 1px solid #dddddd;
+  border-left-width: 0;
+}
+
+.pagination ul > li > a:hover,
+.pagination ul > .active > a,
+.pagination ul > .active > span {
+  background-color: #f5f5f5;
+}
+
+.pagination ul > .active > a,
+.pagination ul > .active > span {
+  color: #999999;
+  cursor: default;
+}
+
+.pagination ul > .disabled > span,
+.pagination ul > .disabled > a,
+.pagination ul > .disabled > a:hover {
+  color: #999999;
+  cursor: default;
+  background-color: transparent;
+}
+
+.pagination ul > li:first-child > a,
+.pagination ul > li:first-child > span {
+  border-left-width: 1px;
+  -webkit-border-bottom-left-radius: 4px;
+          border-bottom-left-radius: 4px;
+  -webkit-border-top-left-radius: 4px;
+          border-top-left-radius: 4px;
+  -moz-border-radius-bottomleft: 4px;
+  -moz-border-radius-topleft: 4px;
+}
+
+.pagination ul > li:last-child > a,
+.pagination ul > li:last-child > span {
+  -webkit-border-top-right-radius: 4px;
+          border-top-right-radius: 4px;
+  -webkit-border-bottom-right-radius: 4px;
+          border-bottom-right-radius: 4px;
+  -moz-border-radius-topright: 4px;
+  -moz-border-radius-bottomright: 4px;
+}
+
+.pagination-centered {
+  text-align: center;
+}
+
+.pagination-right {
+  text-align: right;
+}
+
+.pagination-large ul > li > a,
+.pagination-large ul > li > span {
+  padding: 11px 19px;
+  font-size: 17.5px;
+}
+
+.pagination-large ul > li:first-child > a,
+.pagination-large ul > li:first-child > span {
+  -webkit-border-bottom-left-radius: 6px;
+          border-bottom-left-radius: 6px;
+  -webkit-border-top-left-radius: 6px;
+          border-top-left-radius: 6px;
+  -moz-border-radius-bottomleft: 6px;
+  -moz-border-radius-topleft: 6px;
+}
+
+.pagination-large ul > li:last-child > a,
+.pagination-large ul > li:last-child > span {
+  -webkit-border-top-right-radius: 6px;
+          border-top-right-radius: 6px;
+  -webkit-border-bottom-right-radius: 6px;
+          border-bottom-right-radius: 6px;
+  -moz-border-radius-topright: 6px;
+  -moz-border-radius-bottomright: 6px;
+}
+
+.pagination-mini ul > li:first-child > a,
+.pagination-small ul > li:first-child > a,
+.pagination-mini ul > li:first-child > span,
+.pagination-small ul > li:first-child > span {
+  -webkit-border-bottom-left-radius: 3px;
+          border-bottom-left-radius: 3px;
+  -webkit-border-top-left-radius: 3px;
+          border-top-left-radius: 3px;
+  -moz-border-radius-bottomleft: 3px;
+  -moz-border-radius-topleft: 3px;
+}
+
+.pagination-mini ul > li:last-child > a,
+.pagination-small ul > li:last-child > a,
+.pagination-mini ul > li:last-child > span,
+.pagination-small ul > li:last-child > span {
+  -webkit-border-top-right-radius: 3px;
+          border-top-right-radius: 3px;
+  -webkit-border-bottom-right-radius: 3px;
+          border-bottom-right-radius: 3px;
+  -moz-border-radius-topright: 3px;
+  -moz-border-radius-bottomright: 3px;
+}
+
+.pagination-small ul > li > a,
+.pagination-small ul > li > span {
+  padding: 2px 10px;
+  font-size: 11.9px;
+}
+
+.pagination-mini ul > li > a,
+.pagination-mini ul > li > span {
+  padding: 0 6px;
+  font-size: 10.5px;
+}
+
+.pager {
+  margin: 20px 0;
+  text-align: center;
+  list-style: none;
+  *zoom: 1;
+}
+
+.pager:before,
+.pager:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.pager:after {
+  clear: both;
+}
+
+.pager li {
+  display: inline;
+}
+
+.pager li > a,
+.pager li > span {
+  display: inline-block;
+  padding: 5px 14px;
+  background-color: #fff;
+  border: 1px solid #ddd;
+  -webkit-border-radius: 15px;
+     -moz-border-radius: 15px;
+          border-radius: 15px;
+}
+
+.pager li > a:hover {
+  text-decoration: none;
+  background-color: #f5f5f5;
+}
+
+.pager .next > a,
+.pager .next > span {
+  float: right;
+}
+
+.pager .previous > a,
+.pager .previous > span {
+  float: left;
+}
+
+.pager .disabled > a,
+.pager .disabled > a:hover,
+.pager .disabled > span {
+  color: #999999;
+  cursor: default;
+  background-color: #fff;
+}
+
+.modal-backdrop {
+  position: fixed;
+  top: 0;
+  right: 0;
+  bottom: 0;
+  left: 0;
+  z-index: 1040;
+  background-color: #000000;
+}
+
+.modal-backdrop.fade {
+  opacity: 0;
+}
+
+.modal-backdrop,
+.modal-backdrop.fade.in {
+  opacity: 0.8;
+  filter: alpha(opacity=80);
+}
+
+.modal {
+  position: fixed;
+  top: 10%;
+  left: 50%;
+  z-index: 1050;
+  width: 560px;
+  margin-left: -280px;
+  background-color: #ffffff;
+  border: 1px solid #999;
+  border: 1px solid rgba(0, 0, 0, 0.3);
+  *border: 1px solid #999;
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+  outline: none;
+  -webkit-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
+     -moz-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
+          box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
+  -webkit-background-clip: padding-box;
+     -moz-background-clip: padding-box;
+          background-clip: padding-box;
+}
+
+.modal.fade {
+  top: -25%;
+  -webkit-transition: opacity 0.3s linear, top 0.3s ease-out;
+     -moz-transition: opacity 0.3s linear, top 0.3s ease-out;
+       -o-transition: opacity 0.3s linear, top 0.3s ease-out;
+          transition: opacity 0.3s linear, top 0.3s ease-out;
+}
+
+.modal.fade.in {
+  top: 10%;
+}
+
+.modal-header {
+  padding: 9px 15px;
+  border-bottom: 1px solid #eee;
+}
+
+.modal-header .close {
+  margin-top: 2px;
+}
+
+.modal-header h3 {
+  margin: 0;
+  line-height: 30px;
+}
+
+.modal-body {
+  position: relative;
+  max-height: 400px;
+  padding: 15px;
+  overflow-y: auto;
+}
+
+.modal-form {
+  margin-bottom: 0;
+}
+
+.modal-footer {
+  padding: 14px 15px 15px;
+  margin-bottom: 0;
+  text-align: right;
+  background-color: #f5f5f5;
+  border-top: 1px solid #ddd;
+  -webkit-border-radius: 0 0 6px 6px;
+     -moz-border-radius: 0 0 6px 6px;
+          border-radius: 0 0 6px 6px;
+  *zoom: 1;
+  -webkit-box-shadow: inset 0 1px 0 #ffffff;
+     -moz-box-shadow: inset 0 1px 0 #ffffff;
+          box-shadow: inset 0 1px 0 #ffffff;
+}
+
+.modal-footer:before,
+.modal-footer:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.modal-footer:after {
+  clear: both;
+}
+
+.modal-footer .btn + .btn {
+  margin-bottom: 0;
+  margin-left: 5px;
+}
+
+.modal-footer .btn-group .btn + .btn {
+  margin-left: -1px;
+}
+
+.modal-footer .btn-block + .btn-block {
+  margin-left: 0;
+}
+
+.tooltip {
+  position: absolute;
+  z-index: 1030;
+  display: block;
+  padding: 5px;
+  font-size: 11px;
+  opacity: 0;
+  filter: alpha(opacity=0);
+  visibility: visible;
+}
+
+.tooltip.in {
+  opacity: 0.8;
+  filter: alpha(opacity=80);
+}
+
+.tooltip.top {
+  margin-top: -3px;
+}
+
+.tooltip.right {
+  margin-left: 3px;
+}
+
+.tooltip.bottom {
+  margin-top: 3px;
+}
+
+.tooltip.left {
+  margin-left: -3px;
+}
+
+.tooltip-inner {
+  max-width: 200px;
+  padding: 3px 8px;
+  color: #ffffff;
+  text-align: center;
+  text-decoration: none;
+  background-color: #000000;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+.tooltip-arrow {
+  position: absolute;
+  width: 0;
+  height: 0;
+  border-color: transparent;
+  border-style: solid;
+}
+
+.tooltip.top .tooltip-arrow {
+  bottom: 0;
+  left: 50%;
+  margin-left: -5px;
+  border-top-color: #000000;
+  border-width: 5px 5px 0;
+}
+
+.tooltip.right .tooltip-arrow {
+  top: 50%;
+  left: 0;
+  margin-top: -5px;
+  border-right-color: #000000;
+  border-width: 5px 5px 5px 0;
+}
+
+.tooltip.left .tooltip-arrow {
+  top: 50%;
+  right: 0;
+  margin-top: -5px;
+  border-left-color: #000000;
+  border-width: 5px 0 5px 5px;
+}
+
+.tooltip.bottom .tooltip-arrow {
+  top: 0;
+  left: 50%;
+  margin-left: -5px;
+  border-bottom-color: #000000;
+  border-width: 0 5px 5px;
+}
+
+.popover {
+  position: absolute;
+  top: 0;
+  left: 0;
+  z-index: 1010;
+  display: none;
+  width: 236px;
+  padding: 1px;
+  text-align: left;
+  white-space: normal;
+  background-color: #ffffff;
+  border: 1px solid #ccc;
+  border: 1px solid rgba(0, 0, 0, 0.2);
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+  -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
+     -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
+          box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
+  -webkit-background-clip: padding-box;
+     -moz-background-clip: padding;
+          background-clip: padding-box;
+}
+
+.popover.top {
+  margin-top: -10px;
+}
+
+.popover.right {
+  margin-left: 10px;
+}
+
+.popover.bottom {
+  margin-top: 10px;
+}
+
+.popover.left {
+  margin-left: -10px;
+}
+
+.popover-title {
+  padding: 8px 14px;
+  margin: 0;
+  font-size: 14px;
+  font-weight: normal;
+  line-height: 18px;
+  background-color: #f7f7f7;
+  border-bottom: 1px solid #ebebeb;
+  -webkit-border-radius: 5px 5px 0 0;
+     -moz-border-radius: 5px 5px 0 0;
+          border-radius: 5px 5px 0 0;
+}
+
+.popover-content {
+  padding: 9px 14px;
+}
+
+.popover .arrow,
+.popover .arrow:after {
+  position: absolute;
+  display: block;
+  width: 0;
+  height: 0;
+  border-color: transparent;
+  border-style: solid;
+}
+
+.popover .arrow {
+  border-width: 11px;
+}
+
+.popover .arrow:after {
+  border-width: 10px;
+  content: "";
+}
+
+.popover.top .arrow {
+  bottom: -11px;
+  left: 50%;
+  margin-left: -11px;
+  border-top-color: #999;
+  border-top-color: rgba(0, 0, 0, 0.25);
+  border-bottom-width: 0;
+}
+
+.popover.top .arrow:after {
+  bottom: 1px;
+  margin-left: -10px;
+  border-top-color: #ffffff;
+  border-bottom-width: 0;
+}
+
+.popover.right .arrow {
+  top: 50%;
+  left: -11px;
+  margin-top: -11px;
+  border-right-color: #999;
+  border-right-color: rgba(0, 0, 0, 0.25);
+  border-left-width: 0;
+}
+
+.popover.right .arrow:after {
+  bottom: -10px;
+  left: 1px;
+  border-right-color: #ffffff;
+  border-left-width: 0;
+}
+
+.popover.bottom .arrow {
+  top: -11px;
+  left: 50%;
+  margin-left: -11px;
+  border-bottom-color: #999;
+  border-bottom-color: rgba(0, 0, 0, 0.25);
+  border-top-width: 0;
+}
+
+.popover.bottom .arrow:after {
+  top: 1px;
+  margin-left: -10px;
+  border-bottom-color: #ffffff;
+  border-top-width: 0;
+}
+
+.popover.left .arrow {
+  top: 50%;
+  right: -11px;
+  margin-top: -11px;
+  border-left-color: #999;
+  border-left-color: rgba(0, 0, 0, 0.25);
+  border-right-width: 0;
+}
+
+.popover.left .arrow:after {
+  right: 1px;
+  bottom: -10px;
+  border-left-color: #ffffff;
+  border-right-width: 0;
+}
+
+.thumbnails {
+  margin-left: -20px;
+  list-style: none;
+  *zoom: 1;
+}
+
+.thumbnails:before,
+.thumbnails:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.thumbnails:after {
+  clear: both;
+}
+
+.row-fluid .thumbnails {
+  margin-left: 0;
+}
+
+.thumbnails > li {
+  float: left;
+  margin-bottom: 20px;
+  margin-left: 20px;
+}
+
+.thumbnail {
+  display: block;
+  padding: 4px;
+  line-height: 20px;
+  border: 1px solid #ddd;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+  -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.055);
+     -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.055);
+          box-shadow: 0 1px 3px rgba(0, 0, 0, 0.055);
+  -webkit-transition: all 0.2s ease-in-out;
+     -moz-transition: all 0.2s ease-in-out;
+       -o-transition: all 0.2s ease-in-out;
+          transition: all 0.2s ease-in-out;
+}
+
+a.thumbnail:hover {
+  border-color: #0088cc;
+  -webkit-box-shadow: 0 1px 4px rgba(0, 105, 214, 0.25);
+     -moz-box-shadow: 0 1px 4px rgba(0, 105, 214, 0.25);
+          box-shadow: 0 1px 4px rgba(0, 105, 214, 0.25);
+}
+
+.thumbnail > img {
+  display: block;
+  max-width: 100%;
+  margin-right: auto;
+  margin-left: auto;
+}
+
+.thumbnail .caption {
+  padding: 9px;
+  color: #555555;
+}
+
+.media,
+.media-body {
+  overflow: hidden;
+  *overflow: visible;
+  zoom: 1;
+}
+
+.media,
+.media .media {
+  margin-top: 15px;
+}
+
+.media:first-child {
+  margin-top: 0;
+}
+
+.media-object {
+  display: block;
+}
+
+.media-heading {
+  margin: 0 0 5px;
+}
+
+.media .pull-left {
+  margin-right: 10px;
+}
+
+.media .pull-right {
+  margin-left: 10px;
+}
+
+.media-list {
+  margin-left: 0;
+  list-style: none;
+}
+
+.label,
+.badge {
+  display: inline-block;
+  padding: 2px 4px;
+  font-size: 11.844px;
+  font-weight: bold;
+  line-height: 14px;
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  white-space: nowrap;
+  vertical-align: baseline;
+  background-color: #999999;
+}
+
+.label {
+  -webkit-border-radius: 3px;
+     -moz-border-radius: 3px;
+          border-radius: 3px;
+}
+
+.badge {
+  padding-right: 9px;
+  padding-left: 9px;
+  -webkit-border-radius: 9px;
+     -moz-border-radius: 9px;
+          border-radius: 9px;
+}
+
+.label:empty,
+.badge:empty {
+  display: none;
+}
+
+a.label:hover,
+a.badge:hover {
+  color: #ffffff;
+  text-decoration: none;
+  cursor: pointer;
+}
+
+.label-important,
+.badge-important {
+  background-color: #b94a48;
+}
+
+.label-important[href],
+.badge-important[href] {
+  background-color: #953b39;
+}
+
+.label-warning,
+.badge-warning {
+  background-color: #f89406;
+}
+
+.label-warning[href],
+.badge-warning[href] {
+  background-color: #c67605;
+}
+
+.label-success,
+.badge-success {
+  background-color: #468847;
+}
+
+.label-success[href],
+.badge-success[href] {
+  background-color: #356635;
+}
+
+.label-info,
+.badge-info {
+  background-color: #3a87ad;
+}
+
+.label-info[href],
+.badge-info[href] {
+  background-color: #2d6987;
+}
+
+.label-inverse,
+.badge-inverse {
+  background-color: #333333;
+}
+
+.label-inverse[href],
+.badge-inverse[href] {
+  background-color: #1a1a1a;
+}
+
+.btn .label,
+.btn .badge {
+  position: relative;
+  top: -1px;
+}
+
+.btn-mini .label,
+.btn-mini .badge {
+  top: 0;
+}
+
+ at -webkit-keyframes progress-bar-stripes {
+  from {
+    background-position: 40px 0;
+  }
+  to {
+    background-position: 0 0;
+  }
+}
+
+ at -moz-keyframes progress-bar-stripes {
+  from {
+    background-position: 40px 0;
+  }
+  to {
+    background-position: 0 0;
+  }
+}
+
+ at -ms-keyframes progress-bar-stripes {
+  from {
+    background-position: 40px 0;
+  }
+  to {
+    background-position: 0 0;
+  }
+}
+
+ at -o-keyframes progress-bar-stripes {
+  from {
+    background-position: 0 0;
+  }
+  to {
+    background-position: 40px 0;
+  }
+}
+
+ at keyframes progress-bar-stripes {
+  from {
+    background-position: 40px 0;
+  }
+  to {
+    background-position: 0 0;
+  }
+}
+
+.progress {
+  height: 20px;
+  margin-bottom: 20px;
+  overflow: hidden;
+  background-color: #f7f7f7;
+  background-image: -moz-linear-gradient(top, #f5f5f5, #f9f9f9);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f5f5f5), to(#f9f9f9));
+  background-image: -webkit-linear-gradient(top, #f5f5f5, #f9f9f9);
+  background-image: -o-linear-gradient(top, #f5f5f5, #f9f9f9);
+  background-image: linear-gradient(to bottom, #f5f5f5, #f9f9f9);
+  background-repeat: repeat-x;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff5f5f5', endColorstr='#fff9f9f9', GradientType=0);
+  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
+     -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
+          box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
+}
+
+.progress .bar {
+  float: left;
+  width: 0;
+  height: 100%;
+  font-size: 12px;
+  color: #ffffff;
+  text-align: center;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #0e90d2;
+  background-image: -moz-linear-gradient(top, #149bdf, #0480be);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#149bdf), to(#0480be));
+  background-image: -webkit-linear-gradient(top, #149bdf, #0480be);
+  background-image: -o-linear-gradient(top, #149bdf, #0480be);
+  background-image: linear-gradient(to bottom, #149bdf, #0480be);
+  background-repeat: repeat-x;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff149bdf', endColorstr='#ff0480be', GradientType=0);
+  -webkit-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
+     -moz-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
+          box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
+  -webkit-box-sizing: border-box;
+     -moz-box-sizing: border-box;
+          box-sizing: border-box;
+  -webkit-transition: width 0.6s ease;
+     -moz-transition: width 0.6s ease;
+       -o-transition: width 0.6s ease;
+          transition: width 0.6s ease;
+}
+
+.progress .bar + .bar {
+  -webkit-box-shadow: inset 1px 0 0 rgba(0, 0, 0, 0.15), inset 0 -1px 0 rgba(0, 0, 0, 0.15);
+     -moz-box-shadow: inset 1px 0 0 rgba(0, 0, 0, 0.15), inset 0 -1px 0 rgba(0, 0, 0, 0.15);
+          box-shadow: inset 1px 0 0 rgba(0, 0, 0, 0.15), inset 0 -1px 0 rgba(0, 0, 0, 0.15);
+}
+
+.progress-striped .bar {
+  background-color: #149bdf;
+  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
+  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  -webkit-background-size: 40px 40px;
+     -moz-background-size: 40px 40px;
+       -o-background-size: 40px 40px;
+          background-size: 40px 40px;
+}
+
+.progress.active .bar {
+  -webkit-animation: progress-bar-stripes 2s linear infinite;
+     -moz-animation: progress-bar-stripes 2s linear infinite;
+      -ms-animation: progress-bar-stripes 2s linear infinite;
+       -o-animation: progress-bar-stripes 2s linear infinite;
+          animation: progress-bar-stripes 2s linear infinite;
+}
+
+.progress-danger .bar,
+.progress .bar-danger {
+  background-color: #dd514c;
+  background-image: -moz-linear-gradient(top, #ee5f5b, #c43c35);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ee5f5b), to(#c43c35));
+  background-image: -webkit-linear-gradient(top, #ee5f5b, #c43c35);
+  background-image: -o-linear-gradient(top, #ee5f5b, #c43c35);
+  background-image: linear-gradient(to bottom, #ee5f5b, #c43c35);
+  background-repeat: repeat-x;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffee5f5b', endColorstr='#ffc43c35', GradientType=0);
+}
+
+.progress-danger.progress-striped .bar,
+.progress-striped .bar-danger {
+  background-color: #ee5f5b;
+  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
+  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+}
+
+.progress-success .bar,
+.progress .bar-success {
+  background-color: #5eb95e;
+  background-image: -moz-linear-gradient(top, #62c462, #57a957);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#62c462), to(#57a957));
+  background-image: -webkit-linear-gradient(top, #62c462, #57a957);
+  background-image: -o-linear-gradient(top, #62c462, #57a957);
+  background-image: linear-gradient(to bottom, #62c462, #57a957);
+  background-repeat: repeat-x;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462', endColorstr='#ff57a957', GradientType=0);
+}
+
+.progress-success.progress-striped .bar,
+.progress-striped .bar-success {
+  background-color: #62c462;
+  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
+  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+}
+
+.progress-info .bar,
+.progress .bar-info {
+  background-color: #4bb1cf;
+  background-image: -moz-linear-gradient(top, #5bc0de, #339bb9);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#5bc0de), to(#339bb9));
+  background-image: -webkit-linear-gradient(top, #5bc0de, #339bb9);
+  background-image: -o-linear-gradient(top, #5bc0de, #339bb9);
+  background-image: linear-gradient(to bottom, #5bc0de, #339bb9);
+  background-repeat: repeat-x;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff339bb9', GradientType=0);
+}
+
+.progress-info.progress-striped .bar,
+.progress-striped .bar-info {
+  background-color: #5bc0de;
+  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
+  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+}
+
+.progress-warning .bar,
+.progress .bar-warning {
+  background-color: #faa732;
+  background-image: -moz-linear-gradient(top, #fbb450, #f89406);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fbb450), to(#f89406));
+  background-image: -webkit-linear-gradient(top, #fbb450, #f89406);
+  background-image: -o-linear-gradient(top, #fbb450, #f89406);
+  background-image: linear-gradient(to bottom, #fbb450, #f89406);
+  background-repeat: repeat-x;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fffbb450', endColorstr='#fff89406', GradientType=0);
+}
+
+.progress-warning.progress-striped .bar,
+.progress-striped .bar-warning {
+  background-color: #fbb450;
+  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
+  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+}
+
+.accordion {
+  margin-bottom: 20px;
+}
+
+.accordion-group {
+  margin-bottom: 2px;
+  border: 1px solid #e5e5e5;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+.accordion-heading {
+  border-bottom: 0;
+}
+
+.accordion-heading .accordion-toggle {
+  display: block;
+  padding: 8px 15px;
+}
+
+.accordion-toggle {
+  cursor: pointer;
+}
+
+.accordion-inner {
+  padding: 9px 15px;
+  border-top: 1px solid #e5e5e5;
+}
+
+.carousel {
+  position: relative;
+  margin-bottom: 20px;
+  line-height: 1;
+}
+
+.carousel-inner {
+  position: relative;
+  width: 100%;
+  overflow: hidden;
+}
+
+.carousel-inner > .item {
+  position: relative;
+  display: none;
+  -webkit-transition: 0.6s ease-in-out left;
+     -moz-transition: 0.6s ease-in-out left;
+       -o-transition: 0.6s ease-in-out left;
+          transition: 0.6s ease-in-out left;
+}
+
+.carousel-inner > .item > img {
+  display: block;
+  line-height: 1;
+}
+
+.carousel-inner > .active,
+.carousel-inner > .next,
+.carousel-inner > .prev {
+  display: block;
+}
+
+.carousel-inner > .active {
+  left: 0;
+}
+
+.carousel-inner > .next,
+.carousel-inner > .prev {
+  position: absolute;
+  top: 0;
+  width: 100%;
+}
+
+.carousel-inner > .next {
+  left: 100%;
+}
+
+.carousel-inner > .prev {
+  left: -100%;
+}
+
+.carousel-inner > .next.left,
+.carousel-inner > .prev.right {
+  left: 0;
+}
+
+.carousel-inner > .active.left {
+  left: -100%;
+}
+
+.carousel-inner > .active.right {
+  left: 100%;
+}
+
+.carousel-control {
+  position: absolute;
+  top: 40%;
+  left: 15px;
+  width: 40px;
+  height: 40px;
+  margin-top: -20px;
+  font-size: 60px;
+  font-weight: 100;
+  line-height: 30px;
+  color: #ffffff;
+  text-align: center;
+  background: #222222;
+  border: 3px solid #ffffff;
+  -webkit-border-radius: 23px;
+     -moz-border-radius: 23px;
+          border-radius: 23px;
+  opacity: 0.5;
+  filter: alpha(opacity=50);
+}
+
+.carousel-control.right {
+  right: 15px;
+  left: auto;
+}
+
+.carousel-control:hover {
+  color: #ffffff;
+  text-decoration: none;
+  opacity: 0.9;
+  filter: alpha(opacity=90);
+}
+
+.carousel-caption {
+  position: absolute;
+  right: 0;
+  bottom: 0;
+  left: 0;
+  padding: 15px;
+  background: #333333;
+  background: rgba(0, 0, 0, 0.75);
+}
+
+.carousel-caption h4,
+.carousel-caption p {
+  line-height: 20px;
+  color: #ffffff;
+}
+
+.carousel-caption h4 {
+  margin: 0 0 5px;
+}
+
+.carousel-caption p {
+  margin-bottom: 0;
+}
+
+.hero-unit {
+  padding: 60px;
+  margin-bottom: 30px;
+  font-size: 18px;
+  font-weight: 200;
+  line-height: 30px;
+  color: inherit;
+  background-color: #eeeeee;
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+}
+
+.hero-unit h1 {
+  margin-bottom: 0;
+  font-size: 60px;
+  line-height: 1;
+  letter-spacing: -1px;
+  color: inherit;
+}
+
+.hero-unit li {
+  line-height: 30px;
+}
+
+.pull-right {
+  float: right;
+}
+
+.pull-left {
+  float: left;
+}
+
+.hide {
+  display: none;
+}
+
+.show {
+  display: block;
+}
+
+.invisible {
+  visibility: hidden;
+}
+
+.affix {
+  position: fixed;
+}
diff --git a/docs/css/bootstrap.min.css b/docs/css/bootstrap.min.css
new file mode 100644
index 0000000..c9b4183
--- /dev/null
+++ b/docs/css/bootstrap.min.css
@@ -0,0 +1,882 @@
+ at import url(//fonts.googleapis.com/css?family=Telex);
+article,aside,details,figcaption,figure,footer,header,hgroup,nav,section{display:block;}
+footer{line-height:3px;font-size:80%;}
+audio,canvas,video{display:inline-block;*display:inline;*zoom:1;}
+audio:not([controls]){display:none;}
+html{font-size:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;}
+a:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px;}
+a:hover,a:active{outline:0;}
+sub,sup{position:relative;font-size:75%;line-height:0;vertical-align:baseline;}
+sup{top:-0.5em;}
+sub{bottom:-0.25em;}
+img{max-width:100%;width:auto\9;height:auto;vertical-align:middle;border:0;-ms-interpolation-mode:bicubic;}
+#map_canvas img,.google-maps img{max-width:none;}
+button,input,select,textarea{margin:0;font-size:100%;vertical-align:middle;}
+button,input{*overflow:visible;line-height:normal;}
+button::-moz-focus-inner,input::-moz-focus-inner{padding:0;border:0;}
+button,html input[type="button"],input[type="reset"],input[type="submit"]{-webkit-appearance:button;cursor:pointer;}
+label,select,button,input[type="button"],input[type="reset"],input[type="submit"],input[type="radio"],input[type="checkbox"]{cursor:pointer;}
+input[type="search"]{-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;-webkit-appearance:textfield;}
+input[type="search"]::-webkit-search-decoration,input[type="search"]::-webkit-search-cancel-button{-webkit-appearance:none;}
+textarea{overflow:auto;vertical-align:top;}
+ at media print{*{text-shadow:none !important;color:#000 !important;background:transparent !important;box-shadow:none !important;} a,a:visited{text-decoration:underline;} a[href]:after{content:" (" attr(href) ")";} abbr[title]:after{content:" (" attr(title) ")";} .ir a:after,a[href^="javascript:"]:after,a[href^="#"]:after{content:"";} pre,blockquote{border:1px solid #999;page-break-inside:avoid;} thead{display:table-header-group;} tr,img{page-break-inside:avoid;} img{max-width:100% !important;} @page {margin:0.5cm;}p,h2,h3{orphans:3;widows:3;} h2,h3{page-break-after:avoid;}}.clearfix{*zoom:1;}.clearfix:before,.clearfix:after{display:table;content:"";line-height:0;}
+.clearfix:after{clear:both;}
+.hide-text{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0;}
+.input-block-level{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
+body{margin:0;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:14px;line-height:20px;color:#555555;background-color:#ffffff;}
+a{color:#2fa4e7;text-decoration:none;}
+a:hover{color:#157ab5;text-decoration:underline;}
+.img-rounded{-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}
+.img-polaroid{padding:4px;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0, 0, 0, 0.2);-webkit-box-shadow:0 1px 3px rgba(0, 0, 0, 0.1);-moz-box-shadow:0 1px 3px rgba(0, 0, 0, 0.1);box-shadow:0 1px 3px rgba(0, 0, 0, 0.1);}
+.img-circle{-webkit-border-radius:500px;-moz-border-radius:500px;border-radius:500px;}
+.row{margin-left:-20px;*zoom:1;}.row:before,.row:after{display:table;content:"";line-height:0;}
+.row:after{clear:both;}
+[class*="span"]{float:left;min-height:1px;margin-left:20px;}
+.container,.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:940px;}
+.span12{width:940px;}
+.span11{width:860px;}
+.span10{width:780px;}
+.span9{width:700px;}
+.span8{width:620px;}
+.span7{width:540px;}
+.span6{width:460px;}
+.span5{width:380px;}
+.span4{width:300px;}
+.span3{width:220px;}
+.span2{width:140px;}
+.span1{width:60px;}
+.offset12{margin-left:980px;}
+.offset11{margin-left:900px;}
+.offset10{margin-left:820px;}
+.offset9{margin-left:740px;}
+.offset8{margin-left:660px;}
+.offset7{margin-left:580px;}
+.offset6{margin-left:500px;}
+.offset5{margin-left:420px;}
+.offset4{margin-left:340px;}
+.offset3{margin-left:260px;}
+.offset2{margin-left:180px;}
+.offset1{margin-left:100px;}
+.row-fluid{width:100%;*zoom:1;}.row-fluid:before,.row-fluid:after{display:table;content:"";line-height:0;}
+.row-fluid:after{clear:both;}
+.row-fluid [class*="span"]{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;float:left;margin-left:2.127659574468085%;*margin-left:2.074468085106383%;}
+.row-fluid [class*="span"]:first-child{margin-left:0;}
+.row-fluid .controls-row [class*="span"]+[class*="span"]{margin-left:2.127659574468085%;}
+.row-fluid .span12{width:100%;*width:99.94680851063829%;}
+.row-fluid .span11{width:91.48936170212765%;*width:91.43617021276594%;}
+.row-fluid .span10{width:82.97872340425532%;*width:82.92553191489361%;}
+.row-fluid .span9{width:74.46808510638297%;*width:74.41489361702126%;}
+.row-fluid .span8{width:65.95744680851064%;*width:65.90425531914893%;}
+.row-fluid .span7{width:57.44680851063829%;*width:57.39361702127659%;}
+.row-fluid .span6{width:48.93617021276595%;*width:48.88297872340425%;}
+.row-fluid .span5{width:40.42553191489362%;*width:40.37234042553192%;}
+.row-fluid .span4{width:31.914893617021278%;*width:31.861702127659576%;}
+.row-fluid .span3{width:23.404255319148934%;*width:23.351063829787233%;}
+.row-fluid .span2{width:14.893617021276595%;*width:14.840425531914894%;}
+.row-fluid .span1{width:6.382978723404255%;*width:6.329787234042553%;}
+.row-fluid .offset12{margin-left:104.25531914893617%;*margin-left:104.14893617021275%;}
+.row-fluid .offset12:first-child{margin-left:102.12765957446808%;*margin-left:102.02127659574467%;}
+.row-fluid .offset11{margin-left:95.74468085106382%;*margin-left:95.6382978723404%;}
+.row-fluid .offset11:first-child{margin-left:93.61702127659574%;*margin-left:93.51063829787232%;}
+.row-fluid .offset10{margin-left:87.23404255319149%;*margin-left:87.12765957446807%;}
+.row-fluid .offset10:first-child{margin-left:85.1063829787234%;*margin-left:84.99999999999999%;}
+.row-fluid .offset9{margin-left:78.72340425531914%;*margin-left:78.61702127659572%;}
+.row-fluid .offset9:first-child{margin-left:76.59574468085106%;*margin-left:76.48936170212764%;}
+.row-fluid .offset8{margin-left:70.2127659574468%;*margin-left:70.10638297872339%;}
+.row-fluid .offset8:first-child{margin-left:68.08510638297872%;*margin-left:67.9787234042553%;}
+.row-fluid .offset7{margin-left:61.70212765957446%;*margin-left:61.59574468085106%;}
+.row-fluid .offset7:first-child{margin-left:59.574468085106375%;*margin-left:59.46808510638297%;}
+.row-fluid .offset6{margin-left:53.191489361702125%;*margin-left:53.085106382978715%;}
+.row-fluid .offset6:first-child{margin-left:51.063829787234035%;*margin-left:50.95744680851063%;}
+.row-fluid .offset5{margin-left:44.68085106382979%;*margin-left:44.57446808510638%;}
+.row-fluid .offset5:first-child{margin-left:42.5531914893617%;*margin-left:42.4468085106383%;}
+.row-fluid .offset4{margin-left:36.170212765957444%;*margin-left:36.06382978723405%;}
+.row-fluid .offset4:first-child{margin-left:34.04255319148936%;*margin-left:33.93617021276596%;}
+.row-fluid .offset3{margin-left:27.659574468085104%;*margin-left:27.5531914893617%;}
+.row-fluid .offset3:first-child{margin-left:25.53191489361702%;*margin-left:25.425531914893618%;}
+.row-fluid .offset2{margin-left:19.148936170212764%;*margin-left:19.04255319148936%;}
+.row-fluid .offset2:first-child{margin-left:17.02127659574468%;*margin-left:16.914893617021278%;}
+.row-fluid .offset1{margin-left:10.638297872340425%;*margin-left:10.53191489361702%;}
+.row-fluid .offset1:first-child{margin-left:8.51063829787234%;*margin-left:8.404255319148938%;}
+[class*="span"].hide,.row-fluid [class*="span"].hide{display:none;}
+[class*="span"].pull-right,.row-fluid [class*="span"].pull-right{float:right;}
+.container{margin-right:auto;margin-left:auto;*zoom:1;}.container:before,.container:after{display:table;content:"";line-height:0;}
+.container:after{clear:both;}
+.container-fluid{padding-right:20px;padding-left:20px;*zoom:1;}.container-fluid:before,.container-fluid:after{display:table;content:"";line-height:0;}
+.container-fluid:after{clear:both;}
+p{margin:0 0 10px;}
+.lead{margin-bottom:20px;font-size:21px;font-weight:200;line-height:30px;}
+small{font-size:85%;}
+strong{font-weight:bold;}
+em{font-style:italic;}
+cite{font-style:normal;}
+.muted{color:#999999;}
+a.muted:hover{color:#808080;}
+.text-warning{color:#dd5600;}
+a.text-warning:hover{color:#aa4200;}
+.text-error{color:#bd4247;}
+a.text-error:hover{color:#983538;}
+.text-info{color:#817b58;}
+a.text-info:hover{color:#625e43;}
+.text-success{color:#669533;}
+a.text-success:hover{color:#4c6f26;}
+h1,h2,h3,h4,h5,h6{margin:10px 0;font-family:'Telex',sans-serif;font-weight:bold;line-height:20px;color:#317eac;text-rendering:optimizelegibility;}h1 small,h2 small,h3 small,h4 small,h5 small,h6 small{font-weight:normal;line-height:1;color:#999999;}
+h1,h2,h3{line-height:40px;}
+h1{font-size:38.5px;}
+h2{font-size:31.5px;}
+h3{font-size:24.5px;}
+h4{font-size:17.5px;}
+h5{font-size:14px;}
+h6{font-size:11.9px;}
+h1 small{font-size:24.5px;}
+h2 small{font-size:17.5px;}
+h3 small{font-size:14px;}
+h4 small{font-size:14px;}
+.page-header{padding-bottom:9px;margin:20px 0 30px;border-bottom:1px solid #f5f5f5;}
+ul,ol{padding:0;margin:0 0 10px 25px;}
+ul ul,ul ol,ol ol,ol ul{margin-bottom:0;}
+li{line-height:20px;}
+ul.unstyled,ol.unstyled{margin-left:0;list-style:none;}
+ul.inline,ol.inline{margin-left:0;list-style:none;}ul.inline >li,ol.inline >li{display:inline-block;padding-left:5px;padding-right:5px;}
+dl{margin-bottom:20px;}
+dt,dd{line-height:20px;}
+dt{font-weight:bold;}
+dd{margin-left:10px;}
+.dl-horizontal{*zoom:1;}.dl-horizontal:before,.dl-horizontal:after{display:table;content:"";line-height:0;}
+.dl-horizontal:after{clear:both;}
+.dl-horizontal dt{float:left;width:160px;clear:left;text-align:right;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
+.dl-horizontal dd{margin-left:180px;}
+hr{margin:20px 0;border:0;border-top:1px solid #f5f5f5;border-bottom:1px solid #ffffff;}
+abbr[title],abbr[data-original-title]{cursor:help;border-bottom:1px dotted #999999;}
+abbr.initialism{font-size:90%;text-transform:uppercase;}
+blockquote{padding:0 0 0 15px;margin:0 0 20px;border-left:5px solid #f5f5f5;}blockquote p{margin-bottom:0;font-size:16px;font-weight:300;line-height:25px;}
+blockquote small{display:block;line-height:20px;color:#999999;}blockquote small:before{content:'\2014 \00A0';}
+blockquote.pull-right{float:right;padding-right:15px;padding-left:0;border-right:5px solid #f5f5f5;border-left:0;}blockquote.pull-right p,blockquote.pull-right small{text-align:right;}
+blockquote.pull-right small:before{content:'';}
+blockquote.pull-right small:after{content:'\00A0 \2014';}
+q:before,q:after,blockquote:before,blockquote:after{content:"";}
+address{display:block;margin-bottom:20px;font-style:normal;line-height:20px;}
+code,pre{padding:0 3px 2px;font-family:Menlo,Monaco,Consolas,"Courier New",monospace;font-size:12px;color:#333333;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
+code{padding:2px 4px;color:#d14;background-color:#f7f7f9;border:1px solid #e1e1e8;white-space:nowrap;}
+pre{display:block;padding:9.5px;margin:0 0 10px;font-size:13px;line-height:20px;word-break:break-all;word-wrap:break-word;white-space:pre;white-space:pre-wrap;background-color:#f5f5f5;border:1px solid #ccc;border:1px solid rgba(0, 0, 0, 0.15);-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}pre.prettyprint{margin-bottom:20px;}
+pre code{padding:0;color:inherit;white-space:pre;white-space:pre-wrap;background-color:transparent;border:0;}
+.pre-scrollable{max-height:340px;overflow-y:scroll;}
+form{margin:0 0 20px;}
+fieldset{padding:0;margin:0;border:0;}
+legend{display:block;width:100%;padding:0;margin-bottom:20px;font-size:21px;line-height:40px;color:#333333;border:0;border-bottom:1px solid #e5e5e5;}legend small{font-size:15px;color:#999999;}
+label,input,button,select,textarea{font-size:14px;font-weight:normal;line-height:20px;}
+input,button,select,textarea{font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;}
+label{display:block;margin-bottom:5px;}
+select,textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input{display:inline-block;height:20px;padding:4px 6px;margin-bottom:10px;font-size:14px;line-height:20px;color:#555555;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;vertical-align:middle;}
+input,textarea,.uneditable-input{width:206px;}
+textarea{height:auto;}
+textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input{background-color:#ffffff;border:1px solid #cccccc;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-webkit-transition:border linear .2s, box-shadow linear .2s;-moz-transition:border linear .2s, box-shadow linear .2s;-o-transition:border linear .2s, box-shadow linear .2s;transition:border linear .2s, box-shadow linear .2s;}textarea:focus,input[type="text"]:focus,input[type="password"]:focus,input[type="datetime"]:focus,input[type="datetime-local"]:focus,input[type="date"]:focus,input[type="month"]:focus,input[type="time"]:focus,input[type="week"]:focus,input[t
 ype="number"]:focus,input[type="email"]:focus,input[type="url"]:focus,input[type="search"]:focus,input[type="tel"]:focus,input[type="color"]:focus,.uneditable-input:focus{border-color:rgba(82, 168, 236, 0.8);outline:0;outline:thin dotted \9;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);}
+input[type="radio"],input[type="checkbox"]{margin:4px 0 0;*margin-top:0;margin-top:1px \9;line-height:normal;}
+input[type="file"],input[type="image"],input[type="submit"],input[type="reset"],input[type="button"],input[type="radio"],input[type="checkbox"]{width:auto;}
+select,input[type="file"]{height:30px;*margin-top:4px;line-height:30px;}
+select{width:220px;border:1px solid #cccccc;background-color:#ffffff;}
+select[multiple],select[size]{height:auto;}
+select:focus,input[type="file"]:focus,input[type="radio"]:focus,input[type="checkbox"]:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px;}
+.uneditable-input,.uneditable-textarea{color:#999999;background-color:#fcfcfc;border-color:#cccccc;-webkit-box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.025);-moz-box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.025);box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.025);cursor:not-allowed;}
+.uneditable-input{overflow:hidden;white-space:nowrap;}
+.uneditable-textarea{width:auto;height:auto;}
+input:-moz-placeholder,textarea:-moz-placeholder{color:#999999;}
+input:-ms-input-placeholder,textarea:-ms-input-placeholder{color:#999999;}
+input::-webkit-input-placeholder,textarea::-webkit-input-placeholder{color:#999999;}
+.radio,.checkbox{min-height:20px;padding-left:20px;}
+.radio input[type="radio"],.checkbox input[type="checkbox"]{float:left;margin-left:-20px;}
+.controls>.radio:first-child,.controls>.checkbox:first-child{padding-top:5px;}
+.radio.inline,.checkbox.inline{display:inline-block;padding-top:5px;margin-bottom:0;vertical-align:middle;}
+.radio.inline+.radio.inline,.checkbox.inline+.checkbox.inline{margin-left:10px;}
+.input-mini{width:60px;}
+.input-small{width:90px;}
+.input-medium{width:150px;}
+.input-large{width:210px;}
+.input-xlarge{width:270px;}
+.input-xxlarge{width:530px;}
+input[class*="span"],select[class*="span"],textarea[class*="span"],.uneditable-input[class*="span"],.row-fluid input[class*="span"],.row-fluid select[class*="span"],.row-fluid textarea[class*="span"],.row-fluid .uneditable-input[class*="span"]{float:none;margin-left:0;}
+.input-append input[class*="span"],.input-append .uneditable-input[class*="span"],.input-prepend input[class*="span"],.input-prepend .uneditable-input[class*="span"],.row-fluid input[class*="span"],.row-fluid select[class*="span"],.row-fluid textarea[class*="span"],.row-fluid .uneditable-input[class*="span"],.row-fluid .input-prepend [class*="span"],.row-fluid .input-append [class*="span"]{display:inline-block;}
+input,textarea,.uneditable-input{margin-left:0;}
+.controls-row [class*="span"]+[class*="span"]{margin-left:20px;}
+input.span12, textarea.span12, .uneditable-input.span12{width:926px;}
+input.span11, textarea.span11, .uneditable-input.span11{width:846px;}
+input.span10, textarea.span10, .uneditable-input.span10{width:766px;}
+input.span9, textarea.span9, .uneditable-input.span9{width:686px;}
+input.span8, textarea.span8, .uneditable-input.span8{width:606px;}
+input.span7, textarea.span7, .uneditable-input.span7{width:526px;}
+input.span6, textarea.span6, .uneditable-input.span6{width:446px;}
+input.span5, textarea.span5, .uneditable-input.span5{width:366px;}
+input.span4, textarea.span4, .uneditable-input.span4{width:286px;}
+input.span3, textarea.span3, .uneditable-input.span3{width:206px;}
+input.span2, textarea.span2, .uneditable-input.span2{width:126px;}
+input.span1, textarea.span1, .uneditable-input.span1{width:46px;}
+.controls-row{*zoom:1;}.controls-row:before,.controls-row:after{display:table;content:"";line-height:0;}
+.controls-row:after{clear:both;}
+.controls-row [class*="span"],.row-fluid .controls-row [class*="span"]{float:left;}
+.controls-row .checkbox[class*="span"],.controls-row .radio[class*="span"]{padding-top:5px;}
+input[disabled],select[disabled],textarea[disabled],input[readonly],select[readonly],textarea[readonly]{cursor:not-allowed;background-color:#f5f5f5;}
+input[type="radio"][disabled],input[type="checkbox"][disabled],input[type="radio"][readonly],input[type="checkbox"][readonly]{background-color:transparent;}
+.control-group.warning .control-label,.control-group.warning .help-block,.control-group.warning .help-inline{color:#dd5600;}
+.control-group.warning .checkbox,.control-group.warning .radio,.control-group.warning input,.control-group.warning select,.control-group.warning textarea{color:#dd5600;}
+.control-group.warning input,.control-group.warning select,.control-group.warning textarea{border-color:#dd5600;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);}.control-group.warning input:focus,.control-group.warning select:focus,.control-group.warning textarea:focus{border-color:#aa4200;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #ff8d44;-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #ff8d44;box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #ff8d44;}
+.control-group.warning .input-prepend .add-on,.control-group.warning .input-append .add-on{color:#dd5600;background-color:#f1ceab;border-color:#dd5600;}
+.control-group.error .control-label,.control-group.error .help-block,.control-group.error .help-inline{color:#bd4247;}
+.control-group.error .checkbox,.control-group.error .radio,.control-group.error input,.control-group.error select,.control-group.error textarea{color:#bd4247;}
+.control-group.error input,.control-group.error select,.control-group.error textarea{border-color:#bd4247;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);}.control-group.error input:focus,.control-group.error select:focus,.control-group.error textarea:focus{border-color:#983538;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #d88e90;-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #d88e90;box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #d88e90;}
+.control-group.error .input-prepend .add-on,.control-group.error .input-append .add-on{color:#bd4247;background-color:#f2bdb1;border-color:#bd4247;}
+.control-group.success .control-label,.control-group.success .help-block,.control-group.success .help-inline{color:#669533;}
+.control-group.success .checkbox,.control-group.success .radio,.control-group.success input,.control-group.success select,.control-group.success textarea{color:#669533;}
+.control-group.success input,.control-group.success select,.control-group.success textarea{border-color:#669533;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);}.control-group.success input:focus,.control-group.success select:focus,.control-group.success textarea:focus{border-color:#4c6f26;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #99ca63;-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #99ca63;box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #99ca63;}
+.control-group.success .input-prepend .add-on,.control-group.success .input-append .add-on{color:#669533;background-color:#d5ecbf;border-color:#669533;}
+.control-group.info .control-label,.control-group.info .help-block,.control-group.info .help-inline{color:#817b58;}
+.control-group.info .checkbox,.control-group.info .radio,.control-group.info input,.control-group.info select,.control-group.info textarea{color:#817b58;}
+.control-group.info input,.control-group.info select,.control-group.info textarea{border-color:#817b58;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);}.control-group.info input:focus,.control-group.info select:focus,.control-group.info textarea:focus{border-color:#625e43;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #b1ad8d;-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #b1ad8d;box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #b1ad8d;}
+.control-group.info .input-prepend .add-on,.control-group.info .input-append .add-on{color:#817b58;background-color:#a7dff1;border-color:#817b58;}
+input:focus:invalid,textarea:focus:invalid,select:focus:invalid{color:#b94a48;border-color:#ee5f5b;}input:focus:invalid:focus,textarea:focus:invalid:focus,select:focus:invalid:focus{border-color:#e9322d;-webkit-box-shadow:0 0 6px #f8b9b7;-moz-box-shadow:0 0 6px #f8b9b7;box-shadow:0 0 6px #f8b9b7;}
+.form-actions{padding:19px 20px 20px;margin-top:20px;margin-bottom:20px;background-color:#f5f5f5;border-top:1px solid #e5e5e5;*zoom:1;}.form-actions:before,.form-actions:after{display:table;content:"";line-height:0;}
+.form-actions:after{clear:both;}
+.help-block,.help-inline{color:#7b7b7b;}
+.help-block{display:block;margin-bottom:10px;}
+.help-inline{display:inline-block;*display:inline;*zoom:1;vertical-align:middle;padding-left:5px;}
+.input-append,.input-prepend{margin-bottom:5px;font-size:0;white-space:nowrap;}.input-append input,.input-prepend input,.input-append select,.input-prepend select,.input-append .uneditable-input,.input-prepend .uneditable-input,.input-append .dropdown-menu,.input-prepend .dropdown-menu{font-size:14px;}
+.input-append input,.input-prepend input,.input-append select,.input-prepend select,.input-append .uneditable-input,.input-prepend .uneditable-input{position:relative;margin-bottom:0;*margin-left:0;vertical-align:top;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}.input-append input:focus,.input-prepend input:focus,.input-append select:focus,.input-prepend select:focus,.input-append .uneditable-input:focus,.input-prepend .uneditable-input:focus{z-index:2;}
+.input-append .add-on,.input-prepend .add-on{display:inline-block;width:auto;height:20px;min-width:16px;padding:4px 5px;font-size:14px;font-weight:normal;line-height:20px;text-align:center;text-shadow:0 1px 0 #ffffff;background-color:#f5f5f5;border:1px solid #ccc;}
+.input-append .add-on,.input-prepend .add-on,.input-append .btn,.input-prepend .btn,.input-append .btn-group>.dropdown-toggle,.input-prepend .btn-group>.dropdown-toggle{vertical-align:top;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.input-append .active,.input-prepend .active{background-color:#bede9c;border-color:#73a839;}
+.input-prepend .add-on,.input-prepend .btn{margin-right:-1px;}
+.input-prepend .add-on:first-child,.input-prepend .btn:first-child{-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px;}
+.input-append input,.input-append select,.input-append .uneditable-input{-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px;}.input-append input+.btn-group .btn:last-child,.input-append select+.btn-group .btn:last-child,.input-append .uneditable-input+.btn-group .btn:last-child{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
+.input-append .add-on,.input-append .btn,.input-append .btn-group{margin-left:-1px;}
+.input-append .add-on:last-child,.input-append .btn:last-child,.input-append .btn-group:last-child>.dropdown-toggle{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
+.input-prepend.input-append input,.input-prepend.input-append select,.input-prepend.input-append .uneditable-input{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}.input-prepend.input-append input+.btn-group .btn,.input-prepend.input-append select+.btn-group .btn,.input-prepend.input-append .uneditable-input+.btn-group .btn{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
+.input-prepend.input-append .add-on:first-child,.input-prepend.input-append .btn:first-child{margin-right:-1px;-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px;}
+.input-prepend.input-append .add-on:last-child,.input-prepend.input-append .btn:last-child{margin-left:-1px;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
+.input-prepend.input-append .btn-group:first-child{margin-left:0;}
+input.search-query{padding-right:14px;padding-right:4px \9;padding-left:14px;padding-left:4px \9;margin-bottom:0;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px;}
+.form-search .input-append .search-query,.form-search .input-prepend .search-query{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.form-search .input-append .search-query{-webkit-border-radius:14px 0 0 14px;-moz-border-radius:14px 0 0 14px;border-radius:14px 0 0 14px;}
+.form-search .input-append .btn{-webkit-border-radius:0 14px 14px 0;-moz-border-radius:0 14px 14px 0;border-radius:0 14px 14px 0;}
+.form-search .input-prepend .search-query{-webkit-border-radius:0 14px 14px 0;-moz-border-radius:0 14px 14px 0;border-radius:0 14px 14px 0;}
+.form-search .input-prepend .btn{-webkit-border-radius:14px 0 0 14px;-moz-border-radius:14px 0 0 14px;border-radius:14px 0 0 14px;}
+.form-search input,.form-inline input,.form-horizontal input,.form-search textarea,.form-inline textarea,.form-horizontal textarea,.form-search select,.form-inline select,.form-horizontal select,.form-search .help-inline,.form-inline .help-inline,.form-horizontal .help-inline,.form-search .uneditable-input,.form-inline .uneditable-input,.form-horizontal .uneditable-input,.form-search .input-prepend,.form-inline .input-prepend,.form-horizontal .input-prepend,.form-search .input-append,.form-inline .input-append,.form-horizontal .input-append{display:inline-block;*display:inline;*zoom:1;margin-bottom:0;vertical-align:middle;}
+.form-search .hide,.form-inline .hide,.form-horizontal .hide{display:none;}
+.form-search label,.form-inline label,.form-search .btn-group,.form-inline .btn-group{display:inline-block;}
+.form-search .input-append,.form-inline .input-append,.form-search .input-prepend,.form-inline .input-prepend{margin-bottom:0;}
+.form-search .radio,.form-search .checkbox,.form-inline .radio,.form-inline .checkbox{padding-left:0;margin-bottom:0;vertical-align:middle;}
+.form-search .radio input[type="radio"],.form-search .checkbox input[type="checkbox"],.form-inline .radio input[type="radio"],.form-inline .checkbox input[type="checkbox"]{float:left;margin-right:3px;margin-left:0;}
+.control-group{margin-bottom:10px;}
+legend+.control-group{margin-top:20px;-webkit-margin-top-collapse:separate;}
+.form-horizontal .control-group{margin-bottom:20px;*zoom:1;}.form-horizontal .control-group:before,.form-horizontal .control-group:after{display:table;content:"";line-height:0;}
+.form-horizontal .control-group:after{clear:both;}
+.form-horizontal .control-label{float:left;width:160px;padding-top:5px;text-align:right;}
+.form-horizontal .controls{*display:inline-block;*padding-left:20px;margin-left:180px;*margin-left:0;}.form-horizontal .controls:first-child{*padding-left:180px;}
+.form-horizontal .help-block{margin-bottom:0;}
+.form-horizontal input+.help-block,.form-horizontal select+.help-block,.form-horizontal textarea+.help-block,.form-horizontal .uneditable-input+.help-block,.form-horizontal .input-prepend+.help-block,.form-horizontal .input-append+.help-block{margin-top:10px;}
+.form-horizontal .form-actions{padding-left:180px;}
+table{max-width:100%;background-color:transparent;border-collapse:collapse;border-spacing:0;}
+.table{width:100%;margin-bottom:20px;}.table th,.table td{padding:8px;line-height:20px;text-align:left;vertical-align:top;border-top:1px solid #dddddd;}
+.table th{font-weight:bold;}
+.table thead th{vertical-align:bottom;}
+.table caption+thead tr:first-child th,.table caption+thead tr:first-child td,.table colgroup+thead tr:first-child th,.table colgroup+thead tr:first-child td,.table thead:first-child tr:first-child th,.table thead:first-child tr:first-child td{border-top:0;}
+.table tbody+tbody{border-top:2px solid #dddddd;}
+.table .table{background-color:#ffffff;}
+.table-condensed th,.table-condensed td{padding:4px 5px;}
+.table-bordered{border:1px solid #dddddd;border-collapse:separate;*border-collapse:collapse;border-left:0;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}.table-bordered th,.table-bordered td{border-left:1px solid #dddddd;}
+.table-bordered caption+thead tr:first-child th,.table-bordered caption+tbody tr:first-child th,.table-bordered caption+tbody tr:first-child td,.table-bordered colgroup+thead tr:first-child th,.table-bordered colgroup+tbody tr:first-child th,.table-bordered colgroup+tbody tr:first-child td,.table-bordered thead:first-child tr:first-child th,.table-bordered tbody:first-child tr:first-child th,.table-bordered tbody:first-child tr:first-child td{border-top:0;}
+.table-bordered thead:first-child tr:first-child>th:first-child,.table-bordered tbody:first-child tr:first-child>td:first-child{-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;}
+.table-bordered thead:first-child tr:first-child>th:last-child,.table-bordered tbody:first-child tr:first-child>td:last-child{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;}
+.table-bordered thead:last-child tr:last-child>th:first-child,.table-bordered tbody:last-child tr:last-child>td:first-child,.table-bordered tfoot:last-child tr:last-child>td:first-child{-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px;}
+.table-bordered thead:last-child tr:last-child>th:last-child,.table-bordered tbody:last-child tr:last-child>td:last-child,.table-bordered tfoot:last-child tr:last-child>td:last-child{-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px;}
+.table-bordered tfoot+tbody:last-child tr:last-child td:first-child{-webkit-border-bottom-left-radius:0;-moz-border-radius-bottomleft:0;border-bottom-left-radius:0;}
+.table-bordered tfoot+tbody:last-child tr:last-child td:last-child{-webkit-border-bottom-right-radius:0;-moz-border-radius-bottomright:0;border-bottom-right-radius:0;}
+.table-bordered caption+thead tr:first-child th:first-child,.table-bordered caption+tbody tr:first-child td:first-child,.table-bordered colgroup+thead tr:first-child th:first-child,.table-bordered colgroup+tbody tr:first-child td:first-child{-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;}
+.table-bordered caption+thead tr:first-child th:last-child,.table-bordered caption+tbody tr:first-child td:last-child,.table-bordered colgroup+thead tr:first-child th:last-child,.table-bordered colgroup+tbody tr:first-child td:last-child{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;}
+.table-striped tbody>tr:nth-child(odd)>td,.table-striped tbody>tr:nth-child(odd)>th{background-color:#f9f9f9;}
+.table-hover tbody tr:hover td,.table-hover tbody tr:hover th{background-color:#f5f5f5;}
+table td[class*="span"],table th[class*="span"],.row-fluid table td[class*="span"],.row-fluid table th[class*="span"]{display:table-cell;float:none;margin-left:0;}
+.table td.span1,.table th.span1{float:none;width:44px;margin-left:0;}
+.table td.span2,.table th.span2{float:none;width:124px;margin-left:0;}
+.table td.span3,.table th.span3{float:none;width:204px;margin-left:0;}
+.table td.span4,.table th.span4{float:none;width:284px;margin-left:0;}
+.table td.span5,.table th.span5{float:none;width:364px;margin-left:0;}
+.table td.span6,.table th.span6{float:none;width:444px;margin-left:0;}
+.table td.span7,.table th.span7{float:none;width:524px;margin-left:0;}
+.table td.span8,.table th.span8{float:none;width:604px;margin-left:0;}
+.table td.span9,.table th.span9{float:none;width:684px;margin-left:0;}
+.table td.span10,.table th.span10{float:none;width:764px;margin-left:0;}
+.table td.span11,.table th.span11{float:none;width:844px;margin-left:0;}
+.table td.span12,.table th.span12{float:none;width:924px;margin-left:0;}
+.table tbody tr.success td{background-color:#d5ecbf;}
+.table tbody tr.error td{background-color:#f2bdb1;}
+.table tbody tr.warning td{background-color:#f1ceab;}
+.table tbody tr.info td{background-color:#a7dff1;}
+.table-hover tbody tr.success:hover td{background-color:#c8e6ab;}
+.table-hover tbody tr.error:hover td{background-color:#eeab9b;}
+.table-hover tbody tr.warning:hover td{background-color:#edc195;}
+.table-hover tbody tr.info:hover td{background-color:#91d7ee;}
+[class^="icon-"],[class*=" icon-"]{display:inline-block;width:14px;height:14px;*margin-right:.3em;line-height:14px;vertical-align:text-top;background-image:url("../image/glyphicons-halflings.png");background-position:14px 14px;background-repeat:no-repeat;margin-top:1px;}
+.icon-white,.nav-pills>.active>a>[class^="icon-"],.nav-pills>.active>a>[class*=" icon-"],.nav-list>.active>a>[class^="icon-"],.nav-list>.active>a>[class*=" icon-"],.navbar-inverse .nav>.active>a>[class^="icon-"],.navbar-inverse .nav>.active>a>[class*=" icon-"],.dropdown-menu>li>a:hover>[class^="icon-"],.dropdown-menu>li>a:hover>[class*=" icon-"],.dropdown-menu>.active>a>[class^="icon-"],.dropdown-menu>.active>a>[class*=" icon-"],.dropdown-submenu:hover>a>[class^="icon-"],.dropdown-submenu:hover>a>[class*=" icon-"]{background-image:url("../image/glyphicons-halflings-white.png");}
+.icon-glass{background-position:0 0;}
+.icon-music{background-position:-24px 0;}
+.icon-search{background-position:-48px 0;}
+.icon-envelope{background-position:-72px 0;}
+.icon-heart{background-position:-96px 0;}
+.icon-star{background-position:-120px 0;}
+.icon-star-empty{background-position:-144px 0;}
+.icon-user{background-position:-168px 0;}
+.icon-film{background-position:-192px 0;}
+.icon-th-large{background-position:-216px 0;}
+.icon-th{background-position:-240px 0;}
+.icon-th-list{background-position:-264px 0;}
+.icon-ok{background-position:-288px 0;}
+.icon-remove{background-position:-312px 0;}
+.icon-zoom-in{background-position:-336px 0;}
+.icon-zoom-out{background-position:-360px 0;}
+.icon-off{background-position:-384px 0;}
+.icon-signal{background-position:-408px 0;}
+.icon-cog{background-position:-432px 0;}
+.icon-trash{background-position:-456px 0;}
+.icon-home{background-position:0 -24px;}
+.icon-file{background-position:-24px -24px;}
+.icon-time{background-position:-48px -24px;}
+.icon-road{background-position:-72px -24px;}
+.icon-download-alt{background-position:-96px -24px;}
+.icon-download{background-position:-120px -24px;}
+.icon-upload{background-position:-144px -24px;}
+.icon-inbox{background-position:-168px -24px;}
+.icon-play-circle{background-position:-192px -24px;}
+.icon-repeat{background-position:-216px -24px;}
+.icon-refresh{background-position:-240px -24px;}
+.icon-list-alt{background-position:-264px -24px;}
+.icon-lock{background-position:-287px -24px;}
+.icon-flag{background-position:-312px -24px;}
+.icon-headphones{background-position:-336px -24px;}
+.icon-volume-off{background-position:-360px -24px;}
+.icon-volume-down{background-position:-384px -24px;}
+.icon-volume-up{background-position:-408px -24px;}
+.icon-qrcode{background-position:-432px -24px;}
+.icon-barcode{background-position:-456px -24px;}
+.icon-tag{background-position:0 -48px;}
+.icon-tags{background-position:-25px -48px;}
+.icon-book{background-position:-48px -48px;}
+.icon-bookmark{background-position:-72px -48px;}
+.icon-print{background-position:-96px -48px;}
+.icon-camera{background-position:-120px -48px;}
+.icon-font{background-position:-144px -48px;}
+.icon-bold{background-position:-167px -48px;}
+.icon-italic{background-position:-192px -48px;}
+.icon-text-height{background-position:-216px -48px;}
+.icon-text-width{background-position:-240px -48px;}
+.icon-align-left{background-position:-264px -48px;}
+.icon-align-center{background-position:-288px -48px;}
+.icon-align-right{background-position:-312px -48px;}
+.icon-align-justify{background-position:-336px -48px;}
+.icon-list{background-position:-360px -48px;}
+.icon-indent-left{background-position:-384px -48px;}
+.icon-indent-right{background-position:-408px -48px;}
+.icon-facetime-video{background-position:-432px -48px;}
+.icon-picture{background-position:-456px -48px;}
+.icon-pencil{background-position:0 -72px;}
+.icon-map-marker{background-position:-24px -72px;}
+.icon-adjust{background-position:-48px -72px;}
+.icon-tint{background-position:-72px -72px;}
+.icon-edit{background-position:-96px -72px;}
+.icon-share{background-position:-120px -72px;}
+.icon-check{background-position:-144px -72px;}
+.icon-move{background-position:-168px -72px;}
+.icon-step-backward{background-position:-192px -72px;}
+.icon-fast-backward{background-position:-216px -72px;}
+.icon-backward{background-position:-240px -72px;}
+.icon-play{background-position:-264px -72px;}
+.icon-pause{background-position:-288px -72px;}
+.icon-stop{background-position:-312px -72px;}
+.icon-forward{background-position:-336px -72px;}
+.icon-fast-forward{background-position:-360px -72px;}
+.icon-step-forward{background-position:-384px -72px;}
+.icon-eject{background-position:-408px -72px;}
+.icon-chevron-left{background-position:-432px -72px;}
+.icon-chevron-right{background-position:-456px -72px;}
+.icon-plus-sign{background-position:0 -96px;}
+.icon-minus-sign{background-position:-24px -96px;}
+.icon-remove-sign{background-position:-48px -96px;}
+.icon-ok-sign{background-position:-72px -96px;}
+.icon-question-sign{background-position:-96px -96px;}
+.icon-info-sign{background-position:-120px -96px;}
+.icon-screenshot{background-position:-144px -96px;}
+.icon-remove-circle{background-position:-168px -96px;}
+.icon-ok-circle{background-position:-192px -96px;}
+.icon-ban-circle{background-position:-216px -96px;}
+.icon-arrow-left{background-position:-240px -96px;}
+.icon-arrow-right{background-position:-264px -96px;}
+.icon-arrow-up{background-position:-289px -96px;}
+.icon-arrow-down{background-position:-312px -96px;}
+.icon-share-alt{background-position:-336px -96px;}
+.icon-resize-full{background-position:-360px -96px;}
+.icon-resize-small{background-position:-384px -96px;}
+.icon-plus{background-position:-408px -96px;}
+.icon-minus{background-position:-433px -96px;}
+.icon-asterisk{background-position:-456px -96px;}
+.icon-exclamation-sign{background-position:0 -120px;}
+.icon-gift{background-position:-24px -120px;}
+.icon-leaf{background-position:-48px -120px;}
+.icon-fire{background-position:-72px -120px;}
+.icon-eye-open{background-position:-96px -120px;}
+.icon-eye-close{background-position:-120px -120px;}
+.icon-warning-sign{background-position:-144px -120px;}
+.icon-plane{background-position:-168px -120px;}
+.icon-calendar{background-position:-192px -120px;}
+.icon-random{background-position:-216px -120px;width:16px;}
+.icon-comment{background-position:-240px -120px;}
+.icon-magnet{background-position:-264px -120px;}
+.icon-chevron-up{background-position:-288px -120px;}
+.icon-chevron-down{background-position:-313px -119px;}
+.icon-retweet{background-position:-336px -120px;}
+.icon-shopping-cart{background-position:-360px -120px;}
+.icon-folder-close{background-position:-384px -120px;}
+.icon-folder-open{background-position:-408px -120px;width:16px;}
+.icon-resize-vertical{background-position:-432px -119px;}
+.icon-resize-horizontal{background-position:-456px -118px;}
+.icon-hdd{background-position:0 -144px;}
+.icon-bullhorn{background-position:-24px -144px;}
+.icon-bell{background-position:-48px -144px;}
+.icon-certificate{background-position:-72px -144px;}
+.icon-thumbs-up{background-position:-96px -144px;}
+.icon-thumbs-down{background-position:-120px -144px;}
+.icon-hand-right{background-position:-144px -144px;}
+.icon-hand-left{background-position:-168px -144px;}
+.icon-hand-up{background-position:-192px -144px;}
+.icon-hand-down{background-position:-216px -144px;}
+.icon-circle-arrow-right{background-position:-240px -144px;}
+.icon-circle-arrow-left{background-position:-264px -144px;}
+.icon-circle-arrow-up{background-position:-288px -144px;}
+.icon-circle-arrow-down{background-position:-312px -144px;}
+.icon-globe{background-position:-336px -144px;}
+.icon-wrench{background-position:-360px -144px;}
+.icon-tasks{background-position:-384px -144px;}
+.icon-filter{background-position:-408px -144px;}
+.icon-briefcase{background-position:-432px -144px;}
+.icon-fullscreen{background-position:-456px -144px;}
+.dropup,.dropdown{position:relative;}
+.dropdown-toggle{*margin-bottom:-3px;}
+.dropdown-toggle:active,.open .dropdown-toggle{outline:0;}
+.caret{display:inline-block;width:0;height:0;vertical-align:top;border-top:4px solid #000000;border-right:4px solid transparent;border-left:4px solid transparent;content:"";}
+.dropdown .caret{margin-top:8px;margin-left:2px;}
+.dropdown-menu{position:absolute;top:100%;left:0;z-index:1000;display:none;float:left;min-width:160px;padding:5px 0;margin:2px 0 0;list-style:none;background-color:#ffffff;border:1px solid #ccc;border:1px solid rgba(0, 0, 0, 0.2);*border-right-width:2px;*border-bottom-width:2px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);-moz-box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box;}.dropdown-menu.pull-right{right:0;left:auto;}
+.dropdown-menu .divider{*width:100%;height:1px;margin:9px 1px;*margin:-5px 0 5px;overflow:hidden;background-color:#e5e5e5;border-bottom:1px solid #ffffff;}
+.dropdown-menu li>a{display:block;padding:3px 20px;clear:both;font-weight:normal;line-height:20px;color:#333333;white-space:nowrap;}
+.dropdown-menu li>a:hover,.dropdown-menu li>a:focus,.dropdown-submenu:hover>a{text-decoration:none;color:#ffffff;background-color:#27a0e5;background-image:-moz-linear-gradient(top, #2fa4e7, #1a99e2);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#2fa4e7), to(#1a99e2));background-image:-webkit-linear-gradient(top, #2fa4e7, #1a99e2);background-image:-o-linear-gradient(top, #2fa4e7, #1a99e2);background-image:linear-gradient(to bottom, #2fa4e7, #1a99e2);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff2fa4e7', endColorstr='#ff1a99e2', GradientType=0);}
+.dropdown-menu .active>a,.dropdown-menu .active>a:hover{color:#ffffff;text-decoration:none;outline:0;background-color:#27a0e5;background-image:-moz-linear-gradient(top, #2fa4e7, #1a99e2);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#2fa4e7), to(#1a99e2));background-image:-webkit-linear-gradient(top, #2fa4e7, #1a99e2);background-image:-o-linear-gradient(top, #2fa4e7, #1a99e2);background-image:linear-gradient(to bottom, #2fa4e7, #1a99e2);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff2fa4e7', endColorstr='#ff1a99e2', GradientType=0);}
+.dropdown-menu .disabled>a,.dropdown-menu .disabled>a:hover{color:#999999;}
+.dropdown-menu .disabled>a:hover{text-decoration:none;background-color:transparent;background-image:none;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);cursor:default;}
+.open{*z-index:1000;}.open >.dropdown-menu{display:block;}
+.pull-right>.dropdown-menu{right:0;left:auto;}
+.dropup .caret,.navbar-fixed-bottom .dropdown .caret{border-top:0;border-bottom:4px solid #000000;content:"";}
+.dropup .dropdown-menu,.navbar-fixed-bottom .dropdown .dropdown-menu{top:auto;bottom:100%;margin-bottom:1px;}
+.dropdown-submenu{position:relative;}
+.dropdown-submenu>.dropdown-menu{top:0;left:100%;margin-top:-6px;margin-left:-1px;-webkit-border-radius:0 6px 6px 6px;-moz-border-radius:0 6px 6px 6px;border-radius:0 6px 6px 6px;}
+.dropdown-submenu:hover>.dropdown-menu{display:block;}
+.dropup .dropdown-submenu>.dropdown-menu{top:auto;bottom:0;margin-top:0;margin-bottom:-2px;-webkit-border-radius:5px 5px 5px 0;-moz-border-radius:5px 5px 5px 0;border-radius:5px 5px 5px 0;}
+.dropdown-submenu>a:after{display:block;content:" ";float:right;width:0;height:0;border-color:transparent;border-style:solid;border-width:5px 0 5px 5px;border-left-color:#cccccc;margin-top:5px;margin-right:-10px;}
+.dropdown-submenu:hover>a:after{border-left-color:#ffffff;}
+.dropdown-submenu.pull-left{float:none;}.dropdown-submenu.pull-left>.dropdown-menu{left:-100%;margin-left:10px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px;}
+.dropdown .dropdown-menu .nav-header{padding-left:20px;padding-right:20px;}
+.typeahead{z-index:1051;margin-top:2px;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
+.well{min-height:20px;padding:19px;margin-bottom:20px;background-color:#f5f5f5;border:1px solid #e3e3e3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);}.well blockquote{border-color:#ddd;border-color:rgba(0, 0, 0, 0.15);}
+.well-large{padding:24px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}
+.well-small{padding:9px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
+.fade{opacity:0;-webkit-transition:opacity 0.15s linear;-moz-transition:opacity 0.15s linear;-o-transition:opacity 0.15s linear;transition:opacity 0.15s linear;}.fade.in{opacity:1;}
+.collapse{position:relative;height:0;overflow:hidden;-webkit-transition:height 0.35s ease;-moz-transition:height 0.35s ease;-o-transition:height 0.35s ease;transition:height 0.35s ease;}.collapse.in{height:auto;}
+.close{float:right;font-size:20px;font-weight:bold;line-height:20px;color:#000000;text-shadow:0 1px 0 #ffffff;opacity:0.2;filter:alpha(opacity=20);}.close:hover{color:#000000;text-decoration:none;cursor:pointer;opacity:0.4;filter:alpha(opacity=40);}
+button.close{padding:0;cursor:pointer;background:transparent;border:0;-webkit-appearance:none;}
+.btn{display:inline-block;*display:inline;*zoom:1;padding:4px 12px;margin-bottom:0;font-size:14px;line-height:20px;text-align:center;vertical-align:middle;cursor:pointer;color:#333333;text-shadow:0 1px 1px rgba(255, 255, 255, 0.75);background-color:#f5f5f5;background-image:-moz-linear-gradient(top, #ffffff, #e6e6e6);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));background-image:-webkit-linear-gradient(top, #ffffff, #e6e6e6);background-image:-o-linear-gradient(top, #ffffff, #e6e6e6);background-image:linear-gradient(to bottom, #ffffff, #e6e6e6);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);border-color:#e6e6e6 #e6e6e6 #bfbfbf;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#e6e6e6;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);border:1px solid #cccccc;*border:0;border-bottom-color:#b
 3b3b3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;*margin-left:.3em;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);}.btn:hover,.btn:active,.btn.active,.btn.disabled,.btn[disabled]{color:#333333;background-color:#e6e6e6;*background-color:#d9d9d9;}
+.btn:active,.btn.active{background-color:#cccccc \9;}
+.btn:first-child{*margin-left:0;}
+.btn:hover{color:#333333;text-decoration:none;background-position:0 -15px;-webkit-transition:background-position 0.1s linear;-moz-transition:background-position 0.1s linear;-o-transition:background-position 0.1s linear;transition:background-position 0.1s linear;}
+.btn:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px;}
+.btn.active,.btn:active{background-image:none;outline:0;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);}
+.btn.disabled,.btn[disabled]{cursor:default;background-image:none;opacity:0.65;filter:alpha(opacity=65);-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;}
+.btn-large{padding:11px 19px;font-size:17.5px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}
+.btn-large [class^="icon-"],.btn-large [class*=" icon-"]{margin-top:4px;}
+.btn-small{padding:2px 10px;font-size:11.9px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
+.btn-small [class^="icon-"],.btn-small [class*=" icon-"]{margin-top:0;}
+.btn-mini [class^="icon-"],.btn-mini [class*=" icon-"]{margin-top:-1px;}
+.btn-mini{padding:0px 6px;font-size:10.5px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
+.btn-block{display:block;width:100%;padding-left:0;padding-right:0;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
+.btn-block+.btn-block{margin-top:5px;}
+input[type="submit"].btn-block,input[type="reset"].btn-block,input[type="button"].btn-block{width:100%;}
+.btn-primary.active,.btn-warning.active,.btn-danger.active,.btn-success.active,.btn-info.active,.btn-inverse.active{color:rgba(255, 255, 255, 0.75);}
+.btn{border-color:#c5c5c5;border-color:rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.25);}
+.btn-primary{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#2f92e7;background-image:-moz-linear-gradient(top, #2fa4e7, #2f76e7);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#2fa4e7), to(#2f76e7));background-image:-webkit-linear-gradient(top, #2fa4e7, #2f76e7);background-image:-o-linear-gradient(top, #2fa4e7, #2f76e7);background-image:linear-gradient(to bottom, #2fa4e7, #2f76e7);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff2fa4e7', endColorstr='#ff2f76e7', GradientType=0);border-color:#2f76e7 #2f76e7 #1553b5;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#2f76e7;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-primary:hover,.btn-primary:active,.btn-primary.active,.btn-primary.disabled,.btn-primary[disabled]{color:#ffffff;background-color:#2f76e7;*background-color:#1a67e2;}
+.btn-primary:active,.btn-primary.active{background-color:#175dcc \9;}
+.btn-warning{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#dd5600;background-image:-moz-linear-gradient(top, #dd5600, #dd5600);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#dd5600), to(#dd5600));background-image:-webkit-linear-gradient(top, #dd5600, #dd5600);background-image:-o-linear-gradient(top, #dd5600, #dd5600);background-image:linear-gradient(to bottom, #dd5600, #dd5600);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffdd5600', endColorstr='#ffdd5600', GradientType=0);border-color:#dd5600 #dd5600 #913800;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#dd5600;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-warning:hover,.btn-warning:active,.btn-warning.active,.btn-warning.disabled,.btn-warning[disabled]{color:#ffffff;background-color:#dd5600;*background-color:#c44c00;}
+.btn-warning:active,.btn-warning.active{background-color:#aa4200 \9;}
+.btn-danger{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#c32627;background-image:-moz-linear-gradient(top, #c71c22, #bd362f);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#c71c22), to(#bd362f));background-image:-webkit-linear-gradient(top, #c71c22, #bd362f);background-image:-o-linear-gradient(top, #c71c22, #bd362f);background-image:linear-gradient(to bottom, #c71c22, #bd362f);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffc71c22', endColorstr='#ffbd362f', GradientType=0);border-color:#bd362f #bd362f #802420;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#bd362f;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-danger:hover,.btn-danger:active,.btn-danger.active,.btn-danger.disabled,.btn-danger[disabled]{color:#ffffff;background-color:#bd362f;*background-color:#a9302a;}
+.btn-danger:active,.btn-danger.active{background-color:#942a25 \9;}
+.btn-success{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#65a643;background-image:-moz-linear-gradient(top, #73a839, #51a351);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#73a839), to(#51a351));background-image:-webkit-linear-gradient(top, #73a839, #51a351);background-image:-o-linear-gradient(top, #73a839, #51a351);background-image:linear-gradient(to bottom, #73a839, #51a351);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff73a839', endColorstr='#ff51a351', GradientType=0);border-color:#51a351 #51a351 #387038;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#51a351;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-success:hover,.btn-success:active,.btn-success.active,.btn-success.disabled,.btn-success[disabled]{color:#ffffff;background-color:#51a351;*background-color:#499249;}
+.btn-success:active,.btn-success.active{background-color:#408140 \9;}
+.btn-info{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#6d76b3;background-image:-moz-linear-gradient(top, #9760b3, #2f96b4);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#9760b3), to(#2f96b4));background-image:-webkit-linear-gradient(top, #9760b3, #2f96b4);background-image:-o-linear-gradient(top, #9760b3, #2f96b4);background-image:linear-gradient(to bottom, #9760b3, #2f96b4);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff9760b3', endColorstr='#ff2f96b4', GradientType=0);border-color:#2f96b4 #2f96b4 #1f6377;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#2f96b4;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-info:hover,.btn-info:active,.btn-info.active,.btn-info.disabled,.btn-info[disabled]{color:#ffffff;background-color:#2f96b4;*background-color:#2a85a0;}
+.btn-info:active,.btn-info.active{background-color:#24748c \9;}
+.btn-inverse{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#0f3253;background-image:-moz-linear-gradient(top, #033c73, #222222);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#033c73), to(#222222));background-image:-webkit-linear-gradient(top, #033c73, #222222);background-image:-o-linear-gradient(top, #033c73, #222222);background-image:linear-gradient(to bottom, #033c73, #222222);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff033c73', endColorstr='#ff222222', GradientType=0);border-color:#222222 #222222 #000000;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#222222;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-inverse:hover,.btn-inverse:active,.btn-inverse.active,.btn-inverse.disabled,.btn-inverse[disabled]{color:#ffffff;background-color:#222222;*background-color:#151515;}
+.btn-inverse:active,.btn-inverse.active{background-color:#080808 \9;}
+button.btn,input[type="submit"].btn{*padding-top:3px;*padding-bottom:3px;}button.btn::-moz-focus-inner,input[type="submit"].btn::-moz-focus-inner{padding:0;border:0;}
+button.btn.btn-large,input[type="submit"].btn.btn-large{*padding-top:7px;*padding-bottom:7px;}
+button.btn.btn-small,input[type="submit"].btn.btn-small{*padding-top:3px;*padding-bottom:3px;}
+button.btn.btn-mini,input[type="submit"].btn.btn-mini{*padding-top:1px;*padding-bottom:1px;}
+.btn-link,.btn-link:active,.btn-link[disabled]{background-color:transparent;background-image:none;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;}
+.btn-link{border-color:transparent;cursor:pointer;color:#2fa4e7;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.btn-link:hover{color:#157ab5;text-decoration:underline;background-color:transparent;}
+.btn-link[disabled]:hover{color:#333333;text-decoration:none;}
+.btn-group{position:relative;display:inline-block;*display:inline;*zoom:1;font-size:0;vertical-align:middle;white-space:nowrap;*margin-left:.3em;}.btn-group:first-child{*margin-left:0;}
+.btn-group+.btn-group{margin-left:5px;}
+.btn-toolbar{font-size:0;margin-top:10px;margin-bottom:10px;}.btn-toolbar>.btn+.btn,.btn-toolbar>.btn-group+.btn,.btn-toolbar>.btn+.btn-group{margin-left:5px;}
+.btn-group>.btn{position:relative;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.btn-group>.btn+.btn{margin-left:-1px;}
+.btn-group>.btn,.btn-group>.dropdown-menu,.btn-group>.popover{font-size:14px;}
+.btn-group>.btn-mini{font-size:10.5px;}
+.btn-group>.btn-small{font-size:11.9px;}
+.btn-group>.btn-large{font-size:17.5px;}
+.btn-group>.btn:first-child{margin-left:0;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px;}
+.btn-group>.btn:last-child,.btn-group>.dropdown-toggle{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px;}
+.btn-group>.btn.large:first-child{margin-left:0;-webkit-border-top-left-radius:6px;-moz-border-radius-topleft:6px;border-top-left-radius:6px;-webkit-border-bottom-left-radius:6px;-moz-border-radius-bottomleft:6px;border-bottom-left-radius:6px;}
+.btn-group>.btn.large:last-child,.btn-group>.large.dropdown-toggle{-webkit-border-top-right-radius:6px;-moz-border-radius-topright:6px;border-top-right-radius:6px;-webkit-border-bottom-right-radius:6px;-moz-border-radius-bottomright:6px;border-bottom-right-radius:6px;}
+.btn-group>.btn:hover,.btn-group>.btn:focus,.btn-group>.btn:active,.btn-group>.btn.active{z-index:2;}
+.btn-group .dropdown-toggle:active,.btn-group.open .dropdown-toggle{outline:0;}
+.btn-group>.btn+.dropdown-toggle{padding-left:8px;padding-right:8px;-webkit-box-shadow:inset 1px 0 0 rgba(255,255,255,.125), inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 1px 0 0 rgba(255,255,255,.125), inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);box-shadow:inset 1px 0 0 rgba(255,255,255,.125), inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);*padding-top:5px;*padding-bottom:5px;}
+.btn-group>.btn-mini+.dropdown-toggle{padding-left:5px;padding-right:5px;*padding-top:2px;*padding-bottom:2px;}
+.btn-group>.btn-small+.dropdown-toggle{*padding-top:5px;*padding-bottom:4px;}
+.btn-group>.btn-large+.dropdown-toggle{padding-left:12px;padding-right:12px;*padding-top:7px;*padding-bottom:7px;}
+.btn-group.open .dropdown-toggle{background-image:none;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);}
+.btn-group.open .btn.dropdown-toggle{background-color:#e6e6e6;}
+.btn-group.open .btn-primary.dropdown-toggle{background-color:#2f76e7;}
+.btn-group.open .btn-warning.dropdown-toggle{background-color:#dd5600;}
+.btn-group.open .btn-danger.dropdown-toggle{background-color:#bd362f;}
+.btn-group.open .btn-success.dropdown-toggle{background-color:#51a351;}
+.btn-group.open .btn-info.dropdown-toggle{background-color:#2f96b4;}
+.btn-group.open .btn-inverse.dropdown-toggle{background-color:#222222;}
+.btn .caret{margin-top:8px;margin-left:0;}
+.btn-mini .caret,.btn-small .caret,.btn-large .caret{margin-top:6px;}
+.btn-large .caret{border-left-width:5px;border-right-width:5px;border-top-width:5px;}
+.dropup .btn-large .caret{border-bottom-width:5px;}
+.btn-primary .caret,.btn-warning .caret,.btn-danger .caret,.btn-info .caret,.btn-success .caret,.btn-inverse .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
+.btn-group-vertical{display:inline-block;*display:inline;*zoom:1;}
+.btn-group-vertical>.btn{display:block;float:none;max-width:100%;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.btn-group-vertical>.btn+.btn{margin-left:0;margin-top:-1px;}
+.btn-group-vertical>.btn:first-child{-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0;}
+.btn-group-vertical>.btn:last-child{-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px;}
+.btn-group-vertical>.btn-large:first-child{-webkit-border-radius:6px 6px 0 0;-moz-border-radius:6px 6px 0 0;border-radius:6px 6px 0 0;}
+.btn-group-vertical>.btn-large:last-child{-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px;}
+.alert{padding:8px 35px 8px 14px;margin-bottom:20px;text-shadow:0 1px 0 rgba(255, 255, 255, 0.5);background-color:#f1ceab;border:1px solid #efb99e;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
+.alert,.alert h4{color:#dd5600;}
+.alert h4{margin:0;}
+.alert .close{position:relative;top:-2px;right:-21px;line-height:20px;}
+.alert-success{background-color:#d5ecbf;border-color:#d2e6ab;color:#669533;}
+.alert-success h4{color:#669533;}
+.alert-danger,.alert-error{background-color:#f2bdb1;border-color:#f0a5a4;color:#bd4247;}
+.alert-danger h4,.alert-error h4{color:#bd4247;}
+.alert-info{background-color:#a7dff1;border-color:#88e4ec;color:#817b58;}
+.alert-info h4{color:#817b58;}
+.alert-block{padding-top:14px;padding-bottom:14px;}
+.alert-block>p,.alert-block>ul{margin-bottom:0;}
+.alert-block p+p{margin-top:5px;}
+.nav{margin-left:0;margin-bottom:20px;list-style:none;}
+.nav>li>a{display:block;}
+.nav>li>a:hover{text-decoration:none;background-color:#f5f5f5;}
+.nav>li>a>img{max-width:none;}
+.nav>.pull-right{float:right;}
+.nav-header{display:block;padding:3px 15px;font-size:11px;font-weight:bold;line-height:20px;color:#999999;text-shadow:0 1px 0 rgba(255, 255, 255, 0.5);text-transform:uppercase;}
+.nav li+.nav-header{margin-top:9px;}
+.nav-list{padding-left:15px;padding-right:15px;margin-bottom:0;}
+.nav-list>li>a,.nav-list .nav-header{margin-left:-15px;margin-right:-15px;text-shadow:0 1px 0 rgba(255, 255, 255, 0.5);}
+.nav-list>li>a{padding:3px 15px;}
+.nav-list>.active>a,.nav-list>.active>a:hover{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.2);background-color:#2fa4e7;}
+.nav-list [class^="icon-"],.nav-list [class*=" icon-"]{margin-right:2px;}
+.nav-list .divider{*width:100%;height:1px;margin:9px 1px;*margin:-5px 0 5px;overflow:hidden;background-color:#e5e5e5;border-bottom:1px solid #ffffff;}
+.nav-tabs,.nav-pills{*zoom:1;}.nav-tabs:before,.nav-pills:before,.nav-tabs:after,.nav-pills:after{display:table;content:"";line-height:0;}
+.nav-tabs:after,.nav-pills:after{clear:both;}
+.nav-tabs>li,.nav-pills>li{float:left;}
+.nav-tabs>li>a,.nav-pills>li>a{padding-right:12px;padding-left:12px;margin-right:2px;line-height:14px;}
+.nav-tabs{border-bottom:1px solid #ddd;}
+.nav-tabs>li{margin-bottom:-1px;}
+.nav-tabs>li>a{padding-top:8px;padding-bottom:8px;line-height:20px;border:1px solid transparent;-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0;}.nav-tabs>li>a:hover{border-color:#f5f5f5 #f5f5f5 #dddddd;}
+.nav-tabs>.active>a,.nav-tabs>.active>a:hover{color:#555555;background-color:#ffffff;border:1px solid #ddd;border-bottom-color:transparent;cursor:default;}
+.nav-pills>li>a{padding-top:8px;padding-bottom:8px;margin-top:2px;margin-bottom:2px;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;}
+.nav-pills>.active>a,.nav-pills>.active>a:hover{color:#ffffff;background-color:#2fa4e7;}
+.nav-stacked>li{float:none;}
+.nav-stacked>li>a{margin-right:0;}
+.nav-tabs.nav-stacked{border-bottom:0;}
+.nav-tabs.nav-stacked>li>a{border:1px solid #ddd;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.nav-tabs.nav-stacked>li:first-child>a{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;}
+.nav-tabs.nav-stacked>li:last-child>a{-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px;}
+.nav-tabs.nav-stacked>li>a:hover{border-color:#ddd;z-index:2;}
+.nav-pills.nav-stacked>li>a{margin-bottom:3px;}
+.nav-pills.nav-stacked>li:last-child>a{margin-bottom:1px;}
+.nav-tabs .dropdown-menu{-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px;}
+.nav-pills .dropdown-menu{-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}
+.nav .dropdown-toggle .caret{border-top-color:#2fa4e7;border-bottom-color:#2fa4e7;margin-top:6px;}
+.nav .dropdown-toggle:hover .caret{border-top-color:#157ab5;border-bottom-color:#157ab5;}
+.nav-tabs .dropdown-toggle .caret{margin-top:8px;}
+.nav .active .dropdown-toggle .caret{border-top-color:#fff;border-bottom-color:#fff;}
+.nav-tabs .active .dropdown-toggle .caret{border-top-color:#555555;border-bottom-color:#555555;}
+.nav>.dropdown.active>a:hover{cursor:pointer;}
+.nav-tabs .open .dropdown-toggle,.nav-pills .open .dropdown-toggle,.nav>li.dropdown.open.active>a:hover{color:#ffffff;background-color:#999999;border-color:#999999;}
+.nav li.dropdown.open .caret,.nav li.dropdown.open.active .caret,.nav li.dropdown.open a:hover .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;opacity:1;filter:alpha(opacity=100);}
+.tabs-stacked .open>a:hover{border-color:#999999;}
+.tabbable{*zoom:1;}.tabbable:before,.tabbable:after{display:table;content:"";line-height:0;}
+.tabbable:after{clear:both;}
+.tab-content{overflow:auto;}
+.tabs-below>.nav-tabs,.tabs-right>.nav-tabs,.tabs-left>.nav-tabs{border-bottom:0;}
+.tab-content>.tab-pane,.pill-content>.pill-pane{display:none;}
+.tab-content>.active,.pill-content>.active{display:block;}
+.tabs-below>.nav-tabs{border-top:1px solid #ddd;}
+.tabs-below>.nav-tabs>li{margin-top:-1px;margin-bottom:0;}
+.tabs-below>.nav-tabs>li>a{-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px;}.tabs-below>.nav-tabs>li>a:hover{border-bottom-color:transparent;border-top-color:#ddd;}
+.tabs-below>.nav-tabs>.active>a,.tabs-below>.nav-tabs>.active>a:hover{border-color:transparent #ddd #ddd #ddd;}
+.tabs-left>.nav-tabs>li,.tabs-right>.nav-tabs>li{float:none;}
+.tabs-left>.nav-tabs>li>a,.tabs-right>.nav-tabs>li>a{min-width:74px;margin-right:0;margin-bottom:3px;}
+.tabs-left>.nav-tabs{float:left;margin-right:19px;border-right:1px solid #ddd;}
+.tabs-left>.nav-tabs>li>a{margin-right:-1px;-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px;}
+.tabs-left>.nav-tabs>li>a:hover{border-color:#f5f5f5 #dddddd #f5f5f5 #f5f5f5;}
+.tabs-left>.nav-tabs .active>a,.tabs-left>.nav-tabs .active>a:hover{border-color:#ddd transparent #ddd #ddd;*border-right-color:#ffffff;}
+.tabs-right>.nav-tabs{float:right;margin-left:19px;border-left:1px solid #ddd;}
+.tabs-right>.nav-tabs>li>a{margin-left:-1px;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
+.tabs-right>.nav-tabs>li>a:hover{border-color:#f5f5f5 #f5f5f5 #f5f5f5 #dddddd;}
+.tabs-right>.nav-tabs .active>a,.tabs-right>.nav-tabs .active>a:hover{border-color:#ddd #ddd #ddd transparent;*border-left-color:#ffffff;}
+.nav>.disabled>a{color:#999999;}
+.nav>.disabled>a:hover{text-decoration:none;background-color:transparent;cursor:default;}
+.navbar{overflow:visible;margin-bottom:20px;*position:relative;*z-index:2;}
+.navbar-inner{min-height:50px;padding-left:20px;padding-right:20px;background-color:#45aeea;background-image:-moz-linear-gradient(top, #54b4eb, #2fa4e7);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#54b4eb), to(#2fa4e7));background-image:-webkit-linear-gradient(top, #54b4eb, #2fa4e7);background-image:-o-linear-gradient(top, #54b4eb, #2fa4e7);background-image:linear-gradient(to bottom, #54b4eb, #2fa4e7);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff54b4eb', endColorstr='#ff2fa4e7', GradientType=0);border:1px solid #1990d5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.065);-moz-box-shadow:0 1px 4px rgba(0, 0, 0, 0.065);box-shadow:0 1px 4px rgba(0, 0, 0, 0.065);*zoom:1;}.navbar-inner:before,.navbar-inner:after{display:table;content:"";line-height:0;}
+.navbar-inner:after{clear:both;}
+.navbar .container{width:auto;}
+.nav-collapse.collapse{height:auto;overflow:visible;}
+.navbar .brand{float:left;display:block;padding:15px 20px 15px;margin-left:-20px;font-size:20px;font-weight:200;color:#ffffff;text-shadow:0 1px 0 #54b4eb;}.navbar .brand:hover{text-decoration:none;}
+.navbar-text{margin-bottom:0;line-height:50px;color:#f5f5f5;}
+.navbar-link{color:#ffffff;}.navbar-link:hover{color:#ffffff;}
+.navbar .divider-vertical{height:50px;margin:0 9px;border-left:1px solid #2fa4e7;border-right:1px solid #54b4eb;}
+.navbar .btn,.navbar .btn-group{margin-top:10px;}
+.navbar .btn-group .btn,.navbar .input-prepend .btn,.navbar .input-append .btn{margin-top:0;}
+.navbar-form{margin-bottom:0;*zoom:1;}.navbar-form:before,.navbar-form:after{display:table;content:"";line-height:0;}
+.navbar-form:after{clear:both;}
+.navbar-form input,.navbar-form select,.navbar-form .radio,.navbar-form .checkbox{margin-top:10px;}
+.navbar-form input,.navbar-form select,.navbar-form .btn{display:inline-block;margin-bottom:0;}
+.navbar-form input[type="image"],.navbar-form input[type="checkbox"],.navbar-form input[type="radio"]{margin-top:3px;}
+.navbar-form .input-append,.navbar-form .input-prepend{margin-top:5px;white-space:nowrap;}.navbar-form .input-append input,.navbar-form .input-prepend input{margin-top:0;}
+.navbar-search{position:relative;float:left;margin-top:10px;margin-bottom:0;}.navbar-search .search-query{margin-bottom:0;padding:4px 14px;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:13px;font-weight:normal;line-height:1;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px;}
+.navbar-static-top{position:static;margin-bottom:0;}.navbar-static-top .navbar-inner{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.navbar-fixed-top,.navbar-fixed-bottom{position:fixed;right:0;left:0;z-index:1030;margin-bottom:0;}
+.navbar-fixed-top .navbar-inner,.navbar-static-top .navbar-inner{border-width:0 0 1px;}
+.navbar-fixed-bottom .navbar-inner{border-width:1px 0 0;}
+.navbar-fixed-top .navbar-inner,.navbar-fixed-bottom .navbar-inner{padding-left:0;padding-right:0;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:940px;}
+.navbar-fixed-top{top:0;}
+.navbar-fixed-top .navbar-inner,.navbar-static-top .navbar-inner{-webkit-box-shadow:0 1px 10px rgba(0,0,0,.1);-moz-box-shadow:0 1px 10px rgba(0,0,0,.1);box-shadow:0 1px 10px rgba(0,0,0,.1);}
+.navbar-fixed-bottom{bottom:0;}.navbar-fixed-bottom .navbar-inner{-webkit-box-shadow:0 -1px 10px rgba(0,0,0,.1);-moz-box-shadow:0 -1px 10px rgba(0,0,0,.1);box-shadow:0 -1px 10px rgba(0,0,0,.1);}
+.navbar .nav{position:relative;left:0;display:block;float:left;margin:0 10px 0 0;}
+.navbar .nav.pull-right{float:right;margin-right:0;}
+.navbar .nav>li{float:left;}
+.navbar .nav>li>a{float:none;padding:15px 15px 15px;color:#ffffff;text-decoration:none;text-shadow:0 1px 0 #54b4eb;}
+.navbar .nav .dropdown-toggle .caret{margin-top:8px;}
+.navbar .nav>li>a:focus,.navbar .nav>li>a:hover{background-color:#1684c2;color:#ffffff;text-decoration:none;}
+.navbar .nav>.active>a,.navbar .nav>.active>a:hover,.navbar .nav>.active>a:focus{color:#ffffff;text-decoration:none;background-color:#1684c2;-webkit-box-shadow:inset 0 3px 8px rgba(0, 0, 0, 0.125);-moz-box-shadow:inset 0 3px 8px rgba(0, 0, 0, 0.125);box-shadow:inset 0 3px 8px rgba(0, 0, 0, 0.125);}
+.navbar .btn-navbar{display:none;float:right;padding:7px 10px;margin-left:5px;margin-right:5px;color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#2fa3e6;background-image:-moz-linear-gradient(top, #3daae9, #1a99e2);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#3daae9), to(#1a99e2));background-image:-webkit-linear-gradient(top, #3daae9, #1a99e2);background-image:-o-linear-gradient(top, #3daae9, #1a99e2);background-image:linear-gradient(to bottom, #3daae9, #1a99e2);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff3daae9', endColorstr='#ff1a99e2', GradientType=0);border-color:#1a99e2 #1a99e2 #126b9e;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#1a99e2;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0 1px 0 rgba(255,255,255,.075);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0
  1px 0 rgba(255,255,255,.075);box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0 1px 0 rgba(255,255,255,.075);}.navbar .btn-navbar:hover,.navbar .btn-navbar:active,.navbar .btn-navbar.active,.navbar .btn-navbar.disabled,.navbar .btn-navbar[disabled]{color:#ffffff;background-color:#1a99e2;*background-color:#178acc;}
+.navbar .btn-navbar:active,.navbar .btn-navbar.active{background-color:#157ab5 \9;}
+.navbar .btn-navbar .icon-bar{display:block;width:18px;height:2px;background-color:#f5f5f5;-webkit-border-radius:1px;-moz-border-radius:1px;border-radius:1px;-webkit-box-shadow:0 1px 0 rgba(0, 0, 0, 0.25);-moz-box-shadow:0 1px 0 rgba(0, 0, 0, 0.25);box-shadow:0 1px 0 rgba(0, 0, 0, 0.25);}
+.btn-navbar .icon-bar+.icon-bar{margin-top:3px;}
+.navbar .nav>li>.dropdown-menu:before{content:'';display:inline-block;border-left:7px solid transparent;border-right:7px solid transparent;border-bottom:7px solid #ccc;border-bottom-color:rgba(0, 0, 0, 0.2);position:absolute;top:-7px;left:9px;}
+.navbar .nav>li>.dropdown-menu:after{content:'';display:inline-block;border-left:6px solid transparent;border-right:6px solid transparent;border-bottom:6px solid #ffffff;position:absolute;top:-6px;left:10px;}
+.navbar-fixed-bottom .nav>li>.dropdown-menu:before{border-top:7px solid #ccc;border-top-color:rgba(0, 0, 0, 0.2);border-bottom:0;bottom:-7px;top:auto;}
+.navbar-fixed-bottom .nav>li>.dropdown-menu:after{border-top:6px solid #ffffff;border-bottom:0;bottom:-6px;top:auto;}
+.navbar .nav li.dropdown>a:hover .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
+.navbar .nav li.dropdown.open>.dropdown-toggle,.navbar .nav li.dropdown.active>.dropdown-toggle,.navbar .nav li.dropdown.open.active>.dropdown-toggle{background-color:#1684c2;color:#ffffff;}
+.navbar .nav li.dropdown>.dropdown-toggle .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
+.navbar .nav li.dropdown.open>.dropdown-toggle .caret,.navbar .nav li.dropdown.active>.dropdown-toggle .caret,.navbar .nav li.dropdown.open.active>.dropdown-toggle .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
+.navbar .pull-right>li>.dropdown-menu,.navbar .nav>li>.dropdown-menu.pull-right{left:auto;right:0;}.navbar .pull-right>li>.dropdown-menu:before,.navbar .nav>li>.dropdown-menu.pull-right:before{left:auto;right:12px;}
+.navbar .pull-right>li>.dropdown-menu:after,.navbar .nav>li>.dropdown-menu.pull-right:after{left:auto;right:13px;}
+.navbar .pull-right>li>.dropdown-menu .dropdown-menu,.navbar .nav>li>.dropdown-menu.pull-right .dropdown-menu{left:auto;right:100%;margin-left:0;margin-right:-1px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px;}
+.navbar-inverse .navbar-inner{background-color:#034482;background-image:-moz-linear-gradient(top, #04498c, #033c73);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#04498c), to(#033c73));background-image:-webkit-linear-gradient(top, #04498c, #033c73);background-image:-o-linear-gradient(top, #04498c, #033c73);background-image:linear-gradient(to bottom, #04498c, #033c73);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff04498c', endColorstr='#ff033c73', GradientType=0);border-color:#033464;}
+.navbar-inverse .brand,.navbar-inverse .nav>li>a{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);}.navbar-inverse .brand:hover,.navbar-inverse .nav>li>a:hover{color:#ffffff;}
+.navbar-inverse .brand{color:#ffffff;}
+.navbar-inverse .navbar-text{color:#ffffff;}
+.navbar-inverse .nav>li>a:focus,.navbar-inverse .nav>li>a:hover{background-color:#022c55;color:#ffffff;}
+.navbar-inverse .nav .active>a,.navbar-inverse .nav .active>a:hover,.navbar-inverse .nav .active>a:focus{color:#ffffff;background-color:#022c55;}
+.navbar-inverse .navbar-link{color:#ffffff;}.navbar-inverse .navbar-link:hover{color:#ffffff;}
+.navbar-inverse .divider-vertical{border-left-color:#033c73;border-right-color:#04498c;}
+.navbar-inverse .nav li.dropdown.open>.dropdown-toggle,.navbar-inverse .nav li.dropdown.active>.dropdown-toggle,.navbar-inverse .nav li.dropdown.open.active>.dropdown-toggle{background-color:#022c55;color:#ffffff;}
+.navbar-inverse .nav li.dropdown>a:hover .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
+.navbar-inverse .nav li.dropdown>.dropdown-toggle .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
+.navbar-inverse .nav li.dropdown.open>.dropdown-toggle .caret,.navbar-inverse .nav li.dropdown.active>.dropdown-toggle .caret,.navbar-inverse .nav li.dropdown.open.active>.dropdown-toggle .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
+.navbar-inverse .navbar-search .search-query{color:#ffffff;background-color:#ffffff;border-color:#033c73;-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,.1), 0 1px 0 rgba(255,255,255,.15);-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,.1), 0 1px 0 rgba(255,255,255,.15);box-shadow:inset 0 1px 2px rgba(0,0,0,.1), 0 1px 0 rgba(255,255,255,.15);-webkit-transition:none;-moz-transition:none;-o-transition:none;transition:none;}.navbar-inverse .navbar-search .search-query:-moz-placeholder{color:#999999;}
+.navbar-inverse .navbar-search .search-query:-ms-input-placeholder{color:#999999;}
+.navbar-inverse .navbar-search .search-query::-webkit-input-placeholder{color:#999999;}
+.navbar-inverse .navbar-search .search-query:focus,.navbar-inverse .navbar-search .search-query.focused{padding:5px 15px;color:#333333;text-shadow:0 1px 0 #ffffff;background-color:#ffffff;border:0;-webkit-box-shadow:0 0 3px rgba(0, 0, 0, 0.15);-moz-box-shadow:0 0 3px rgba(0, 0, 0, 0.15);box-shadow:0 0 3px rgba(0, 0, 0, 0.15);outline:0;}
+.navbar-inverse .btn-navbar{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#033769;background-image:-moz-linear-gradient(top, #033c73, #022f5a);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#033c73), to(#022f5a));background-image:-webkit-linear-gradient(top, #033c73, #022f5a);background-image:-o-linear-gradient(top, #033c73, #022f5a);background-image:linear-gradient(to bottom, #033c73, #022f5a);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff033c73', endColorstr='#ff022f5a', GradientType=0);border-color:#022f5a #022f5a #000810;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#022f5a;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.navbar-inverse .btn-navbar:hover,.navbar-inverse .btn-navbar:active,.navbar-inverse .btn-navbar.active,.navbar-inverse .btn-navbar.disabled,.navbar-inverse .btn-navbar[disabled]{color:#ffffff;background-c
 olor:#022f5a;*background-color:#022241;}
+.navbar-inverse .btn-navbar:active,.navbar-inverse .btn-navbar.active{background-color:#011528 \9;}
+.breadcrumb{padding:8px 15px;margin:0 0 20px;list-style:none;background-color:#f5f5f5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}.breadcrumb>li{display:inline-block;*display:inline;*zoom:1;text-shadow:0 1px 0 #ffffff;}.breadcrumb>li>.divider{padding:0 5px;color:#ccc;}
+.breadcrumb>.active{color:#999999;}
+.pagination{margin:20px 0;}
+.pagination ul{display:inline-block;*display:inline;*zoom:1;margin-left:0;margin-bottom:0;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 2px rgba(0, 0, 0, 0.05);-moz-box-shadow:0 1px 2px rgba(0, 0, 0, 0.05);box-shadow:0 1px 2px rgba(0, 0, 0, 0.05);}
+.pagination ul>li{display:inline;}
+.pagination ul>li>a,.pagination ul>li>span{float:left;padding:4px 12px;line-height:20px;text-decoration:none;background-color:#ffffff;border:1px solid #dddddd;border-left-width:0;}
+.pagination ul>li>a:hover,.pagination ul>.active>a,.pagination ul>.active>span{background-color:#f5f5f5;}
+.pagination ul>.active>a,.pagination ul>.active>span{color:#999999;cursor:default;}
+.pagination ul>.disabled>span,.pagination ul>.disabled>a,.pagination ul>.disabled>a:hover{color:#999999;background-color:transparent;cursor:default;}
+.pagination ul>li:first-child>a,.pagination ul>li:first-child>span{border-left-width:1px;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px;}
+.pagination ul>li:last-child>a,.pagination ul>li:last-child>span{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px;}
+.pagination-centered{text-align:center;}
+.pagination-right{text-align:right;}
+.pagination-large ul>li>a,.pagination-large ul>li>span{padding:11px 19px;font-size:17.5px;}
+.pagination-large ul>li:first-child>a,.pagination-large ul>li:first-child>span{-webkit-border-top-left-radius:6px;-moz-border-radius-topleft:6px;border-top-left-radius:6px;-webkit-border-bottom-left-radius:6px;-moz-border-radius-bottomleft:6px;border-bottom-left-radius:6px;}
+.pagination-large ul>li:last-child>a,.pagination-large ul>li:last-child>span{-webkit-border-top-right-radius:6px;-moz-border-radius-topright:6px;border-top-right-radius:6px;-webkit-border-bottom-right-radius:6px;-moz-border-radius-bottomright:6px;border-bottom-right-radius:6px;}
+.pagination-mini ul>li:first-child>a,.pagination-small ul>li:first-child>a,.pagination-mini ul>li:first-child>span,.pagination-small ul>li:first-child>span{-webkit-border-top-left-radius:3px;-moz-border-radius-topleft:3px;border-top-left-radius:3px;-webkit-border-bottom-left-radius:3px;-moz-border-radius-bottomleft:3px;border-bottom-left-radius:3px;}
+.pagination-mini ul>li:last-child>a,.pagination-small ul>li:last-child>a,.pagination-mini ul>li:last-child>span,.pagination-small ul>li:last-child>span{-webkit-border-top-right-radius:3px;-moz-border-radius-topright:3px;border-top-right-radius:3px;-webkit-border-bottom-right-radius:3px;-moz-border-radius-bottomright:3px;border-bottom-right-radius:3px;}
+.pagination-small ul>li>a,.pagination-small ul>li>span{padding:2px 10px;font-size:11.9px;}
+.pagination-mini ul>li>a,.pagination-mini ul>li>span{padding:0px 6px;font-size:10.5px;}
+.pager{margin:20px 0;list-style:none;text-align:center;*zoom:1;}.pager:before,.pager:after{display:table;content:"";line-height:0;}
+.pager:after{clear:both;}
+.pager li{display:inline;}
+.pager li>a,.pager li>span{display:inline-block;padding:5px 14px;background-color:#fff;border:1px solid #ddd;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px;}
+.pager li>a:hover{text-decoration:none;background-color:#f5f5f5;}
+.pager .next>a,.pager .next>span{float:right;}
+.pager .previous>a,.pager .previous>span{float:left;}
+.pager .disabled>a,.pager .disabled>a:hover,.pager .disabled>span{color:#999999;background-color:#fff;cursor:default;}
+.modal-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1040;background-color:#000000;}.modal-backdrop.fade{opacity:0;}
+.modal-backdrop,.modal-backdrop.fade.in{opacity:0.8;filter:alpha(opacity=80);}
+.modal{position:fixed;top:10%;left:50%;z-index:1050;width:560px;margin-left:-280px;background-color:#ffffff;border:1px solid #999;border:1px solid rgba(0, 0, 0, 0.3);*border:1px solid #999;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 3px 7px rgba(0, 0, 0, 0.3);-moz-box-shadow:0 3px 7px rgba(0, 0, 0, 0.3);box-shadow:0 3px 7px rgba(0, 0, 0, 0.3);-webkit-background-clip:padding-box;-moz-background-clip:padding-box;background-clip:padding-box;outline:none;}.modal.fade{-webkit-transition:opacity .3s linear, top .3s ease-out;-moz-transition:opacity .3s linear, top .3s ease-out;-o-transition:opacity .3s linear, top .3s ease-out;transition:opacity .3s linear, top .3s ease-out;top:-25%;}
+.modal.fade.in{top:10%;}
+.modal-header{padding:9px 15px;border-bottom:1px solid #eee;}.modal-header .close{margin-top:2px;}
+.modal-header h3{margin:0;line-height:30px;}
+.modal-body{position:relative;overflow-y:auto;max-height:400px;padding:15px;}
+.modal-form{margin-bottom:0;}
+.modal-footer{padding:14px 15px 15px;margin-bottom:0;text-align:right;background-color:#f5f5f5;border-top:1px solid #ddd;-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px;-webkit-box-shadow:inset 0 1px 0 #ffffff;-moz-box-shadow:inset 0 1px 0 #ffffff;box-shadow:inset 0 1px 0 #ffffff;*zoom:1;}.modal-footer:before,.modal-footer:after{display:table;content:"";line-height:0;}
+.modal-footer:after{clear:both;}
+.modal-footer .btn+.btn{margin-left:5px;margin-bottom:0;}
+.modal-footer .btn-group .btn+.btn{margin-left:-1px;}
+.modal-footer .btn-block+.btn-block{margin-left:0;}
+.tooltip{position:absolute;z-index:1020;display:block;visibility:visible;padding:5px;font-size:11px;opacity:0;filter:alpha(opacity=0);}.tooltip.in{opacity:0.8;filter:alpha(opacity=80);}
+.tooltip.top{margin-top:-3px;}
+.tooltip.right{margin-left:3px;}
+.tooltip.bottom{margin-top:3px;}
+.tooltip.left{margin-left:-3px;}
+.tooltip-inner{max-width:200px;padding:3px 8px;color:#ffffff;text-align:center;text-decoration:none;background-color:#000000;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
+.tooltip-arrow{position:absolute;width:0;height:0;border-color:transparent;border-style:solid;}
+.tooltip.top .tooltip-arrow{bottom:0;left:50%;margin-left:-5px;border-width:5px 5px 0;border-top-color:#000000;}
+.tooltip.right .tooltip-arrow{top:50%;left:0;margin-top:-5px;border-width:5px 5px 5px 0;border-right-color:#000000;}
+.tooltip.left .tooltip-arrow{top:50%;right:0;margin-top:-5px;border-width:5px 0 5px 5px;border-left-color:#000000;}
+.tooltip.bottom .tooltip-arrow{top:0;left:50%;margin-left:-5px;border-width:0 5px 5px;border-bottom-color:#000000;}
+.popover{position:absolute;top:0;left:0;z-index:1010;display:none;width:236px;padding:1px;text-align:left;background-color:#ffffff;-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box;border:1px solid #ccc;border:1px solid rgba(0, 0, 0, 0.2);-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);-moz-box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);white-space:normal;}.popover.top{margin-top:-10px;}
+.popover.right{margin-left:10px;}
+.popover.bottom{margin-top:10px;}
+.popover.left{margin-left:-10px;}
+.popover-title{margin:0;padding:8px 14px;font-size:14px;font-weight:normal;line-height:18px;background-color:#f7f7f7;border-bottom:1px solid #ebebeb;-webkit-border-radius:5px 5px 0 0;-moz-border-radius:5px 5px 0 0;border-radius:5px 5px 0 0;}
+.popover-content{padding:9px 14px;}
+.popover .arrow,.popover .arrow:after{position:absolute;display:block;width:0;height:0;border-color:transparent;border-style:solid;}
+.popover .arrow{border-width:11px;}
+.popover .arrow:after{border-width:10px;content:"";}
+.popover.top .arrow{left:50%;margin-left:-11px;border-bottom-width:0;border-top-color:#999;border-top-color:rgba(0, 0, 0, 0.25);bottom:-11px;}.popover.top .arrow:after{bottom:1px;margin-left:-10px;border-bottom-width:0;border-top-color:#ffffff;}
+.popover.right .arrow{top:50%;left:-11px;margin-top:-11px;border-left-width:0;border-right-color:#999;border-right-color:rgba(0, 0, 0, 0.25);}.popover.right .arrow:after{left:1px;bottom:-10px;border-left-width:0;border-right-color:#ffffff;}
+.popover.bottom .arrow{left:50%;margin-left:-11px;border-top-width:0;border-bottom-color:#999;border-bottom-color:rgba(0, 0, 0, 0.25);top:-11px;}.popover.bottom .arrow:after{top:1px;margin-left:-10px;border-top-width:0;border-bottom-color:#ffffff;}
+.popover.left .arrow{top:50%;right:-11px;margin-top:-11px;border-right-width:0;border-left-color:#999;border-left-color:rgba(0, 0, 0, 0.25);}.popover.left .arrow:after{right:1px;border-right-width:0;border-left-color:#ffffff;bottom:-10px;}
+.thumbnails{margin-left:-20px;list-style:none;*zoom:1;}.thumbnails:before,.thumbnails:after{display:table;content:"";line-height:0;}
+.thumbnails:after{clear:both;}
+.row-fluid .thumbnails{margin-left:0;}
+.thumbnails>li{float:left;margin-bottom:20px;margin-left:20px;}
+.thumbnail{display:block;padding:4px;line-height:20px;border:1px solid #ddd;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 3px rgba(0, 0, 0, 0.055);-moz-box-shadow:0 1px 3px rgba(0, 0, 0, 0.055);box-shadow:0 1px 3px rgba(0, 0, 0, 0.055);-webkit-transition:all 0.2s ease-in-out;-moz-transition:all 0.2s ease-in-out;-o-transition:all 0.2s ease-in-out;transition:all 0.2s ease-in-out;}
+a.thumbnail:hover{border-color:#2fa4e7;-webkit-box-shadow:0 1px 4px rgba(0, 105, 214, 0.25);-moz-box-shadow:0 1px 4px rgba(0, 105, 214, 0.25);box-shadow:0 1px 4px rgba(0, 105, 214, 0.25);}
+.thumbnail>img{display:block;max-width:100%;margin-left:auto;margin-right:auto;}
+.thumbnail .caption{padding:9px;color:#555555;}
+.media,.media-body{overflow:hidden;*overflow:visible;zoom:1;}
+.media,.media .media{margin-top:15px;}
+.media:first-child{margin-top:0;}
+.media-object{display:block;}
+.media-heading{margin:0 0 5px;}
+.media .pull-left{margin-right:10px;}
+.media .pull-right{margin-left:10px;}
+.media-list{margin-left:0;list-style:none;}
+.label,.badge{display:inline-block;padding:2px 4px;font-size:11.844px;font-weight:bold;line-height:14px;color:#ffffff;vertical-align:baseline;white-space:nowrap;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#999999;}
+.label{-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
+.badge{padding-left:9px;padding-right:9px;-webkit-border-radius:9px;-moz-border-radius:9px;border-radius:9px;}
+.label:empty,.badge:empty{display:none;}
+a.label:hover,a.badge:hover{color:#ffffff;text-decoration:none;cursor:pointer;}
+.label-important,.badge-important{background-color:#bd4247;}
+.label-important[href],.badge-important[href]{background-color:#983538;}
+.label-warning,.badge-warning{background-color:#dd5600;}
+.label-warning[href],.badge-warning[href]{background-color:#aa4200;}
+.label-success,.badge-success{background-color:#669533;}
+.label-success[href],.badge-success[href]{background-color:#4c6f26;}
+.label-info,.badge-info{background-color:#817b58;}
+.label-info[href],.badge-info[href]{background-color:#625e43;}
+.label-inverse,.badge-inverse{background-color:#333333;}
+.label-inverse[href],.badge-inverse[href]{background-color:#1a1a1a;}
+.btn .label,.btn .badge{position:relative;top:-1px;}
+.btn-mini .label,.btn-mini .badge{top:0;}
+ at -webkit-keyframes progress-bar-stripes{from{background-position:40px 0;} to{background-position:0 0;}}@-moz-keyframes progress-bar-stripes{from{background-position:40px 0;} to{background-position:0 0;}}@-ms-keyframes progress-bar-stripes{from{background-position:40px 0;} to{background-position:0 0;}}@-o-keyframes progress-bar-stripes{from{background-position:0 0;} to{background-position:40px 0;}}@keyframes progress-bar-stripes{from{background-position:40px 0;} to{background-position:0 0;}}.progress{overflow:hidden;height:20px;margin-bottom:20px;background-color:#f7f7f7;background-image:-moz-linear-gradient(top, #f5f5f5, #f9f9f9);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#f5f5f5), to(#f9f9f9));background-image:-webkit-linear-gradient(top, #f5f5f5, #f9f9f9);background-image:-o-linear-gradient(top, #f5f5f5, #f9f9f9);background-image:linear-gradient(to bottom, #f5f5f5, #f9f9f9);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startC
 olorstr='#fff5f5f5', endColorstr='#fff9f9f9', GradientType=0);-webkit-box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.1);-moz-box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.1);box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.1);-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
+.progress .bar{width:0%;height:100%;color:#ffffff;float:left;font-size:12px;text-align:center;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#0e90d2;background-image:-moz-linear-gradient(top, #149bdf, #0480be);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#149bdf), to(#0480be));background-image:-webkit-linear-gradient(top, #149bdf, #0480be);background-image:-o-linear-gradient(top, #149bdf, #0480be);background-image:linear-gradient(to bottom, #149bdf, #0480be);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff149bdf', endColorstr='#ff0480be', GradientType=0);-webkit-box-shadow:inset 0 -1px 0 rgba(0, 0, 0, 0.15);-moz-box-shadow:inset 0 -1px 0 rgba(0, 0, 0, 0.15);box-shadow:inset 0 -1px 0 rgba(0, 0, 0, 0.15);-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;-webkit-transition:width 0.6s ease;-moz-transition:width 0.6s ease;-o-transition:width 0.6s ease;transition:width 0.6s ease;}
+.progress .bar+.bar{-webkit-box-shadow:inset 1px 0 0 rgba(0,0,0,.15), inset 0 -1px 0 rgba(0,0,0,.15);-moz-box-shadow:inset 1px 0 0 rgba(0,0,0,.15), inset 0 -1px 0 rgba(0,0,0,.15);box-shadow:inset 1px 0 0 rgba(0,0,0,.15), inset 0 -1px 0 rgba(0,0,0,.15);}
+.progress-striped .bar{background-color:#149bdf;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:linear-gradient(
 45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);-webkit-background-size:40px 40px;-moz-background-size:40px 40px;-o-background-size:40px 40px;background-size:40px 40px;}
+.progress.active .bar{-webkit-animation:progress-bar-stripes 2s linear infinite;-moz-animation:progress-bar-stripes 2s linear infinite;-ms-animation:progress-bar-stripes 2s linear infinite;-o-animation:progress-bar-stripes 2s linear infinite;animation:progress-bar-stripes 2s linear infinite;}
+.progress-danger .bar,.progress .bar-danger{background-color:#dd514c;background-image:-moz-linear-gradient(top, #ee5f5b, #c43c35);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#ee5f5b), to(#c43c35));background-image:-webkit-linear-gradient(top, #ee5f5b, #c43c35);background-image:-o-linear-gradient(top, #ee5f5b, #c43c35);background-image:linear-gradient(to bottom, #ee5f5b, #c43c35);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffee5f5b', endColorstr='#ffc43c35', GradientType=0);}
+.progress-danger.progress-striped .bar,.progress-striped .bar-danger{background-color:#ee5f5b;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, 
 transparent);background-image:linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);}
+.progress-success .bar,.progress .bar-success{background-color:#5eb95e;background-image:-moz-linear-gradient(top, #62c462, #57a957);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#62c462), to(#57a957));background-image:-webkit-linear-gradient(top, #62c462, #57a957);background-image:-o-linear-gradient(top, #62c462, #57a957);background-image:linear-gradient(to bottom, #62c462, #57a957);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462', endColorstr='#ff57a957', GradientType=0);}
+.progress-success.progress-striped .bar,.progress-striped .bar-success{background-color:#62c462;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%
 , transparent);background-image:linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);}
+.progress-info .bar,.progress .bar-info{background-color:#4bb1cf;background-image:-moz-linear-gradient(top, #5bc0de, #339bb9);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#5bc0de), to(#339bb9));background-image:-webkit-linear-gradient(top, #5bc0de, #339bb9);background-image:-o-linear-gradient(top, #5bc0de, #339bb9);background-image:linear-gradient(to bottom, #5bc0de, #339bb9);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff339bb9', GradientType=0);}
+.progress-info.progress-striped .bar,.progress-striped .bar-info{background-color:#5bc0de;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, tran
 sparent);background-image:linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);}
+.progress-warning .bar,.progress .bar-warning{background-color:#f16e1a;background-image:-moz-linear-gradient(top, #ff7d2b, #dd5600);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#ff7d2b), to(#dd5600));background-image:-webkit-linear-gradient(top, #ff7d2b, #dd5600);background-image:-o-linear-gradient(top, #ff7d2b, #dd5600);background-image:linear-gradient(to bottom, #ff7d2b, #dd5600);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffff7d2b', endColorstr='#ffdd5600', GradientType=0);}
+.progress-warning.progress-striped .bar,.progress-striped .bar-warning{background-color:#ff7d2b;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%
 , transparent);background-image:linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);}
+.accordion{margin-bottom:20px;}
+.accordion-group{margin-bottom:2px;border:1px solid #e5e5e5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
+.accordion-heading{border-bottom:0;}
+.accordion-heading .accordion-toggle{display:block;padding:8px 15px;}
+.accordion-toggle{cursor:pointer;}
+.accordion-inner{padding:9px 15px;border-top:1px solid #e5e5e5;}
+.carousel{position:relative;margin-bottom:20px;line-height:1;}
+.carousel-inner{overflow:hidden;width:100%;position:relative;}
+.carousel-inner>.item{display:none;position:relative;-webkit-transition:0.6s ease-in-out left;-moz-transition:0.6s ease-in-out left;-o-transition:0.6s ease-in-out left;transition:0.6s ease-in-out left;}
+.carousel-inner>.item>img{display:block;line-height:1;}
+.carousel-inner>.active,.carousel-inner>.next,.carousel-inner>.prev{display:block;}
+.carousel-inner>.active{left:0;}
+.carousel-inner>.next,.carousel-inner>.prev{position:absolute;top:0;width:100%;}
+.carousel-inner>.next{left:100%;}
+.carousel-inner>.prev{left:-100%;}
+.carousel-inner>.next.left,.carousel-inner>.prev.right{left:0;}
+.carousel-inner>.active.left{left:-100%;}
+.carousel-inner>.active.right{left:100%;}
+.carousel-control{position:absolute;top:40%;left:15px;width:40px;height:40px;margin-top:-20px;font-size:60px;font-weight:100;line-height:30px;color:#ffffff;text-align:center;background:#222222;border:3px solid #ffffff;-webkit-border-radius:23px;-moz-border-radius:23px;border-radius:23px;opacity:0.5;filter:alpha(opacity=50);}.carousel-control.right{left:auto;right:15px;}
+.carousel-control:hover{color:#ffffff;text-decoration:none;opacity:0.9;filter:alpha(opacity=90);}
+.carousel-caption{position:absolute;left:0;right:0;bottom:0;padding:15px;background:#333333;background:rgba(0, 0, 0, 0.75);}
+.carousel-caption h4,.carousel-caption p{color:#ffffff;line-height:20px;}
+.carousel-caption h4{margin:0 0 5px;}
+.carousel-caption p{margin-bottom:0;}
+.hero-unit{padding:30px;margin-bottom:30px;font-size:18px;font-weight:200;line-height:30px;color:inherit;background-color:#f5f5f5;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}.hero-unit h1{margin-bottom:0;font-size:60px;line-height:1;color:inherit;letter-spacing:-1px;}
+.hero-unit li{line-height:30px;}
+.pull-right{float:right;}
+.pull-left{float:left;}
+.hide{display:none;}
+.show{display:block;}
+.invisible{visibility:hidden;}
+.affix{position:fixed;}
+.navbar .brand{padding:14px 20px 16px;font-family:'Telex',sans-serif;text-shadow:1px 1px 0 rgba(0, 0, 0, 0.2);}
+.navbar li{line-height:20px;}
+.navbar .nav>li>a{padding:16px 10px 14px;font-family:'Telex',sans-serif;text-shadow:1px 1px 0 rgba(0, 0, 0, 0.2);}
+.navbar .search-query{border:1px solid #178acc;line-height:normal;}
+.navbar .navbar-text{padding:19px 10px 18px;line-height:13px;color:rgba(0, 0, 0, 0.5);text-shadow:1px 1px 0 rgba(255, 255, 255, 0.3);}
+.navbar-inverse .navbar-search .search-query{color:#555555;}
+ at media (max-width:979px){.navbar .nav-collapse .nav li>a{font-family:'Telex',sans-serif;font-weight:normal;color:#ffffff;text-shadow:1px 1px 0 rgba(0, 0, 0, 0.2);}.navbar .nav-collapse .nav li>a:hover{background-color:#2B7CAC;} .navbar .nav-collapse .nav .active>a{-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;background-color:#2B7CAC;} .navbar .nav-collapse .dropdown-menu li>a:hover,.navbar .nav-collapse .dropdown-menu li>a:focus,.navbar .nav-collapse .dropdown-submenu:hover>a{background-image:none;} .navbar .nav-collapse .navbar-form,.navbar .nav-collapse .navbar-search{border:none;} .navbar .nav-collapse .nav-header{color:#2B7CAC;} .navbar-inverse .nav-collapse .nav li>a{color:#ffffff;}.navbar-inverse .nav-collapse .nav li>a:hover{background-color:rgba(0, 0, 0, 0.1);} .navbar-inverse .nav-collapse .nav .active>a,.navbar-inverse .nav-collapse .nav>li>a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:hover{background-color:rgba(0, 0, 0, 0.1) !important;}}
 div.subnav{font-family:'Telex',sans-serif;text-shadow:1px 1px 0 rgba(255, 255, 255, 0.2);}div.subnav-fixed{top:50px;}
+.btn{background-color:#ffffff;background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), color-stop(5%, #ffffff), to(#ffffff));background-image:-webkit-linear-gradient(#ffffff, #ffffff 5%, #ffffff);background-image:-moz-linear-gradient(top, #ffffff, #ffffff 5%, #ffffff);background-image:-o-linear-gradient(#ffffff, #ffffff 5%, #ffffff);background-image:linear-gradient(#ffffff, #ffffff 5%, #ffffff);background-repeat:no-repeat;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffffffff', GradientType=0);-webkit-box-shadow:inset 0 1px 0 rgba(255, 255, 255, 0.2),0 1px 2px rgba(0, 0, 0, 0.05);-moz-box-shadow:inset 0 1px 0 rgba(255, 255, 255, 0.2),0 1px 2px rgba(0, 0, 0, 0.05);box-shadow:inset 0 1px 0 rgba(255, 255, 255, 0.2),0 1px 2px rgba(0, 0, 0, 0.05);}.btn:hover{background-position:0 0;}
+.btn-primary{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#3daae9;background-image:-moz-linear-gradient(top, #46aeea, #2fa4e7);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#46aeea), to(#2fa4e7));background-image:-webkit-linear-gradient(top, #46aeea, #2fa4e7);background-image:-o-linear-gradient(top, #46aeea, #2fa4e7);background-image:linear-gradient(to bottom, #46aeea, #2fa4e7);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff46aeea', endColorstr='#ff2fa4e7', GradientType=0);border-color:#2fa4e7 #2fa4e7 #157ab5;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#2fa4e7;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-primary:hover,.btn-primary:active,.btn-primary.active,.btn-primary.disabled,.btn-primary[disabled]{color:#ffffff;background-color:#2fa4e7;*background-color:#1a99e2;}
+.btn-primary:active,.btn-primary.active{background-color:#178acc \9;}
+.btn-info{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#9e6ab8;background-image:-moz-linear-gradient(top, #a271bb, #9760b3);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#a271bb), to(#9760b3));background-image:-webkit-linear-gradient(top, #a271bb, #9760b3);background-image:-o-linear-gradient(top, #a271bb, #9760b3);background-image:linear-gradient(to bottom, #a271bb, #9760b3);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffa271bb', endColorstr='#ff9760b3', GradientType=0);border-color:#9760b3 #9760b3 #6f4086;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#9760b3;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-info:hover,.btn-info:active,.btn-info.active,.btn-info.disabled,.btn-info[disabled]{color:#ffffff;background-color:#9760b3;*background-color:#8b51a9;}
+.btn-info:active,.btn-info.active{background-color:#7d4898 \9;}
+.btn-success{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#7bb33d;background-image:-moz-linear-gradient(top, #80bb3f, #73a839);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#80bb3f), to(#73a839));background-image:-webkit-linear-gradient(top, #80bb3f, #73a839);background-image:-o-linear-gradient(top, #80bb3f, #73a839);background-image:linear-gradient(to bottom, #80bb3f, #73a839);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff80bb3f', endColorstr='#ff73a839', GradientType=0);border-color:#73a839 #73a839 #4c6f26;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#73a839;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-success:hover,.btn-success:active,.btn-success.active,.btn-success.disabled,.btn-success[disabled]{color:#ffffff;background-color:#73a839;*background-color:#669533;}
+.btn-success:active,.btn-success.active{background-color:#59822c \9;}
+.btn-warning{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#ec5c00;background-image:-moz-linear-gradient(top, #f76000, #dd5600);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#f76000), to(#dd5600));background-image:-webkit-linear-gradient(top, #f76000, #dd5600);background-image:-o-linear-gradient(top, #f76000, #dd5600);background-image:linear-gradient(to bottom, #f76000, #dd5600);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff76000', endColorstr='#ffdd5600', GradientType=0);border-color:#dd5600 #dd5600 #913800;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#dd5600;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-warning:hover,.btn-warning:active,.btn-warning.active,.btn-warning.disabled,.btn-warning[disabled]{color:#ffffff;background-color:#dd5600;*background-color:#c44c00;}
+.btn-warning:active,.btn-warning.active{background-color:#aa4200 \9;}
+.btn-danger{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#d41e24;background-image:-moz-linear-gradient(top, #dd1f26, #c71c22);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#dd1f26), to(#c71c22));background-image:-webkit-linear-gradient(top, #dd1f26, #c71c22);background-image:-o-linear-gradient(top, #dd1f26, #c71c22);background-image:linear-gradient(to bottom, #dd1f26, #c71c22);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffdd1f26', endColorstr='#ffc71c22', GradientType=0);border-color:#c71c22 #c71c22 #841317;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#c71c22;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-danger:hover,.btn-danger:active,.btn-danger.active,.btn-danger.disabled,.btn-danger[disabled]{color:#ffffff;background-color:#c71c22;*background-color:#b1191e;}
+.btn-danger:active,.btn-danger.active{background-color:#9a161a \9;}
+.btn-inverse{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#034482;background-image:-moz-linear-gradient(top, #04498c, #033c73);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#04498c), to(#033c73));background-image:-webkit-linear-gradient(top, #04498c, #033c73);background-image:-o-linear-gradient(top, #04498c, #033c73);background-image:linear-gradient(to bottom, #04498c, #033c73);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff04498c', endColorstr='#ff033c73', GradientType=0);border-color:#033c73 #033c73 #011528;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#033c73;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-inverse:hover,.btn-inverse:active,.btn-inverse.active,.btn-inverse.disabled,.btn-inverse[disabled]{color:#ffffff;background-color:#033c73;*background-color:#022f5a;}
+.btn-inverse:active,.btn-inverse.active{background-color:#022241 \9;}
+i[class^="icon-"]{opacity:0.8;}
+.pull-right{float:right;}
+.pull-left{float:left;}
+.hide{display:none;}
+.show{display:block;}
+.invisible{visibility:hidden;}
+.affix{position:fixed;}
diff --git a/docs/css/bootswatch.less b/docs/css/bootswatch.less
new file mode 100644
index 0000000..3c353e9
--- /dev/null
+++ b/docs/css/bootswatch.less
@@ -0,0 +1,181 @@
+// Cerulean 2.2.2
+// Bootswatch
+// -----------------------------------------------------
+
+
+// TYPOGRAPHY
+// -----------------------------------------------------
+
+ at import url(//fonts.googleapis.com/css?family=Telex);
+
+// SCAFFOLDING
+// -----------------------------------------------------
+
+// NAVBAR
+// -----------------------------------------------------
+
+.navbar {
+
+
+	.brand {
+		padding: 14px 20px 16px;
+		font-family: @headingsFontFamily;
+		text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.2);
+	}
+
+	li {
+		line-height: 20px;
+	}
+
+	.nav > li > a {
+		padding: 16px 10px 14px;
+		font-family: @headingsFontFamily;
+		text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.2);
+	}
+
+	.search-query {
+		border: 1px solid darken(@linkColor, 10%);
+		line-height: normal;
+	}
+
+	.navbar-text {
+		padding: 19px 10px 18px;
+		line-height: 13px;
+		color: rgba(0, 0, 0, 0.5);
+		text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.3);
+	}
+
+	&-inverse {
+
+		.navbar-search .search-query {
+			color: @textColor;
+		}
+	}
+}
+
+ at media (max-width: @navbarCollapseWidth) {
+
+	.navbar .nav-collapse {
+
+		.nav li > a {
+
+			font-family: @headingsFontFamily;
+			font-weight: normal;
+			color: @white;
+			text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.2);
+
+			&:hover {
+				background-color: #2B7CAC;
+			}
+		}
+
+		.nav .active > a {
+			.box-shadow(none);
+			background-color: #2B7CAC;
+		}
+
+		.dropdown-menu li > a:hover,
+		.dropdown-menu li > a:focus,
+		.dropdown-submenu:hover > a {
+			background-image: none;
+		}
+
+		.navbar-form,
+		.navbar-search {
+			border: none;
+		}
+
+		.nav-header {
+			color: #2B7CAC;
+		}
+	}
+
+	.navbar-inverse .nav-collapse {
+
+		.nav li > a {
+			color: @navbarInverseLinkColor;
+
+			&:hover {
+				background-color: rgba(0, 0, 0, 0.1);
+			}
+		}
+
+		.nav .active > a,
+		.nav > li > a:hover,
+		.dropdown-menu a:hover {
+			background-color: rgba(0, 0, 0, 0.1) !important;
+		}
+	}
+}
+
+div.subnav {
+
+	font-family: @headingsFontFamily;
+	text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.2);
+
+	&-fixed {
+		top: @navbarHeight;
+	}
+}
+
+// NAV
+// -----------------------------------------------------
+
+// BUTTONS
+// -----------------------------------------------------
+
+.btn {
+  #gradient > .vertical-three-colors(@white, @white, 5%, darken(@white, 0%));
+  @shadow: inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);
+  .box-shadow(@shadow);
+
+  &:hover {
+  	background-position: 0 0;
+  }
+}
+
+.btn-primary {
+  .buttonBackground(lighten(@btnPrimaryBackground, 5%), @btnPrimaryBackground);
+}
+
+.btn-info {
+  .buttonBackground(lighten(@btnInfoBackground, 5%), @btnInfoBackground);
+}
+
+.btn-success {
+  .buttonBackground(lighten(@btnSuccessBackground, 5%), @btnSuccessBackground);
+}
+
+.btn-warning {
+  .buttonBackground(lighten(@btnWarningBackground, 5%), @btnWarningBackground);
+}
+
+.btn-danger {
+  .buttonBackground(lighten(@btnDangerBackground, 5%), @btnDangerBackground);
+}
+
+.btn-inverse {
+  .buttonBackground(lighten(@btnInverseBackground, 5%), @btnInverseBackground);
+}
+
+// TABLES
+// -----------------------------------------------------
+
+// FORMS
+// -----------------------------------------------------
+
+// DROPDOWNS
+// -----------------------------------------------------
+
+// ALERTS, LABELS, BADGES
+// -----------------------------------------------------
+
+// MISC
+// -----------------------------------------------------
+
+i[class^="icon-"]{
+	opacity: 0.8;
+}
+
+// MEDIA QUERIES
+// -----------------------------------------------------
diff --git a/docs/css/variables.less b/docs/css/variables.less
new file mode 100644
index 0000000..c5931eb
--- /dev/null
+++ b/docs/css/variables.less
@@ -0,0 +1,301 @@
+// Cerulean 2.2.2
+// Variables
+// --------------------------------------------------
+
+
+// GLOBAL VALUES
+// --------------------------------------------------
+
+
+// Grays
+// -------------------------
+ at black:                 #000;
+ at grayDarker:            #222;
+ at grayDark:              #333;
+ at gray:                  #555;
+ at grayLight:             #999;
+ at grayLighter:           #F5F5F5;
+ at white:                 #fff;
+
+
+// Accent colors
+// -------------------------
+ at blue:                  #2FA4E7;
+ at blueDark:              #033C73;
+ at green:                 #73A839;
+ at red:                   #C71C22;
+ at yellow:                #F7B42C;
+ at orange:                #DD5600;
+ at pink:                  #F49AC1;
+ at purple:                #9760B3;
+
+
+// Scaffolding
+// -------------------------
+ at bodyBackground:        @white;
+ at textColor:             @gray;
+
+
+// Links
+// -------------------------
+ at linkColor:             @blue;
+ at linkColorHover:        darken(@linkColor, 15%);
+
+
+// Typography
+// -------------------------
+ at sansFontFamily:        "Helvetica Neue", Helvetica, Arial, sans-serif;
+ at serifFontFamily:       Georgia, "Times New Roman", Times, serif;
+ at monoFontFamily:        Menlo, Monaco, Consolas, "Courier New", monospace;
+
+ at baseFontSize:          14px;
+ at baseFontFamily:        @sansFontFamily;
+ at baseLineHeight:        20px;
+ at altFontFamily:         @monoFontFamily;
+
+ at headingsFontFamily:    'Telex', sans-serif; // empty to use BS default, @baseFontFamily
+ at headingsFontWeight:    bold;    // instead of browser default, bold
+ at headingsColor:         #317EAC; // empty to use BS default, @textColor
+
+
+// Component sizing
+// -------------------------
+// Based on 14px font-size and 20px line-height
+
+ at fontSizeLarge:         @baseFontSize * 1.25; // ~18px
+ at fontSizeSmall:         @baseFontSize * 0.85; // ~12px
+ at fontSizeMini:          @baseFontSize * 0.75; // ~11px
+
+ at paddingLarge:          11px 19px; // 44px
+ at paddingSmall:          2px 10px;  // 26px
+ at paddingMini:           0px 6px;   // 22px
+
+ at baseBorderRadius:      4px;
+ at borderRadiusLarge:     6px;
+ at borderRadiusSmall:     3px;
+
+
+// Tables
+// -------------------------
+ at tableBackground:                   transparent; // overall background-color
+ at tableBackgroundAccent:             #f9f9f9; // for striping
+ at tableBackgroundHover:              #f5f5f5; // for hover
+ at tableBorder:                       #ddd; // table and cell border
+
+// Buttons
+// -------------------------
+ at btnBackground:                     @white;
+ at btnBackgroundHighlight:            darken(@white, 10%);
+ at btnBorder:                         darken(@white, 20%);
+
+ at btnPrimaryBackground:              @linkColor;
+ at btnPrimaryBackgroundHighlight:     spin(@btnPrimaryBackground, 15%);
+
+ at btnInfoBackground:                 @purple;
+ at btnInfoBackgroundHighlight:        #2f96b4;
+
+ at btnSuccessBackground:              @green;
+ at btnSuccessBackgroundHighlight:     #51a351;
+
+ at btnWarningBackground:              @orange;
+ at btnWarningBackgroundHighlight:     @orange;
+
+ at btnDangerBackground:               @red;
+ at btnDangerBackgroundHighlight:      #bd362f;
+
+ at btnInverseBackground:              @blueDark;
+ at btnInverseBackgroundHighlight:     @grayDarker;
+
+
+// Forms
+// -------------------------
+ at inputBackground:               @white;
+ at inputBorder:                   #ccc;
+ at inputBorderRadius:             @baseBorderRadius;
+ at inputDisabledBackground:       @grayLighter;
+ at formActionsBackground:         #f5f5f5;
+ at inputHeight:                   @baseLineHeight + 10px; // base line-height + 8px vertical padding + 2px top/bottom border
+
+
+// Dropdowns
+// -------------------------
+ at dropdownBackground:            @white;
+ at dropdownBorder:                rgba(0,0,0,.2);
+ at dropdownDividerTop:            #e5e5e5;
+ at dropdownDividerBottom:         @white;
+
+ at dropdownLinkColor:             @grayDark;
+ at dropdownLinkColorHover:        @white;
+ at dropdownLinkColorActive:       @white;
+
+ at dropdownLinkBackgroundActive:  @linkColor;
+ at dropdownLinkBackgroundHover:   @dropdownLinkBackgroundActive;
+
+
+
+// COMPONENT VARIABLES
+// --------------------------------------------------
+
+
+// Z-index master list
+// -------------------------
+// Used for a bird's eye view of components dependent on the z-axis
+// Try to avoid customizing these :)
+ at zindexDropdown:          1000;
+ at zindexPopover:           1010;
+ at zindexTooltip:           1020;
+ at zindexFixedNavbar:       1030;
+ at zindexModalBackdrop:     1040;
+ at zindexModal:             1050;
+
+
+// Sprite icons path
+// -------------------------
+ at iconSpritePath:          "../image/glyphicons-halflings.png";
+ at iconWhiteSpritePath:     "../image/glyphicons-halflings-white.png";
+
+
+// Input placeholder text color
+// -------------------------
+ at placeholderText:         @grayLight;
+
+
+// Hr border color
+// -------------------------
+ at hrBorder:                @grayLighter;
+
+
+// Horizontal forms & lists
+// -------------------------
+ at horizontalComponentOffset:       180px;
+
+
+// Wells
+// -------------------------
+ at wellBackground:                  #f5f5f5;
+
+
+// Navbar
+// -------------------------
+ at navbarCollapseWidth:             979px;
+ at navbarCollapseDesktopWidth:      @navbarCollapseWidth + 1;
+
+ at navbarHeight:                    50px;
+ at navbarBackgroundHighlight:       lighten(@navbarBackground, 8%);
+ at navbarBackground:                @blue;
+ at navbarBorder:                    darken(@navbarBackground, 8%);
+
+ at navbarText:                      @grayLighter;
+ at navbarLinkColor:                 @white;
+ at navbarLinkColorHover:            @white;
+ at navbarLinkColorActive:           @navbarLinkColorHover;
+ at navbarLinkBackgroundHover:       darken(@navbarBackground, 12%);
+ at navbarLinkBackgroundActive:      darken(@navbarBackground, 12%);
+
+ at navbarBrandColor:                @navbarLinkColor;
+
+// Inverted navbar
+ at navbarInverseBackground:                @blueDark;
+ at navbarInverseBackgroundHighlight:       lighten(@navbarInverseBackground, 5%);
+ at navbarInverseBorder:                    darken(@navbarInverseBackground, 3%);
+
+ at navbarInverseText:                      @white;
+ at navbarInverseLinkColor:                 @white;
+ at navbarInverseLinkColorHover:            @white;
+ at navbarInverseLinkColorActive:           @white;
+ at navbarInverseLinkBackgroundHover:       darken(@navbarInverseBackground, 6%);
+ at navbarInverseLinkBackgroundActive:      darken(@navbarInverseBackground, 6%);
+
+ at navbarInverseSearchBackground:          @white;
+ at navbarInverseSearchBackgroundFocus:     @white;
+ at navbarInverseSearchBorder:              @navbarInverseBackground;
+ at navbarInverseSearchPlaceholderColor:    @grayLight;
+
+ at navbarInverseBrandColor:                @navbarInverseLinkColor;
+
+
+// Pagination
+// -------------------------
+ at paginationBackground:                #fff;
+ at paginationBorder:                    #ddd;
+ at paginationActiveBackground:          #f5f5f5;
+
+
+// Hero unit
+// -------------------------
+ at heroUnitBackground:              @grayLighter;
+ at heroUnitHeadingColor:            inherit;
+ at heroUnitLeadColor:               inherit;
+
+
+// Form states and alerts
+// -------------------------
+ at warningText:             @orange;
+ at warningBackground:       #F1CEAB;
+ at warningBorder:           darken(spin(@warningBackground, -10), 3%);
+
+ at errorText:               darken(#C45559, 5%);
+ at errorBackground:         #F2BDB1;
+ at errorBorder:             darken(spin(@errorBackground, -10), 3%);
+
+ at successText:             darken(@green, 5%);
+ at successBackground:       #D5ECBF;
+ at successBorder:           darken(spin(@successBackground, -10), 5%);
+
+ at infoText:                darken(#908A62, 5%);
+ at infoBackground:          #A7DFF1;
+ at infoBorder:              darken(spin(@infoBackground, -10), 7%);
+
+
+// Tooltips and popovers
+// -------------------------
+ at tooltipColor:            #fff;
+ at tooltipBackground:       #000;
+ at tooltipArrowWidth:       5px;
+ at tooltipArrowColor:       @tooltipBackground;
+
+ at popoverBackground:       #fff;
+ at popoverArrowWidth:       10px;
+ at popoverArrowColor:       #fff;
+ at popoverTitleBackground:  darken(@popoverBackground, 3%);
+
+// Special enhancement for popovers
+ at popoverArrowOuterWidth:  @popoverArrowWidth + 1;
+ at popoverArrowOuterColor:  rgba(0,0,0,.25);
+
+
+
+// GRID
+// --------------------------------------------------
+
+
+// Default 940px grid
+// -------------------------
+ at gridColumns:             12;
+ at gridColumnWidth:         60px;
+ at gridGutterWidth:         20px;
+ at gridRowWidth:            (@gridColumns * @gridColumnWidth) + (@gridGutterWidth * (@gridColumns - 1));
+
+// 1200px min
+ at gridColumnWidth1200:     70px;
+ at gridGutterWidth1200:     30px;
+ at gridRowWidth1200:        (@gridColumns * @gridColumnWidth1200) + (@gridGutterWidth1200 * (@gridColumns - 1));
+
+// 768px-979px
+ at gridColumnWidth768:      42px;
+ at gridGutterWidth768:      20px;
+ at gridRowWidth768:         (@gridColumns * @gridColumnWidth768) + (@gridGutterWidth768 * (@gridColumns - 1));
+
+
+// Fluid grid
+// -------------------------
+ at fluidGridColumnWidth:    percentage(@gridColumnWidth/@gridRowWidth);
+ at fluidGridGutterWidth:    percentage(@gridGutterWidth/@gridRowWidth);
+
+// 1200px min
+ at fluidGridColumnWidth1200:     percentage(@gridColumnWidth1200/@gridRowWidth1200);
+ at fluidGridGutterWidth1200:     percentage(@gridGutterWidth1200/@gridRowWidth1200);
+
+// 768px-979px
+ at fluidGridColumnWidth768:      percentage(@gridColumnWidth768/@gridRowWidth768);
+ at fluidGridGutterWidth768:      percentage(@gridGutterWidth768/@gridRowWidth768);
diff --git a/docs/developer.html b/docs/developer.html
deleted file mode 100644
index ee83324..0000000
--- a/docs/developer.html
+++ /dev/null
@@ -1,47 +0,0 @@
-<!--#include file="header.html" -->
-
-
-<h3>Developer Access</h3>
-
-Because we use Git for version control, you don't need developer (ssh)
-access on uclibc.org to contribute to Buildroot, but you can request
-it if needed.
-
-<p>
-
-To obtain developer access, you will need to demonstrate you are
-serious by submitting a few good patches first.  Then, you will need
-to select a username to use when logging in, you will need to send me
-the username you have selected, you must send me your preferred
-contact email address, and finally, you must send me an ssh version 2
-DSA key with 1024 bits (the default) or more.  If you do not currently
-have an ssh version 2 DSA key, you can generate a key using the
-command<pre>ssh-keygen -t dsa</pre> This will create the
-files <pre>/home/&lt;USERNAME&gt;/ssh/id_dsa
-/home/&lt;USERNAME&gt;/.ssh/id_dsa.pub</pre> It is recommended that
-you generate a key with a "passphrase" for security reasons.
-
-<p>
-Make the file known to the system by running
-
-<pre>ssh-add ~/.ssh/id_dsa</pre>
-
-You must then send the content of 'id_dsa.pub' to me so I can setup your account.
-The content of 'id_dsa' should of course be kept secret.
-
-<p>
-
-Once you have an account, you can use it to store Git
-repositories. Simply put them in subdirectories of your ~/git, and
-touch ~/git/<repo>/git-daemon-export-ok, after which the hourly
-cronjob will pick them up and show them in cgit. They are also
-available though git-daemon:
-
-<pre>git clone git://git.buildroot.net/~&lt;USERNAME&gt/git/&lt;REPO&gt;</pre>
-
-For additional detail on how to use Git, please visit the
-<a href="http://git-scm.org/">the Git website</a>.
-
-<!--#include file="footer.html" -->
-
-
diff --git a/docs/docs.html b/docs/docs.html
index bd8753c..1e24553 100644
--- a/docs/docs.html
+++ b/docs/docs.html
@@ -1,6 +1,6 @@
 <!--#include file="header.html" -->
 
-<h3>Documentation</h3>
+<h2>Documentation</h2>
 
 <p>The Buildroot user manual is where you want to start reading if you
 wish to understand how Buildroot works, or wish to change/extend/fix
@@ -28,7 +28,7 @@ help:</p>
 
 <ul>
 
-  <li>On the <a href="lists.html">buildroot mailing list</a>
+  <li>On the <a href="support.html">buildroot mailing list</a>
   at <code>buildroot at uclibc.org</code></li>
 
   <li>On the <a href="irc://freenode.net/#buildroot">Buildroot IRC
diff --git a/docs/download.html b/docs/download.html
index 1d2a8af..b9700d6 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -1,8 +1,6 @@
 <!--#include file="header.html" -->
 
-
-
-<h3>Download</h3>
+<h2>Download</h2>
 
 <p>
 
@@ -43,8 +41,46 @@ follow development, but cannot or do not wish to use Git.
 	<li> Click here to <a href="http://git.buildroot.net/buildroot">browse the source tree</a>.
 	</li>
 
-	<li>Anonymous <a href="git.html">Git access</a> is available.
-	</li>
 </ul>
 
+
+<h2>Repository</h2>
+
+The buildroot repository can be browsed online through cgit at
+<a href="http://git.buildroot.net/buildroot/">http://git.buildroot.net/buildroot</a>.
+To grab a copy of the repository use
+
+<pre>
+git clone git://git.buildroot.net/buildroot</pre>
+
+Or if you're behind a firewall blocking git:
+
+<pre>
+git clone http://git.buildroot.net/git/buildroot.git</pre>
+
+<p>
+
+Please use the native git protocol if at all possible, as it's a lot
+more efficient than HTTP.
+
+<p>
+
+If you are not already familiar with using Git, we recommend you visit <a
+href="http://git-scm.org">the Git website</a>.
+
+<p>
+
+Once you've checked out a copy of the source tree, you can update your source
+tree at any time so it is in sync with the latest and greatest by entering your
+buildroot directory and running the command:
+
+<pre>
+git pull
+</pre>
+
+Because you've only been granted anonymous access to the tree, you won't be
+able to push your changes to the repo. Changes can instead be submitted for
+inclusion by posting them to the buildroot mailing list or to the <a
+href="https://bugs.uclibc.org/">Bug and Patch Tracking System</a>.
+
 <!--#include file="footer.html" -->
diff --git a/docs/footer.html b/docs/footer.html
index 9cc1e19..0a555cc 100644
--- a/docs/footer.html
+++ b/docs/footer.html
@@ -1,21 +1,7 @@
-<!-- Footer -->
-
-
-    </td>
-    </tr>
-    </table>
-
-<hr />
-
-    <p>
-    <font face="arial, helvetica, sans-serif" size="-1">
-	<a HREF="/copyright.txt">Copyright &copy; 1999-2005 Erik Andersen,
-	2006-2014 The Buildroot developers</a>
-	<br>
-	Mail all comments, insults, suggestions and bribes to
-	<br>
-	The Buildroot developers <A HREF="mailto:buildroot@uclibc.org">buildroot at uclibc.org</A><BR>
-    </font>
-
+    </div> <!-- /container -->
+    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
+    <script type="text/javascript" src="js/bootstrap.min.js"></script>
+    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
+    <script type="text/javascript" src="js/buildroot.js"></script>
   </body>
 </html>
diff --git a/docs/git.html b/docs/git.html
deleted file mode 100644
index 0c99251..0000000
--- a/docs/git.html
+++ /dev/null
@@ -1,44 +0,0 @@
-<!--#include file="header.html" -->
-
-
-<h3>Git Access</h3>
-
-The buildroot repository can be browsed online through cgit at
-<a href="http://git.buildroot.net/buildroot/">http://git.buildroot.net/buildroot</a>.
-To grab a copy of the repository use
-
-<pre>
-git clone git://git.buildroot.net/buildroot</pre>
-
-Or if you're behind a firewall blocking git:
-
-<pre>
-git clone http://git.buildroot.net/git/buildroot.git</pre>
-
-<p>
-
-Please use the native git protocol if at all possible, as it's a lot
-more efficient than HTTP.
-
-<p>
-
-If you are not already familiar with using Git, we recommend you visit <a
-href="http://git-scm.org">the Git website</a>.
-
-<p>
-
-Once you've checked out a copy of the source tree, you can update your source
-tree at any time so it is in sync with the latest and greatest by entering your
-buildroot directory and running the command:
-
-<pre>
-git pull
-</pre>
-
-Because you've only been granted anonymous access to the tree, you won't be
-able to push your changes to the repo. Changes can instead be submitted for
-inclusion by posting them to the buildroot mailing list or to the <a
-href="https://bugs.uclibc.org/">Bug and Patch Tracking System</a>.
-
-<!--#include file="footer.html" -->
-
diff --git a/docs/header.html b/docs/header.html
index b987d85..f64869f 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -1,65 +1,51 @@
-<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
-"http://www.w3.org/TR/REC-html40/loose.dtd">
-
-<html>
+<!DOCTYPE html>
+<html lang="en">
   <head>
-    <title>Buildroot</title>
+    <meta charset="utf-8">
+    <title>Buildroot: making embedded Linux easy</title>
+    <meta name="viewport" content="width=device-width, initial-scale=1.0">
+    <meta name="author" content="The Buildroot developers">
+    <link rel="shortcut icon" href="favicon.ico">
+    <link href="css/bootstrap.min.css" rel="stylesheet">
+
     <style type="text/css">
-     body {
-      background-color: #DEE2DE;
-      color: #000000;
-     }
-     :link { color: #660000 }
-     :visited { color: #660000 }
-     :active { color: #660000 }
-     td.c2 {font-family: arial, helvetica, sans-serif; font-size: 80%}
-     td.c1 {font-family: lucida, helvetica; font-size: 248%}
+      body {
+      padding-top: 60px;
+      padding-bottom: 40px;
+      }
+      .button_column{
+        width: 430px;
+      }
     </style>
-<script type="text/javascript">
-
-  var _gaq = _gaq || [];
-  _gaq.push(['_setAccount', 'UA-21761074-1']);
-  _gaq.push(['_setDomainName', 'none']);
-  _gaq.push(['_setAllowLinker', true]);
-  _gaq.push(['_trackPageview']);
-
-  (function() {
-    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
-    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
-    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
-  })();
 
-</script>
+    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
+    <!--[if lt IE 9]>
+	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
+	<![endif]-->
   </head>
-
   <body>
-    <basefont face="lucida, helvetica, arial" size="3">
-
-
-
-
-<table border="0" cellpadding="0" cellspacing="0">
-
-
-<tr>
-<td valign="TOP">
-  <a href="/"><IMG SRC="images/logo_small.png" alt="Buildroot"
-  border="0" width="200" height="100"></a><BR>
-
-    <br><a href="/about.html">About</a>
-    <br><a href="/news.html">Latest News</a>
-    <br><a href="/download.html">Download</a>
-    <br><a href="http://git.buildroot.net/buildroot/">Browse Source</a>
-    <br><a href="/git.html">Accessing Source</a>
-    <br><a href="https://bugs.uclibc.org/">Bug Tracking</a>
-    <br><a href="/docs.html">Documentation</a>
-    <br><a href="/lists.html">Mailing Lists</a>
-    <br><a href="http://autobuild.buildroot.org">Autobuilder</a>
-    <br><a href="http://patchwork.buildroot.org">Patchwork</a>
-    <br><a href="/sponsors.html">Sponsors</a>
-
-</td>
-
-
-<td Valign="TOP">
+    <div class="navbar navbar-fixed-top">
+      <div class="navbar-inner">
+        <div class="container">
+          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
+            <span class="icon-bar"></span>
+            <span class="icon-bar"></span>
+            <span class="icon-bar"></span>
+          </a>
+          <a class="brand" href="/">Buildroot</a>
+          <div class="nav-collapse">
+            <ul class="nav">
+              <li><a href="/news.html">News</a></li>
+              <li><a href="/about.html">About</a></li>
+              <li><a href="/download.html">Download</a></li>
+              <li><a href="/docs.html">Documentation</a></li>
+              <li><a href="/support.html">Support</a></li>
+              <li><a href="/contribute.html">Contribute</a></li>
+              <li><a href="/sponsors.html">Sponsors</a></li>
+            </ul>
+          </div><!--/.nav-collapse -->
+        </div>
+      </div>
+    </div>
+    <div class="container">
 
diff --git a/docs/images/glyphicons-halflings-white.png b/docs/images/glyphicons-halflings-white.png
new file mode 100644
index 0000000000000000000000000000000000000000..3bf6484a29d8da269f9bc874b25493a45fae3bae
GIT binary patch
literal 8777
zcmZvC1yGz#v+m*$LXcp=A$ZWB0fL7wNbp_U*$~{_gL`my3oP#L!5tQYy99Ta`+g_q
zKlj|KJ2f at c)ARJx{q*b<Rc{fZDE|-E3z8Qg5C}{9v!pTzga8NZOmrk*O`5892Z0dh
z6y;PuJwHDK9$?(w-u|_L_3`o1($W%e0`}kWUyy&dCnqOQPfu4@SAgf?;o*P$z|s8t
zJh1KR>bkhN_!|Wn*Vos8{TEhUT at 5e;_WJsIMMcG5%>DiS&dv_N`4 at J0cnAQ-#>RjZ
z00W5t&tJ^l-QC*ST1-p~00u^9XJ=AUl7oW-;2a+x2k__T=grN{+1c4XK0ZL~^z^i$
zp&>vEhr at 4fZWb380S18T&!0cQ3IKpHF)?v=b_NIm0Q>v<fKgXh*W25>wY7D0baZ)n
z31Fa5sELUQARIVaU0nqf0XzT+fB_63aA;@<$l~wse|mcA;^G1TmX?-)e)jkGPfkuA
z92@|!<>h5S_4f8QP-JRq>d&7)^Yin8l7K8gED$&_FaV?gY+wLjpoW%~7NDe=nHfMG
z5DO3j{R9kv5GbssrUpO)<pElNvVjx;Inad7%}rnn)BtoiIXM{s0C>Oyv<s*i2m!7M
zNCXUk1jq|?5|99_k&%%AIlu-a0ty3=KxY8j%*;&S3IIajE_Qc!f%*X_5DScgf&xH0
zumu>Vrlx>u0UKD0i;Dpm5S5dY16(DL5l{ixz|mhJU@&-OWCTb7_%}8-fE(P~+XIRO
zJU|wp1|S>|J3KrLcz^+v1f&BDpd>&MAaibR4#5A_4(MucZwG9E1h4 at u0P@C8;oo+g
zIVj7kfJi{oV~E(NZ*h(@^<JQ`7oGGHtP>-(Q(C`Psb3KZ{N;^GB(a8NE*Vwc715!9
zr-H4Ao|T_c6+VT_JH9H+P3>iXSt!a$F`>s`jn`w9GZ_~B!{<w2b}Uz=xRP0Noee!5
zHGxHKH;uZjouChSB9)ldcOm@{14~ct04{b8>0soaiV|O_c^R2aWa%}O3jUE)WO=pa
zs~_Wz08z|ieY5A%$@FcBF9^!1a}m5ks at 7gjn;67N>}S~Hrm`4sM5Hh`q7&5-N{|31
z6x1{ol7Bn<k_m&K*9NkB7ANp6;_WSmra!UL^eY+pz_w5LlB(g$UY9|-AP@zsw4|7-
zi|#>skoViZ<brlX21G1wL@^v%v2P&MSTZc8SKT&&Tq!~%Uw%k^(D<O<S;ewoH)@(b
zb2Z<#wBV6y-?HHFVJFRg^me&@Reg!dys6F1>0GqbLa#kW`Z<Hy>)VCjt1MysKg|rT
zi!?s#<KsBd5lg=VLu4^|xo0%enAx0mMXMSpk0KF_*gOS;jx!zP=@5TPN+S>#Ck>8c
zpi|>$lGlw#@yMNi&V4`6OBGJ(H&7lqLlcTQ&1zWriG_fL>BnFcr~?;E93{M-xIozQ
zO=EHQ#+?<}%@wbWWv23#!V70h9MOuUVaU>3kpTvYfc|LBw?&b*89~Gc9i&8tlT#kF
ztpbZoAzkdB+UTy=tx%L3Z4)I{zY(Kb)eg{InobSJmNwPZt$14aS-uc4eKuY<?xyi!
z`TeGpun(kP^7#~<fX0r^ExRQwveWDF;DOQbL}?LBzt>8h$dtfyxu^a%zA)<y|4;I#
zFU8x7%0eT|Hd@3!T6Anh3IoHrN%@H8e6ge;3u)_$N2H&Rv2`ml6;kL~xS07C5Nzt<
z>>fYI&)@ZXky?^{5>xSC?;w4r&td6vBdi%vHm4=XJH!3yL3?Ep+T5aU_>i;yr_XGq
zxZfCzUU at GvnoIk+_Nd`aky>S&H!b*{A%L>?*XPAgWL(Vf(k7qUS}>Zn=U(ZfcOc{B
z3*tOHH at t5Ub5D~#N7!Fxx}P2)sy{vE_l(R7$aW&CX>c|&HY+7};vUIietK%}!ph<X
z*_6&Ee=)&D at nDa!y{$f<(Q`UdM+|H2ksGEhG7utFYl`Y6pD#+4LC8Hw@6|1H-x{D`
zE$uaNS!i^Rx(%B(My5}1#H73>rCuh+;C at 1usp;XLU<8Gq8P!rEI3<U)y>ieg#W$!=
zQcZr{hp>8sF?k&Yl0?B84OneiQxef-4TEFrq3O~JAZR}yEJHA|Xkqd49tR&8oq{zP
zY@>J^HBV*(gJvJZc_0VFN7Sx?H7#75E3#?N8<p*btH>Z!C+_f53YU}py<FUNWgSuj
zi^M}p>ggxx1?wQi5Yb-_`I`_V*SMx5+*P^b=ec5RON-k1cIlsBLk}(HiaJyab0`CI
zo0{<v3Q5P3 at oM!6@v&t6RJy0OS}M??mGqk1x;(pa`FWA#n+2z37<uPHl{#HvB!^?r
zm9?WOv;Tt(gt*?Pw;;%nF3|I0gDBXPM>=1_LO$~oE2%Tl_}KURuX<`+mQN_sTdM&*
zkFf!Xtl^e^gTy6ON=&gTn6)$JHQq2)33R at _!#9?BLNq-Wi{U|rVX7Vny$l6#+S<va
z%-r+y8D)Cm{5=IM8|<{prj)kZfIZ$NiW0)fE9{-SR)@-;NBJtHk@DI_v*mK(N0#s#
z?S8~jyotdcJJAAUt_;Tr)fa|*cT)~*JZ!c_7yVpSb{r2MllfJDbfI~-7n_#K6lw4G
z^Eyhsh^z8eZs2;adrfk9ip%h;IP|>Z at KvQt@VYb%<9JfapI^b9j=wa+Tqb4ei;8c5
z&1>Uz at lVFv6T4Z*YU$r4G`g=91lSeA<=GRZ!*KTWKDPR}NPUW%peCUj`Ix_LDq!8|
zMH-V`Pv!a~QkTL||L@cqiTz)*G-0=ytr1KqTuFPan9y4gYD5>PleK`NZB$ev at W%t=
zkp)_=lBUTLZJpAtZg;pjI;7r2y|26-N7&a(h<zryrg`J^oeC|8V|qszB+|*eQ-(Dy
zbn*nJ1W|b4-1y?dTI6}3IPMw+-O0;Q at eMMtjjQ+G6QfN3ae61Yd9LfQx_UREWecK4
zMn7A~fOz)be1)Yg{2Ysl9G%s8-h-~@C;ALAL0r=<JP2uCe!T|wAywH1r;F|f_q8N(
zYp^0FkyL9uj<8bK@fyTtgo+DT)14B^<SigcSJotgDV02O!M(CS6_B&^bILwyV?Ng4
zm7WQp?{l<Obhuy=22?5<oQDiM22&u4rZrRVG|L9ABfY{=95aTyd~@a$o~1P#ji`=w
zBKmQqX}r3Nlk9Q|gR7)~#n6AzYk`#!R*d5x`A)hU(!1R1%^zXxNJ(kPCw4htU9^(O
zP4cYV^F(I>X|`1YNM9N8{>8JAu<en5+94bD>v}hp1v`3JHT-=5lbXpbMq7X~2J5Kl
zh7tyU`_AusMFZ{ej9D;Uyy;SQ!4nwgSnngsYBwdS&EO3NS*o04)*j<g2BLf;iAZ2(
z7Key$cc6ey>uAYl;57c2Ly0(DEZ8IY?zSph-kyxu+D`tt at oU{32J#I{vmy=#0ySPK
zA+i(A3yl)qmTz*$dZi#y9FS;$;h%bY+;StNx{_R56Otq+?pGe^T^{5d7Gs&?`_r`8
zD&dzOA|j8 at 3<oPyCd}SOX6AZj_;pT>A&FR5U3*eQNBf<4^4W_iS_()*8b4aaUzfk2
zzIcMWSEjm;EPZPk{j{1>oXd}pXAj!NaRm8{Sjz!D=~q3WJ at vmt6ND_?HI~|wUS1j5
z9!S1MKr7%nxoJ3k`GB^7yV~*{n~O~n6($~x5Bu{7s|JyXbAyKI4+tO(zZYMslK;Zc
zzeHGVl{`iP at jfSKq>R;{+djJ9n%$%EL()Uw+sykjNQdflkJZSjqV_QDWivbZS~S{K
zkE at T^Jcv)Dfm93!mf$XYnCT--_A$zo9MOkPB6&diM8MwOfV?+ApNv`moV at nqn>&lv
zYbN1-M|jc~sG|yLN^1R2=`+1ih3jCshg`iP&mY$GMTcY^W^T`WOCX!{-KHmZ#GiRH
zYl{|+KLn5!PCLtBy~9i}`#d^gCDDx$+GQb~uc;V#K3OgbbOG0j5{BRG-si%Bo{@lB
zGIt+Ain8^C`!*S0d0OSWVO+Z8<kqm;qPrHIJ!qB8;9h5*>9}}O8aFTZ>p&k}2gGCV
zh#<$gswePFxWGT$4DC^8 at 84_e*^KT74?7n8!$8cg=sL$OlKr&HMh@Rr5%*Wr!xoOl
zo7jItnj-xYgVTX)H1=A2bD(tle<tL7^Z!nJ*fwgn&QUe>EH57#V{xAeW_ezISg5OC
zg=k>hOLA^urTH_e6*vSYRqCm$J{xo}-x3 at HH;bsHD1Z`Pzvsn}%cvfw%Q(}h`Dgtb
z0_J^niUmoCM5$*f)6}}qi(u;cPgxfyeV<wtcQgsqG?QDyA@6XXM7siU#+0#mP~AnX
z9f=bMes~9>aaVmOsG<)5`6tzU4wyhF;k|~|x>7-2hXpVBpc5k{L4M`Wbe6Q?tr^*B
z`Y*>6*&R#~%JlBIitlZ^qGe3s21~h3U|&k%%jeMM;6!~UH|+0+<5V-_zDqZQN7<fD
zM2vP&&BMr(%$M51tLpycNES^{gnGn-o~t&>9?n?!Aj!Nj`YMO9?j>uqI9-Tex+nJD
z%e0#Yca6(zqGUR|KITa?9x-#C0!JKJHO(+fy at 1!B$%ZwJwncQW7vGYv?~!^`#L~Um
zOL++>4qmqW`0Chc0T23G8|vO)tK=Z2`gvS4*qpqhIJCEv9i&&$09VO8YOz|oZ+ubd
zNXVdLc&p=KsSgtmIPLN69P7xYkYQ1vJ?u1g)T!6Ru`k2wkdj*wDC)VryGu2=yb0?F
z>q~~e>KZ0d<sP$M^)hrN7IC)eGuv*?pAk#*4fxII<8rIx545 at 9E}-};{IJdo*}!V1
zkUgWQp<TD%7(QQhWkf*vd;SiT1P@}N?jaoKEV?lzqfa1pG1Y^}ikjNMM*Kb?m5(n&
zOz8{+G2z7JatI<J95R%#%#ATAzlwPl$?6)w6WH~ku?(FhO)k1eRlF4I5UqR?T`Iy=
z_bVtkxqs3lQGny-BS%nkzwrXhI_M|P4l_VNVoMjVRoZ*0(JkMQ#AdJLFBj%$oTBx9
z_5|g_ll0@cfLf<j;&lJ>_#7f3UgV%9MY1}vMgF{B8yfE{HL*pMyhYF)WDZ^^3vS8F
zGlOhs%g_~pS3=WQ#494 at jAXwOtr^Y|TnQ5zki>qRG)(oPY*f}U_=ip_{qB0!%w7~G
zWE!P4p3khyW-JJnE>eECuYfI?^d366Shq!Wm#x&jA<tFBO~aWRutYg|6S!-V%dvXb
zjpm3-7^fYCzbWmx*ts$8ECu=f{D#|=T{2_Q?C-SVQTSi8ey{G^D$8U&*bY{vQ$kGG
zq$8)>o>=HdCllE$>DPO0N;y#4G)D2y#B at 5=N=+F%Xo2n{gKcPcK2!hP*^WSXl+ut;
zyLvVoY>VL{H%Kd9^i~lsb8j4>$EllrparEOJNT?Ym>vJa$(P^tOG)5aVb_5w^*&M0
zYOJ`I`}<NkH4X@iCc57jNSqY3D>9}UoSnYg#E(&yyK(tqr^@n}qU2H2DhkK-`2He%
zgXr_4kpXoQHxAO9S`wEdmqGU4j=1JdG!OixdqB4PPP6<nq;ZS)73s_@N{54U_<mt#
zR{@UUroZJ1=lVB~3y%RbLLE=9Mh=pj4wNruVxXLk8pKH)JVr{Hbx`P1XQ>RXA}>GM
zumruUUH|ZG2$bBj)Qluj&uB=dRb)?^qomw?Z$X%#D+Q*O97eHrgVB2*mR$bFBU`*}
zIem?dM)i}raTFDn at 5^caxE^XFXVhBePmH9fqcTi`TLaXiueH=@06sl}>F%}h9H_e9
z>^O?LxM1EjX}NVppaO at NNQr=AtHcH-BU{yBT_vejJ#J)l^cl69Z7$sk`82Zyw7Wxt
z=~J?hZm{f at W}|96FUJfy65Gk8?^{^yjhOahUMCNNpt5DJw}ZKH7b!bGiFY9y6OY&T
z_N)?Jj(MuLTN36ZCJ6<obtKS{VOOSzs>I5Xy7uVlrb$o*Z%=-)kPo9s?<^Yqz~!Z*
z_mP<Y8YDC3(vm~>8(unFq65XSi!$@YtieSQ!<7IEOaA9VkKI?lA`*(nURv<D`3vIl
zzk?RMHDq|}aqs!Q7n{<V(L>fKL8cX}-+~uw9|_5)uC2`ZHca<BJSyCJ7L7R3^ezpJ
zixdU%^Arizo-zh;Lga89_J>eX7L8aG6Ghleg at F9aG%X$#g6^yP5apnB>YTz&EfS{q
z9UVfSyEIczebC)qlVu5cOoMzS_jrC|)rQlAzK7sfiW0`M8mVIohazPE9Jzn*qPt%6
zZL8RELY at L09B83@Be;x5V-IHnn$}{RAT#<2JA%ttlk#^(%u}CGze|1JY5MPhbfnYG
zIw%$XfBmA-<_pKLpGKwbRF$#P;@_)ech#>vj25sv25VM$ouo)?BXdRcO{)*OwTw)G
zv43W~T6ekBMtUD%5Bm>`<n0ehww;K9t*_z=^iZoM2Gjm6Wx6QTWDzOX28g|i7p-G(
znPo(pGb2-Hja^(5g>^Ltv!w4~65N!Ut5twl!Agrzyq4O2Fi3pUMtCU~>9gt_=h-f%
z;1&OuSu?A_sJvIvQ+dZNo3?m1%b1+s&UAx?8sUHEe_sB7zkm4R%6)<@oYB_i5>3Ip
zIA+?jVdX|zL{)?TGpx+=Ta>G80}0}Ax+722$XFNJsC1gcH56{8B)*)eU#r~HrC&}`
z|EWW92&;6y;3}!L5zXa385@?-D%>dSvyK;?jqU2t_R3wvBW;$!j45uQ7tyEIQv<v(
zw)qBpyRhiKBMR9HV)v2ZJdk>a;Db}r&bR3kqNSh)Q_$MJ#Uj3Gj1F;)sO|%6z#@<+
zi{pbYsYS#u`X$Nf($OS+lhw>xgjos1OnF^$-I$u;qhJswhH~p|ab*nO>zBrtb0ndn
zxV0uh!LN`&xckTP+JW}gznSpU492)u+`f{9Yr)js`NmfYH#Wdtradc0TnKNz at Su!e
zu$9}G_=ku;%4xk}eXl>)KgpuT>_<`Ud(A^a++K&pm3LbN;gI}ku@YVrA%FJBZ5$;m
zobR8}OLtW4-i+qPPLS-(7<>M{)rhiPoi@?&vDeVq5%fmZk=mDdRV>Pb-l7pP1y6|J
z8I>sF+TypKV=_<SBxSgNFy at 5`t70+_4F<*(g54PNEt&4u%OoVR^n+$TL)qKdP6c)n
z-CoP*_kXZ4vBsj8M^2Y0nDq-^4r-wgu2Y-3fmi6ooPIXTI%UdJhw@7KgR=N+Vl3NO
zcl8-&i~^e%3E1G+u&^#M&5!sI)la$uQ2y&KsaZjx^r8D68BTZd^NrAV{0u$=#SH#4
zLE2)q%<UADH&I$um|>^NwBU^>4JJq<*14GLfM2*XQzYdlqqjnE)gZsPW^E@mp&ww*
zW9i>XL=uwLVZ9pO*8K>t>vdL~Ek_NUL$?LQi5sc#1Q-f6-ywKcIT8Kw?C<o*=Aa~-
z*eA0Mgmu5-j8rTh^;={1$#X=Ck5Gk;@KK#haYa^sXr0^_^Q84%+WOl3?#Mc#{{d}B
z>(_3pbR`e|)%9S-({if|E+hR2W!&qfQ&UiF^I!|M#xhdWsen<tq75@@WHX{+T3S~F
znoMw2v{^ia4`fkd=3p<6XkL)!lsI%8iq@>v^wpKCBiuxXbnp85`{i|;BM?Ba`lqTA
zyRm=UWJl&E{8JzYDHFu>*Z10-?#A8D|5jW9Ho0*CAs0fAy~MqbwYuOq9jjt9*nuHI
zbDwKvh)5Ir$r!fS5|;?Dt>V+ at F*v8=TJJF)TdnC#Mk>+tGDGCw;A~^PC`gUt*<(|i
zB{{g{`uFehu`$fm4)&k7`u{xIV)yvA(%5SxX9MS80p2EKnL<HSdiWFiAy=3UmV-rj
zc%^|o`X!t!vuYErrUzbG?ostY(qs7GE^=Z33k*P+F6r($h_?W-bHJ|GUK at Wlv9++M
zG}?Z?8{_X${_c9aOXw4qfk0vTaVRH6FMOnFD?w|zo{zKKg$8wzW&yufWk&idB=+9!
z^dTI@g=>t<HJ%Cd%{u~X`lRpMFg&X{m?Nw#T4cg*?z{+rC($M4z9RHV at 8KoueD7_)
z8T@i-6RG$5%_Y`lSjj|?wSvITK5c4g0!Uq49VAn-H<9~;vn7~hBdYuDOt2$gtNuBm
zo8$Y{2lwMxZNbfb$Hm0T528Og7Jfl!35edSr>CZ>tlX>*Z6nd&6-<c}7z{sZ9V^Ux
zMNgR3$iH97>Mv$5rHD*<Fmux@1NkgiA%VmyOAwal{&*L*?*@Cl?&!jtcf3KL{{|8z
z_($$R;SoAei#gUO@=7)M7s~2aAxJ>db;&IBK3KH&M<+ArlGXDRdX1VVO4)&R$f4<g
z`M~bg9+=(|cc^a3vB10?3GZiq$o|Zromh?lE2%m!alG4CIrvmRZHZVSM>NxXI>GBh
zSv|h>5GDAI(4E`@F?En<q4iBUtn-fux#Jt=qU6#PBE4-GhP)}OK!CI;i(sJ6^VIJF
zwJMEAeGKMb_^`VbA1hFYio)roSCrLG-NL5Yqhb{sh3_zt(Zg93UP*;!m?}k&V`1AB
zNYPri&yVkXW8uO1geXM3Oj&$G%~#Jd%h;?JDKwrq;P+!t&4W1Z^1?Ikguvk#bK?Bx
z$w5M*LxgRe=jz?UiDBbfC1I3!cjeMD*ueh4W0S*z6=TAf+ZYkG$}FGti`ipjpIK>W
zS>#c&Gw6~_XL`qQG4bK`W*>hek4LX*efn6|_MY+rXkNyAuu?NxS%L7~9tD3cn7&p(
zCtfqe6sjB&Q-Vs7BP5+%;#Gk};4xtwU!KY0XXbmkUy$kR9)!~?*v)qw00!+Yg^#H>
zc#8*z6zZo>+(bud?K<*!QO<vKd$8TBt^HLIw%iB>4ehiTCK&PD4G&n)Tr9X_3r-we
z?fI+}-G~Yn93gI6F{}Dw_SC*FLZ)5(85zp4%uubtD)J)UELLkvGk4#tw&Tuss<g@J
zd3(n+h;=s-joD7pea}*kl|?T5<3W!rK}V)#HpvFL3uRc{oe_mV<z1l~^m1_TkJDu3
z;JtNs6#g&&@E09TG{#Z`zh|EKwRTiJr)s50$5?Nrhn68HAr=rV#m>a)mTD$R2&O~{
zCI3>fr-!-b at EGRI%g0L8UU%%u_<;e9439JNV;4KSxd|78v+I+8^rmM<g+mx0&Si$a
zgf1uYC03KcCN)Lz!>f3f40Jb}wEszROD?xBZu>Ll3;sUIoNxDK3|j3*sam2tC@@e$
z^!;+AK>efeBJB%ALsQ{uFui)oD<x}JL&L^@dTz{b&_?*nsS;lNnoJ@(k9d5xVq$|w
z<ejC>oq()2USi?n=6C3#eetz?wPswc={I<8x=(8lE4EIsUfyGNZ{|KYn1IR|=E==f
z(;!A5(-2y^2xRFCSPqzHAZn5RCN_bp22T(KEtjA(rFZ%>a4 at STrHZflxKoqe9Z4@^
zM*scx_y73<sFS1_?6+u!sT9fvjld*kU~edMy>?Q{<Kw(x)TAd1JfBpLz7(Nk)Jsdz
zj7#eyM{0^=a(C#N_pwZ(&^&zZP@5Qw`oUBRW0i<S2ql<0tEs~>vt6?~WEl?2q*;@8
z3M*&@%l)SQmXkcUm)d at GT2#JdzhfSAP9|n#C;$E8X|pwD!r#X?0P>0ZisQ~TNqupW
z*lUY~+ikD`vQb?@SAWX#r*Y+;=_|oacL$2CL$^(mV}aKO77pg}O+-=T1oLBT5sL2i
z42Qth<Jh0Ysw=K%u7GarF`3bIM1>2+0 at C`c+*D0*5!qy26sis<9a7>LN2{z%Qj49t
z=L at x`4$ALHb*3COHoT?5S_c(Hs}g!V>W^=6Q0}zaubkDn)(lTax0+!+%B}9Vqw6{H
zvL|BRM`O<@;eVi1DzM!tXtBrA20Ce@^Jz|>%X-t`vi-%WweXCh_LhI#bUg2*pcP~R
z*RuTUzBKLXO~~uMd&o$v3 at d0shHfUjC6c539PE6rF&;Ufa(Rw at K1*m7?f5)t`MjH0
z)_V(cajV5Am>f!kWcI at 5rE8t6$S>5M=k=aRZROH6fA^jJp~2NlR4;Q2>L$7F#RT#9
z>4 at 1RhWG`Khy>P2j1Yx^BBL{S`niMaxlSWV-JBU0-T9zZ%>7mR3l$~QV$({o0;jTI
ze5=cN^!Bc2bT|BcojXp~K#2cM>OTe*cM{Kg-j*CkiW)EGQot^}s;cy8_1_ at JA0Whq
zlrNr+R;Efa+`6N)s5rH*|E)nYZ3uqkk2C(E7 at A|3YI`ozP~9Lexx#*1(r8luq+YPk
z{J}c$<WQa$CfVIhsE>s`<i2`cEPYHzF!ZIy?L$}MhAPFqQe at _8Lh#cQAH~-zZ5p$u
zZauEKr<oluR2T6z2A|B^#roi2jr3F<X4&!ZjiXo?9nIbJ4iAii=A_@&#n$TqH^#R&
z{$qMQO7u^&7KEB6l{H~A;ylPsJw2kA4#E2@7dO%lsi+3{VJ4?~e4(Bz-tw&^YR9P1
zTlpCH(W_%+@#|?%RN0HM=U?pU5$E2f<RPK1fw%3KLs--hd|lj})1h|Y<6CA3NsuSI
zl=<<g*vcJW=6yZY`aXe5QUB~awgg5fxlu%7u#A8=UXt61U-7wGtR{L&XvKbUf-}PL
z<eXA6<<r^;=`XwtFN1~2J^$Y${#Q0Tyev?j!*Z4q^mjQ4ah)uW_s=JkrRS%l*Ut`>
zPM35Fx(YWB3Z5IYnN+L_4|jaR(5iWJi2~l&xy}aU7kW?o-V*6Av2wyZTG!E2KSW2*
zGRLQkQU;Oz##ie-Z4fI)WSRxn$(ZcD;TL+;^r=a4(G~H3ZhK$lSXZj?cvyY8%d9JM
zzc3#pD^W_QnWy#rx#;<pgDoauRid_B6w$J6XKKeAcZHU9rH9=s!y`%~e@hGc<c#A7
zRRTR`&dt`*;~VYcVGk-~aNB!?q#4B&%52?dI@=%LQ>c&N at sqHhrnHRmj<I9Tx4aSD
zVUQ}9lh=Kd&QIx0uCqYm3pFs_*L;b|$xyZks(AAwgYsH85PAL~ndH7DNUoZKBHCWu
z_<;@&ed^tpoO=DG4Hem|2>#i;s%zLm6SE(n&BWpd&f7>XnjV}OlZntI70fq%8~9<7
zMYaw`E-rp49-oC1N_uZTo)Cu%RR2QWdHpzQIcNsoDp`3xfP+`gI?tVQZ4X={qU?(n
zV>0ASES^Xuc;9JBji{)RnFL(Lez;8XbB1uWaMp at p?7xhXk6V#!6B at aP4Rz7-K%a>i
z?fvf}va_DGUXlI#4--`A3qK7J?-HwnG7O~H2;zR~RLW)_^#La!=}+>KW#anZ{|^D3
B7G?kd

literal 0
HcmV?d00001

diff --git a/docs/images/glyphicons-halflings.png b/docs/images/glyphicons-halflings.png
new file mode 100644
index 0000000000000000000000000000000000000000..a9969993201f9cee63cf9f49217646347297b643
GIT binary patch
literal 12799
zcma*OWmH^Ivn@*S;K3nSf_t!#;0f+&pm7Po8`nk}2q8f5;M%x$<L>SdAkd9FAvlc$
zx660V9e3Ox at 4WZ^?7jZ%QFGU-T~%||Ug4iK6bbQY at zBuF2$hxOw9wF=A)nUSxR_5@
zEX>HBryGrjyuOFFv$Y4<+|3H at gQfEqD<)+}a~mryD|1U9*I_FOG&F%+Ww{SJ-V2BR
zjt<81Ek$}Yb*95D4RS0HCps|uLyovt;P05hchQb-u2bzLtmog&f2}1VlNhxXV);S9
zM2buBg~!q9PtF)&KGRgf3#z7B(hm5WlNClaCWFs!-P!4-u*u5+=+D|ZE9e`KvhTHT
zJBnLwGM%!u&vlE%1ytJ=!xt~y_YkFLQb6bS!E+s8l7PiPGSt9xrmg?LV&&SL?J~cI
zS(e9TF1?SGyh+M_p@o1dyWu7o7_6p;N6hO!;4~<t3w3SV570<|$VWNPP~TbX3|=X>
z2B`I;y`;$ZdtBpvK5%oQ^p4eR2L)BH>B$FQeC*t)c`L71gXHPUa|vyu`Bnz)H$Z<N
z7UVAHFsR+HLO+(tK~=M@pM7ZMPj5gkz>cXGve(}XvR!+*8a>BLV;+ryG1kt0=)ytl
zNJxFUN{V7P?#|Cp85QTa@(*Q3%K-R(Pkv1N8YU*(d(Y}9?PQ(j<e|z%-Bnrh*J1R%
z%JAF*cdp#Zk#h09fv12$TuGUsX=V-wgNcEGe0hhp%mK8EVPi6@!a;xi$k!wcIO|bJ
zPx8DZ*0Y(ggKhnp2=Ax#f<wKp{=pA29>;NzWoEVWRD-~H$=f>j<LsfOZ;WLF*F0cm
z9PSRSlSFQE>9~PN^BM2okI(gY-&_&BCV6RP&I$FnSEM3d=0fCxbxA6~l>54-upTrw
zYgX@%m>jsSGi`0cQt6b8cX~+02IghVlNblR7eI;0ps}mpWUcxty1yG56C5rh%ep(X
z?)#2d?C<4t-KLc*EAn>>M8%HvC1TyBSoPNg(4id~H8JwO#I)Bf;N*y6ai6K9_bA`4
z_g9(-R;qyH&6I$`b<fg~;S@}+8_8-ItZ!TS<!|pei*+CWiVH?M1CEFM{ij_eP4dL+
zsn%eDn^Kp7vLEn|Dq0`Wt&GpZ?eq^%pqXVR^PA!ZyoGLI7ihDaWiNi$M6h)PNwvHR
zEcA82H5fM6RnpZ!R872>42v|0V3Z8IXN*p*8g$gE98+JpXNY+jXxU0zsR^W$#V=KP
z3AEFp at OL}WqwOfsV<)A^UTF4&HF1vQecz?LWE@p^Z2){=KEC_3Iopx_eS42>DeiDG
zWMXGbYfG~W7C8s@@m<_?#Gqk;!&)_Key@^0xJxrJahv{B&{^!>TV7TEDZlP|$=ZCz
zmX=ZWtt4QZK<Y>x**)lQQoW8y-XLiOQy#T`2t}p6l*S`68ojyH at UXJ-b~@tN`WpjF
z%7%Yzv807gsO!v=!(2uR)16!&U5~VPrPHtGzUU?2w(b1Xchq}(5<TwC<%h0ow%K}h
zTlz}37c^dc?7rEmt7Zy9#q|V+5bE1c06?X{e~%TDZ!@uG_uU!n6VJy=odWKS?p#j?
zn;v){i#`+1X;Ls^(9p!?42vli(fu1D-%nf?-3VKCs1JT^-;{Pg82EGZ&|T}A#wtP(
zR^df|3P4JZ0|weuCV=JopL6MLvYycbd;-Xx_r)Hm1~(2>Ed^G|SD7IG+kvgyVksU)
z(0R)SW1V(>&q2nM%Z!C9=;pTg!(8pPSc%H01urXmQI6Gi^dkYCYfu6b4^tW))b^U+
z$2K&iOgN_OU7n#GC2jgiXU{caO5hZt0(>k+c^(r><#m|#J^s?zA6pi;^#*rp&;aqL
zRcZi0Q4HhVX3$ybclxo4FFJW*`IV`)Bj_L3rQe?5{wLJh168Ve1jZv+f1D}f0S$N=
zm4i|9cEWz&C9~ZI3q*gwWH^<6sBWuphgy@S3Qy?MJiL>gwd|E<2h9-$3;gT9V~S6r
z)cAcmE0KXOwDA5eJ02-75d~f?3;n7a9d_xPBJaO;Z)#@s7gk5$Qn(Fc^w@9c5W0zY
z59is0?Mt^@Rolcn{4%)Ioat(kxQH6}hIykSA)zht=9F_W*D#<}N(k&&;k;&gKkWIL
z0Of*sP=X(Uyu$Pw;?F@?j{}=>{aSHFcii#78FC^6JGrg-)!)MV4AKz>pXnhVgTgx8
z1&5Y=>|8RGA6++FrSy=__k_imx|z-EI at foKi>tK0Hq2LetjUotCgk2QFXaej!BWYL
zJc{fv(&qA7UUJ|AXL<Te#svgLe$GRVt~C0`%AZ+-=S0D^On=i42k@^tJ-LZGdLpRi
zdrV5?>c5z*_NW#yWzKtl(c8mEW{A>5Hj^gfZ^HC9lQNQ?RowXjmuCj4!!54Us1=hY
z0{@-phvC}yls!PmA~_z>Y&n&IW9FQcj}9(OLO-t^NN$c0o}YksCUWt|DV(MJB%%Sr
zdf}8!9ylU2TW!=T{?)g-ojAMKc>3pW;KiZ7f0;&g)k}K^#HBhE5ot)%oxq$*$W at b#
zg4p<<e2}@}ZtI091*fR6EHmhc2JFT&S+9NWaDJ!A80$GFF7R`A%xl6?3MWwFH)kiY
zKkO7P(Y}AIYl!b at wU{Hfoy`qG`h+F#SJJ{&-s<{+@b9bRRm+2<>Ou`ME|Kd1WHK at 8
zzLD+0(NHWa`B{em3Ye?@aVsEi>y#0XVZfaFuq#;X5C3{*ikRx7UY4FF{ZtNHNO?A_
z#Q?hwRv~D8fPEc%B5E-ZMI&TAmikl||EERumQCRh7p;)>fdZMxvKq;ky0}7IjhJph
zW*uuu*<F&)uV|73Nr>(Y6)S;Od--8uR^R#sb$cmFCnPcj9PPCWhPN;n`i1Q#Qn>ii
z{WR|0>8F`vf&#E(c2NsoH=I7Cd-FV|%(7a`i}gZw4N~QFFG2WtS^H%@c?%9UZ+kez
z;PwGgg_r6V>Kn5n(nZ40P4qMyrCP3bDkJp at hp6&X3>gzC>=f at Hsen<%I~7W+x@}b>
z0}Et*vx_50-q at PIV=(3&Tbm}}QRo*FP2@)A#XX-8jYspIhah`9ukPBr)$8>Tmtg&R
z?JBoH17?+1 at Y@r>anoKPQ}F8o9?vhcG79Cjv^V6ct709VOQwg{c0Q#rBSsSmK3Q;O
zBpNihl3S0_IGVE)^`#94#j~$;<ISbQ+zLM8Q_sWpD4<&Sicl|!a~&A@PH`UFRr4^t
zSjAA>7+u870yWiV$@={|GrBmuz4b)*bCOPkaN0{6$MvazOEBxFdKZDlbVvv{8_*kJ
zfE6C`4&Kkz<5u%dEdStd85-5UHG5IOWbo8i9azgg#zw-(P1AA049hddAB*UdG3Vn0
zX`OgM+EM|<+KhJ<=k?z~WA5waVj?T9eBdfJGebVifBKS1u<$#vl^<Wg*!!OoyJ@GG
z%+_%2Ex-A(=Z(Bs6q~agBwBL+Pcns5yTYUCI_zEv3JOnOB;7f=h8xGf|IQl+Qw37#
z{BhR?wjaFo)FpPNNRkn616I`fE=rl+<Vv=sXw)oTB*nsxZd}^hq|lwuLq2tPYK9Ch
zP~rW|kx{-S+q;ojdznAWu9)x>BvSg)xsnT5Aw_ZY#}v*LXO#htB>f}x3qDdDHoFeb
zAq7;0CW;XJ`d&G*9V)@H&739DpfWYzdQt+Kx_E1K#Cg1EMtFa8eQRk_JuUdHD*2;W
zR~XFnl!L2A?48O;_iqCVr1oxEXvOIiN_9CUVTZs3C~P+11}ebyTRLACiJuMIG#`xP
zKlC|E(S at QvN+%pBc6vPiQS8KgQAUh75C0<L{Rx=;M-*LCs2Bp<jfOoZepIeH1&E9@
zECcRp6~TSaxo9}VYr%Om){SqtW<MPRfw2-K1_c9&KORpSyh3Z*9=_y`d-Pn0_zAw+
z=kYI%Xg`=LN{&qw<HTtk2MKE0r;WoX$l}>a2xcPQDD$}*bM&z~g8+=9ltmkT$;c;s
z5_=8%i0H^fEAOQbHXf0;?D<BP;<HVQI1JZt*v)6RAq&gagO^!F$spXEh)>N5z-5+1
zDxj50yYkz4ox9p$HbZ|H?8ukAbLE^P$@h}L%i6QVcY>)i!w=hkv2zvrduut%!8>6b
zcus3bh1w~L804EZ*s96?GB&<V5y;va8bgv&LhJ<YYLxjoJ6PJ;r2T$n2GZZ+&blBq
zN@;fP%v^kz^?uH{Kpq(Ih{eCW5OnE5%HakzY6sMl!wfw!(lBl{oyDuNM|bEKU#YtR
zTTK?n-{?&5Szx)y^~WKl(fG>F7c5?m?|t$-tp2rKMy>F*=4;w*jW}^;8v`st&8)c;
z2Ct2{)?S(Z;@_mjAEjb8x=qAQvx=}S6l9?~H?PmP`-xu;ME*B8sm|!h at BX4>u(xg_
zIHmQzp4Tgf*J}Y=8STR5_s)GKcmgV!<zLBv<JCu*R*$7_b_L{9GvwPbpvkT at 1&MS$
zijYfuLM?Pa-BA2}iX9A(2K)AF@cP6QkvvCLyswdDf?LI~tZ|qKPtWR#^oamFBRcUk
zs5b$Sc+=%VrL*7Ba(pp>$JKTg at LO402{{Wrg>#D4-L%vjmtJ4r?p&$F!o-BOf7ej~
z6)BuK^^g1b#(E>$s`t3i13{6-mmSp7{;QkeG5v}GAN&lM2lQT$@(aQCcFP(%UyZbF
z#$HLTqGT^@F#A29b0HqiJ<ZOKS1P#S0IU6AksffR*wx4ca5r>sRJAlh8kngU`BDI6
zJUE~&!cQ*&f95Ot$#mxU5+*^$qg_DWNdfu+1irglB7yDglzH()2!@#rpu)^3S8weW
z_FE$=j^GTY*|5SH95O8o8W9FluYwB=2PwtbW|JG6kcV^dMVmX(wG+Otj;E$%gfu^K
z!t~<3??8=()WQSycsBKy24>NjRtuZ>zxJIED;YXaU<x|u=Vd7uuZ|>z$@0z4rl+TW
zWxmvM$%4jYIpO>j5k1t1&}1VKM~s!<EQ6q8U;EP6<gFYZ!m%POxUBC$P89e*7OnrM
zdWQA)CjX#LYDI-i*mnQZr;sN<6@SPOXNM}9Rp_hcE;y>eLsCVQ`TTjn3JRXZD~>GM
z$-IT~(Y)flNqDkC%DfbxaV9?QuWCV&-U1yzrV at 0jRhE;)ZO0=r-{s at W?HOFbRHDDV
zq;eLo+wOW;nI|#mNf(J?RImB9{YSO2Y`9825Lz#u4(nk3)RGv3X8B(A$TsontJ8L!
z9JP^eWxtKC?G8^xAZa1HECx*rp35s!^%;&@Jyk)NexVc)@U4$^<D$wmm?XpH-Sg4*
z8B^w;<H>X1Dag6`WKs|(HhZ#rzO2KEw3xh~-0<;|zcs0L>OcO#YYX{S<TTw)*(lZC
zIx888OkDY0a@=pFP3fhTGE0#kua@EqJ8hp4VSNt-Xfx&Iq8mr)#UbJIBdW*?_9fdi
z7f!0)Iy{xeM7LDi+*QJ?BdGeD5e0(0aSm&GvjQ!V6CD0we*R)~MbsZ|>N8m6`9pp+
zQG at q$I)T?aoe#AoR@%om_#z=c at ych!bj~lV13Qi-xg$i$hXEAB#l=t7QWENGbma4L
zbBf*X*4oNYZUd_;1{Ln_ZeAwQv4z?n9$eoxJeI?lU9^!AB2Y~AwOSq67dT9ADZ)s@
zCRYS7W$Zpkdx$3T>7$I%3EI2ik~m!f7&$Djpt6kZqDWZJ-G{*_eXs*B8$1R4+I}Kf
zqniwCI64r;>h2Lu{0c(#Atn)%E8&)=0S4BMhq9$`vu|Ct;^ur~gL`bD>J at l)P$q_A
zO7b3HGOUG`vgH{}&&Agr<FnKy|IF(G1iR*`GW247VX<aAlJ2F?Q<={Aib+`}_HyE*
zujP5~Z9 at I2PBhiOY}cNA6jXAuIimavj#$XIs@HezE!U24{*GtAdHFvr(O>Fy%K^>?
z>wf**coZ2vdSDcNYSm~dZ(vk6&m6bVKmVgrx-X<>{QzA!)2*L+HLTQz$e8UcB&Djq
zl)-%s$ZtUN-R!4ZiG=L0#_P=BbUyH+YPmFl_ogkkQ$=s at T1v}rNnZ^eMaqJ|quc+6
z*ygceDOrldsL30w`H;rNu+I<VKUrjL=bDy~WtS;;K#ThRGVRMNFq&Gco*pd+ChOJI
zqAbbk-&kSt%3!MCpue~I%|gblH{=P#-)jqQC%xCp|J^jUO>jlS+G~p&0SawXCA1+D
zC%cZtjUkLNq%FadtHE?O(yQTP486A{1x<{krq#rpauNQaeyhM3*i0%tBpQHQo-u)x
z{0{&KS`>}vf2_}b160XZO2$b)cyrHq7ZSeiSbRvaxnKUH{Q`-P(nL&^fcF2){vhN-
zbX&WEjP7?b4A%0y6n_=m%l00uZ+}mCYO(!x?j$+O$*TqoD_Q5EoyDJ?w?^UIa491H
zE}87(bR`X;@u#3Qy~9wWdWQIg1`cXrk$x9=ccR|RY1~%{fAJ at uq@J3e872x0v$hmv
ze_KcL(wM|n0EOp;t{hKoohYyDmYO;!`7^Lx;0k=PWPGZpI>V5qYlzjSL_(%|mud50
z7#{p97s`U|Sn$WYF>-i{i4`kzlrV6a<}=72q2sAT7Zh{>P%*6B;Zl;~0xWymt10Mo
zl5{bmR(wJefJpNGK=fSRP|mpCI-)Nf6?Pv==FcFmpSwF1%CTOucV{yqxSyx4Zws3O
z8hr5Uyd%ezIO7?PnEO0T%af#KOiXD$e?V&OX-B|ZX-YsgSs%sv-6U+sLPuz{D4bq|
zpd&|o5tNCmpT>(uIbRf?8c}d3IpOb3sn6>_dr*26R#ev<_~vi)wleW$P<Wyn_7n0-
zl)LIgF0z;$xTz(0JgW0t|K0{|pl+d7{+{fAW)lB*Qg({z1~qrplnmDSP!2>X|5)$_
z+_|=pi(0D(AB_sjQ;sQQSM&AWqzDO1 at NHw;C9cPdXRKRI#@nUW)CgFxzQ1nyd!+h&
zcjU!U=&u|>@}R(9D$%lu2TlV>@I2-n at fCr5Pr<dtPlfA<Z*`%$WS?W!M7-X at Sw}lf
zu7sLkI`BK6gTBwv0nqdk^SqiGBO}U16-Ky}DlzfpVxxnEAc|MG(;#A7b;H&MP*riE
zHr?l)sap(Q`P6U_@Ov18QJwI7yr|=6Y+TbD2PUEPfsh&V{s?8AA2dT>ZNVyKWR7hm
zWjoy^<!R*J%IXEk=E5cj6b=;i9u3uQuMH4{qOT^=OGnt_=n2>p7v8m#$qN0K#8jT-
zq`mSirDZDa1Jxm;Rg3<Jf$!Bj9`<kE;Sz+T_M)m3-f__2l^&CsYnIwV?+%t2FG{Ta
zI-67-X7Fu-xbrdN@cn6z3_k9VZ?2i{<ie%nx)UUiUTLNtHEK)0HD_qUYpV0X30}z?
zM!*@omRu>rAPhC)LcI4 at -RvKT+@9&KsR3b0_0zuM!Fg7u>oF>3bzOxZPU&$ab$Z9@
zY)f7<va9`_LvY6!5H@PMYi?(=yM97@*rbrsB=oh`t5ydnN2A;15DysI3n?zsE3{ZX
zq+yK*u5H1rVq8mwv!|dvE&PWazz!0^LY7dozu5qaS3Q5~q}uAQUJN5WW+A&wvpho?
z=!z1Q9;>pKh22I7ZykL{YsdjcqeN++=0a}elQM-4;Q)(`Ep3|VFHqnXOh14`!Bus&
z9w%*EWK6AiAM{s$6~SEQS;A>ey$#`7)khZvamem{P?>k)5&7Sl&&NXKk}o!%vd;-!
zpo2p-_h^b$D<fdz<@`H3n|HeSVR76K at 6|_9&-VHAVO=;`v1rN8I|9P)PS7vp83efu
z`yTr9OVLz|?h*IHce7sdT@Ktb#!>NBO>{h4JdGB=D>fvGIYN8v&XsfxU~VaefL?q}
z3ekM?<wNDtI4J<DC6XBgM26Nv#0iut=ZwA#^>iOKkCzQHkBkhg=hD!@&(L}FcHKoa
zbZ7)H1C|lHjwEb at tu=n^OvdHOo7o+W`0-y3KdP#bb~wM=Vr_gyoEq|#B?$&d$tals
ziIs-&7isBpvS|CjC|7C&3I0SE?~`a%g~$PI%;au^cUp at ER3?mn-|vyu!$7MV6(uvt
z+CcGuM(Ku2&G0tcRCo7#D$Dirfqef2qPOE5I)oCGzmR5G!o#Q~(k~)c=LpIfrhHQk
zeAva6MilEifE7rgP1M7AyWmLOXK}i8?=z<j)TsCg#MI>2;N=no)`IGm#y%aGE>-FN
zyXCp0Sln{IsfOBuCdE*#@CQof%jzuU*jkR*Su3?5t}F(#g0BD0Zzu|1MDes8U7f9;
z$JBg|mqTXt`muZ8=Z`3wx$uizZG_7>GI7tcfOHW`C2bKxNOR)XAwRkLOaHS4xwlH4
zDpU29#6wLXI;H?0Se`SRa&I_QmI{zo7p%uveBZ0KZKd9H6 at U?YGArbfm)D*^5=&Rp
z`k{35?Z5GbZnv>z at NmJ%+sx=1WanWg)8r}C_>EGR8mk(NR$pW<-l8OTU^_u3M at gwS
z7}GGa1)`z5G|DZirw;FB@VhH7Dq*0qc=|9lLe{w2#`g+_nt<uBB~iQoK%j+BR{KW$
zxUoEE;u<56rl_>>_%o<~9(VZe=zI*SSz4w43-_o>4E4`M at NPKTWZuQJs)?KXbWp1M
zimd5F;?AP(LWcaI-^Sl{`~>tmxsQB9Y$Xi*{Zr#py_+I$vx7 at NY`S?HFfS!hUiz$a
z{>!&e1(16T!Om)m)&k1W#*d#GslD^4!TwiF2WjFBvi=Ms!ADT)ArEW6zfVuIXcXVk
z>AHjPADW+mJzY`_Ieq(s?jbk4iD2Rb8*V3t6?I+E06(K8H!!xnDzO%GB;Z$N-{M|B
zeT`jo%9)s%op*XZKDd6*)-^lWO{#RaIGFdBH+;XXjI(8RxpBc~azG1H^2v7c^bkFE
zZ<!d@6;Xr=zrz^$h_Zbcf~Z$lrrBw0nL?BbB`hkkx&01qcs_@(`dj5M$3rI2JKgsr
zS^x~?G~LTF&PL>CVPE+E*Q=FSe8Vm&6|^3ki{9~qafiMAf7i4APZg>b%&5>nT at pHH
z%O*pOv(77<h_P}M1fVl at bA%;8!%G$2v2^1K;a|J|258iaFK<JsY+PvseEryJp$5<!
z9lXGNp5qrv`T=s~_@3Ry-B6o<m;T-lQtjLZ)m`X2mKrN#6`?5SI5G#qCc`>?ZiT{W
zBibx}Q12tRc7Py1NcZTp`Q4ey%T_nj@<r4RLoFiQ1cOG!U!@-f&DrHzjFreg6r@E|
zvE{2Q=kFJS$gwo*FVtl=epg~LzgZ(&E7V*y3ct|~AGvI-3JcYr{%DF#=;?cH6~ge-
zxOld^6>1WKg5Fz_Rjl4wlJQj)rtp8yL3r!S<K<bid;Q+mY&EMZN}!KaieT~EVI>hy
zvZvnmh!tH4T6Js-?vI0<-rzzl{mgT*S0d_7^AU_8gBg^03o-J=p(1o6kww2hx|!%T
z-jqp}m^G*W?$!R#M%Ef?&2jYxmx+lXWZszpI4d$p<r;|3!?@3AW<2Zgi0<hN9ff)N
z(zo6I+-$9Bx*(c$-bk0EGqBsb91nmH7yrN`CVj(QCaD{RJgvV-JPkoBQAwGD;nyzn
z*I;L?L=(3oeAQ<rjW4NvWy!bHdLOHMjezGb#Hb+lSX`#>UN`(S)|*c^CgdwY>Fa>>
zgGBJhwe8y#Xd*q0=@SLEgPF>+Qe4?%E*v{a`||luZ~&dqMBrRfJ{SDMaJ!s_;cSJp
zSqZHXIdc@@XteNySUZs^9SG7xK`8=NBN<V=E)OCgg+S0s%X at m8dOqs;y*2U#C_D)u
z81;Mt5p^uC3PVJP at 9PH9!<3b5IE^n;kwm}NvP7!(7^P%;1DOYVJumd1Eg9zSvb at M<
z=8_n~reVNX{Rwy18un@y&;emesWi1XQooSmDu!<kFo)-HRP5pn?;0r-+4i~5mY$28
z(;>M)fRVOjw)D^)w%L2OPkTQ$Tel-J)GD3=YXy+F4in(ILy*A3m at 3o73uv?JC}Q>f
zr<Ie&tGbM^0N<roTuDj*?S_O(I}B&He=e8Pl8`tjGg-O~5%TUI<1yQ05r*$Oc2#s#
z8%FWrdDtn79-cwa2pX4M_-JFx9zK7mChDM?zK(~_K9>Y&8SWmesiba0|3X-jmlMT3
z*ST|_U at O=i*sM_*48G)dgXqlwoFp5G6qSM3&%_f_*<qxyINw1$We6It<0I>n!P<uj
z?87vdPOI3mk{cGX^R<>iT>?cNI)fAUkA{qWnqdMi+aNK_yVQ&lx4UZknAc9FIzVk%
zo6JmFH~c{_tK!gt4+o2>)zoP{sR}!!vfRjI=13!z<fc;{t9y2@_q+%poab^!jwREr
z2+#Zf9d~36snX-iZ(5U>5}ijMFQ4a4?QIg-BE4T6!#%?d&L;`j5=a`4is>U;%@Rd~
zXC<xcC%fK=hCSNPW&)8o$8W+KO-SU#5LbV{{RyL+099LpC;6!uxU&{MmE<Y{b<h52
z$81YnCmIWu(0dlOntRk)&>~H7eGQhhYWhMPWf9znDbYIgwud(6$W3e>$W4$~d%qoJ
z+JE`1g$qJ%>b|z*xCKenmpV$0pM=Gl-Y*LT8K+P)2X#;XYEFF4mRb<YTI|Oo*wqC5
z0h9Vcyd1-aYw_k;tVodW95W2hdEX}FLSrp|R+GE56fkm-P)-t$V)|A=l7x|mefFZC
zXMAilrJt8o)%dz@>c~jj?DM@(1e`nL=F4Syv)TKIePQUz)bZ<lVCgA$*!Fmgxl6o%
zjdFR@&JKgonL5u$SS;U)hR2JO%(X!<3`;2ma}g7i__wVr1m~_yKAfNhm3c!NlBG8F
zi*)rX!5cY!j#B&Bh5F)#rbPS@4QDD~@ulB?(x|5|p4JWn*dAG|<;_kq<4J3{W|V%$
zFux+io?Ym>?Bi3 at G@HO$Aps1DvDGkYF50O$_welu^cL7;vPiMGho74$;4fDqKbE{U
zd1h{;LfM#Fb|Z&uH~Rm_J)R~Vy4b;1?tW_A)Iz#S_=F|~pISaVkCnQ0&u%Yz%o#|!
zS-TSg87LUfFSs{tTuM3$!06ZzH&MFtG)X-l7>3)V?Txuj2HyG*5u;EY2_5vU0ujA?
zHXh5G%6e3y7v?AjhyX79pnRBVr}RmPmtrxoB7lkxEzChX^(vKd+sLh?SBic=Q)5nA
zdz7Mw3_iA>;T^_Kl~?1|5t%GZ;ki_+i>Q~Q1EVdKZ)$Sh3LM at ea&D~{2HOG++7*wF
zAC6jW4>fa~!Vp5+$Z{<)Qxb|<doy+ePfu6oC(7$`&WuO0q0$+a9a%yz_{5phPWBz7
zW*;>{unMgCv2)@%3j=7)Zc%U<^i|SAF88s!A^+Xs!OASYT%7;Jx?olg_6NFP1475N
z#0s<@E~FI}#LNQ{?B1;t+N$2k*`K$Hxb%#8tRQi*Z#No0J}Pl;HWb){l7{A8(pu#@
zfE<FZzTROa?{|??!(1M&=4t#qdoS<^Na+oYIxC;QnUK0am at X-v$)ut<3yca1@z&t9
zM)d{X_R6>-OTvEreoz1+p`9sUI%<waswQ*s(MUS7r-ADfL?@KW0)mbJ;|S&qT$0vX
z+3A>Y{e5L-oTP_^NkgpYhZjp&ykinnW;(fu1;ttpSsgYM8ABX4dHe_HxU+%M(D=~)
zYM}XUJ5guZ;=_ZcOsC`_{CiU$zN3$+x&5C`vX-V3`8&RjlBs^rf00MNYZW+jCd~7N
z%{jJuUUwY(M`8$`B>K&_48!Li682ZaRknMgQ3~dnlp8C?__!P2z@=Auv;T^$yrsNy
zCARmaA@^Yo2sS%2$`031-+h9K<HTVTe5)EQvp!MW(iadmCJS1wSbK_ at ufo=dlOY}z
zCO9zVYKg|I&o<%8Sb*|F!S|!19op-p&g=TZ%N9@L#(UmyHRFj))9t+gQpBfbTesf-
za`2nVU~8Sd4Kd<Xb>MZsIHfB>s@}>Y(z988e!`%4=EDoAQ0kbk>+lCoK60Mx9P!~I
zlq~wf7kcm_NFImt3ZYlE(b3O1K^QWiFb$V^a2Jlwvm(!XYx<`i at ZMS3UwFt{;x+-v
zhx{m=m;4dgvkKp5{*lfSN3o^keSpp9{hlXj%=}e_7Ou{Yiw(J at NXuh*;pL6@$HsfB
zh?v+r^cp@jQ4E<vE>spC#RqpwPY(}_SS$wZ{S959`C25777&sgtNh%XTCo9VHJC-G
z;;wi9{-iv+ETiY;K9qvlEc04f;ZnUP>cUL_T*ms``EtGoP^B#Q>n2dSrbAg8a>*Lg
zd0EJ^=tdW~7fbcLFsqryFEcy*-<UjNQKPSE=_Pn2>8!?;n%;F+8i{eZyCDaiYxghr
z$8k>L|2&-!lhvuVdk!r-kpSFl`5F5d4DJr%M4-qOy3<bq6e{+%w<EWihn1$%KzFfu
z`LKHky~)zdoi4^H8U?2zL}?l1u6MD%jgB7&*;Qf>gdmQb<G$UVN?JmKSKB~L!OR=i
zI@^y#3#{3i>qF1=aBtRM<!CT741&i5jO+s2lsMXtwRPLCm;Sn!-GpQ>7)c_Ae?$b8
zQg4c8*KQ{XJmL)1c7#0Yn0#PTMEs4-IH<W7>Pjkn0!=;JdhMXqzMLeh`yOylXROP-
zl#z3+fwM9l3%VN(6R77ua*uI9%hO7l7{+Hcbr(peh;afUK?B4EC09J{-u{mv)+u#?
zdKVBCPt`eU at IzL)OXA`E<o1(5;mC6=k at -!Ol2~E}J9hOE??)KsP;2EQ2{Z(0gwv}f
z!It<n&*dKHQo4x|g+0u^h~lZ5Ov4IC#Tfq*CptilVN;HXz`iK4{1F;tZh8So5XLY*
zXxgB;G7CZ#<Iv1X4e=NIfHyT;2#ek12;Y}7qA*ja41jVbduyrB$HRMX3i4#!N49oM
z=DRz&*@5P2{)@K+w!!IcW58;P<<)I=(H60m7Iz@T{w1f<%~zS?f9pR^Y*#fpT<Noz
z19vhe>bu`Xp?u0m%h&X41}FNfnJ*g1!1wcbbpo%F4x!-#R9ft!8{5`Ho}04?FI#Kg
zL|k`tF1t_`ywdy8(wnTut>HND(qNnq%Sq=AvvZbXnLx|mJhi!*&lwG2g|edBdVgLy
zjvVTKHAx(+&P;P#2Xobo7_RttUi)Nllc}}hX>|N?-u5g7VJ-NNdwYcaOG?NK=5)}`
zMtOL;o|i0mSKm(UI_7BL_^6HnVOTkuPI6y at ZLR(H?c1cr-_ouSLp{5!bx^DiKd*Yb
z{K78Ci<l%%epWQ$#NR9uIf5|S3KV`ZTJ$&qJ6`ry!VhqBuPs(j#jC&+5r^-xzR6fB
zK27~T)ZekimVRRz-lpCAJu2yR?1~gIvHR5a1NYj$*q3Netl55}ts!oix2<m^q4oKA
zx&s$GFeBD?)7%@b7gCQPQkbzcY-#e<IqbmH&`NOUj{m_7zrJE%0%MGK`P$ftHCCyA
z#QEOkdexcb5q+aRNqFbL{IkS#hFvjjH9v~WbirfMFFJD$DOv0$f8V^PmC)h at B?4Tt
zm|Lni^t};e&92Z{h%k-#j#z#sF&$u2EIp%nX3YhhH9Z@UzRMIVYuCt&$V#l>&Twup
zTKm)ioN|wcYy%Qnwb)Izb<b#d)i{+1p{kvKer6Fm8jK>H>W!;Ah5Zdm_jRY`+VRJ2
zhkspZ9hbK3iQD91A$d!0*-1i#%x81|s+SPRmD}d~<1p6!A13(!vABP<Z{iwC7e4%~
z_Ln8-%lvcLY32-Y@1SO1*q92_(j#+rhCS=CLMntrY3Mry$(OvuZNSYRrU>2kNgqEG
z?AMgl^P+iRoIY(9 at _I?n1829lGvAsRnHwS~|5vD2+Zi53j<5N4wNn0{q>>jF9*bI)
zL$kMXM-awNOElF>{?Jr^tOz1glbwaD-<Z?hQEA3Pbch{-zrz(GmD@~J*ag^+fZsaw
zY>M0OKOlTeW3C!1ZyxRbB>8JDof(O&R1bh%3x#>y2~<>OXO#IIedH0Q`(&&?eo-c~
z>*Ah#3~09unym~UC-UFqqI>{dmUD$Y4 at evG#ORLI*{ZM)J<p{vwhmRDEF0r$s4y_e
z=sJVWn|ZM-lg`hKmi%p5C*Kde*o`ZFJEf1Ej+^5AxXqpoV)MlQbue7)^k_qkb+e;`
zWde0R#5(=H5cM$dK9LAsdS=Yk0oGNTPVR(|j6Ls{ih2+`6_F=VxMEkqB<u_yrMn-7
zem-jG!zg{VfBK=QGIg$ZuYze9uWx?aDxho7OdK|L{6b`Vwt6C>l=e1it!XzY($S3V
zLG!Y6fCjE>x6r at 5FG1n|8ompSZaJ>9)q6jqU;XxCQk9zV(?C9<V#w?Lf%1Im<}?28
z%fv0sO4GSZ%zfKH*&?O&xk<I#mt_{KWN at l7yB^%JPt=7^LfPgcr~mEkBmfFP7Db0M
zd#E!M<3epZs@^{m3?RG}!71NRBMkEamf~hxD%`6taJAN-7_P+KIU~cqcmswNPF@u0
zBEd?J2tVMNdm+C_OO1xnDaP<CvO06_?;7EsCcbdr{cefhRUYuKyPaC&4Q})>+i*>w
z21+KYt1gXX&0`x3E)hS7I5}snbBzox9C at Xzcr|{B8Hw;SY1$}&BoYKXH^hpjW-RgJ
z-Fb}tannKCv>y~^`r|(1Q9;+sZlYf3XPSX|^gR01UFtu$B*R;$sPZdIZShRr>|b at J
z;#G{EdoY+O;REEjQ}X7_YzWL<b@Mth=4xckE^wJmIQPsUfw>O+Ey3>a_KDe1CjSe|
z6arqcEZ)CX!8r(si`dqbF$uu&pnf^Np{1f*TdJ<q2__L6D at tfPK*~rzVm(OhYZi{~
zO7D1Cy0z3WdT1AOu^h7D1_(%nFOYSW(8K@CEF1cpVqIf7{ZixjH(=6Z%>`r2;@SaZ
z#hb4xlaCA at Pwqj#LlUEe5L{I$k(Zj$d3(~)u(F%&xb8={N9hKxlZIO1ABsM{Mt|)2
zJ^t9Id;?%4PfR4&Ph9B9cFK~@tG3wlFW-0<w~5R`uK#F{bA6_apO|PKuT2G1V=wh!
zZWPJWbbu)nGiWn?;_;mE<K|T11{jR4I#*v{H=AUuEc3+UXA@7uIuDpTy`jcYhUz%o
zBA}z0OR6}0Iqx8Rc?*~((>fXZS_L4U*EiAA%+`h%q2^6BCC;t0iO<j7`ENmUd8a;m
zq?b}^r<Irhn?t82<3YNwQO;C at tCYRR<pR}s5&giTT+nc?H}mtH3ZX|EFpV#H_g4in
z8Tbrg7JdfQvFh#<ovHft;`1YsxU2!leoc~Y)qNFc1mAL8P2+9584$1X7q1nBToy)y
z$s4}XIl~zQ7=m5m-cT at n8wijJJ$|#uxO(nL+IWs9qk?i9%s#W2ZxqfW`jt6{wIS^q
z*iUq6jHCeqca?Re1w*!C)k-nH(eV#(PnPU`?~ov%Y+nj9)j3~WBrKHnC<W0QlTNC*
z<u_q0O?_PoEKdE%)ty at V5F=^-=y+E`(D|T`;&Jjf?_7CST84~oRyM!RwLEZ{ZM at iY
zIB{U~Ge+IK^?H|Bpj8js3(0P2EU%fWNhAH!9B5rA(2TXL071s~i2t!VlQfp=S*6A2
zkt-CN_z|1uc9QB1_^Gpz5);n_@pEbj*T#DvuqJuuKb_PutQhcu6?7{m7g7o;mzZA9
zf{W$DK$@&k565^Y7M*vmK#vF0i(Zb4TM%~5g7C?du<oAbjjU>4V=s4Qug{M|iDV at s
zC7|ef-dxiR7T&Mpre!%hiUhHM%3Qxi$Lzw6&(Tvlx9QA_7LhYq<(o~=Y>3ka-zrQa
zhGpfFK@)#)rtfz61w35^sN1=IFw&Oc!Nah+8 at qhJ0UEGr;JplaxOGI82OVqZHsqfX
ze1}r{jy;G?&}Da}a7>S<aX|!tNbjGLu?E#M_FQ+tx7QwU!f|T#|0pGw8beze%W}X8
zTh%o9Dbrk*KF8LN?^<3buL7%?KbkRMr_jMII=xY`U$vl5f0r@#H-|^ToExGU<wfLd
zXr+GANZ(jz6qI7<1HwuGyQ7H^naJ1E$XxZfl>CDsFDuzusee<BvkaOnN;I1*%q9kj
z^#m2ll1tq&oMv5g`}?0u!-DOva7&B0@Z!bH=K`f(k?GfNkG{%)>CKof|Dz2BPsP8?
zY;a)Tkr2P~0^2BeO?wnzF_<l4Nvqf<W`7QjWtJDSw)B?FOMa{8DG?kxHAQnVhPF5z
zxnU_-^up4Prel^ed-PkB1+y((Pnm`A;p#0KHiAU@r9|EKB!f~*!CI?=fpguhu1lxJ
zNfwd#_vJ<v;}^GGOcxE|6OXh~-#_DXMEuzGXcF>Ul-ekY=-w26VnU%U3f19Z-pj&2
z4J_a|o4Dci+MO)mPQIM>kdPG1<w<ic`+WErB>xydiR9@#<n}&^Z@zb@F^w%zU4>8m
zh27D7GF{p|a{8({Q-Pr-;#jV{2zHR><r}G)UYxpAdB=!PS*(C~*1H#i#3#T1$j2)t
z81k%ZC~^7K<oMng7XOD4<}b)aGe_1j<vxx~;=~OWNZThvqsq&|9D#PlGC$L88fM!1
ziqq3RXQ^4C*>lGoFtIfIpoMo?exuQyX_A;;l0AP4!)JEM$EwMInZkj+8*IHP4vKRd
zKx_l-i*>A*C@{u%ct`y~s6MWAfO{@FPIX&sg8H{GMDc{4M3%$@c8&RAlw0-R<4DO3
trJqdc$mBpWeznn?E0M$F`|3v=`3%T2A17h;rxP7$%JLd=6(2u;`(N3pt&so#

literal 0
HcmV?d00001

diff --git a/docs/images/logo.png b/docs/images/logo.png
index 9286c1852f31246046f08abb16e87d7e5ff56842..2db743b4fa93820a2ad38bdafb1dbaafe7805fee 100644
GIT binary patch
literal 117499
zcmV*YKv%zsP)<h;3K|Lk000e1NJLTq00Dad00A%v1^@s6R-w_P00006VoOIv0RI60
z0RN!9r;`8x010qNS#tmY3ljhU3ljkVnw%H_000McNliru-U1jE6&l;Og&F_=02y>e
zSad^gZEa<4bO1wgWnpw>WFU8GbZ8()Nlj2!fese{03ZNKL_t(|+U&hsuw>_T-}hVV
z`*!c{bI#l_00 at u+TI5i+Y+V?NA~lF(TXrPHiIS+|B$Wq0C3#6zk{2q8nK&_wmjo|n
z<snt6vR_guS0$F6_?D6_muOpxsR1RL5>3(O1p{7YND#nauIJLb_x`?>hqd<Z-7};j
zxh$Cwdsm?_bLO1W-Mi2Eul4=cfBpYrX6&!;#;XF#<L|$J-2d;F%>P*oGeIQne6D{?
zFe at MxOydjmu}2oMosXM=2$&f{r3#469$V7%+zbUXM2rEYbUkH#uNk^Gp0)Lz!_vJa
zQXU}n3}FLQl7OZqMHWbN0c45gBUn6Lq&d2q)9N<OVQm&mL~VL(M6g=p`GQEo%rG-l
z{oeU&_W$p%{q>!E$sX*#yRPl~UB3kw*8nvM at V2QShzJ$Ks!)c3S_iN)M{qQ?<eVm?
z7R15Y3O0Kz5t}_9FA}v@6v0#+{l|ZoN*RP&dPEX+b3%9gjkde{xhr=3g_hGB$ncG)
zwY>EoXFLAEB;6uuPf|k_|1WvLFi9W_EG-a at sCwaH&y&AU?efoAbMd|{o`&{W^x)Y}
zmhZf!%O|^LaX`|zZ?b)EBgk)G{vPc2*B<Qm*LM`i^P7XcBuX(h>tlxQURyU0u9TBI
zZSCKJa*7QPu;Cc7GsFtQ;6Nt{%}es)JS?87dhY6jbolPq^YU`ZNoJ2w5YwG*SVX{J
zb9z at c_kZPFI(X-0X`Vfi?#^L3`*NG=t4etb+Z=Oz`*r#^f8&bs=0_SCuBdiMu8S<2
zXH at GUVv<rqr69UNRsH*`U<ofKDyS?#76m!Hi(R-=IX6&On60SR-m2-`$2R%7TXp$f
zSiZYUhu?FnIe5Bj76)j6zlg<s)#(hh$Nc@Z2mAf?I{@Hp!NnfsTLR##fZEh0i_JTC
z!GLbPW;l7XT_1n*N_}{%9nQYa(0vmf?p?_oe<aDtm1I3xdPE13fT*ET$)Z#V8i#~3
zfRr<nqnG>U^3T at A_q>(P|43&?KXfafyVB*X(H+-#P9W6~&8%;}d_Mit=YKjqd-SL3
z!Fy3XLaJSX<;sQzJ$#bk{+GCa<CT_lcty0fNKckT(jqD+s1B$U&`QSq<*VbdgT7(e
z|6IjDGLqDg7U3f3MW{!e>ESIYsk53XtZof*`C~(R_EuT`{>tio51RAudA&V+vLuCC
z<3ywdEYHX<o1J3x@%KiAeQnrZd$8YMzm2Q1%YoY?G((+HD8eudoISYRp51%(%I5y7
z?Qrr{wEN~2sdqn;<?KpBkEWiaLz}c-X~fz=dK$6lm@SG-je=1SQt%~Uk}IYUMADm5
zHho2Im2~N2!@>JswevrIGd=MmUDF;QLGEA$G;{LhfB3zt&;9YgnBKvM>k-H~pgC+U
zy<1@kavyv1A@^=P1KNnFBGQwyl4XPHhRlHE2Z%fb>%9u9-wP8VnNibr3}90s07NlO
zh^#Q4FyTqW4gl#)np;*=XJvIZ*u|H7z4Ehl`M%fW!uP+H&b{xXIk-q8;~b>yP*xQ|
z_prXd_F%uietYfwBOUzs_i7X|5Jje;;uhfhzUSob&GzKYe|n|6_l4GuU%irsJ0DR!
zxzcD)tEJUct{{Ee=m3-e_9|H`svs0lndl2sgOQ?FnTkq{$21xfG9uCm+ at kh3N?m at e
zEWZEN=IAG}<~d6D0NXsED@K0pA6$Ln?0@~3KAo=Cb0QoFlE89{<a1EoKpwt>v)g}^
zVijy4*)bx9N{2`#$qA}!j16!KavP+F`Ykwi-SY2M1<8h>SgJmpl_g?NA@&4VYgooK
zRqE;ivUt<V@@BE~f3eqhetuYe|A}6F|E=cSySqiZ+Bv;^>ml_X{P))$?DyAio6ebc
z@(#Eng<6%<hqo6GUi<93j$i-ulH*sN)6JV7Y0~MHq@~TWxgvRJ7eUWt>BUq?GE4)`
zl*$Yg4Yar_MGdJHOR}v$BY;W8Qg)681<QztiL{+ny(J7?HKEv(bi;Gl=74G&7MriO
z%lz@@?5J;L)gtXXVDSu=E<inl{sy*w5>DPvHFcV#o*}h|RGgx!Z&789=n$ujQ-l-5
z&M-NF>K~u6Tig4npjjaaCKWX13bw at LNu*u^Yp7(fWTLB$)b=$>ds=OIbFe2qwpqOA
zs~mmcZhGSVx7)+ZRi(~~j0SbHRWEH%Uf;SX?63W`2mAds8xnd~Z6>HH!!YphtuMEC
zzVgW{-J73zk8ZyHUnDtx?;;H=N$V at Q_N~a8tVL4tL1v>pDg~2DN{NO6%?8p_MIGdI
z5fo0{Qa6C9F^G{(oXRnw1V^rtL$WA->Yz2N&Yegyswq;R#rhR$cYs%f^pM&VG+n~#
zB`C?!nF at 7<)r^SvpjXtpak2xbRYVKM1B7GH&S@2^m>eT^k4lf4H{WWz9d;E%#JhXR
zezGVSqKfJfwOod}0<yn;YYl6GgHCLD%j)9xV9Q?^<Xt~E9R2Vc>B5I^EiS&Z%bIpn
zNqfoW{@R26{`&vDDqCseNEe7CN-4bc+Lzk<U;f0E^_|aMP4?DDlAgY|VYs5YUM9}S
zGDy+^l@65+nhHryKwR3`Xip;pq7_qfQbv`U1kr&?2_;KV9XQ`UJ~NTVJA4_3md=B_
z6eb7rl>GConYvoz2p!IQ7i=dOYeW)axVB!?E;vpgJt}(=Lc&D+aV&!jz%j@}Opg78
z!3ML3UI at gtO?5Ra3P3`fqRIl}(-uM0KpMmju==Dwe^VesZK<*}t*as|?qcnoTJl#m
zJpHk<`oODP{-ZbB3-9St8asQ#NT}2}X6!+Kf9=73f9)XscHoE=kc5bE|MoZ9Z+_ty
zuAII8sjIoZ{*lb_d(}>#%bc_#on$R&s^nB@@&Kx21=S6r1HwQSQ0+);KngIpdL>ow
zVpG9J&Yp~D1`?tJCJCeW&y&HsY*mm-MM+kvauClqA!Lvitift%?FFP>fN~L&Q{Wy}
zH{QjMOI((x(*rgRh!fKynE7+^Vwk8T#0=36<1Qv=UM5S2$sLqFPDW$h@d98Htdt5>
z%^y;o`w`6u4Q5Xuwv6{;fzcqf1r}f{GulpVdCN+3V`G;-)*pQ6Re9paZZ0prw at d1P
zKMrqYT2|YG{{Gs7{r-X(FYg<jrza12{R<y&@4osA*W~OgAI;pqs`czSk#(D-lM&3b
zY|zxRNR^y>Qc92$S%s7fP0FZdlpdsWC5sxOvC$d>%?Xqx&`<@WV3HACI7(_aK3hMB
zj8u-yR6*JXAHIOvP^2MMd_z}`u=*4-2x9lJbPQ6FqOq7O-ieFf15CZEM_>ZXZO4x(
zCJW38!YQO<FJxv^yNl`r at 6gBJg)%Fw1mFWngxZ2=oeF`;1t{m8TEf5%<7Cl*wTQG<
zYujP%Ev@a1ja~lOaB%Had-6}*T%CVsH*)%BV-eY3`)d#O-!&x7<C^RkipIvONMf^D
z^UW{(qxQ|u|BWldgD+mydiSHbuAf&qZK0DaXNYuUt*8u0E~IQEH5M5h>xGn!W&xTK
zNg<_#2~-(Kqm*!*WU6!5RkxeAqki4Sjx<y`riWl%6ar@5Ihgf9_vEPq$6BhjlO+Kv
zNO=<LpF%mq^qU~vv?DOTSHgn1OsP&Pq$av<jepaijzF|S<QQXv*?o``-w}u+;;s)e
zy&F~xNdisi^hrprt~|mu`c`vTMJzBoMC$^p3o40ZORKi*gyk(MiyIrBd1*NMqu1r>
zKhd=Z=TRH!ES<KMw{p$Le<t?V{@R26@3}7i5&8z<jW7R`_SUEWk1Olff90ywyB|q1
zyjSGxxkSGddx*(>8cJ9NI8D$bALiyJk#b?NNTgKIEF?9W22zIHfX0?-mFgZaGV{q1
zp{7xt!^AaLHIzin1vOmC2$<MbWgbgJ6Nk@yDQxM(Q9E?1rwFDS%vMPGUf3)kzmCXT
zkT%|an_?!I<OvMbMz0>jWZ{B(EB at RBq%OS3RB^gVPEhGE>oK{FNH+~`r=_$43<fzI
z6Ov-dkYrvzB)Qdt9K`SzFG6-erA3AX!ZMURjlrsu+Po}f`BEqEyD?n)lQ)~Eu60e5
zW)>8>bI;*h?#=D5{j~@Cw?ELApeD-1f1lpJBd`AIU%Pbs3xEAz(al@`b)vg!vVJZx
zw3>TqWdI%`c1%iJpcgSjjmAJUp$#OhXf_sYBBx5qM$Q5FS&{4-`bmBm-R-y_8cfL+
z?8VTeKExcmYbhWLL<*3dIuW;I5E>uujz5Sa7_;<3AWd-R4-q-UhWDWTQyBM<^i9wc
zOxg+9r|wsVkb0)A^mFWvZQ*b!4Z?ugBG!<-cvRb<=^mmFyjT=-Drr;#;a)zb=1W<z
zoK;m2C5lMvueJJiZj}S1tiamo-<<Mk*08*#wY^cx;m6jC553A$|L)Dj`S0m+l4&t(
zuiDvPd$9jK-qBAEl0n;i<CR};U-`se`UBmYzxESZhW|+9><6<9ZOTP*0w2I`$TE=h
z6r}?j5G^Eu8a-iF7b>EH7^Gau4Kxey>YJc=QU+ZFg`+l^Sendw&dJzP#+j&puA~_7
z;&RKWGSnTaXZ!K-dpGgg6*zzzMM8StZmsWt&ASonA>9ML<0=~l)UvBHL&38}VtK4n
zMqI69W{Anu{rlr2jQfb*LChtlRt2rGNLJ$XklcQP6i*SbByPW82TnEF24oSZm`hk)
zAY`m8qVOccnoewW3u|r+^&Kzuhd+5;p8oM}d2k*Hsiv6veSKtryDtL!YY+Bscj`tA
zbHyWlU-;6m{y*)_PyKJ#bo1t))x;0vG(5S;smX0-q0YPKv_aEAVj!muwY4u4*{T28
z46U&&gi(vQyFv9XH76#}Zx&G$n&7DuShfi-owAsGfP=R;SL%!k9I@>XlZ=G2$F=b@
z&VK~y9lAnM5=IkEc?)bX*&qbq59hG_4aheUj(yPyT;(&~M_X*ar>QT6S at vR6lXu>A
zKsE1JGK&e72S_?a<UUqw6b5F)TX7Xpu727HhfR}^iE<EH{*cDfVywVcP+KnswZ&+W
zn$2iBp?#UszO=C)x-ne-cW$np`aqYGQL9U9_g((}+JpV?A%1?c`&H%S_yNE1@xRo*
z{)NADZPoBX(=MK0E|<$@+0rzL+z5>pnp9BTpt2#+qjm~<Mz#*@A!2Ka9fO^bs#1zm
zL$Pb*6a=6c+CUqCpR!BnHDv3i&gYi|I#a6n^EN7q<T{y*ZNXmMYC*Dpo|X7IMX51R
z^&+6E(e>7?nx>Z7$v~+bBAf3;hI8KGr*A;I7qn18BxAKfQA~={CP}?3mmCs(H*WL$
zz8w^sfzVJyNo;&MOYTmx(pn1C;Pk7En^{wbZ|cMDVhi8^vz}yi8n7D&P!FA&GR0~_
zYVyLwa&0uXq&7Eded1&5#ZSB<@A%2Dug*Q)d6z%8h~5uu_tzfm-?l&xAhkeJ?%#f+
z{q)cM&sUD$_{`PA^OrxmJb&@|<)U4-xu?yB$ca-noJ}TRqz#!uqJnHlIzTO`oPnJ}
zT~q5R)Q(yPO3Bp0wyurl1J#^hkrR1YoWD<?P2KJ)rL70Ot88T2O_HSU{zypP%{zV6
zi-F?7CSDL`RE`v28GxQAu%ALgY-TW~269AQzY85M`9fIxO-x>k)_V?wLamJ#k at 0@l
zJe_JRfF4UeZ?H_U#AsKn2Br@%?u6?P6P+`Ge!PFCK57sNO}?EA+lURb8Mn_G>;hN{
zYNtU<Jg#ID+D>fwHOlJqoqhjbs89U#Cl^nBpv!4%sl4y<_tzfm-^O4+g4<iSZnXdS
z=l_>$b-4S{^H06|>cO&ou1%-Q#_p5sm}F-p&S+Re8c5QC^kg-%^yE~XI?#$}A^}x;
zgo4x)YQ2pOJ;h+?Vdw=bMzw83lmcy|q?HeDH5ufDH3gCnBqxfb63bS&FHVkAN|I0!
z?c%SAxSa8^=5)zCA#2*g9qAm4PTYLZYt~}*-7q|j)()CCLBEM<k5G}?xb#!!rvslO
zFiJ9ICfkg`uFp5}?0GbZ-NCr)Us@G0@9?QE(KMI(L@^A&7mc8l#!n13P^|?`hzY7k
zSXm&n)ar#sEMqiS$)<9+mfC!>AD($}z5I#m`PqM?TOAzj0e^q(!T#-m?1X-<?xZw9
zMK$xr%^U4!f9Wq@TQ-{)&YwU3e8YpbskbH7W0W&gqLa@(YCWPoSq7AWoC4rOeUov^
zgCxHB>Mk$EIsEznE0tPd80rN2wT4N4aT+E!!eRwY4h2fX1Zd-6R;nvh%=~jiot&9G
z<Sjb)X~?^c8Jq)^Oo>oipsnb%7&Wf}7NIGA|K5qMpZ117-=QpSx at I0lYL96PwS<q(
zu%$yLf3ne*!I!+MM5iy!?0lfW1GjNt05K#i7F=XB+Bhgx3(|la{|h2YwdGD+qv-;z
zP;5bFg~`%AfJpv-Yy8w9%e9pDWrlMvb^5^@<>`O_=IYXWI}Pb+6+xKWNHALIPdd$M
z;Ll#Vxd;3G^}BFw7h~p`tI--FG~9pdcKZA$|H=oKcISU=^XVT>!|TgbAJVWvbVH&;
zb&cvkl0s5fkYwrIV?_s&Bt$Do*9di{ZSO!@Obb{-1*|@RvW5y}5K1wI&i`DiQ85}3
zQZn*V$c-V*Y_TYf$slZjEEONpngOojnYM1#J>?yIngFOFXq?2B>zKPhx&^|x*kvr7
zCifp+|7 at wKJp-GkVQ47LTcqY|E~&IUyZ7;2YYFfDAs#0?xW`;!E9D%$e3skd#0G4Q
z=@2KS#{u8%pZ&`v%d|{jdKkB5K%_-XeR)b6sE6 at 9nwTB<?82&oHEXfuEh*=2^yR%T
zb(enndi(Sr?wZW5$If)m_SgP;{L1@V@ViUb_;5`y8?A^FrNF&6zSO?)g`a=_dA|Ig
zW_$1f**sWg*^u;vhE0I_29+Ve-rXHlDk}Zd(PvqQVOJkrbd8R#P_>Zgs3|#UDv%U0
zBd3ZEkQDljQ3j~hb>+1h)(O2CS&byIxI_emH;E)nQc<gQ0(j!TF{nh$!XIapW}5Rr
zlXi3Lq(}MYIP6VS%<F-KSC3@O2A4wWZDesuP47T97ojHV@->v>xbI9`zRuTISI)?Q
zRG(72Q_Wa>)lWjTN7W^u6~$!bmJFOCMDfBGtg2L(NtSq?B?_Dp)xATcLCu1OQdA71
zf~<W|D?t-!#_A>v*y_>>SIOl{)-SZ_-v9pMy8FiU`s`12?eYldG0RiVz at FCGU;EDf
zUn<DUBiwwYR^{OvUv1y`@+YorZvWcV%-#Q{;p79^&Mt^<Qs&G}%A})_f~bRf){4@T
zWSBbMoO*--Rm13mvv;kaNp;R$e7)b7oq`@gfx%_wrTSuOG5QVEUg&$ndtM_8G%HAp
ztwN{9A{Ha9LoBD(5#$_%c4?eh_N+AQOfT_MPL+!Hy#qp~lBZb3E$yN%ffPZ^P+3!0
zA;UYNzW~x>&DT&l_Tpm$CJiD5jqR|}T0x~yV=$|+$W}>iV<3jHK&1y0mw8I>&(8{2
z at 0$G4n{M!%;F8R70V`;fv;cA_l)^(tdN)KXjo%Mj`TU|9riW<lo$9j|vE`b2_%h}4
zOI`la8}%K3>gMYFvz=I>nnXVCBYONjeY3yzVE;Qs$&c}Lac at N&{DjHf at WGw0w{N}j
z%U6!y_~g~5-1$hW>-Q!*eNN<LnWB4dv;*6?r%mwk=-AOal_Ofo`2Uf$cc1t&l`BvR
zralv}kt&G*4fnl~Soa64$A;`v+un0NhJH)&<iO^(5oBS|2$qA|Np2$`!QHF*R_!zs
z9rvd~ontev9Di;)`Qwjmv5nllxKoUYqP0?SFiR#>aoVHQ9+jYFq(RDgZ1c2x&^NCj
zyg|ha&nWlQ;99C|;{6(Pbp3wS*}+%LJP;;6rbH32VM`5(A%jt?1OD7VPBU1F;;Ki$
z+8<MvC`VX512zu+wGGg3wpjqgwr^=LYu93{TT-98v8h*I>Yx78*H=$`Uzn=Nw;9|9
z&9+DVJ=pKBf3f_$|I%%PMMQ)FWqtp4dgIk!e#gnJm;Vsm*MDZY=&!1sK9^<FiaeAg
zl_VSI;XMa7LO=$PAwa&5;bf1dg4Pa6PHBh+ogmu~Y}?KbF~*>AcWxZrE9XXQM2Al=
zSZ{1Puvx5Mlb~4$v at w{?hGxMQwx!5%S>mX--&zKTahihIltMepuZ`y+m4pO!!puai
zOr~n%@>MlABf|=2XHh&rIfrylQ|kiFuTk at zZBdTRUMVXIop<fQ>#N1{h`2`+(As0O
zf$ek}F-5Eo3dhh|T-j7Xi+A`n8M=t>UXCIwAh~@r3q)cjP=@I~P+ON}N{aU^MIjKR
zW{lP-2c47)FAw$iy*OO{53e^*UF(vB9$#b{4(;)Mf9=8kcZjl?hN1yXpqxFt$E`2^
z(qZ at dr+<L;*Z*`Q$A2uz@$b*pwMjRksdtx3jFdX3Xj1P?vH0T7*v+d{k`&-HCY7Q8
z)-uT-18ui&^fV-ldBG%|G(<f}w&EN!p&^$6=!3uCKyeIq${`ue5@^`^#4KF{UsHI(
zTg+V}BSe+i<3>$T4;>LIB|v?2`E-({Qi5_CKRzv<#e$R=4um1G^yMmx)5`+N6WDML
z<UZ2e#^emK6{Z`cwr<vDOv71`j%q2se&#r7ifS`;^W&hsQh?5HcQqe&RFJ_J*Id?A
zeL|K;HO^{s`1E{$gyMD)MU*tYCKho-2nlEL8!6R2cBqGIsTW=zhG$;vFZ>7B7tj9d
zoyyEiEkJ+I<L|FM*#Ay|{m4B_Vi*Q)f92QPH(&V&-(x3V`k_XT|MM(oKbY+FLY7Su
zIy4O~pVSSK+>$uyfZDJfyr!OvMbOB`K`2!S38GnqjEFn}@-PlL)!Zdu4*rkw=qg6h
zjFgI$I+=md8?{$z at 7#0|XtTIy*(&I%4B9HSsS~A@%$+)G6d+AZOIYK~z{FqUR+1Si
zoJgli)ngG&+&pa at M4}1B;w0dmy$=d>a*wPOw{0FSP&bzl>7e-rqP?qK#>Fl>+7`)r
z=9+#1q4!V{5 at MU!MaYx%(~Ci(TIZ&7=0jcaw<Zc_boU`ywUlBtc@@Ly&`L`7S%f7&
z@t8Y?dhDTwd7OG>t!}q~HAr2pt)73G;mH@*NB`#a^vq9pi^XEQgck4jet5eF`~6+`
z7ed*L9^~e-IgER+f4P1A3%__}ef!f_GxvXHp(o!fcKpsPU7P4gT7#x3sIDF0Qy~Qh
zFH*dd*G!gm&@!hJEmUQLiiYZC1p2K*qs+j4YV?fV2)s!P4 at G0yDJ8^);D~X1-#)B<
zJ7cKsHKXRsR@#Cs;^(N{N;4JNwQ1IAB^61o<ryX6V~0Pgh>9smGNuF75~_;SabF;w
zxXL4&S)=RaD6#aJMYWAbDRKbAIciBrehBGa+>dP_%y!liAW3pcMpG<v1zk2(Qvdik
zFc!|R;*^dT$|>XAdHY2iadHD`Iisf1<57!Y;VicFTwJR$&>fe|8vmRcRtv-Bmt}b3
zrFHXx8|8_A`{v@@b6wLkdk4+^wFmouF<pFR?&v6zI61z@Yya#Y96q>p{X<Q8^Uvhe
zT}|cQb1HqCIFYQqr$;5{;IkIr_|(XRW$jvdQF7{Il|KN{?oC5h2md+&U`;kP^%GSh
zGw*o<kTeFTHlua~bR3Xs3_+73rNB@e@Po&%8*{083|mtYXl?7Cvw#|komwCHflJ%@
zfpg<J@#k)%P^hAQM`QnB>i);LK`lX-IoK7gB&*ShM_`F;T-8$~b_zEB at 4A5g91Q0$
zy^k~xyg*D_w!7-7@%v4&i1U-j?0v78FI$;w at 1+`6BVV=yDdwz9BfglH5}F*i{c+ry
z*}~@8>bN7Ik-nAOM at J+=QeyMh8pcH|tIM_4CvQ<M-dNj}k8Kv$UQJJY;O6SmmCk<*
zM!B!;M5FAlJ=pKB-$FNUj|6_d_LX06-~8e)d=C$A{Ln&A|4ZfgL&+YtSvHdB9lWI@
zCrH{O=?s+;w!>#+QIfg^ah3s*GlT(=l>?PLm>egkgs9QUG8`w>wu?;eG|5gEY!oDo
z)J{kjMYl+-9aWw{F+}b<<<ckElnL-<Lo8l}WpV=Az`q7$;T`_&j!*RQI-{4S*P&Y~
zN9qK0u7DW>#Tz#yo1I`BjK^Hug2*Bq8f<!>Mvr@}n@$8$kFfr{gKD~mHk%m8Mk<)-
z1pa>0+za1DsF8f70piIJOBfsf)G{DekW!pY>OqQg=XK%5&<kUOro$*sYbu!(sa=!H
zrlkmg3C4%)Hp!?baSgIn?wC?bV^S}5@XlNC%#D-&xtF;7N3O4){Jt)w^liHQeG=Ap
z!?j<k`scbd=3eoOL*n6`Hx{=(_jliQ`pr+hFLC$3YEu8bsoZ;Kl9M(|he`><vO?0{
z9V!JM5{gqds)bCCB}fR2i#wVSI*bU*W)UT)pHw$U<N2{AfFwkqlO+Ha9Di(j7DXdt
z7KLht+A#6`!b7SIj;R8*si+9HvB+8#=cFyBucN-a5u`xfnAev@$Z*UHQtT6LyZLdk
z$wCrp7Bb7~AB&u;IvdVHbtRAaYZ7Uw^$cYZeYT4$MKUH%vG`*x-O|{4OdmkgA>{xo
zmni*xG at nf_os;nmfHsWDShY4zv9ZC(Sgufe4?@vx(v&NXX2Vf4r{(LoT<l9+-Y6(W
z_QO^k+{;JQX(J<s&I(DWLkCIF63<Vg*q7dmhg7ltttB;I6*gB6(rG)qb^PMV$*t?n
zGtX~*@@*@7ou5?q6wki1|E{NN9u19fxkX~=dtQ6xSK2qf`0)?R=~sTH$;W>%arW+P
zXRUG~DfI{&AF#>>QX!{=N<(n~03ZNKL_t)7a)xLj3qF{YM3znX+W2%&XHvz91JQ+Z
z at gj(<-A~=jt#hSAsSFZcjv9kod3+!{@xwU=gr+_q)PbrssP&LWipw<XFe-G$|I3!%
z8L6XIuw1FhscBgXHTwWTAv*0Qz|wX8zC{`lhLXc5tx!cGj6`QSw$7)IS*=D1s;9=E
zBi)N7YLyAosJ@vh0=18VHiWnRAvQF=XONDORHsaV?JfXul30b^aWgHixd;Auibzm4
zh!yHkd}DY3>0%a;fYxB4UPRQl)Wp_Nl6!yd;oezsoxRrCsmwIG`xxkogs)Bp7EbH*
z3+ix at Bu}rcKKb%cF1^(0yKdN%f8^%!$?xkLse41UJ=pKB-xTnxg at Pk-_x9J@oB!nR
zURl5KsjH1X{OF>d{iyJ8rJPEm9d36}khH;hdUMJ~HjoClBThYtgT62z>f4+yf_II&
z?;@#N<BCf>WE^yA*#YyNMW&hU`TTRXGECc%icVd97 at 3)ka>;RLVB8Rm4nF|jdfUp*
zvr{-@*oh=x2%Ru<<e_D=y}2ob_)*>L(PS%Ww^jg2V}?;D at EgI==%VQL)BI%T{fh~;
zR8Il(kFCQqNRVOWI|kB0Q?`~4w(!RhSKExfIS%;U^qjqz^&!9Xq9UbYy+Uu$$MEFP
zpaF71($PeP6~kYLjEh_2pL2Nd#P4b~goPWWSs(ib8LP=p7bTLuipx%=URoPZ-l}%t
zMmL;$X*l}f>x*~%XxFaJG5O^0C7OF0XAknT3|4bD$y(s`8=q>w{<*(>jkB+QwB_t-
zvWL$lPM5-(oCdP4-LobYl5SASwE3!RP&PE09Jnzz)e4!V`=M+Ht3H4=_oaueB1P)d
zpnK+P-I*QwK++4;D0fUFXp8uQ&bZ{XW4LZH5QcH<$tI5*FB0lf@_6oo4T9F{LE*iB
zy#-A#y>6GO#w}O2r-52Qk`F*fA);F*bV0$`c1Y^mSW_1-G;UxPU*i>SG%zE~#tO=U
zk#91=fig+(@}Z{570CxMtYA~Id=klqBb_t^?d12UGC0MAOk1~3xfy0Pv_=xcW$^)P
zj^VO7)uvk9HlY%WU4E(%mVVF2`>zrdP!F=eY=a*ei1<W;BdUmc5%T%M9je(<jjJld
zl~r1|!^uB->FldFZ}d<8;hP6f{QfR!4X>uO|ApUo_TSw=Kfgz35AVrWKlAhF9^U%I
z2Qzp7hlb<l#g5yCPLizMqecg(WVG`wSgDA{=Bs*6tctJSYXpIa_;QVkY`fqwD>lMC
z>YR>=PJC<A8{4W$rmfF$X=*OD9799qf1m5}x1VDnGxSr$*lgF>Fr`$FSlxh>2I~i`
zH`Ee^f-c14SJfa3)*6yM(^l-!WiJa;vL;S0V_|4Q&gw%};UEUm-q}_eobJK(_Ejn>
z4b{RMC?tyB1?%*^edX4drp$^Dyer%N1zotxr5CUsbU<=Lm9wq4zSN!JyoEo$#!%SG
zfRx?`xV<4Alnz)3dSI~dEJ#bs$O9g2m%E_elFw$Gr->!60jXZhL<B2!XO4uWI9g>t
zSy+Q`Kpk4FTtw;$<f*mT>Q=4G8(n?srOky8T|apG!`))BiUIc?@b{hl?{#2jZX4o0
z at AJ@aB=P1~Ki}T^%-_0N9(>_nU8LjxMC#cGk{mA+U3kr}5$VZNkhFG3N(xE47!Y<O
zHa=6srmkA%53Vu9oF~soc?67YE6EO^FC!q=u|U`k&`+w1NAg~yk@tb87^<$~v8rfV
z1l=;sAf+OsRI?I;M&DS)z)Ep^D!zH;Vwh0Ws~{-{sK(5)iWevdj%a%`%tAIPZiisf
z#qyM3vWa6)C~w3E*Jd?<d|XT_+aWduNFh-juoz>jwC;Lot<y4Qzy@hDQWI7h>ZTxR
zi8Xy#ArDjDEz(b?3bTaB+F#1pFjR at 4a*30g`Rqj-d`V&BuL;-hyIEWE(}0bpYX&r!
z_COTO`JRFK>CjJT)!pd|K!-G5kQfr!oh2MzO?q%;CA8_mKYXb>{rZjmnLly!;KDN<
zRHu_7;AKzi>^uA4W8nU+yLqQ=lzy}3YoGn4_RTN;y=zT*<G)LC{|_oB@5t6Il5S94
z(`fIDQBvHmM%=A3N0(1BGUgy5u}O*s;Jd;_N9r^LEc34WTXpqwemx?T0{?X4wEY3*
z5<B01Rgv9Oi`rJMxzlymnb*8cbWBB&YSg}>8<`fbq<HX2t!|KJ?Y20{5?Hu5y-q3+
z14|T*P;HCN+0l`6nlpsXJ#81Dd<bh;k{G5oj4GPRPp6JIbMVKKVcP{q`LgKD6N1$t
z1`S57!*t4W>*DIgG;c6%Q5Cmd5Dz^uI|p_G<rEt>$Y5AsVXbgxNV9+ya8R+7(bQ5^
zV<Br3ud|8MRO>UDYM2aBL~Lq4G&Y5&W~7F*sExrVi&$z?-?XiVFdTqgKv;sEqn5l@
z&fgkrd1K8pFWD1+?E1meKhUKlJHy*4b6_ve+=Knw8u4M4=(8ItB9eG;|1JIUKmOZK
zo_yo_4>of0XB)f!yx8$FMPgJ+K8W=JZ1Ip0si;<vo}_ECR1X at __?1aaDN7@LBg~D$
z*y+gKv!-sJsM?mIK_)Mn9f!&Bh3PDy+A4Lf?s>#kp^EIdRZbMqD0#Hvn(~q6F_&4&
z0BjT+%68LsuyMBOa?HSPYkj#$^~nFx?#x~z4pyO|x6r$L0g&jP$3G`(c;5TV$e7G*
zkmGs#0$PulZ>v at v+)o~Hx<$qaLI*T8!rC}v_HcF+2A6JH<4b0ysC1Csx5$gr3aNK}
z7&~;Zsn7vksB~6Gu=3%&<pV^Qp-QTl_5PSTg6l!N9yeEWQ=<5}tQH<ef|`1vurzJl
z`V69ptlO}VunSNY2v1^t6U$gfP{oW(9kzUVQ!l>Q9e(io@?HO0*DelcntXfAHhF*T
z!TxP}jh#~{TIzsm=Jl_AzWvIl|Hk*%<5&K@%>92W)#E?Z*vV4mjFi`?6q+=U=#aE=
zrA;akHqwC%ER;~;1okRu3InnbpvcS-(lJVQI&mA1>k-_&!>f-&T=H~k*e);0MEh*J
zSlQXY9c>moT`2~^w(CMLZQYLFONAotIB8bg2fw#zyH<<%hV2l_pvE0BCAmwcESA{f
zJi;BQ!^|tkWtm3rk8ds~)GQIf*E at f23!f)MQBdN!hc~=)Tsho4C1|E?o^1)*#S5EG
z)Sb&22mf4ayvSG=_rT?p!pgmEg1*ucCqNGZ at J69P9V)UJpOZkV&?u67$crsSXqCy$
z&BTFQeEnFY@sRk*j#<4p*ld~4YS2j$C}S1_`CV&du>*`q#OlvMU3rJk((8d-T*JZ3
z{m}kT>%|{>CB5^<zkYc1bjQvT*1VC}>+<(t|F*kA9}U67x);h<Klh3D8^7_luBG9P
z|2}j4ey#T}iJawzwYySk&w?IF8{dT0it2_W9U>j7LJ}cqoq#-#oqKW{fh4{?KY4eB
z)X|5NzCKm8KGunwB-e4v46|8KbrY=3uBLtj`!T4)?GkK<yC0+U+=FEtU=HzrmmQ*W
z>xJ3&t0i<8unjIR><uXiN{#JTp)TAA4E4=gX_MRhT8VCae6o$3m5I(edk~#@%WI1<
zP&H3#o$Ux}=2R&QFS?OBHL6YgIS(Og3=O}jXV9`u)$;o?o*XuA{TX-Ci|`7qV9CSE
zt=1_N-M>Z=)$so5U5TWj|EKq*sp;phZfO&hZ9E}8m5g$Tu=b7Lv2ceBR9$xDR2Gd-
zBCL;&e&&g94ek%Lq?Sua6+|wCOcX>euZ^RxmC}6vjOYG>Jo6_%dGN&5POVH!aC?B?
zgZ<l+#hLhdJl;+->-Cx&|M=(HJ2(FRwFM7fP`mfM)(6YP35}Kj`VFe5WUUB2DS2uX
zvLU6OtP!pe+o at wJ-ALbn4?<mKvMmPVrl+MX^<s}GWwzY9jg9$KEVkfn)8KYIA=Hs4
z8h=?I0ehbdnA;|docE4tnuQu?`+BB1f~D}ludcff4ZaMqL{%fRb^+utjayW7*;2z7
zriN+S7<m}$w=v8deRJ}}If+)Mal#GKWkGHg>@(hG`?_PWY&IYg`gqB%aFK2 at XY*{^
zM8&P5WoiauIm#4RJD9U^TLZZiKT9W&HWU3f4qE(Ytc^u1bLr$XSGP#Va=#xedjYG4
zNgJW*AX2Hc at jQCOoUX#wv&1c#XehtuWrxE@!V8}z$b!0A!f+Uhp9>yfQvkbYCd)N-
z^~uwE`Newik6%A{=101eY-)=3V7~|Zw^>7Pv0++5SDtxr=gsDepZvd`J$wDrf1uHm
z|5p3Ap3ic;OsPZZS?HPT<WnKZLo`8_F$A1Qhw_eIk@)+TrV(*nJ28yaQ8hCM>RC7b
z*ibe;*L2IRkKfnq5g!`eQbiLL#EkaIF>s8>Ewj%ZxBJHeG!Bfb?mk4F3RdIXa2=ew
z=w+fYWC}frMWRNq<Y3KGA;+Sa4KZYu$(Ke_j>6`AyQ%@n{p2M>(&(ZyRnG$Wm)jQ+
z$`qlEVz)tSrqUvExOJPX_uPuWm_o;=Fc&GYdFx(4Nw*7GTE{rTr$8Qp+==X3rZ~m;
zEpsitjVFweX={AYEeW$8Nja!14S-L~7bmp#KAV`T{4fa(+*!ikEVUd|q+%sfz)XRq
ze|B;I9fl)nIftOAT*mAaN(OlXWVN=sc)2f^UR)o3`1<Nyf2><9meW9g-{tSY{_R5C
z%<Ol)6MOU4EA1CQ`B#6~9)9URTh#kMLcRaqtf$LFN0K#~I~w(YtBP+~HmP%tK6r1T
zlG3<$qi&U=Eox_I!eat!1d-^hX`XTQV at oaKw2Fx!RUvIXS0?TCql47Pz<#T%_a<FJ
zX!7_k?0m@Up6W3>aQ))keRt>UJpC%VQ_8d{DjT5={%19vLOSXKqzT)Dg*v^H4yP>F
z?F$)Z{yD3y`I{CugtILTv|U8X)7K(xe7yGpAq`?Z7QRAA!Dvuc-j#=9$pPPH8@;0%
z)W%Xdg{KI;bNbdGbpHKKKuYYy*5JxJmw(zSvUNApo8>zX8fjHB$!tyX%(yPQ#(r{H
z4c{YdmTT-?yo|x-G(H0`R~RXt?B&n3!RpdgJHrL6WKYbpBTP=Ao<r;aI9wYCFZcEE
z#r5L-*O%}5iLO1kum}7-*nelj`s58h(jrs3koj;+5?_Div+b+D`q!@M`m28~*@GVu
zyM2`D)B{D<sBT!WCM92rQXL%hQvp?S*d3S($&8f8j$2Vx|Ge?n)--I1nfUOL7m+EK
zwNkareu<)g)6lC2@R>5BTXx>onF{9-+2+Xmo1ZMkHoheD&Qoo>lx15B9e-L8nmtlU
zA at TG;@VK95)WML=<8+R1sRFGrsUnwxH5XCoskV+n6QHIklu8XXNqE96urvhMKJr)U
z+`I}>UAkyl88Z?S?nr5}j2qTZoW4^#VHaTui)ASfg;xjE$3(h8b+L)Xtl;P;dxbvU
zu at cz^1Pv7ctR4=(eY at I_O4gXG<mu;E=`qO@jZ}4bWP!^j>81&!s&OJ9tRc#z)FEu4
zM_XhoEoMukKf-E8q>ZriQ>>l~iRRJTIDC1iM=!0@)f at WEPu@Jd_^ysU;P1iyI}z-s
zzt!qT+W-?I at s-d1a(nADfAgC5-*_SM;CU^_%gl*`d1&Zc^=;Ucdf<$#8<I)@dG($t
z6f`PzqHX|k3hq1xiK0A`{W^AYGV{Zc$dQ#T;Eo`zb54HtM$Y7xqgH=T2Vrs2m?8{E
zQO@>+Fz at Uq;%N3<$0{)@az;3E9sO*8R|a1^-Kgu#L!Md8Wt7^A3u+WfHl%GJwTSgm
zg=}jttSJ;Uii&&NlZJ5qbWVPfWX=h%lsy|ZK;10`as;B6odeML_tCo8Us^N@vjRGT
znoORe<2kXP{e9bQCxjxszjeM<HIq4wZlA08s)DibLR#ZJBdm^P6TbIlwrN`?e}AKZ
zxmw7B0t(b-M}S~8dyHcp_Y4{@ZnZ_~IqGl_4)+KCGf{f9T%@Lq)`PX_xm#se-Z<m;
zy(G{4$?J!guXgUM69F$)BjA32?ZN(cYv{_T6WK+>xse%a3`6BhpZ<9J+UNexwT0b%
zLF%37wccAcvJM`8gQlQv<jnQ+oRLyNvjcrn2YON{Z$|%kb(&}k?lL7JrCA{`iSBwD
zyiRky-9gx+a!Y-zj_pX|M&q*SwJXdu`p)^srta)}S_$K`9VDEEi^#^mW+uh-*C9J|
z0vE)D^ss|E7~1>d)0lHB3y{VK(6%sSvGO6IbrA$oCe8f>_Ke>9;y{?kQ=9J4O=Gc4
zq$qR}5r<pdxL__ at -$Hp<EX&jtkH?!yr88PJk5X0oi8hL{dpPAp+#-E&^om%anEIT?
zO6c<4PFZD$)5OZDEa_vK9Y4!9cKdbK at t5g@HtvR49d_lTu{`Eh(IW$-!TSqhIYP`=
zSn+|aFS%U+J@X-rUG&0gM<%lBYF)j&wr5`~mw){F(K~*i1Dj<E?;}z6VE-=%@ppk9
znYxeldd-)9<?ps{-1zvlrrv%*>%-?$Jy|9m(BvKwSKhd5<*`#Y(vgx|nwTV1&6lSV
z0qhd_vGalKsHyiSH3EGa0euGih;zKEv0Iu9wFNe9E$wRScL07G#>!4d|LrK8?brL)
zjnBn-p}Jc{NFHP!u4Ywj>*5d+Oq-=%jUB%gU?~37JI}D4oF{5T7cRWGSO#emHLu)j
zetfMqL{wqLXv1|fWSF{5*%B7<{0mj`q&@e+bMdWIHc_zh7W~8}n+ThE|JzJ^KX&}8
z15#7?<SSOox1lb!L+?sIn%9qG)S1jw5PYs+5!Pb#B#VG`BmD9E*i73}CZk8cZ~gk`
znCPtYSB&)}|J;!mPfxK8zltWZY*#QGU?pZ6cEN*kY=v^cKSvfA2WvQbc{5yovA^_V
z*AJfkaF=wur}CI_;GW+3j=6qsp1UTdqfU;GMwx*AbD#LX+c&=W^Vb&T_6suHc|Min
zW#T?r&Ja7LA&kuA1mOgw_t;P$=aLXoC}B)=>ZHRAar-oMeyZ3qHRUl1#{c5S;B7?T
zM7cb=%<|ZuZF-#F%3C`RG}*C7pl&Iq>4RnG^L2Yv*b*1 at k&_4`Wu+dZk|UEg&rG(e
zOqM%VpqAph1A5M-iY7=MshAwGi4uBy^>AG&5sg?vf4+?IhsNnnCmEzWK?W^m-hUeo
z^wS`7vZ^q2lz9@%V^w1=5d&CFKA4_zAl*yeojH>SlcPZ$wGnO-`gv`gdYXb_nrWlj
zr180g_zXdaxrJ;`Ya^h0F_UQ+EfUX1&LV9qGx_|Bg$z?dRyw|Eo%`)b56Kq+iG(yw
zmk~Lo@(}b4vlGM~E|mw at mipEU&Aq?({PC?{Y=?o#%3&N{&x_Ok+IRN9^9}x_qj!nj
z at x%N4v+IAoz5lgOUTf-|7qmWjUhDm3)-^e85IUN4#zK0K2PExKg`}>Fmu#ez$b_U)
zndlnV&<8xka*`yQcwCKwpgXFTEl67Eq%958FTO7%Z7H0&Jkn$a=gLl3J$3fsbu)cb
z9o*H}8Stj+Y8<g|-wKSLJ3Q)`8I7VyiYe}9ySZ8n26K;?jYk>Upsr+z99&t(R&5%)
z`y<pUwXQ>|sxeq?5Iv7+8_Jtdsw9xwyNYD298##7CgU-8#VoEx*M!!ADnqDoByw=K
zjluTkr*7|^=p;#X4<9ByKBS5F_u^8b>c@%9vIoK-)G^l3`uN=W05>ct*cPkp>>y?Z
z at jRy!LIkY4mwr564eBWX*bAaR`MD>)ht`DL(^gPhtS+3#H=tgO6H$-U3s6^E&Awh(
zQ_sEJ4Tmpo4uACe!Mp!>m-Aw0F1GLL_hA3K3iP%5p!4|QeSYH?fA;X?o1gknuJ`_2
z8ty+YJXmHuqtVXYDs at BF6GZNl)lUK`yMdWYpf!3mL$lKtp?dZcw?Rrwz%SwgJe%1f
zO!UVrht<93b+YM|tvG&1a`~+&9FuQF=S;KIQ2p$Nlb8xxGUyOFw9zQrqea8M<ymmF
zITp2vMIIvqEry#D<xr~6pF5y)D}ixV2|y#%rJn-G71|Z1tJ%OYVR{ag3;uCkdcsr6
zh%Q2T;xU2PIy_`LVD0pV4b#FE^C-TcZdA7B|6{6`7wkM6<c2yYit?z`*;d551KMuS
z5H!z}>Y~BXZ+5=U1k{?Th(K5_j4q+0I!Rob>eLT2$!VPmg-n4gk)k!XVxUq at Njreg
zq*$`LMC<^m4Ye-OVM&z%IFHFOQZr@;h#f&yL=F%+SXVoIc~j26xL$qm`oWbS?-p%4
z`RI(mzrXfi|GNV8s>;dzdwlxu|K$s3Z+`a27Iyb%(s2Jn!tpZ62}wH|Hl(y6$uT0w
zXsR^g-Db+Z)v3v~@kyfZO6Hrg7F}s{(7r6ib}$?AM4kEA%ni#Pb*Zd7iBene5e*|V
z`4*kGZns_Mo;u_A^CTmA%v%SC7DhwKc>#Hp*Wc;vL&_thtvCMEZR^f}*i4`=*iex!
zf=vdA<fY*5$L(76?%tZqL2oQw7cVQ<&`X2qimD4Vhcl)$L35<Am>9L`9_={hvx*j{
z7o?AFH at 01Ea5YWcOhwUb)TMj(UFY69lBR_`;&UbF5}*GM2uIYqcA(SIz-;alKMgOK
zj#{SiIip;-%m&AbS&c<H37;NCl2Xga{jbA@AriIf$oFSVeVNSFOPj}rw#EjjjW1f+
zd4wgkKk|E82H*(N1FVmNzyhlcA}io<Eq3&BXXjpAFFtsE_3oeO7Hvy0NV4znzmu-F
zou9o$%lhqpfaVs(s><ofLq7A1f93G>^<Vq3Mjreb>+k(AJZyy%RC^KwsvXJ$k{vts
zq8Xt&z#}^r1Y$ls&6AwcS=|sJdXDN&EMVE47K_G#ylg2DT$ZTG&}y^vDgVqdu-dmk
z6{{}qv`092$KhDGnVkYu477%lW>*{iNNxCbcRV&~>-0e0-8(H+qe578aXv=KZZakn
z$%Av<*+Jf8`(oZv3MxV=zVu~-QFB4lbGV6D=L=-1@lbAQc7~xouua<rb{crMh#q2C
zIDO`DwDj#%sg<fBp|l>Yo!cyvkh;Na6O>6s>||Q_65C+f#e-}@se*goSQCp~8|VDT
zsA8H&y82PI)W$6yb}M)AYp!@26+}?PsW!3f>06_$pB at Prs+##6LJCza9HA9U79gK}
zb6`ySlE%Av0XH@}j at JW}1Gkher$}ibow&)Jja^FzRhEMd*IKPFu=&*&&%U;~Ztwo7
zu5DKneYz8Uxxe;c|J#|p@|yuYTaNzh<do0+!=G&*e&bUg%J%SQ7~c9}vC}r$37R(~
z29lhi+(+z`nxRoY+B+W~14(gBqW=<27V+E8SA(0Exl%<YG~O}Rl38ar>ztFg_qa_O
zZ)V-`OyLk6q&;G7AhR5cxe{mR{yg%$tJr*+y?dYK5k0?cw}1UZqX$d`iA!Q!JRJwp
zUMh$1elOJ2`%hf)En4jji(n5a=G=XOG#pd2cl2hFj5RwF`H9IlLbuU<G818i)vs;B
zig-+<N|S8Tb^D=Hmke^~?>h-gG2ETXaZoi at -BO^sFAen+>Kg2BP#YdFf)$S^G{U~P
z%#L7V!CVBzvT at HEsgrZ*<d?*}+qa;cQqWI|*l0a$;iNH)yLTX4oqvRvIn^bjE?%8J
zk^wZn7X{%gjN4Wo<Wd?Wtzo!`Xrjm|38h-bw8I!sJ6M{eYpuu&bie-M*;nm4@BXQ-
zT^@wxMA`<q?7RGbX;=F5fBw(E{b(8<4<4C1dR%wiovr!xU;01WJ2!vzTIT)>(%=5k
zR39#rtx0LaLV8qA5$=$z^G-cOQgMl7a*j3;e6|=(P&ICcFw at bG&>$m)Gp3I+DR6v1
z8*4f?etZmd^<Q at 3k%+)Y=oA}=t-9@ExAw@gQxdl!D7&dokA6Qj*_D98&U4>>V77rg
zfzWI>AkHW{ZjD)T;0v|Txc{K>-D@#)h*MB_388TV8IaUK^Uk1eyby}E at njO@v5QWq
zIPgnOej1SE!Q>L&6*M8?j1E&0iCKJOtzpMtPXAbm;H@(4&suosqX&=<Af1PN8PX-l
z7cn`HNfWO!PGqzBfLnf+P+8?r42j>P5uL}7U*;>(bvu9|ZHt=)Jr}c$@v$uy!Nf8}
z-22|aw%HmUO`?Dry9M$7TZ+MMVcVuue=O~x9wB+{5 at z$^t`Ch1f at ExXCab+K5BF}I
zojiO^kKR*qUc}H`cj&|YwFmp(a(Dk|moTR$`o8D0|L@;y-+J{E*B0fq7j*OH^J*u{
z#D<*K<XjOsM(hqr2eJwpK(8uJ<;a$QS5<NVw(6D&k<i=EWtB2plyVFnD}+n|B{F&2
zOPmzOPW+M1XX@^DHS`#}j~RUZ_MX_*wQ=PCBd=Cwo;jn9a?B2=?`y*2=wFEwjLx1!
z-GUb>a3o=}2+q5ixoB>|REtKe-sn{}YUX{q-~lN;wzz^w$Qk1WizG-3w<K0UwF&#>
z9M3;Me*E0{nCa}s$8r|qJ=HW(Z1Z9Bc>lcC1t()=Mr{r5)1xaSUqI4j$WJ1ADPp<C
zE<6f_E#1?f1~oTan`DvWjUKD`cnq_&?Jz8{T~?5w8*{u~BXZGW;mR|8mF)D)^q!{K
zX>R_eYb=9V>?N#G^*jOU0!<sj$qvzD#PYar9KQdBDwZ*OMn&G2hkG|pkB?u|!}pfl
zG(f-4x7~yNKPTWnvbZrBZB^qpuK!&7&Cmb6YiYRk0>i!M)p`#ckqt=;YIjlYdiaPc
znrp-aCQ@|tGE0ogLFq^Y4rx5L1N|c07(JXrM;@G6&TP0_YBcqeoiT*NqJ!sS6qP(8
z&kQ?B{9{7^03ZNKL_t*MQQ$Cj-*HX=VnCh0mmTTlBMVisJxxqA4aQ*cZ3DT*Lt)FZ
z>b5&~(%1`A=)FhhOEH-wf|#Ibfp8S2VBTdbn at O+k8MN-dFC*|w`%*oU&S8toE*T^_
zryt$A1%Nt`j}k@=u-DlDT&M6Ck;YGCn&L4v!rasU$KJa%Ntz|sVaNS`k&#v1Rn_lq
z%wz*IsF7e00FoP-RcoP at up$@2g5pAdftwj4XhRdt`sc_ at 3z<wCfiju^3Isq3BRpo%
z^L};D^rO1#ov(=azU!`qKkmH|*&s-9Fb`yz^;A!FWoE<|-{;r;oa5)1#8Y7fju^zH
zK{>f47n6dv0~m{&oHgi$%1zMpBDA~=;^#d#m!Y(E(93uO^{=t|?j#IP?tdhX^}Fq~
zQbt4CVH6p$7Iv#70J~?9!&|Hb<>~}|@z}=2alh&xvvDA-V%@v?)-4Q%w21&vDInT`
z>K*rX+B!@}P{|+$FmzJL8%+2D*QejRyg2=kpZi>$Cbww5CT*{a{ofeE`P2<P%S!$F
zpZ@;({jdJ-_sZ_Qw;|_mG0E|y=b*Ah!4?J2!1M$Y6IKk+#BH<H@p$-_=*s=%3wK>P
zBa46;g1Ox-hrE*V0j9pdMjus1tVDTj4=k>*G(Lb`wA1oO$KH9=)2G8Y4Ffuaa*|u<
zzGj%7*trUDzHp|=3Pxi8)m1U8gd-H{+WzOjWYz(s4ARAZkTiryHM&&`12O1q1FSv^
z6faU(x%W#PMw1;N)Y&MwwS&F42|~pdv54$iQAi+7!*BJu<TZmI2<iubY1vn{G?lWe
zlK(Keu?XzYk2tr&E)~5Eoo<8p4hU<I?mTqe;2iZF0R@_(3DplKgKsF8tlDQlevMVx
zNceEc^utWO)n|3DB`ki^Nr%;`K{7Pi_vY$}Sp>$;te5F|psoSld3gJa06lT~!4}Yz
z#1Tma5hjAZF%f@(mxtfGxY&GHZhfwnQqrR1y5L_I`~Rel-imF(58nC8`n!MrzulvY
zci$%2yu~^n7dZpb1`}o!IydO1_!5*$DT$3BWwwrs!{=sFOvEjGggeYUz2v>Hb2|*k
zTX#DUI2ASOLEqZF7bYtV%7^bUy2yOb`-Cg?8 at t{e`vxd<EcQtlUxC|ezHU1_R0zHI
zS$>^E3}z;#U8<Fu{4o7oBGYvP#Ttcf0 at whU!TgGSGuZ&ux_bzBg~GSR3K<Dn?f^%x
zja@bfs%~mVW_3(mQoGVB30*>GIM*@N6eMm;0>r)rYoD26^xV0TlHu$zT`(EJOR=R(
ze(<mtacKu0iERa!8$h`QDz^Z7&dxijHnntJHies~dpVI$GVm~VXrDnG4S;b17T%)y
z!7*l!Sgfe990VINquR48wI+lZm$U+2m_b{6ZT!4#N|y~#*ATwp1>X*L^Tw+_1B%}S
z^BWWK7cf8k-e!Xj%k9tA!ewt7zb^RK#r|(t_(Nj(;~#u${m#GrU+ztt58jsg>@AYZ
z<4K=^=n@kznCJ|w4?smR6~>Abg%zccIaV?y{ysTYUx>{6rgy7!cT4JmKmwPi;U6pV
zJVg1m9T%eF#j4@!6rEiXqkGYTUI%k4miCl0+zP+)r*u#ql#>StwLO8{<fLYl7T-5y
zi}^Fu4oaH>CZABmNK#B-x&<n)0dy0>cfjR&D7_5OF{pl$Tx7UNvKW}9>`PXpwz_}(
z`9T3>^}aX+){(++)knY_K;rjlg^Z~kpfve=^Fof|0WA%}lKl6E^M|udKYrQkQh!bH
zbE5b=(V2&Sf%5a9atFlEfobiw6pK$t+(9?(vucN3i3N>>dJ at M^rIO_<C{~cnBQ`({
z)EleC<Y0+mX4PP(YNpO%KrbOG0M<^^T%as>K&#n3{e3dZ-Gr5GL0eYi8!Ikf!0zMk
zZFl9vquakyuM7QkvHu(XlIGUvOH&W;f3*I~Klq>TEvMgm8 at nfOVLm%%Jp<7WN0Wl&
zF<2jfCt$?|liM3`1Z+oYR59InVSk{RV(M?I8-K`{$qouoZm|xDRN9)eq{H^C3lyz`
z)>!TDNm}hWJO4R)i0Nxj#)`Ir)ceu**gZNEGbd>|Lcd`LkZl8VRAZnzWI=KLd+UY*
z&;qk?TSMt(BPq)r5Z!>5n_zwpz#UL|9++-{>Jx}u8m_GHB_QM!MC|d5xB#YCfTNd<
z-u1XFrQ-fIl)0^z)>Vv@%ny#bf^6hOP9)s8khBh_6uTHE?FWm73dq@&;3g#47Ajrw
zYSVxnHpOM04!NaTX9AVy0DcajW1rH3xDDt~^CPf{h|>bvim{X9Fep%CnZjSCb_cYD
z&4}?8PNv&`sOAj>2Cz-OhUhuJ4g#hffFrQ0x)ckr+=5I`EnLTmU*gFUv_cSIHk at xv
zq+h`1<L_;j8y`;3f4160+osX$UqAU@KR3I~Es=)~mZrY;NB`@|<>McIxh$t|VLm-3
zJ+twXc0hdql808%3s7{izzt7>GHV073`H2FD~{Pw>DBk6st*1&7#s58*R<y|uijuu
zzNf2V2uCN$Q0yE`INE-v(tV`5_piMzarfWYSMq!F$`&HxTT^VlE@n!`J^>&@G=Ryi
z0#;xS8RC(LWxGt0SD<MHl$)TV|H6q9pGZn|GcEFjLjhF+RRy*`uuWyG(A)f)A-{C;
zRqw{rqTq^kWA^O{Pl8gn{1k#Mfo0lN_q)cw%b+L`O#b&KGgs4Y*<tAV{b%ZAWHL=q
z4zn}gm at O{=N52f7J`bhm^Yw~wPBDsNQH^5ZBc#V at N0az{z-Vy;K3#e!xd{Y3gIBe)
zawutJrgY@Fv;^{HE&KU12&WdFQpq-I0g&E?P8$o4q1oL)#j*)#hGGN7*|F;By%j%s
zyFC7bw=O?<XRTCx@&Nt=TYcBR{;n1KAqvlxH_Ni%Yk%^4>nHF3<=s*re_>gktx3*7
zw8ffcO!5q*&pc$rJlw_O0VCYox^UYxB+?dH!JS+&ac{@jc`UR+#uAS>_#VfKtDGqc
z(ZONysUMaa+16DX+wak<55*ql8D2*Ok91g&>R9N($V8-&>ktvx*Y at ojm|J6w1DNiB
z%dePUjk`W_IYzFUg at F*w(4*HuN1t)ab^rSC_7O|Cf_mq?`vAIq1T6(z)*wD=Mb{$_
zHT3LZ at td0Rz@@c2{kX&7OM_v800xJ*si!){|6e=azw&=d28ft4s6g2!1pyme)9cHb
zz-HtRrXz=MrWS646?D1-UA+li-39ng-tUzrD6QQOx};O4<+)qTq2&%}I%dWPC75z!
zyXa!eQaX9^Rj*_!-K3^wqri(>Q7}NKAe^^vT|NTUn--Q%8-RB9?{U9i3&PF{zFr(N
zp50s1CvVgJfA!YI!ym3Sy at 2St;9nQ}D?ywrX7Bvz at 2@}j_8;D(dipPP_xPkNXQX<L
z2{TBZK;?l6(YO`t0(Ud)QlXRpVUrW`f%3-*NbS0L*&|7vC{^(SDVhqCtczDz6c06?
zC_C({$Y@;geFhRW|AOuv5OBNQ_QfO~U?O`K_cB61dt;1WkK&M#AW~TiR#065<#p=}
zi9mb|rQ+AhNmF=a9vwl;5$N~}(84VPH}QYhjn1we*BP|?z@(F<bcNXY1q7DmIC(PQ
zu^bfI^vR2)X4fvkxGQJDu?ZrU0P0>L;=O;61>a<g*5zCGOi(osA8}p)?y{MD0{OM0
z2qk7P9f8VC;OLiu>9YXewr*V`6)QUC#c=k#32Jglf@;v1??!|<n!z>4ZkI5F>Td8$
zA}W at di^->-;_}X7OKp4!rgK17U_Jx%3|L+Pm95z&%hrkFonN~JgbfN?!6$us?<Rlr
zwtVz|ymj&Pqjkh^Y97$nzpi1N$h at pppuhjlpRM2h%YS{3caPu3{Olf<i(}L+CR#vx
z2FPRU=t<pVOfV&p%2{<oZ$4q{nuWSYT<Nd?QuwNLg_p-7T{_Ez-f7VGi#QJk)z15-
zf6sJPx1)!L2K9#%9sJeEN$uYoiFwATpGe_G5Ck$O4=V{xL?Kpp*`TyA5CAWERN#WR
zqKZ|jRg_Et!w7vm0Y`5DtIvWaN#a}L8m5hce-O)$fMo-ebxXzyEIPV)(Jah)zqplx
z**(x+p_X=VP@itr7yU96_HkZwD+TY44UQ}6Oi4KMX<>3hHFlD_pvfm0%x3Zi909!c
zD8^!oS*y=L%P#|b$KQ{%*X17iZ6S)f$;BrQF at je75Y9uF%xI4I$f2yTg;?5uXYOn|
zs>5Ro6p!3mc at 2~gAoEQqy=3WDyoJ)n_64{Cyam$?r45)ap>%$%bb9YtzyIa>!SB7f
zxjgmdw|ZTTuZ#WO;#6UL^!^Xm-}uV!-P7HJw`G3v7R^tO2^V16fpr7a2R3-S3~^Gz
zO50jEsr#v`_WqE*!D&~e_yM4L2*Sq$z&%zTxUpi0X`|i&VMu_IMvyvIo!#N5Kv)6g
z>_bAT`w(?ZBpoK-ReCd7BygqX?IY=XFu+jJB_>}ivlRq2XGX>IP<jExw;e7pc%o|Y
zMII}1V+s at -kylor^{+vT?K4Pm2Tq?*NB~{DyRVOc?fdQ@WVQjZJfv5sI@0$>`@j#g
z239}hMWo3Thd>tIyT(xrX$0m%zYF9dRy$OK+>L~mDGv>M&1E<|OwCigNFTX1gdeig
zEztBPboDDxe$Kxn;H8>}F5%cAv?=)kp~(-Q9V*uL*^w(~n2ks2t|#aiL^s^vEtan;
zn2s!romK!<RQ=F*9vHm(0GOZi(D&KNdY>|N_O!Jf6k8N*06jfk(dFG6%XjbYe*CYG
z=Q*}(<+{87yIkz|T`ZqIc|?Ep$N%crw$I-CpJey+EuGJfSvMfvpx^>h?}M=eijjA=
z_!K at iT}Gyw1wwJpaiL}%LTE`o&3k49lY(qj-?G(!V7SpvLnlp?Ho_X#F$0FIZjsV;
zrdc4a;xG=0;GR^~uI)c0ejUp3pH<a~-)^*!?$w1Ce#E(=D`@tfUjxc*5Us(qwt^6a
zFpSJ14N52j%#{dqd;*@{^c{whkdDE)*4?8P3qskw2d&jD3RYlRHLHfbTUvvJaA+h5
zNh@q_kIY9FNZu7;xJ<D>IBjjZgKB(?6PKT&a)Zby!V9ME5aEQ1?0u=HWlc_a2PWQ}
zFBOyN?)~QqF{r!%ntlbkdfjZFJ$1`k6Zf@;IJDy%&bozJ8 at obGSNRi2m$W)2opRz;
z-R7sSym-^%mJhV}CbWR`)FKnhN9GQSo6zzY&<zwDck@)A0u}%}=K*$5I(u_f&c1xK
z`P#kn5B_8=(vDH>J@>DF{oN_{eOIfh_|{kc&5KVzdgr%wdHS2OJX*7CAbN>{El?l1
zH8EuXwFPr1q>PJ6?3S<rsT9Z98#Yf@<aS=sL5880j)X1HS(#(c-z-VpLrlJ7QQO2Z
zWF3-kZSH-)^m(DqJIhWmR)B>D*eOvZI*6tPJcgDP&>BJQd#kpA@$yRm-OBDVi|2t7
zhV%N1h)+QRDFi+KHE5YYlR~(utx&@|#}B~W2jJx)Qf at h1*Y-1{gVegy&B at KaGw-J)
zCu`H!sN0f*xJONFr5Y~J5jetrkoXT)jj)hliI5~PtHC_PM}9~NR0=es3_~kV7SaNX
zGh{YsMW<UJegisv9#UR2Pk9Q*&kCj+b~uUMzt-IBP_%XM&;sEdgxDi;XNR<^g~qUX
z{2SD>a_b0JB9+M+gTeqkh3cu{^5sX6`2<8Sc%!w2a+f>Fno|Yo0 at RCjl_&Ss{P^vo
zr+ at s`=_h}+)@$#azr)2|v=N>}c<<ZaSik@MulxgAp8XTup1wlMhQKpechLF-q8FJk
zMO-m4n;u@(*KL3)lp~C^=q*I3)I4WWIM4f<%dVr{>w=s6WAmd|R~D*MRs%H9k-4fm
z94xV{q<dD#stOhJVF`VDlEi8r@i9FR(Vo7cg`=RB17eq(zm~s#>q4pY at KRguvBTvB
zXu0DBt3ea36YS)heybT~zjB%1WN_2*>(JHb3`Pq{EVnu#Gr*Mr*+MrTdY69WQpqv5
zm(-^gF-f{g={SxBDzOjH$ZXmVYZ-PKbin5WZm?-Fy!9hk#gox`XGveQ$}L at RJ7lPt
zt_^`RD1H1GfFmd!+rpE&4`;avTKy7q^(H`fEa-)&b}#v%Syl4RRW(RPAz(T3&mbm|
z(vrHAjOQYca)j&ZX#s>#z#ujy57QP9fliOWdI_yJ0X_xTh+5E+hls&PGgQw3-lE|0
zm~eLQh#$U9pZvjF=TARc=e4-bul>7I>;n=31XK*Z`NseIfBu at Def(wFJo&A%oUW*D
zLCYDaJ_F<#CNljzr%9Eh%uuV{K-Eb}+ZdPZqzbNhz{PC`hI`Im6Dx`|efp<e&e(SC
zar^XP_wJJR<d;`%7PhdF4l?p0ObVzpH_Fs+x12$5%)68mp}}OWb-BKf70X@WW8cN=
zshG+HcwvB=k|=ee(!67$*aptuHcs;ZDii4VS5f)M8)!;IiG;wS5I>A$eh(y<ofnS(
zU5$k=9WH((glRur94MaJ>8!H%St`No56VD(_WwUm+5B&-b|~&M`>`1-3R1_{-SmvG
zLe=6E5|Y3TSt#*j!Ra)CVUkEHF9EC1L8o7W;^x3TSaG-MKrvh1f?GwzBx4rFU95#v
z6Cb$a0c&ryymo2ls=Idf-brUj`4MP$?0LW!=GC8VjvW|^jpO$lD0UFNI4*j6?*`ug
zvV8daZ|=62PS{4k%2m>Y>tDYR#a{OdzT>Um`HMe(@${4L{&roS{if9Owa7UbTacWa
z#IlP6w7gJ7^qJwXSiF-i)Zpm?O5BoTv?p6N at AdWlD-^M3qH_9q_5ZW?h6q<Q*avvK
z_MLjj92FxLjJ9E$&!9#Em1K|!JaC#5ijuBt9T%%ed`EI`(^lY9N076sA>;9D^ddmd
zp=sGCHxC;-Ri$y!h{R7%X&o~&1IMp}*C$Zc7C_#)3bXG|@$xaS`2 at YYW3v-zE^~%S
zOOne&xVIm^2M6b%Ypwn@)4>7J!-}oYH+7PIc9RpH-Jy`AP-jv^4Cty6$z*UxCOmbV
zkGgF!@dUw9dp~ppS-k?DJ_GOz2JQI4%4~-*xtpbUrh+?Gqjc}t%*@uFpfy26+;^yP
z2Z{wkvkRL{!fWC30-8=iv<2;c3Ca(xyC(t2U?FC2G~Aj2*n;E&N at vFtPVY{;Z`|E{
z@F&OCmw7OYT%km`{`HGd?1N<Nm#BX9{co<{`}!aM1I*9<N!>kt1<NUsTEMg}W>s9$
zb&;HujmW at Qgla@(5K-~7dI=-pP&%`(b{V#7iM)H`PraN`vlAPRI6du(zdIkYj^BU3
zz=RryLsG~X0>%g8wmWF}uYFEBUPP>@kcM3Vbpt|Nh!vDx0Qd${*68G;1-zG`SXsy2
z+&R@%P6_NN17!_bf6i1oQ&R~=caPa%DybE;eb3Cg*tGWI_P?gqDh4a~=bB`n)Zu{9
z4EDwq1TT-_<Uo^Ek`A9oI}o_ZX#q%~y#t0JOerxW<`y%Sw#D)HCx_8i9{18ZadY7`
z?;mlwDUqTmqfWO#t2eFNr!|;w0yuUEY2^wYB(a>+vo>=zTafZ at ofN9Gxm_x(I8!W`
zt<d%pVi#oxJ$fIgFW625J%!Q^$QVR(K2 at D<2ZFW$Z$a1qIDhk)&%VrO|L)%TgLl?F
z$J4I$wXec27K}qO+96zA;9Fn$zfQJiAN=z=pZ=EC&5G)!;kWZcFt#XYTdkyq3$wc^
zM#o}doB^zh`wZH1P$QEl7o)D$xQCxiZ=(<eMA-bvbFqrYu#t9XXsg5A?2w}am#c1W
z*(Y-KV0fU;M?XDuuGq}g{jc|jm9?wo-GrjjzmM32JqFP&q@frWpjc6gu3r5BBpT-(
zgBCo<MBBBHLcscUvowZDLyhlr0=xpKE*q^M0NXS3iDxGvLs}{G0UF29Jstg?F5Tk@
z$H$?)htT6E45d8$quu8dq$>sA)Y&_*7wXvWh(aHDzD;OHxyehN#$V9Ge#N(FCkP*T
zmtXAKlmcD73QTVT<yObB*zQBZQdoPSi#R?X6J7N^30n#yc1MS>c+RkS=O$Q9=~Ifm
z)$-W9?&mk4{1l*bC at j7(0&i^ZWid}4Y&<^ld`)_GZ;gllQa|}Ozj1l?kU?#8`&yy%
ziwNT=4J7B+zw(FcM<0Fju3~dn=F>IHDTpgdJ%{SKEqj!3pTv;*BSo4uf*0CC7BV84
z^Vz!fW`m%EeZT;~?-i+h0Qb3EG1#N3W<yC4C_$l0F>f7H0kw`jHfgWAx$V#65!SZ#
zs+QjxHDvf&KTK52 at ND?DB!>5Ahvu-C6oZIJ+}9;A>?0^%GNlL|L1^vTZV&sQmC5nE
zAgRJ|VhXdcRVV2zNm3i8b_}e46<UhnHr&Q45(O5AlIBZbz8}<hZuBOHLE-RNLF$l{
za^rx)v`ZTAky)<!NK9QP+3^9|<;Zr|Fn%sE`w|s3*`@Ouw!PaeY0;i;-)|D)GCZED
zIy|aE=5d2^lrWJ{C)1?~D9-`q6<@|$`{!Bn at QN&yY))LCPcGjCEr&K9v5`y#O4a0`
zK7|U*q8cKgqmRM*8dUFq=rPDuIrej^?`JILmCs@YA3G489~V0Rdu#de?`%H$x3AV^
z8SGK6JNsWW7{{F(8HD>kes}$&Z~gmwb@%jN$oBjMa!xD at XxU(?kF7J{z_1xq*mWOf
zeGoaLNPN<MM$Jx^P|1v0OLo`Y<0p-991HCpgeaYU|B7jVJ9%TMW=0q%oF)%r78?vf
z2cvAlOO9O&H^Md!0{b`rn!5ME$he8Bon+KP){)wOqDW7=0peRp+;Vao+>P}O9tw!W
zECj?m`!Im>3&6g;%nTgAW}T@=M20mlglzl10;mhHxer=4O+uxdhhR)lDsG<;{xuqX
zer=W+`Tivj#H%bTpq%lMHW8YBd?d~lLbV+X5!=Y&-&6Mv at E+4gvzE?nR%CadVJryA
zr(b`bQfF$m3{!V-A6vmMp8@mp`5Bppf9uO=-T0~V0pV<r9k<YQ5`$~_$R(eiV~e#P
zpv6tnE<np0uF84pmJ8xA(c+6&9{l5kE%XvZmoFXB<{uqh{Kapc-~Y>Fjl)T=)j7X-
zFpik)uGWfg{n`J0vOWFq%h;XW(|UT0Wd>ve(Z_&pQAlxv36q*ZR}{IyF~F5K(uH!X
z*9_CyH!tEIJ}HA`ZI?hbSQ7+6t3wAr;QQKe_M(kg)lstksU19Z;TikzL`(`$aSc7Y
zNB-gWHiu6Is*FHRSMZgskeG|E;V%lu#8m-VL-_>|jyponT@<^is#mxS#HO_C&xn{k
zZW74C!0I`aqhB_RH^^F_f at q0mUH~}*?VefjV(u2%^Z@3Pbc>TF&+JLvRHJY+M+?=F
zbOdukMFbT#$R+&awGq(i+Y`1BwYnX1`yPjRtd>-T%Jxqd;RYWySc&#Re2O17?0R~F
z#39IQP`M4A-hlFpAX=wyy;(1mG{g%VjNlFIXDnd1dmswfshIZ-351RybPUkeLtm=-
z?W{fl>TQTT50o<iXMX)Bf2UUbIXrY|2Ve)tWr05Z^`mn7FZIbE-Mf5tf8EPnuYdhK
z7JI$Az=@ZF_rLe;_5F9heph#=U%>8SP0IzSUP6~MXnkrfmJX>9cfK0LsWiwAnfEmD
zj$x)hm=k)^5klewpZG$LcrpL9?jjeR`VO9Lysc`QmP)4N={<N<_+Xi<p9*^A$3CIl
ze;*PnzS>DD`-7oh65A7+?h%xGP*!Bssz(m;9aJa$jHGkZEuw at kG^CI^`L*ZqmeaOB
z5fhP+nx=c2fc0k}<&N_n?fpW?q}~-keFmMM8SKaAwcifKNRBe>ycI?xNVN}5ACCot
zI+TY)i<FYYCTa^#725qd{LmSbm=v{51j_a`x=L&1gU_6MexVCSL4$TAyorj(BRZj+
zi&shpooN at q!bhN^*P#5W!AVlxzo_PY)N9-;igoioex`FKlUpgw$=Q%UcZvy$V}p$7
zF@!dt<uf2`0eYMyt?KOWd~yB0fKegX0oZ``a$V%&-i`YHmv{I7=*@X)y8Eja5U&gQ
z&vvmtIHYZKWM*tGF7eI3_`{RU<^3<o_Vi at d3xaF_Y#_@cU%C;SUdwn`kneEDgQFen
zI-}Rbn=i_cX*+m`H94J#W~x$j<-Jt0S79j7wA!NMwyRGE0VC<YJwgZ13>&xI>uc5r
zI!rE6*a>o|01enEI&ZBlphE~Mk}^z{z_P>s*|$ZRA-DzTgrf4-7+00{wWP!QP*khb
z+HXaBB2tH+%jy<rW%kF+mRzN3-Mz^$38*t<_ZTFX2Gg)#{o0eF0YSO6w1XnzCNye(
z-tRi{+E!wd*!G*f{w|BJC=n5AK!vcPZ`awTg8l#~G)^8u43w!W{F3_v4Fanjsq7F-
zlKtJit4{RN5uj@*ulz7jPwzSctzHC8pMzlKvRVanNm$J|nre%R#7@pu)Aj4ILn<{7
zdd1E;F!q$Ll28w?J_hOw0G_wbT`${IL)F9DW94vmBG){0SWb_bH+NT;U%h+z;4hDR
zgSx9~$u-3Da{=Q>w?WE)0^j_LKVCol at z?M2a&foT^EE9OU|Ar`6DV&%L>UGmduK=V
ztf5gai|%!~eF3rum_0#g0(Clg+Ed{)rQ8tWEe at k}cs^x}pEe1gw8A_<rLsrrc0Z2~
z95bmSZ*c`=GD?x9`+iETgNy~M2u%k!=qtR0>>Ezj0lKFO(`|sJ19wgeM at a$D>GJyx
zV0NO`{=Rt1Q*`$wa|MhWJpvv7k_C-0nKg}PVVi5Ncg%GQ+ManlM at bcraf!2k-Tv$m
z001BWNkl<ZM1&fLU~bMfJdRUAv-e0y(6r+IKH(K(lUP{8MWJ_RcKdT>o8(xb%x<gQ
zk-?qen>F$^Nnr~q=~QG4P?>V8IY?e{yX3I at 2&)JCJ%*E*0*b>yzP-%PfmWY^;@E8<
zia|9nf;J57g5&6$Dd;MQ9N&%=s9gGz;yDP5dHu)&OpgFQ2bNb|aP$Pk3n~@gvMy~i
z7uMZ#_}|k8MK*7)=<J`>hyVW9w&#zihrafU`!&S#b5ZP@=ADS}?D0eX;Wz*EH*`7u
z-FbU<qIE;0Gqhd+^~^USU0aN%qeq{)s-sfIR06=H7&@VS&zZ#RWt2P)WbFQp))mTb
z&uREN3Qf7R4cPVqM;FWeo7jp0?JfTB0sNKmeuRVXr=25bKQ-u;@3YAwN#~U30nZyY
z+gU}J)_Y1xpGniZLlUbiCT at d#NEEE<a at 8HEid)gR)b8jtV0t4Zu(?$$?wPaOfMg5Z
zoi$?7NqP~n@Q`jft(nA`iNA^@RAt$(J$6Q!O{=OXZj={=9O1!F7Kmf!ZPdbTAYc!~
zVSf$Gdy8e#+fdl|Y)Ycw4@$c2?FXjsb3;9;AFva6<w~gIJtBz!z5_0=rwv294LCde
zrpB2L#zY$~-D}AC9?P$t!Q_7UvV~6X1ItSQjyz}gDGIjE^O(k8wHmRVlUD`l4y4c4
z6E1(_X!+4^Z|?s;FKOHd*SO8kXR*(K5U)Vr`r4nqa`yQB->JLPzt79rvDOP<*`U@Z
zsIaZZK6#IoExvB=^PjY}#t9oU4OS;bnu<EK%<4I?33E`$7W+<iT&&Rn7mpwl?jUN)
zF*%IKa*3REc<t=Ulf>AGTFf3?-j?G)lPwBih&`mP at SEL1Kw90R6$BDmZ;2^|-GhE4
z0nNu|1?ZB?Q2oQN)D_g!o$sqp1grworCXkxvXNG;Q1SGn)pNl5mmMPLikbkrFjNF2
z=fHdcUN)Y6%Frs{saVJfb%t&ZJ*d)P|Bw?+z<HV{gUe@Q)0m;^YrIZ!vv=@77{+mK
zBpXRe!xXeoXQ%8+owRzWk~S8pzR77<4>%p_l{ajv9#bE6djHxfXq>y!PWmZ)3(Pl6
zhRoHZs$@0`EbL+HD?sfYv~AjAiW{Gb)x%wSp2D6ZoAydMv-h>U?zzi5Q|jOnkR7xv
zP%h>^%j%u}E-jH&FJC<>Xa9sxzxwyjAH8=Rli~HRpTlC`a8Smhk3U?$|Lwo{EzGC?
zaM at nISY>DKd-W6~r&twB4zkWjn=+$>lSsP>s&A!Nb{x8MhNNyIw&wFkO}ZzoEkD2l
zmAf2S$}X3y8-S%|Uao+FIiZ#Ovo2D#hhZWkH at cWyGy`|V6gkl(4!l2AbQTK6y^*h>
zTUW&>9(>+L0u`~>>0Kw&1k#&UFtg~?W at pj;Kw?g%MZ?DXYcUPpK&sW?sXVc~qbzJo
zR(#94;;2#83Nu#%mZyMjp}PyawrPyk-5-IAgS!GxEzU4Lb1!m(ww#+Rkw|>QxlM9)
zFseH|{6hvB&{B~OcFWy^#S4EKn(tvDE1^2_jA7UE!<N~UqWC(Q%hPZZD3y+_G6|>s
z>jacn4c~XZt9_;}Sq)h#7Ld%QkEbB;tJ^S4V7df!X);`zv$)IZKCrxG+z4Mn at x=Zv
z+w{ne)q`e$c3 at P1W{<!;pNedLYmF!WeD}$}JDKOLyLVoD-~U_{`+au(JMaA2$?4Pg
ze|O$p{JPZB39<ptM#`GxT2a`3rz>81IS8I$6ek?_7me6$$T`BAMNJy1)}h4{%f7rs
zX(QV-={@<Yxq%4R%=Zf`V at I76d|&kYg)VC98Q#<N_iCK}`$j(PaA0UZbpUN4OuKQp
zg2Q?93dqHZk!{S9l&0D5(w-29fD)uSf~~yw_kbpGZEzPkNgeuoKy7lO0<3OZQWHf$
zycgA~(1juMGlTbLgL0TA&tdEewXzkISbBmqDP~u=$wN(Yj8N+A6=*NW1nJA)nw6$#
zvF+am@dO#K%(iXXSriprIcKn!54mT*p*_TuuY&<SYOowpF1J}`!U|GW&5GF-RJO@$
z|1NY4=9fH9apf_D4&BuqRA=k_!wfE`4d(%zD^RRG_R;>XQVVM5@`)At`E~ysX9!NA
zx*)78dTC`wFVdyu+REjc`SR{+`<=TN58gR${M)tm{^z3DYmYHf!6zU7c>UhD|LiX2
z^SiP;U5ji$^%8Y?0+wBRv}Ey9v5i>`j6A$=G~ZYarAvC0TgO*pc~LYW9K$+wu!Xha
z*kpGHTeZ at l8;LDiJroVJudx;LD98uftmwM%tKhCe2L@?r1HDHk_ndFPA3z;%QMGf8
z>|4^1Z)$Xq&zsz`AS3haeN^kR6`e$~yQR7~J}W?eVD<@G+UwZ0#m15VWo5zSaPqMj
zDaqByToMK9GhjXk&6nwwbJ&^N1R?u26#ey2#Z%`NN-YNg018RMZ|n`ict`ghk3i*d
z<C>ii&h6*;jJR$8wy=|{AJH)+-flLfRr^||By6d7z?62MODqbq?HE+PW2Sc5sdGLz
zMw*t+{SwBJknF*k1_xP|ibvn*>@J!+=;|?0U-6KZ0^kDB({`!3LUi^HX)y~0Y|Y=A
zwkUe>=8De0C=dVqB%%z}C*W%c|7X3k&!r*zq<-+NubrGex&NhQzBtjkA(k0ccF^VA
zEIG7h#~XyK?2X#-u(eH48VFbMVojZLkkxeX5Zl6CT$inTVI{q#L5#6kShXz(^|DO4
zLM32{JnX!dy3&Kjt=i!-b;f5AlA@iF8;!*7erzG_b*9?kzl`<`GC?XH>cEciJXCKR
zPAfWe>$y<G1*F~b*RVLWc&AQnfsOm=K(feaw{SqZ0?GtBdKI*K0YZxE(UB&>45Id_
z6@=YIC!-A*N7MHv at c7u}&=BWH8+~Z-u1AKzr_5CtT$?O433Q^pF0<v|lC*BWs`<zW
z+3!uEQ<Cr|x+0dcOS|Go%3`x1ZioD8T)tDbiAZ52I!z6hL$|EQ3gQ*O&jGY{xQE)t
ztY_Hv{EHFqnx7+61?Uv47j{^xcjP6e>;ftu+iP21Fery-s62z>3_yj*0>Ta`I}kaE
z56iGsbGKbj`t0ti{^;)Z!8^wh)?%5+*VX>#0JFEQ{^`R9<wxKB+Gl9F_?+yXu2nA~
zbpxHBfUwC$mM}T%2}mM6=#GWQPN*-q(j5XEn11Jw$Y|2W{Si^s4Y`*7|4ZWPO*x`D
ziAe3gKP8#Pos*=HUfJDeQTE~)vQ1?<$cY^Sn7Tu$5usNyCjMHuS#8BMB;gLq03GF_
zrc``V5|{OHnrk)k&?E6+sZLf?Y0QfCaB%ewy$@s$Yh~gi;OKei(J$E<F>%KW$7k`>
zm0A~om|qLro*+K=3iai<AXddgMf%Q^bMHbsl9tflU+R2mBgNzI$LCqPgH@mj>6ja6
zgLIn0s8=>c5O`@p=s|Wm_b}LHut8?j#YCC{fSV6Kt(qrLguj;wN-NjUI~l^ax at pL_
za`h$zYp`-N$4lSo0>x~wO-v1YenNs3fSV at Qq%D*_2I?z~tmg^96F@$;!tPUp?LI6%
z`ptF-&>Y?U at 7AY({$Fj*9&(1N6AiHF^{=0yVy`-OP~ZQ?S6 at GS`2IiE<@_~SE(vu3
z$p%tS^9CabVxlfRj$IoGshv(Fw?7rxrBv^fg~y^geM%f!kGW?)XDVz0w|Di7t69QX
zKx=$|8sMDp_^9f)cZc`Nr+VFwTtglNLIYVl>hbAQpror0vGET)3s%HE&?9TMbeoxG
z$6R}eDvKu#1X_vCI<jDUlA2&@Bb`$<6o<~Di$OW7*RAloj}8&iCr71%=5x@pfi4#Y
zOQDNt6z#h2hJA<4bc4bw)CtCYJ$FnC<l6S$Z>j%GdX<%uq6oY14^nz5J{6V${!#au
z^nDHH;j=L7g;nlYG`_=Lm-L(nPbNDhq$Xa;4rVh@!>}PtC}5f(bkm`nIS+e9_183e
zQ>7sBWh|N#@~K&LOFKAy^S~5F)$se(BVbtr`l2uCu^$98AddmQ3;+zOwrOi0@&=F%
zNG{g}mw#_9AOFtg!B<}mK}1@MT-WoT#m-*x=6L$}34Q;YfA(sf&;FY_U*48FL+TcF
zcM53Dj$YN4V-C`Yc>IV<xIj8Sytu)bcHMmDjJS1ycAn+?R+oyl90gppywP=s+ at yMO
zD6t!o4Z%@eH_qC0@;z~<2MJmHA5=9(QIg^tqtd#2EErzfRd5mM_@3-9uE4^eGL5I8
zU$b`bN?ZHq0*K+k64R9$8Jr3n$E~LDZjVDN4p?PO#K5!$9lZ!GFYL)d0hZ#TpGUwl
zgO&@Z#(`w%WWC)4tG!;45dv#aNtdd1#bKED9Ul^dkz_g8UqirEb9%9bzBUCcstNOu
z!#j4)^@Q)?BfAgT<W%5YNHfDQ>xWoc%M652+|a5`cQl#79gb~*E+XeW#HHWBju}Rs
zhcOehW1kgUj<2mM%;ux7YQ=oo0?W(pXFsFm&Rzh^BTuptw~eSEp51}d6+3$V(u9kD
zgr|S?o114JANxt`*Xdf4`7>4Q_w8Cgc=y}4P9J^nUu(U5eVI1}vIXh}bvaK0DwHtn
z9Y^hm*;a(ZTPNg|YAHO*gGanQczt(oSgNXmW&b!rr?6>Vx$cFBt2Se+mbqcw`;yJO
zrgbyvXmc>=?$JxVyDqp3H9xRGmd-cC15m=%GYdSotlWKwiUPZr$-H{J=&`OrxM^;S
z;+#YsGi4L5 at J_kU3<il8-kQazdDpPNw%KuLvFJz{6Va6jIJyO_Ubp>+ at FakH8dU&w
zV_oR70jUv|nx6w3Cy+^B;wedJ-Y=d#Ks32`%XsKhIEZ$sURSF?Vp%NEFindLONg at 1
zLmcCuh`Uf5|J*Zw*3AsGOA$-^1chn|W?(q*CE&Es-zR>LcKy5TUgeT0RNxmtxPi!3
zNFG8Id4v!FSZ5|N>vMJpI1!)fq;#zl|91d&0!<Hr<$0(~pt1qe*6%4cpZogA4~RKk
zMa^1a2f_@NT`BtP*H`k%?`|Ld)rko#%Jrhv&oX9DMA&RL`2IJ(`nt?#|Kq$ne+_j5
z4N_JvTY{T3!QT+p%#kkDFB7$*SXsyX*RF~u^y|JbRTY)USO2>}5pf&uJxfdKAZ7+2
zQil-o17xK0%aKkEv-qoFy at FiTuJG?IL>(NWwfjNcqE*tg$_a0^P?X-!J!C|NLD{6T
z%B@*W0`hS8zyuMc+hLHl$&3o3DZ5JA4|2(ZAEbnW#o`224MsqjfTPzyy!KO!vI8a|
z$Z`&?=g?&a>Sd}-Y=JF&=xgIAlBg_u{K4Y?eQ$9`scTXiEc0nA`pxdR`3|uHDw?*@
zCM1v{zW^|<qN*guugp!lnbruA4Q#1mZJ{Z6oguKmxrfri!#i1-8O0T|X`l&$0->8A
zy$RCAe0 at -jlgWdm5w%Jj9k;!9RFE%s2`$d~G-;)jt&z9&HIFOYf(n7OxRWRY@?_*r
zAP}`BE5Zh>oAtyOclFsfKfgKsWR1A*l&>rL&mLxPH`+%(`oa3qhu{0W%;zV%Y*$z=
zp|YUP&)Ti(54Qy!Q$hy=>>nmMG5!V_C|1mu;>rWB%p~0eK;a={i$>BVNu{?<C~W%f
ze(=j_?uP<*s7-vDAUZ}H4&D8p!Bf8oH4?0Jpw8(%@0;?W9f)y&kdHxnMc{UTHf?Du
zF8t()MQ!7fVdS6gM<#YLi`wh&^F1woC@c_%GKNDfp%3;gT6mayz(Nz~=tW?<-QBg;
zE}Kod0`nt47GS=#2cO%4m&H`=01>cv at S5Fyzr-XYUZ~n>W|WPLWc>m6Ap_38Z)Qi-
zR9D<vcO<uA$B%uslV2xwLc9y*sgxWDbzv<neQQda=3XsUN_gW(z^^Z4DH#!s$t;j{
zwj5i!;R{ZyJY0+<+xh5n3}ENW#+;LfP2yAQ)?r0ow1RL7EgzeO0<9s%57T&=g`hHn
z^}>mn#i1lLJW_X<X!F^%e*90j58wH$CfIuY>u0Xmhc@=z?|$QCvw8NVx@=FRUXr3h
zw@)F<C6uBwYy=Dop}2Q@?|maf6J}6@Rxi>Zltn;Qv5!czPnnY!^M&LJlQAA`2Ld(`
zzd;pU*6H3}e>SUZ3tP2y_?81YV!suNg5p6Qt)o{3WRU~?{lFuLj`4+}-S2+L?LkjD
zX?UfM!^*zNV)93iyR+-YojRy3o|)>t58alb>u;(OD at L{`+iVBoI!L#X8pSy{0Ggf$
zR<E_9S^WLEr3%$&X63MK09l6o*RW}h?@8MHPeY3yI~cKVapi+SBdj*$^CqOCdy1p+
za5$uec!1`*o6Rn7RnXEtOPg}{2%Xpl#*+36s=dcf3uO`ZMu^xa)Ce?j_0{yEH`7mG
zInSIbnKoIkt@C$Mo^b>0iY>z0a}E}}Cpzqr)gU#LM*t>ZxnrLT7bAS(K1o!edJ4p5
ztyDK%GtYa%29V1e6L0=YJp0z`+p|X;?w;4benyIYbihP}#}7U}`sm$ne_ogKU#;``
z8Ztv<#!}DovElS=L5}%V2}^JICEmG8mwv<}X=YyXO*^kT7PgQ?vNkL_^JT?zWii?;
zsA>nzbU3(-cF9&)#kBlaTn`Pe`z-i%@MOt?8ITTW=<ct=@8h8iMG9;9?MRZgSKS1}
zQ5db@DVKvufI31pVh1JsgtU63owUg&(dT%*%{?+rj-0S9;U3Cf)Iudg1YNCx@(P4Y
zMoKcwewr&m=cgvWtUFNMr9!2dzDYX(+!{boTh_34l3o>5R4BFpmc1<5R>YG4?xdq*
z5Y^vAAF^kw5uJ;42RXOj$J2#Jl~zFNBnCsdVUob2CQ+?BXX?CmD30k^q<Rj@&kYkv
z?kh0by@>^abBJC-^}=!aIP^KKm621Mv^|-!1C<BR<z<NOKsa}Oepp&eX3v0gH(6VJ
zB3rWfGb%{VUs=h=|8Vp0+piA%k?NQ$asBIWx7fFb!EUV|{qQ@Vy?A>6pVoQv*=3nY
zd<0(>GfrZLnIoyX`Ii%^1gv~pRhLlbl#ZYso?U2lrHe-ls=9l5wMfF~DoGTJww%#4
zH4BKcBYzv2wih%K(2slZ<o_QW3tLD_iSAzZdJ^uWll%7cIz|f${q@(oU;a7#JN=>N
zcEj4)H|xrs4HtvHmYN-61c4yPT_vAZbm+>jde~S;KmPtTmrg}vR>;o75CQ9#LFEPG
z9l3cDsRCFQ(C*YZm`gBwkV^HUCkoUSBgleIzPfi^h;71>se65Yvqxpb@&8i_4UGpy
zK$9|_ByEC{?mnRL at ZqM`Y3>W=QJ)h=*Wef*z+k%JL~je>F_XCndTz at m<m9hSC995<
z73To#pfI^+ZO~)+7$j>j*50+-0b-LxOa)s&cWyxEv4&UxY(R1j(#?w#o&9%u_VpJw
z7f(US2|1B>oo at Bhg>je}+wB(bfA^gm%kJV=rJmn_Y#?>UvOEKH?*sC#riOKav~k#=
zVZ!2;R8e57<L|iyNSz;z5Q>;2lhGV3;T}5GrFklpsaL^!D)zi?)Czm}p0Oh>mUPuH
z_7a`{o-bJCQ3^Veb-1FNjzumV#{YvNBXnh<9kloH8hS*){U_}Du1$4;=(s%m8H+(7
z;lVCmlzk%TH+1s at 3<7wt3fQw%j at AG0*$G%l{LjdoFlF_slk)^&n;B?vBf9#~<ej at 6
zYB)Y-05In!o`sS)oI@co)TYouBm3Bw!>%mbe1$i~RfYT03cu);)))uh?^EnES_Pkm
zNe>aJ*^xzIbY|0D%e4&x)C|-dIxV+-JC~aiCl|xtWt?(EjISv=1G>vaJ8`qN<d(W+
zEUIfzxiH`Q`kGH8;mPAmRTPKH(_kuGp;Mte+p?8h7S_!xtKCPR+dlfvabWiyP<vhB
zf4VRZ at bQQ5tsj5<<C7|z8#-@M>jKmZ)aA^uy)F_j45=mp3aOJ!Xx*~_McHHdkjpKx
zHA*s06{-p;j-^+3JER7|7=+Q`>3(QLci;SQT0zex6)~8?ED@~e+M0i}P#efvm(`_<
zqK=YAlAgrtv34CKtcM50h~G!IC;NdZI%SfU`m)ey+0bzB7D3oe4Pg~5t(Z|yb~-$h
z=5ayi5?pVtS3?-F@Z=L$1dnJb;G<Uz{^_opIA1}_Q()Oa>kf=vbAOBir34mN`ABTd
zb_8)0!Blm$C_t8uF{i^K+%IVD`xWJd>x#Q(nEJs}k`hla_WjU46#{C`r<Bvl9tH0a
zn017ue1fZfKbvavhAmn3V{1Ta at azCxdyq;vca{ONi+dwvs_Z$xip7%0z@X_dXn7Hp
z2$dH*2xOi2x5=S*V4OjzI;3X{c!En1FCc7BCY*jzo_+gdyWOS)`Wn9ZDHZ#DNa2I;
zfA8e%^wF1=`SL{SOr#Zc*+J?Sq>SpRMpnG-YZmox+lf|U^#nTa0K<Yjb<pll<5<1M
z#;VI4AwU%!)Hg*Hx@a0^IomauAgZ>I=hl@<TG@&}_*EKzkYA&eOGvR-Bn~A+|5)`Z
z9XI9oA?>V at J7zi$xK58hU_7zO>F$`UXkB~Pg9fSHGIeWK93{e(SUe}>6(JxdSlQoD
zkgjt_D+K;iNk#<=eEEtHVFT6R7gX?c1Wb1Ty48*7aTqIf*?^V{n>v;{WV<&0L_4Jl
zXLo9gZ%c>#_DqTw=bp6L at 7?!|jrQTO1F%N)>dsyEzw;i<v`@IeTs=ubKi at +=rCsMx
zX=!nb;DG4VV+W;4QRxWGH(dc2f95huU7&ht%TIY=c)AuXC{UjQSNR$UrCEt!mj{kc
zPawJi$sK!rMNnz(IvxKSIYm)#8hjcfUcfSg<Z?~4xr^P8@9s|DJ-&(ux&HN2nsY8L
zF7V-d-&xn?{A8Io>$&b+Zg~b(ab*Xgc3v%g^k8LRN&k^%s+E?)6`uR4+0~E9P%<cJ
zl512aah=Cf3O)c$NhqyP>W!h|?+htf;+=o`-FLwbzNMvJ70g#Z7NB&{>*r|R{aFhh
zr=g(rOIoxi`%5(k#k2vJV=h^6+BBt59GQ-~D>4>5PPT37aDZx4p at hV;Stj?Y5b?0@
z9?N${i%2JrY+e>3i*poi-#`pn-3F~*vHXG3ikmC|Re>%K0oj3;3xC<GvFQ*3iN6k=
z!F>=+-XEHaYN6UnLjH;k>*g2p*WkmXpAPph9Ucmzqfr|lj1a?tIx_mwAgS(9qcLC&
zZ5&1}qJ>Ys at -6G$Yuxll_IaWJIPwEiJ=AN-CBdq3kV<y@*%**C;eaZLwg5c=<`)5;
z0W2te06KOSc0wB{p8ESV?B7&LGbWnBx_xscr(c{Of9s^yx@SFo{p+Vv?1=~uKK$|e
z>4OhWROU6+#U8x6g)WyF#vKE+x<=g`Q`tIh5$lcx>A#}zupU<|)LL6QRH|YmH!2f5
zXSk0@4|xD^f>5hF1xnZTE{@fwtZ$TH0?k6e>Z`g3d^`-U{&8JtcBP at 30T1%eLoIjL
z;aBa{L?dJ`7>Q2`a at kk(3+PHgNYnFI2nskiPqksEUc^(#l2Lf2fd)PXjnR*#JIJ~n
zfvbF(r6!!B)d*sSK+76hUW63&2t(h*uf>|r<sqn6NZqwf-rg5J?KULUPuvG`bVZc9
zh9e1X@&&)><WnDe=&wY)msk90_`c{Kq_g)}mctNv)i${ZrUA0kzUY%2Oxc>#TAKh^
z;qprFrpq1ksMl}{jnu1^8{@I>Vfew~*SVy((ax2s5q55efVz)I5WBSc7^p8<m^sbp
zjRMK at b4dj%XZ8$1j31yKDt1tr0o|-8-rU9c5AJTxJ~{4{VE@0k^6O&%9}nU57yg6y
zzJGFY`Rq%z&L^^L2vSj(Eo$AiuGG6s>K0=}Oiv%sPJ=R{3*@dVHkV8*0`_+oF(}AT
zgXSquOA8~hXSi_zLLF4#Q-o4<c;@UVqD@ibWNqyx2Ww8rCX)24>13NU+CKC}y83&s
zeo(M~-+`3Pg4 at Ex`yw3dw8~YcIAacOE4mGnH#4-Fj*tl*IJrkEKGn$HG+_ at nla5vu
zdrx0n-|EX&>gHMMwh#S%B%U*i)r(*}=QWmx5O$qUq00qyF#`6=2HQi<W8xC9!9}0}
z<Cn}c$o_OZ#B?tQa{u0!{|M|@^hzwgeW-c`M!%%rP&;6J(W={T=+BzS`0cr-IEbyQ
zkIA5baGX{OW*oOgkp(1+3l`@59!2NwKoCG|^VYtuZO{^Tb}2&8a^`sEYd*!ZBZE7%
z(4Yx~El8jG&#>o^u!ZObtUIu7-dyS9FYX?H=R~i7kgr|R{uYXT`ewU5!u=24U9;>?
zux!`0E*1_wpP|xXwgs?o5#>D&iK=1Z;!cYc%TAQ!s|Y~Vq?)GBDXDL7FuZicuVeR%
zdw&oe*c;cyxq{B8Mmzar?>`=2+oc+|)p=!bb;`50oLZ6QE4HNmId}^%?8-^<lA6cZ
zRhX~}dm>Y(FVD`o8I8rCv&&LV)?RYTXemfbJ9ea^Pp7iN&7L(HW?VAjtwUGIou@<p
zxv9f<{S#`%SA9nzu02CQ%+S>>V0xj0`P at Qy0m#XI!UC;J!{GLdarKR25>OTYTZ>I7
zB+VF(I-Px7#|Us|hso)$a}niFhuf)hx9KN^{_8>|lz%2EeRakGjCmOS3?M71gzC>C
zB9Eff at esC1$qCBlxg)C3a@#{u$Yqrbp$UQtqS<#HmX4SmVY|rvjixEJ^c|E$P at p^k
z&o@)`#Sm2YDYE+@4v160p&g=~-4CiBPQF<e-kiwk_ttfDel5BDX?OOIKlyn5^ub3b
zRp#}w%qUW!vO|?iD{MiYy1E9j)rTQG$QO~ck)W_*Q^dUN=N+1X001BWNkl<Zm7>d*
zgc}NCwcd-b7`!503q%BS at Bpq%iSAyNAe9Gy8tJ!T#hnym9iCc36cF3IrUI&7EQ|<s
z^DyqDp`k!=$VUW;D@QPkb)$!(5bEq5_6q=dK!v}XUAw)HI~rM1_Y>E&ttFV#rENW~
z{B_mQp1Sjcx9hwD>K^&24HinmFb~d_t*V`UKz6HC2k1f7yke-_fKD&k_NIBiIeBgy
zbTmH#%@rzhD- at wqmu7dt{(b`5AuZO=ckj_uLA4{9M>(S&#FzO2(7`S3a*qyr*6G?I
zb9fTS=wUM)BzBm#AbL7<=7e(|ZZRC;FxpwZ61#F{zYM5)?(a>I<MZ)#20@1GmLZr-
z>g<OLfk8E-oeIUaOP3q@1`R9j@&u6QA$l_t(u!{@D_1b7>zXg2WRpNzmy;{6bc>?%
zF>gOQxj6mc_>kAQ{>4A(Lf`+o|KlH?Y|b8ksn*?z)R|_PQR|E<8%O^n=U?qML&Lj;
zI}VE$g9OC8Z<z&)yP{F;><eNDr6xU$fn8JiV(?88i~hA5<P^K#j)#gPyu?XSrH#cB
zI(wnLZmP5Ig^{uBq_I7_jDC^RF!%A{XT=x|hnCbu2Zd+cux*ge6&}lI3Z2&FRofh{
zi+hSAEsoWtr4aLI;TnF3(qY7$`MHO_`#s?p%LkgOm<YmvLn~no949QPfVhCCmo4YC
zbeX?Z>|mWA+h%5U=S41E3@)VxU8 at WuBs=#IS+$8(bDNy7Umlh6fCz`i{elh;bD=1d
zj`OQV2)vDIx~J at ksp0Cyw5u28#)93_scgBg^WgB$sd>=1sfs#Pj^bwbn${>RfUbPc
zA`XkvZA)94m at QpR{*Oz^!nQcz9G7Ntc>=`-Briburg`vd?Mx4yv!E3S7a+3Wb7EVz
zQe8lpLD-zE=;Dj>lkc8LC#jX|TK~64&@wY>t+ at aGyX(5_PL^d^lUmm`FBi6%snmJW
zL=g4Z)l`2F1qxvvIG0>Ft=7mUobT9qE=#$0ym%KM=4c|~em6X-Qx at MG4Vj|!o3i%W
zWX~8aNKmCtm#zvC$}xNC4AdZMlS0TbyI4E%_g&qJIXe8IIE(oPg*N>F4(@UMiYu3{
znx}qv3awk$KiDC!(q|@C;6YtRX&y*TQmG`JmVM8#Uz>?tzZFXA23(<tqR3libHSW$
z0jpb}LSVK7PO2X&^98tGnsq`<e(4I@PYul<$Dp>Q;}g0rzOMWt*1`ERTp5cWmZmJ?
zTnZbeAFdq~({5Vrih0kNv`)Qx-mhj306D=bnB3-BQkx$zR0|z$IRm7fVn`=ncB=!-
zhmO2enxN&VbJeshWDb)vKiktHAzyz5^k~o7L7Pz<iA_@+i;M+SE<tq-=mjLD&75KE
zc0CrTY$1A?FcGJ3Yz1Vyrn37LxqSbn-Nhry&v(zS>AKkeguD7 at Pal`Z4?cQXbY984
z!EO<dRM4{ZEy)oQ2<3>uDOTu66>}#MG$l+sy|q)xK;Txfq0jF~vu-iU7ESyx;r4JS
z*`HJC<(;vZ;;I>kvKtZVFadl?$%(Rff=L-wOszw{SsUK>g$&E5RMDy1y|(vSsd?Z>
z!RJaHfeC-$#~|;BGnB~9<tQ#R?m(zt3u2ekk$e0LWU0A8Bd)}!u8Yjw02&S34zW}I
z6mBOLxW=U{i=wPaibE=DA?WG`z%O)45Zh5O2y6j%XFdrmCJ{{xJVz&wPgD<9aRO0;
z^bCBS+Qg!xY?QUZU<nv>0oW?+4Z(=N$8wg&!A6JM#7&-9^6zo(pBVYcGB^Evo*$a0
zdy`%^D`Vc5cIBUhet61f&xq06?O?*zFWur!oahcfzfW}Ihn*F4R(BBfrK%pYZ$az}
zzz>0HdV6A9pbETRMMmWiEY*z40?`>vTera2f_3u(Eg%24+owN%X at qdDw`qT3SAb~j
z9v^>l|Mj!eC;u3-dsTEM$czOuwC)BTPY at A*XdWJ^U$<mVsj>Dlj<^w+(L;j*U~xS<
ziJ7QnbevM+vP!U2p at dJ}b7Zkat0lTQ_e;^}YSHAA0!!1<%1u(KeG_XB_7VqFbjZyH
zr+J?fu&97Qo~$I8q=SI47kJWd#|B~RYLZ at 2(rjy*1U0V*sxcN-lAI;)D9OFqNxDPX
zC!j$sq}u7c)x%48m_oGod+wLFq*+C)s=+Y6=#+d!HQ63$1)5&8kw0wD!WLP`LNG+2
z%hq)A)P<dR=c|5r^jpU1XqvEC7xNVaNh}4qa*QL9%we1G^J0uJ%;?b`*NcX0+7{7j
zcMUtIQRg&lo3yXnnM&iIOZ)$pa~$9EDr@HG?8P<z-8U}JgXlSfWAw;Vsrrc^Ah#}z
zT&LVasf?8G?*H7B|0+YvGh5uMcg7|`)f7hD2x`%1P>O(gHLv at 6?#p5GD{Jij`}y<-
zFNfy-s-Jyb?0+Jiy?C+z==N@VdT*KKwlS-=8HsuJF}y3-Y-v=swMyx=6$L)VPIkjG
z3BgA7hn1XeB%tQ_-zj8-AXW3>SI61o*$~ko7BGXz$=AK5ptmv5J~hjy67eD}J%5*L
zzSe<O7pJAz#dia$j~VQ+Ov&`E24_XcMumc_k+xZn(3CoZua0yNSJ(^JJ-Y=Bw@k|L
zXK3W3O4|BTN4T-JO<B%sNtt_Uik8~=mwjJ-G6j`ENNq9*gvZ{;p8fHvK+A0?ufgnL
zA`*0i0?R2#W>DP$s4WDZoe>{63=drAE5?0olN|YWXk^&N2b}&wRa$s at p%f-j7eAO?
zc4uGFECt$Q8J{orv5%PDt^h+$u0dd$%YMUq(<v2RbOm{@N}UR=3qpy{sH_0G0g(l)
zM|mjp@Dp@SXG-HAmd<(tzL6f7kLGKt17R&j)auJNnE?*tjT^+O#uGu$e5{_`PTBV*
z>SiLke2p*fzrMYAT&_F%pJ1`qEAV;|!Tpck=UV5RA{&;vwWXa}G1GP^Mk2Ay(lGoW
zGPP>+?pDn>!Tv_j#ndkWnX(ri at -(XGWP1^ybm=>x)mPybOybx*X%xdTLNI^NWhwH5
zM?2!y4zW-Y&f2sYk%(og9s4^X0ui!v5t`p4499xE{C$rV%I at 7@uCQ2OAR_=-1J>E=
z<V3p<(Y!e&J592O9*a#jaSKVw>7kL+;?lU;4+Bn8TSL0ZNT?>rJ<?|46)=lP#0W||
zSWtk~Eug%R at P&{a_*@BCE}-)z)V*-REDSJgUZqJaQ=%zdQ3}X`s!x{{;_oA11wylg
z4o@4ck^$s_0+~2KGgCpj$&t1FE+meBkN>D|9+Lw7Hf#zAf(#Bn{ysyOmQmrPW0-kQ
zu7;{DNL{<%kDz+P6frcr40*Q5&mck^kGCoAvPndp5DQ-%NT_y9_DUVEKp;?g2+<o5
z|2uJzq(qer>l9u9T((Jt)a00A%ABI}tD^V+hxzn_*RRz$Kfz*8SNw>JvvZt2egM>+
zsc$qMvMr#s+s;J79O<5 at rXpyeALeu&%ToOT6AMmUDN%ti1gPo?7p0+N3MfUw{LHNm
zlwfj8Cv$BOvA8&?CdHK6<*-U5UfF}k)NQu9o;WsMC4(}0tko8;rjDo<Qk!u6y)WHC
z6mrk_xk0ezM8Z*c*|q-!a+~P1RjAnW!FRh_7@JMB@(`0SNpmY&t<4w?kwk<RnHL9d
zb>dEsvRL;pj#h_L`g{PYDP0U$gZ&WV-Yk<DRE_|?)%@OFYE`R(mK|t0PtO~owj+^n
zA2_l4CX<}}BV61wUBOyG*&cL%e{VY#Zf<5iJz|G~j>;KRl?hZiZMUf|sa`UJznFq*
zx0tkdnD;OawGG$iZ?g=x9-990-DkkTN0gQ_<uF`-uwZoyf+N38HqHGsCka#C*o1QA
zDOEtxusn9ChsZ27C>pvx3<ywcT)}l4pxQ}G7ZU@(HmU7pU4p$)Bn>N$*`;{f+f$wI
z&ClMwT?N-r&fli=^4XII>&s_PPe^oKYX!SK?yhc~;0)h)&1I$jJT?N?d|AYykm_-Q
z;xfM^YN4pCiGL^lN~UNL$GugvMCHbzb{kRZFi($(OFUSxKohA>*h<N@{kkaX;;<2W
zE@%r48dN*vi&d%9P{QoREj+*?*=Y!3aS~P#A=8xM)IsucoD%NgUc5MSr_fOzAsp$7
zmwKTCO<BYV#f;0uxDyWY%nxRQK(uXj=D`U!HzR8K8`4Sjq%&jl?pQmx%ZTLaSa~Z%
zI;~9$PJpu7j)kW$sVcBMHlO=ip<>Z`12p0tb8-PfmX;;j<?<qVg!Clpm&4qJ5pL4e
zLPy$lZ1_KbxjJ-$ae5u}{qcSG7xpx63TS7VN$J!%V*R~~XxIyP{IIJUBB`nl&{g~9
zi^mf_=hI>Fd|vLz{bFP|T-UE#H%E)TmbsDE-ScD`0^0yoA)r)%9s~7uP9p{jt*j<!
z6Fu0Ze+G$!D-wfpWCqEW3+-;|?tYmsp0;U-u8aLoq{#Q4Cr=(cIN9trU)tz=BFju7
z6(S30*$!r8Dx4Ut3}j*ijCUKXk^pwY?WrklND2GPCZr8ht=x#!g)}Dy>YOdp@*oyN
z(-y&si#-tB;DFBAS0hRe1vRW1+ at y^<hfdoN<u>ZOawrn&NPC42h7>M)`;G8xhXS=}
z$t9U0nsJS021cEx9Ssu71JE#HlFRIBd-7G%iomgAv2AFMaB~HU$Uxq)%y!^tr{xit
zlcHcCy~%xQ%vz$e1t9URd$H?ZUIOvTrYS$9tEk;K_1tiK-E^C<oJtzbgI%(dw(Nl#
zH-{a>wfg7PK~7r7qTgEuXmuw|UsB8aO8g#<!>l91GvP_{FdTOynySR^)MmM%&Pkco
z#B$&=Yn+4vFexh02>pe%f~2x3pt!jm_`J?iO)>qr55CIIKR0fN4LmO(lx(oYu6Tyo
zuL<QfigV^MP@nI(gzA%-?;>#ZyxSF&F3b+yLrp4XKrVeclr?sbPd4YaV5OY|^}5*q
z1k^Zj(>;9f!Ft}Eo$#_-3oSWXt1j+0lWR2tPG8miVI01QybO1p&#qWnbL0irF!Ruq
zhjdekA%zm^0n9Te*U!~xp3vYUWSddcU9AzYNd|r7;l}AB9{PI8f)~~ZV%U2pu at n(h
zp)^d3EZbZPAzuvPRs>WyN#lT~N{1 at 2{|qTjj!K1+hoG)gB{8mp7H-}_Fxj5T{I+g5
z<sGkmDjh-BoI2BH0 at cU%mLQ|V-sxH--~ey*oB{85(xH@Dh8+Ro0<3OA`G)OpvPoX+
ztiCvU3auNc2vlb;G~?0}pdQ*Ge!$h-tjz<EMvOkTYWJfGwObTPsEDkfD||_an%Nyl
zAko=swT`&^J{;;Et$Q81OGl%#k=F4Wq#_*`z!`3C6BIQ^&Abfi2SOj_lNu)%BphGS
z)it6$4ACt2z*RGZ7IG75RnjK#=DqL9RuuqWcskjQ<OKE|EHmE#i!WK3odfd`sH{U*
zf3m{)7wg&kCjuQ6Vb{g}KR-ju#8`GSo<4j8RB`o-b!>q*$H<&ayB8|x9tj${dLhUB
z?fZ}%TA4N&NK=v);my)Z2gBdJx-wu0o#>W=7GPF!X{85|RQJBG?v9z{WVb+ssq3!X
zq0!$^WsGVbZ}h}5Y-{>_{eSV;!`f$_yF2I=R_H0EjO9?3gr>}3&YV6iWZH?)V%e at m
z;E;y8)Uwz=312vzLuK^7;V}`(@Mm#++U1MA{=SZSb?LZ-ARd!I&cY0c?EFIbK0{e&
zW@;?zvhy!IUqY92BTa|<Ob1zPgIkP%R^Kxi*ZKo_mKM+fI7CtRY=!G^K=j?ehOr#%
zLrpTbccJWw**&APly3S4avx$IUO(&*6l*AWS_ZH+ALImky<#el7cr&c$3y@(?0(h?
zmExo}9KKnBWNOyYxf9S$7t)2X5Bn!!Wx+OWvO;K+63i%5R`6r5z&RBaBj9nATu4kL
zMb6hu%ZZ-9zusM*T at em{UF`q!GPGp=^{3AsPoguaEFcf?hRh({`V$jg7x@TzSD9HQ
zUGY|5n6hHEsF}zt;!3Q*LAiCtv0%9515Q|61y<1#r>b{JOwJE<H-9UtZOvW8R>OtF
z9sq}YYP`m}7=GXRv#8R+=C8punxQAl-e#*(TLwcM3Q(U)klViTu*RYmDuyiErh1Zg
zV04`_J3o-!6fKTN+vh;a-q1>ByQ(KnQI7R7c`SydY6n~R!FAP^Zy7?#;fD%)hOn!k
zRJyL)4plBI(CQ_inDQ%#`Z_CAs`=V4vrQ)bk4{oshc30jG at Z^n$i(dSHMfW{SbDT%
znkdo{t2pB6HD$Oq;kLbxAps3tWMeE_Wgxv9<AoGffuaJ2-H%AWAMVnz+__WR5}m;`
z-BiHw{7L#$**$s#iXdD!Zg=qivG+E;wx!9L&=c{lea^j^S()`+w)z?&bt49d5tFJ3
zzkvxOMm=Ke9`(#WgE<2b5+ETV)E0<A3j^Ikf)SGGwp(p?+b&mTWo6!vbIxAtjbIQ@
z#2ag$YqwpUIjPKBN>zT`d-mRIuN7~^6VJyMImK8O$G{PXir at _W6+Gl;Eer;|plx;V
z<4c%*{7m7Udx=;-+(*8FOK|S(AwpH`4P-t6_5_#57uY|2wZHxOi}x<nzb*Fv_MLt4
zb^*Nk@|PbzzIpxcyZZ-oPH{7K_JQ%DEN;1g^w{&KnOO!h*-RP#y7y<$T#)g{HkOs|
zoDSQ)mb>fjTO9s_(9k6Q8DtR&Lo{NWo{Qkw3qclrSysg-zl4>PRrvowR*^g02d8f-
z;aB&mhotG*GR&z^lvcdGF^p!@8^i)yOTVzJ6==c0iAw8rg#ph^>@z0 at 0{(D&MA1qb
ze3O1fwFuAFI+;B-Vm~k~!n-ZJ>AM=po4?BKVm~jg-Gq}XZ3qkw*8%8<>_UD0vCImX
zpO-kxZ(<oUoLX<)pKUFNyGILBOvf)vJ2$?T)pOz5Gegq@$`Ki{0LEFkmj{HDRRmgb
zUjwrPwFBt34F!|<EJzO(1Bimf;$1CTqgHPvbs&{Z2msfy@N_0y8SZI7c4>CVsN^a!
z;dHeM{i($IXppDF$8p*(hzV4`4F4T}L51#Qz5*?<31^CY2$#1Id&{qNMtAQAWIkf}
z@k;&ScaJxJ{>s08KFT+**qhtQ>*I at Geg50~_2EBvJAQlmQD2<<j4l|yu=pEky}K6<
z9SnlSx>0zEchm)!R3ptZG%}Bt?Bq<L;_|qd;#oA4SAR(9zPfSVtR--Rj?DR*fuq;M
z*lK@Q0>{lhtBVusf-bK-)mS~m=R49btUBrV{Ud3k66sJ;R<vl2sW3j6+7&T?DCUq)
zZh@0_N{i%*qDzIVOsMZsG{vE^or<q34~q<wX%@$#7o?<AhlHV;+*mYVZ>D$A{;RdX
zkeJt~P#xvzQpsDF at 4)3kI106}7X##Y2e&J&6V8%?)!|DOi~87|jbou6UKs>!Um<fX
zsVke8e_j_QH73rzgl<aqlJt<29E|08wrqZWm)N_Aj&|-(GNwjx^6B@yM0_ROvNkcu
z$-61NX!0o&Ti;~_*}Nn)GkD!z256W&uEhTP9>(LIs^qUc90(bzCGnyiTzZWl6MxaJ
z!{FB?q|1JXhvEa=o&vfFW(3DWf#bMWTwfiJzqp_Ft(x|$=h;(Tm?Q0%zxw6faa at 1v
zu>H={g|LJvh5>zM-{*-fvO`R`A`61C_-Vta4~nczmxs4;X_vC}NvnnF0fC6fvJ)`E
zBF#H^b?~dh$I*Ow_?K}XVPd3Xu8NWlk+oPQgCQ9?2U1_KFwS at Y6}ivqvU=fyIQI;x
z_?@yK5XHHuZ8`3rLdTQNV{6G*U9G`<!u;C0u{@-AxLr>jZRE(Vp!X6d!QlSH1*8|X
zv*3&xMYftM1cUx8R(8+ovi3bK4pNkGoxX%@-+?x`&89}w<9v(|atp!IU*#03nV#g6
z{C_)j_flNhbMCHNKq14u<#c&bSA&y2Tc at 5n@Rn2T&D77&LE)B6n_5^Ov9q$Zz&SC5
zblE;&HfxV5r|w#jBDTKxJVJ1W9BF51DMTEuFBwl5RMQ9)NyE5}c;s<{w${kHGHw%g
zGNC1Tj}Fbh^ez1OxG^vG1utR%{vjMsRCzy<m(N{;$CNkb4#5<A{1p4+TYS@heLZtc
z^YM87`RDMtlRpjU5h5IOFOd)sE|8OUl|pzU5I{fC9z*ILO?;so?2MJ&^7MrX&Iufr
z>PBA*S<>p_rL;&I$z#t>H)91?BOiZ0o%B)+WX6SU6J5FYfDS23g*hi?^KieNI+87u
zf7Ya7x}+$%aEi&P0CM{C&K<^dp)_X|`d~eH?KbLpgxBOW0EmS#miiVCs#^$vY(_Y|
zHQH=01ruhW8rr!`g+*9O*cRXT!L-d;3DeRNxQeF~C38hgQt>(NVfsN7f)R`>GX&pt
zK0xd()L0-}wK*^2Q@}OYs4Q!UIK=kFEXhCuEc at lv)q8dOv0yoBFQ9l1Uv*kwO*YTR
z<+fMp0xN@dOJyiudRtwzD`C7zW>IiXt!=_maT}}~9%Sh-iu6YkK<*=MQ101uJ;5Ys
zu-f1~f41$t<!(fzp}v<28H#(=FCqTnqT8MhiVY@z2Eilm)u&a;WC!Fm;7>f1p6;=~
zezm{(#W&vL{_Ek{lk2 at dUGety7wppGrZ6Plxnpyb)$GVlo6t=7<E*7v#r3t~J8MZv
zk(Dfde^CJiXP*3wf^95@M))TY8+Cykxg+rR8=8^nW>~Kwt#ApMJ<%9RsdUllqhw&j
zp|dmv$<;UWiaNw;af(`)8Xv?#2Tq at HfaW9=4~Cz7Rw{qC;GA68wf9fTLmUxLd{8$+
zNvjY-B11UZw4~KF7%zQgnlW0(-^Fh7XFabS0LDyamzbtm(*)*5?|XjVV}op;#QSFP
zv&ji?I&i#&A5SdSx^Vr<kPStv3O#r-$`MO+h3@BL=San81>DEUf;vAdX6OdM2u4uu
zuVw*3+#DYHT8p?~l{edC+=R_Rhr)^lB?qjhsff_41}y+b3u?PfQfL}xIPN0A{bpxl
z*h;V^wz0|C2tSR}^|Abkc at 5`^#1vgFpi|$_!|A?UG?!~<?lpp?W4^=u0g5Aha!8{M
zhoAk`z{Br8J^cLDx1Igh`0LHvFUOm=U;JQVzgS~YI22}Q*S>Cv?e5rn=ynE-wB?zb
zl*v at 24n+Z+%$qfwO`jrbfdLK~tWmC*Gw9tjacqq#I1BPjcFMU&=>aL;V*ktwV+c!y
zf at a$90hhKO30mH*k+Bxg?r~^XO)WReTrxf&z8o{XA2P`Z>5W!&RocW_Sy0Lz8Gy_u
z?gjSnxY1_!461YO2)bf<x#Yom)I(XFXv*Y?pH~rlh6VZx`4Do$-PXb6x;XF2X&)Z|
zdUtL*4h_xHd{au|oO-0Ahh=w-lL)Uvi77xkSp^Wjl0MNUY{HZ*k%hZM!6?YJlI{yu
zb)1&3RRkq$o+Tlb^2%9Oz(Ike6*4sr>PdmLvc|B(iccRp4KC8fmQ$tmrF9P`-y)aR
z!ufKN;iNd=xSkrl$dHvf0PDN6je%jF7-M at 4tq=!wK*kk{@2r?m--BGipBehY3+)p2
z5Nh&!4!G<IFuxbfSM%YQ_jC53b^W&3e-)U0-oWqPz5B`j@a8{-%^#VW6y|P0>0|wk
zE_h_24GfczeiS)I0H%|rQFEVM{pcRGJgkh~+ at 3-u6%+!*ZmGKIw5lytE8s^aCb3XT
z*dX-6Xyy#VZQl4EY at o#E(<G}*$!@sa7;A4p(nN6Zt@fsbXuOGBLS-C6sKr>yMRNlO
zPV5~c6C)mwNz_<R&|4fV%U(KQfER at arz%uQBebMHc6y5kEmK6x)GNO4M(<1JNSc(<
zsvtZ41(&qL-DyG1?y%b@xC%r+0Q7#@6g1^CCh3>+iAh&ES#df*bb{9G1w>XTc_w6)
zpz0Q7v36tR_Pdg<y2Wu@?$QUo;15^sXB?V}VG9<K^gTrvd*zZkL&05vj1Wwia@tAJ
zF3lc866=GV{PR_s99`lXb)7<Nf$p$L1gLZ>ESNcWrj9n#vvjmnS|v<t at Xp!T&E+*<
zA9A0i?eLjUSWr#<%GW$N5qP|Y@6c%sBYzTq`V{;1-8Xtk`_;Q%wu|`q_RYuF>-DGZ
z{&BDbj*7iAvy4QJH!>-Y=D4 at 9mL{!lZ}3T(oGFLfxm+PLV(@Htz(wW^rD*rem$^*R
z4kLw8q?|FcOYZxs)bIHuRAcnqnGsy>biH(^GBzK0P2Mx36w_vzrfKu&nXM>$U2kS*
z2OKjgoFbUS at MRChv2}WA(okvZoYc02azgYZCz at k%<Jm1mmvm2$n}d_ifniEtpo5Fd
zS=PN_Tfm}UYB5r6eP>b1lUd5xD{8 at C0kzmFa#G?M7CaHycme3k;(V7dZ2~wR0e^r@
zP7BkD5mkj#(!CPPh-`@#R>3xl2`5EGDPBtVPI|2Sa&zM}!->$&?x3+~Uj9Lj*_d3n
zqi-8iv-pYu$5Z^-RH5d6tWiltq_T)H0h#SE6vATkxbaiwfL15rLjb?P)Zuuf50Tda
zK-<wpkf^1*mAPOVKZTt|1jsKRptI-=`WEgVFshR~2U<&)k(+v8^B#qKAYnsVN5}zD
zyVw2AtK;d*Z!~WIwazlHzx+avWB=grLko_mrRF%pG|6^B(hmE(6sQOVR?8+hf1{C~
zUrWf at 7M0Csrg{jA1K<i^ije-e_{aqj at c_xgq&jU|QJ!m|isj|Ot}-TzOv@S+Tv=hI
z?(4mZEryRIXWr~I&aVl?&)0{CLHgk2($*}6WNAMzlgS<00m<iBPX0R)IzITG-o<;;
zJCgE_)k&sS*XJpG<U}L1S<I{~>V`?H+-2TX9hVhp<^TX707*naRHrY`cg^TW^JmRO
zSC@)tP&{dhR<B?FNe66ys=#zn#qADJ%*&r%=%25gQYt+v1#C?1a-a1YTFv}y0wA21
z(8=ZP%iO7@yoPIF*cCCUYx*%-B-;v_DSBi=7iB`HxHVQQcFfIQEfwOzLV7le+fNH)
zv5kw>3j{C9BPS-Ly$-lw9}OtY^VTG>4vzs^cMvMeaG89L;{Ch}uU5N1v!;X*k<6A5
zy^DpcKh!nWwkHs`SMG0r_jvouZ!~WIwG{j8NFLt4hRvO$@?1Xk0sv1vqLWzMq6Mzp
z%yxr&3zv4lTyf=3&Ly5hX$`zAi@Ol3ND8MYICk=!1|}S5N5XtxT737euq}&ZlLhH?
z+up*22XA(%gJTMSsbQa>i~TWLF$yw898hLGsxcig<@8N1M$6!#6=rXTq3k7$ocrZ?
zS#4&^FC}l;XA?iIyjJlUA?=xwik%zpV9eMgmT#+L7NhlX9uUdSs4j5f>QxZErB```
zaA>okaJN{}>PNr;2A8z^3|LC&JL3nn0^V`r_9c&?S6c2{x(g@`x%&MXpXI0}v=4gt
zcR^ND&fbQ5uP~e=ioEaiYNxeGs%tCE#cH`#Fb)`<N%zoaR><!oye#$DQqvN<J2eq4
zd^|d7C2jaE5A6l5m~8Z(pR_n`-1_!;=_1Hb@@8S+6RPX}bCNeg9sA+UVQ*xL4Tw(G
zk(nJE54?khd4S-0Km7XYc>L`CT=w+aV*gb at H~{eW^_S&_=*dO*C<rFN6eU#CTpJzD
z2jv_ZZi(@q-ZecHW;ZoUy6^H;rT(VO)dq|9JiLs?ra0B73;L-*k(x@RRIoi6>Ws}w
ziFHZ>&(Wac`?-fqg>7c>hI0zjf?Qz-Cw4hsYiVIDP8Ja+uu)uQm;qU-)Pi}^7ERiF
zJu+d+u~eWw;dX`CLm6~cQ6`3+Zk=ebM{=-%urDaOpYh<314CxRs?$TkPEL<0Mw688
z^8g7R`~jJlb)7L`I$+yJ5ZO*$`#c70D)e|P-wdxv!m}Sz9xO?js%wNjAP&u>s-xUU
zMMg{v(*V0JE8~Qmnro%m5*3QAgFwpDKku95h8c;Fw1~c?GR~t8k at Y$3#CDMOJV`I~
z=48TXy|!8lj+e~8oy&=H4ghzEw(5=^Jl}!iM-UtJJjP@==|*X*X+Z=6^=2+|pF5)|
z4jrk2{{Zoio>i(8zF`iknvF#5rxFFmB(Vp<08{pdPciqNZQ$P)`+vJ%@kQ<Xj;FV;
z10S`c`0^mcAhRv@3j1W|Uf%Tli}<9ZuT0<Lq-BDF$yL#Hmj!|gjNJT$NZ`S}7dkxV
zK2Y}-?#=LRCw`wUoN2C>4_e#B6?5h^I+vF at dFKh~OpQV;x(wT995|NAR4o3I__Lp(
z2P5_?7%*|{Bf8QGJR!U at EwXgeWpm#6{%HGub(H;aikOT-D)^3ttVXn<PKVjV@Fk>k
zYw$-x4K2g9K38_Y(^ixo7pLK^<0mm)s86j5on}$<a2wU_WvP3!AcO$P;Qp4WSkY{h
z5}G1FS}c`TpzjEj1vv5WRPY9HxG&F@Ie<yEZTaBDA)KF8<ihJcD+IiE|M8mZv7DsN
zR!4i|r=Po#TDaz(psQF7E&5Sf?zy!?cD9^al*{PC{RJ{m0qDWDQV8Ax_*HQ5eIsnM
z(<?{{qJ=2LViBL>wu-TQU(u~;=1nMd`yOGA78JzdO&|S8q`Ov_NlbDMl`C+3iDQ4e
zb_3rq$K$V|*vF~*@bG|lZ{G&*gI&qW5%sl%Y6(8lX^HOGGET2~Z|e-Mb#lIqzT}By
zq*y8ne*U~5$k}9kUA-=aK6M%76yGUjX%IxN(Z=MJBXQ26wPxc`Fp^7?q!V5_*&{dh
z$lfCY8BCIOGMCWOlJm+&Icy_>W+z-$u`Cx9(wRid&t`gxuYw^FyN{p>3SI=h>euK@
z?TOc9LUa;7(+bPzRKjl1)^@-rJo|JgwxzA}aIBq$uWPLy-FCT*W?|8n at a<)IrAzFD
z(wP+V5wIOWze_{k6(CbZmX-u{h<InA@Q|n|up4V<F+i?lu<R_t*1Ty}{9wi+YO%JA
zdjeWZ7~!gn*s+`43m2-ze!Gq6)JeK(lbYM|?l;V4PeJ&jC9U0tv>0Z=TjD#WJi`4o
z+#jiJcti at K`Vv~_8rcO~v3I(XyC(bY{Fyotd5G_dhHFJrEqKYwX%qeg7pJKn>6hY3
zTfO(=^(%XPQ%hPwiw6C+*#BB!4glbIe7JvldUyrcy_i6`d at 1ja^uLy#Brn8MmoNQo
zhkPJxP_wYYLjPwB$(e{wNV at 72%c0R2XE^JxD3&stSB<7yc67lh?VcXX)>%-1zz#13
z>smsx;FCp?af!y)GCSgZq&4zsQSI-6ShWg%(t)OCQWpbQGKj^L{|&*Z=0u{Wol5G4
zWZ5A{yk{|vYGScBFkI+Rn~O(p6vCF*n#Hl(2`4MZ at -UWj=jM)qahfow-#yXf+#4QO
z1%Jl(mU|+-gX)LnL|O-=0b);pJ at P*EN)ik5yA(Z8ZM+B5%>eLiSt~n$^bpDb4hu0+
z7mwv+TLpU>A&+&vw7*vQ3(duH0a+`}(juv#PWDfwi8-DvV!dqedytQwI@=VjCG)8~
zaQN(q49L9lfVewNAJO&PMN^j)H!%Pkri at Y$yGtx}a}izq3n`63TaPW3IvyeZlAn*?
zm+TOGBK4P$7_N;*ng{Teb_&NUnUBBw at bs%!9Zgt1{NEP)UkkT)0FRIFUhVtSKLGFw
zG6i;I%y1coDbAiZosXQ0K(V%@<gcSKr%wOAVc>^@G|1?ZX2V6JFl*5fqd0qYx0qgG
zCt~sUNlG~K46^0_VK*vUOQ_;VY_jq2y#=4xtfg%VpfcL9lCEs2QAJy!;dL2=nxfE$
z*T2;sB%m0v1zTB~#hDhbToS5~(9MFmyJ8CA!a#lF`%I~C#@Xo&E%Iz7o2f`8EP6(H
zOPZc=$*n6$x`)EFh`=(<vRK4xWt?t+zJO{_@G4(;0(R^XLO$)>t-CH7WF1^v<g$uD
z<N}wC3T><Kk#%748l)td))1LG1r{hj_NF!1152J3`)|e~=3#K6SEex@g(u}BpRdV1
zQu+_2<fKa<;;xw`tcs?>8asxaeZw{~6y2X$h2BRtaeW(uyPSvEOJqSWNO!<Q=y^ZS
z`@K{6Iast&i`yk%cmTMhEmg5847!+fIR&LALH2^EBz8mh1N$p~{MG$8aXI_-v2g&r
zd-HHVpB`VyocBJhZXWZaV4O1}X3-k+OFg<XF)4)uDbc>+l=~`#KI29T4;tWbgB-+n
zxrvOdq)?;|I$BB=#6%OO<B*sfif^CF+oEDh8)&3G98&MOaQ;^CZPNC^aQZW}Wr_X3
zlx5o>fE`k<X*o?8sLISQbi4q3FeS+AJ<5?`*1$EpJ9_U=`upeWhUG)DHFmhY<C5!&
zY1X{ptrf7jaQMRt(y3fus(5oJP|I2VxzVs&m6ZovO50*nS=d;M6SA6>t|dd^+Xp~7
zWX2xEjHAwc2erL<+K1py8JrQ`Fk6wqyPr`M^$`YjSQ)Y+4)Fok#<bC-Y09Eos;oQ)
z*NPDo^~lI=!lbniTK^toF{!k$`h-WMLxjocpEp>zVk(!W%<)YKDRW|j5MZaNsvtK@
zXUYL^e^XO}4ZiowTKL)s3kAPG`~!&ZFnv+UZPIoNW{nm~Kcsjh*!+#RRqX44kV%VX
zU+$?16<g2{6pZ;KEfp|19)C&E;v#{3Q~35 at +wu19;Wg$Awc~8Ec&|vd5g48Kg;D#f
zTm;+lvyJrGBurbF_gY2;?M7Ir=j5W2SmAQ6jR)7Tl&pzgA1w%6T+4=`CJi=UGc$1c
z8i`ZqgYC_@YE3ax7=3ovHnkSF#aH(8&#Hzm*^It+6Jmg=lb0P>)IQoyLDtfGvlgyy
z at ts&YaC#<%tx;I*HDQN6r16QZ`&`hAHpOM81{LM7H*j<(JS8*5xIX9`V?9GPlI3Y}
zy}0f&^V&|x+__)`MDBsHtb3=gh)S^sxIcv{+OaP-&JAYkE%<nmQ&w(n9>_tJB^+Y>
zdjOb>=9A8LS<uV0ry5VqESAVLLo+)XQ-p9Nt%kejQ!T1_L!T86e#%=l7EkffsF^gm
zJK0>=35q?ZWNA&@1vix?^drM*l+cf2;1ig=fa?<+k1&5326ouvou=?A!+WxEYMKm9
zza4ohDrdKUUM{Nq_iQ9Z#>xiJjA*n_2JdfS$77p}zByg~*I<_rU)KJ34Va=VP#e__
zfNDgXS#9f^d6#L6*po`DQlJ#BNE)UIRJGV8iB~&aHPr>G;Ru;9hIte>fw8k)?wa8#
z<6N>y1fakR5|~NDq(6LFw2Cl%NV;1J$MlXnYlD33<ku30Zc<CG`2C|`qREk7jto>s
z8N*FJt2TGcjDR$0ZkHO%vi8L<@$6hwMRr=k_YyY2 at 7RTJLB(V!iIZ|z;n`ex<Z@3a
zceeRdRtv>&fh-8i+e6zq;vPw05PHod9S^x=mkJ}78FG1SA3)^}qSRgFZpHvV-U9o(
zaO~7Oh;HZZHz$?`Hz?XpNiM-Qf%5M!aJ?gxAyxd#XU43&<`p9jaXBzV%feY9v1~Mo
zv|3_TObrdH%xvCvdgcL;_SoJayn;k4&CHfD9*nw(%K6Jh1i#Ot-V@3E+y`9a`kO;+
zt3x2Z(MNjXgmysXU4^=fKbC(^P;l+U!n3UN341odpBA0>#YqF89?jxJn#dU at W*wM9
zYh+WZynX6%ytzNF4^s4J5qwh!m|t13Uk^?E$cJ~Y>%lQIOp#gyZK`EpHI6m%y5 at Oo
z^mSK^xzd29d(pK(m}3?jrIOytwNVI>ER}e7U0iC_qj;WK?W7_Llkc6A#}GdSn1~VI
zPBm{q7tIHM#(PDNh)ZL)GUl>{(YkU10;W%hXiW}=oKB?T7V99fGc_|!tr7~b#)_#9
z(K72{!C=$VPQuHTQ|v95tP;jz$ViPntOyv);c|C^Lc}InCQop7w3a6zVz1KgpX8IL
z$(@p-7*3tGO!0grdAaZP_kw{jE;QR(wicnJegckb(D4>`aj8T#zO3lfLl at wLh#>du
zv at a0c#d4NGD$oIyyR}1NcU#F)$*mWG;sR%ft+eZM>?cq9t~bbR+ at SmNx#$qth(k8+
z2|E?~-lYf4)8R5`1=2pV%(8Q+=gV%amPu_?jF at tKTe=I4!fFX^`4-7l)8O+3ZJ()p
z^$4?>qIF2+{w%Itn_^`)+vKN!a+J?s?oVW5<nxFL@h3KaD^O;bhVomEkHjASqho*j
zanzp>-^jPc{@3m7;|6~B=5?I2qCthL!a>X0j_)<|DyijTw~=jcHib_lPH9p4XiICc
zsI8pXYT82JQ`j&=KwKOf$pgEu5D}a4`{&7SU2&K`%YB8 at dY2P`9UWfkkDV2V-nj&w
zgmNbHxK-OOKqU&jS&h0OmP$##LMQEwP0&@po*g2opfkg}O<)q)u8TGp2g&f;0wGAv
zi}@2=9$<5a`a58M9S;!ShnuaS5TDEPRyPPP5$k9U#}#5%*nEW86@utyr7>G*I7E7C
zKq0w|6AG1#=}+qeT%*`s?%@D78nh_ at Oo{L3*n#;a!%VK63XXt*c8>P6Zjki#k!&t@
zilQ7cluKhWhkV3xSO!Dp!;nlXc>Y4+Q>Ha7)=u2)8`O_w!6A*6V-gZOQVjbfB0gh3
zl}&>K!&U}BQk}(980Fz!3S+jw%0?E~nwm;2Ez1ZlGkk#&R>!1orr1iYd+}T$xI%P7
z at UA-XfO13g9?qFUM_4(<ZDvl4dShhC1Asd!sM|s9a;g>S-;^HxF;Qi3&HRZTkN?^6
z^ybG4%JOfFxN7 at 4e(2l}JUu<tIPaJYXa=SQFM7y;j7vcXmUKD+9}>rr;tO5btj>AQ
zlY)7}*EfJZ`N6>-?wI1(Qi3mm5y#J5v3_~%O}4iiy{^U<xO}Eb37Ll`f{O?ar=i<z
zn6ahgfXPz1RVH(0YzbQs^QUSQ=~)uxZ5eUVX4xbTxCw9E^T_kGmRYK9D3)YGJrdW9
z;)Mu_0I%l}fl-yKt-*NMvZ>o<6l#9~(-#1)&?A1I*#|YLiNB at 6)dz6jNQ+dc-bDe=
zAP^idc@c++-tiFYhdWKZ#0o+{8E?&i2mBH~JxZrczc!B|CtWruhj*rt348nku-^gZ
z4p9x4QtScG98VD4$QM5X9MgO18U#M9u6Hg|O`LSX3CLae1!X<AL7Fgc1|j#`B<>>&
zEUh6amRy|LiS`-rMEUWER31Y7x0sksIE9h&2??&gs5Eu0l2ewn${BqUW>6$$xlop~
zsDyw{prNL&Lb+G)x^pii=AqcGlrCFwYqgkH41J&gW{bisjd6i<MnrhwJi_KD1ruwF
zjf^HHuHP`np+?AWucR&smG(t&{n7sJ)4NRM^=}X>=W8kU`@UoDk1^UAaoiL*sKVxi
zj}0=kc-^Y8{1J|$pnE0q29k&zjG}s*Rf}@Lb5icqqZ`)UVVlA<Ab_w<pmhO5JbdI-
z7&q;f5T=BZcEenS8Bz&K*TXSJgsfCJk;KDQa)17F;>^QP58pbVl7-?iQHT>yjyO3T
zv0H#}Bz1?YL#Y}TEPi!`oA3Y}P)zbPl_S1NEOs-qRD$Tr;Bl`#n2VJoPI$MxgX#{k
z7krQ%GM^y&0O)t4yG^eee*mySY`~SBt;AB?@gjKA?g8!i0qBLIIzRF2GoN(99F4~5
zJIpVD-|>{3b!(^+*JVuKJS^(k at dk2y2H5u_tlS>?dsDnHF~=YXGr|X-G)$ceY=bzq
zHXb;kpCORB;gp($WlbD=9fb}_3>hdEPniL+ at i{L|HDNzwM-U52 at z^5N{p1E$jfN=~
znA4Z0z$SN1{BzxvHQiv{ZgwYh3r)yy2IfA<`hwDnKb7vY!7(?Xzk&g%5!%sc_KMK9
zb{@$4F!y!xhzZBYosif`w~^Kiu1`D=eBCGJaGl|mBNP7gng_A~-yp|?udLX2AN#o<
z*ss at G$cAy27kyDkn~9M(p%Qjtd{l-DH1T2yYo!=%ImU0~1z1RDr$w<uVwxh at +%Yfl
zIBs0-ZVuQUowi?Me6$%wMF8CKL@;HrH@U|7GlUqWS}v8Ckt(Z4aOX6T9CI!^FKEt=
zj-~u821SBB17Zg>!!iyfoiFoV+tPRB<1eI?CUr4s-*!G5DF~YcL2`+yO1lP)p3fOl
z80W2H(9Yqo9U|97%@cOp_657(3zxL_fZhi*<uBp-g885{G4l<kTXm0^JD^+w+6-)5
zq+%)q+L+w+YgTiJUt?O5yI|QMjKQ))-bs~B8|#Y$wtotl|8CN`U^BD?vN>eDgxbN7
zo4G8D^)8f~^AV=^?AS-^3$^*-OH2hqS-)-!ZdsFyFgj5 at J6NTm(-sTPVlp)oI2ja4
zv|#fbc}t`i&&@Iwj05GiYgUUq0yQlfX^Q1gOrL|9$--v=#SrpFo%C^Id5}|X at un5x
z7nmEg?Q7x;YC<vE6T5fe91jut5xH$pc`C<SzLA=!Vh7_GA_1jpvTmFQsln!3%wvaK
zF8C%@`>&<5zdpXZzg{0-0k|(Z9<V&q>Gz_l!L>gea#@@CD3YEYncyv6BCHH~m?Z7F
zN0(c7(1`9}3Lu978=(?9W~SBnJPg}Nx0eZV!48K?VEcyv+kxn!XQ=v=6S5D%=29KE
z(C~M7_;^PnyB=t+h%nlRNO+Zw!RrB%W3eI%8;cIjHjSUbLnuAe6P8j4T>Z?-XxG&h
z%MMWtCd+R~I3*b3J-H=lp*V)E8>WoqIPI8YAQG!eiJ6_54mgELqM-qBy#w?kh`oR-
zv2OEVa=3Exnh|c{3UlH2dntC8__cyigd>yTew}M0tRDsxhtrcNJ>2Inf#XxS{1D=g
z0Ria<eSjN8?*Y9;yo)<bchV~F0?J{$VMI1=+^w92WVJJqWnaALeoAP8!8A29@^B}e
zQ)tLnDswK6D<7pb2uVfMq<_jv*;)bc%cW9$qH28N^tJa9bS0|P;#X^FoRa9+!`yiD
z&zs2`v*p`bgQwPEwGOo#7HDIQiSB@Z0N{yg+;t6NPMHuf2xd%t5Qsel%%%~VG{kT`
zy~eS>!{zb`{EWGNTkQWfj2scc)6>(d<2e3-1Fu4z9=Ej0fXNjCh53OoF0kza!L@nd
z<T&Y&E&bV}NTv&7U+8+WOC;2yLzlu-24KUn6%M>?Yb6;ygL+yM_=p9U8FLZFqWFcf
zwB3Xwx?mw+UIz`U%zzQgC3A-=7f>?}080^OV at BJ|14yc!@f7ZO1V6jRvPpAsmmN*|
zf13lF;Go%59+p~#KuYWr_<tNYL(@8e-Mcw#NHYWjrbbLy(B4-uSC at ca{EDPVrzC$J
z1et{N2+TJXlpg<iV2lsq&{o<9Xeuy+l!)X^AIUYpj~Ch}gp<V7k1*^5V7p at qS$ISb
z2&M$09geG19oqq)zl4rY;{EZob$eucVG(*UFEKIr0h66jU33C&3K^l$7Sq}*RZm at A
zxALnt*5p<2QIMkYOqTL&T8U4~$<na_wm<tZf$4;dsL9f)S6`Jg at cu!{v#s4uNz^m#
zAlX|ng}E&gyKpECBSYuZsHXLMZu?}<&K}+0Kc|R%@BPsGtE~$hS7 at hSw!^h at X$jfX
zH556A-H6@6o_=h{_5TB~-;zMSE%txg1?}AL=bW$LeqSRWmMua}Rv1v(V0uMTY~2H2
zAH;8wiG!TjMzb%Hgd>{K)HGnIRq>JZ1W~OHc4&^W0^5PXF3=B$jf8Jjml14~Q18yf
zkdxT2f|;*xu at v3f(#q18MwHgQ-ZTZiU>u9?)e|0qz>Lc{VzW{EV`rcmdkoYfD<-5N
z$<`5GH(zSSq8F~i;-HFjxCexjN@CV1RjCJ29hm&`lGkmV(xxv6L7MwO$mL__k*=o8
zIbp)>O&mzJFw_nSCL_l+_97|1NeUu-z{d-?d<XE~f%$;wwP`-s5l>*wmHH*eUjXB`
z0go_paFGmuK|K9s?3C~jhhsu!9v(44H at qj9e(CAmC}`cn<0fmGw`*f|#2G`3TF`S4
z0!T9*!49&3cubEtV9n1usN7>^XGCmI%7k#jWrTprEg;9VQ(hZ=s`Zu=sIbsWF$7Z8
zo6A~4t7h+Q`ie&nhaod*mA2J#x?U+%l;Y6G`z%_v04h)L`N_(vmUb3a%%;^ICFyvv
z$D0)N*-zXb{=V(+{s_RI#DuK)Ce-`wtLo_c|35uGhA1OFxg9ukdDHaRUy+Ud2eAS5
zwTxm>OkO<(Dx at UM&_q at md19Jj6%v@8jD>9`W5iA2vf|&&3_6q!BGF|G(k?T$FKvdC
z9b at kCu$lx$&XTA$;2IMCo&%Eb1Dm+?<fHJ^EAB8(y#Wy_LWe^wIKk67rYjfF{9od#
zE-|?{@pq>J)s=WmZf(1Uh6mS?(3q0 at d^ltXbAc)7fdg}v|5r>F$Fo*!^64F{MtKb<
zmP=Pb5#G4Yw!Y(f1&cQ;CIyLPAqj%VgxXs;-U9QN5Pb>pCoVAkgr`SlK<ryE-@x~O
z1^7F_e#K?=J#@Rk<s*pw81wQ;*iYydA|V(|FMvb=HJ|J>uW%XBoD}q6LG$JM-KSFe
zW=qWD5!YDv2q!Xa#V^Lhm`>ET=&W_^Urr`C{H$JSSm}q4vV)$OVejB8?$L{}GfIf$
zD&1FRO$NSk;yT`62ikIdEtNSz$O{(Xqoo${u<O=I)D2|QwLacEIDQn*Ov|oVamt*8
zeB)W0 at r657CSg|lNPYhg_opvE#5e5MSK8U<LwLPjG3P9a_+);hV?Z^w^|2UKh;Fc<
z@Htn}Pr*_(FC#F1BMwh0+@{e1A8>3QiA19 at sf1ki1CC2um>MzbH6Z}D8*ovm1x9~>
zAs~7VL6IYhxC at 1V4eE(bcLE-rauzc+02?_k-X!UaVl271ks2ws3|Q%&X%HHr1!QB;
zfQz}=sO(n?Q?iq+r at h8q+C#%{Ix$k`M(w=gz|io788&Gb8xw>Huu~`_F2%8SEg%@4
zR>_>mk{+0y+$!jNzt-NT3Kz2r7Rhv at 71g*f;5ZDfaC)|EK=>L-T69<$Ye^+`eHL_0
zTzT8kHrd|*`Yvn_w%-EoehAfjU{bBCF9HUcM-XI1031jch}HFSO7zk=^Ez8C>3fr;
zL#l?WD4TV%xUx&YrRdBeBQeY>__r1ZC~V&#Le|U)kIZ3 at IRXp?k#ZH(GPes6;S)Ri
zt?01|HW;9tHlC4i$h6tX`#OX1HLbayl(X-_40w=T;BuTBhrCBzW3S>0#Q{@WhmTma
zg64O}<7>T at 8r`aszb*EElLhVdX at y<S2^>eWHI7b=<f>5Q$%XW__+5h|yIU+p;S+;L
zfy@}E9l$<;O<6=Wx|sC0Hw4X7h&{V5f1S(Bkmu4>R8dc{R&v-=MJsg!$4#l(q36^9
za_%LaC|iUd*}Rip^Qt&aCaoc=?k->o1a%Nn()z%+gxxMD1!*ye%~~QBXym`M$BaQb
zrVp*|m;*2^pogSij8_YuyNIN;DX%5*Fie^T*aR@>11SP!)~zot$61a*$Vhq}_nzAt
z6V(`U@=mFTvkHdS;&UZ)Ej-C6>d6GMV3NE!JB#WSVi%Y`!tF8cH~#{5{3%R6hFm^|
zY(I)A=kfvr6F%Pn`f{Zs87C=Ax}%>aA5U|x+#QJ*r{1U4f_st;W=O%4uPonG?!p2>
zau4l-*v%3YFh6+Bl`N-0#!A-PSX`z(vN`|0sFssXr%ro<0nN!E9Z2<gfmA=+U!cgx
zgqa8_Q5e0ZZunp6OIA~X-&E^^-v9t007*naR7aS&zYk@YWj>egua2M{PdiA at otVd)
zoBe{ZdHA-o|6B9y4HMIk$~%ql?M&N|qDKV;aUW(!<`pcivUsx2&caAplY}L+;1JW^
zbp@WJ6YXRH+>(2ZrJxOdy_aYvAPy<E+Ce5z6tE1XrqBv0OQ8;61TH_R{7l-WWqnQ_
zG;eM#C~7594W%zWQ-PuwM!{EM2TX}!&L!dlj-!;zLs}-la3ohE@bhp2^fBw1OQBh}
zgaBqhnZF9SN-^9p&9Eipa)fpzmCKNfk;^icbktRpCyV!_EOL-yJE)#iVrNqqo()@M
zLiH6&Bc6x2tU_}`D^)hLyL31x;G4q)+Y|=MuY{+f2Z}Z80)?qy`WvXf1>_gd>-S*C
zYe4TH$B$u`?@+Mz7{V}+xniLRw%JsujSWN5Du%4Rj7w at Wyrxplb1ce2zK#`rdF_-Y
zfD6FPRU at ImvC~RB7zct8-umZ!OCA6_vFm^cBP$>m?zAJfV|^YjmPMoKNZnMuF;6py
z>|zE(PCkm|w>_*0o-{GTyjktO=McdG^LvQAU4pJ^5J=Ch2?h0?a6E!xV#tK;4}7-R
z%zOiI`>zGYnNRQ1fCU&~mtb;Eg>kmjDWrmIaM>f163e4~P*J-&4Z(y3G?H+GD at 3!K
z^}@cB;t3ugFvm7l$L_8eTwtE0>Y0S4&7*#jHmUq?v_BqPIHpfd954fdStES8Dl(iT
zZ&I|5UIaL16aZIm44oDxqU#A?`v-&)l$6rRN#+nhkGO6=f at xz2zQ5#Wn`Pcu55`Q6
zG7IT&#gsUN%d at 5vOhish3fCCrrvqd2RkWENmi7aA2xUPYmOkoH-QB9O&*7mKc43LT
zRLv`dWU($n%$Bf{GOo@}!7P13P at kj>F4eNK6Q0E@{{lF^jF&q89Cmyc7~g}8 at 4&~$
zkjo3qMW`y<gkB&GLE}{!g{3?1UvZ12EU#Bu_PXe4S0OUF#LX;#L6zyCLOmEs1EahL
zyeO0BkdmZmM%<vcj$D~`wXBfiJKk$jO>1$1m&Z-C>3Q@^O`-0SFrzO1eAj+tqL!@<
z_xo%N!c6V1)b^q2;I$FjACT$QIh>g=mP>2j-@%SY=-rFI_Hg;O*#8 at TJv=;wP>KHV
zUf$pF*VM2v$aEt>Aln7l1BVlJb~fw{Jbkt8MC%JjNQ)Yn72Aa3s>L(Ue~z((80g5(
zI1JbvhM^jZ$%Y|<lK25|Ul5Ruvdc8SEoGrnig6}8>$E(mT_hnUC@^dlsPsm6S>0U6
z*^T-HRFc-jU^n7vP?nzh8gNarE_`}eArM+HcMLKdM0l{!N<k)Y=sF}#7gGeKtfh#H
zDoH`?PtuQQl6;ijJBp<Ph!iO_?D)*SNiUl$`U?_R&!YHJA=i>OmA86B{md|q=@Hyc
zL%ES&J=(%LQnEh*8R1#uIASR-8<{l*_W{S}kmC_J{xTN2`Z470$B^y2WsqiLK-HK!
z#e%Kjlq!rzOnR={fXiN#Mk8F4VKK3k&rRg0P?vyqMn!)rI|!v$hLcZU0p5gDB%LKq
zTDbRIq at tjNaSx@W{7x9QAP2NPgh6Rzv7Vi_I4e479I|iV`U!x?2-ZnU^U8$oiDl18
zAb|jUwAgZdMm?ho=^UCSX!Xz$Rj5gNUa{{_*zR7CA^4kboA8x)_Q!GH@!dlOP^2ID
zgkiG~QH_j6^PO&s0ZU+n2Zzn@W>+4`lQ`Z1;7-%0ByP6QOi4L1imnd0WcTbwXNs8U
zS91Zd566W!&b&HQe6hlEDX29CE-GhRHAO?uCEx^xk`<HKde7NqhvCV|PXGOZhEK0>
z_M{>y6{G1H5*@BVH7uS(?J5|Oq3x&++7Vf-2}Ma-K6K~=I2FAV6gl at B5DlX=Ax$!E
zhIzQ`q=qUFqk4ez`!(b;rS=IctjOt+(=2Np82rMl!8<0)46PzxxWrBlKM)h4Fu*0g
z^mq at GnY&vlnH8E#&DmaS4#?)1v;ziaK#R~=!o%TsAaiPm+iSRe3Xu;1{Rr5;3!NWB
zF85^cZ1l?sFaD%UDm`4_J12mEk)~w$`GyE5pE)+Qj(1rt1gUGI&`Vdks;7ko{eP6$
z8i@p}kXnV9tOTiGt)&%0G+sOUVl(v^-j~8)v*y;ptHRx5Dp0~t>z+yM9`9xB=YDBF
zTV|v(!UaBe=m<C~n!f|U3qnf0ai8~?kFWfA_#?q5kFIit*}g6If3shQO<ecK!s@)8
z)}{tOA_!#oN}~~M40=8QTvun7p3^K!;Y=A_>4s)XR^H{pB%}BbHU&CXGKwVRg2c&J
z=Pslko(-7DDW|wlh7_gH#Iad0Q&a at Uh~=6zC<q8P$VTd<XHS*v8_6&TVz-LQ_KZRv
zYD7)HAmS}~2v*jq2JbnrQ(8lZBM#XiixX)h3h?x`2ouH;dQSN%{7MR|r;;?Tv$2S$
zlc^B&4_-eP0I4$=k)$;R*j#B}jpEabtpg{hr8ge(oT6M;@VhiSh+Og_i&&?hOYCWw
zOOB}^e222#aGj9G4obq0$%Gv1{t=&yv0S`hPwNLs6SfDyUIX?5n4gB|>-a7(z7H86
z0Naaj0QJYPP|#7!%9xyvS}dtChEn!A(2O+M*ez%=Z#;LwWw)?$1=3q6{HeV5A;5 at h
zV~p at CmsBiIolMp814wnYUt#l#(I!$$-n}@fx{{*wbM~=IrNoKc0sa6ls%TlWHKBq(
zL+lj?4%zsA=OS3htoX&GV1{F;7lam;>pL*)mD}U*`mz5JfPbF8P~T$qf7 at U5uMba|
zFi=Vf|3M5{NVOChVfe)HQFQ~x6_$35M0~X=6Ng9lEyU`Sj*+7+G+m7z*Nb7};<%)R
zuu=S@3lfN~S)2LT5>ophL&qE at VJxNqc2YhaULAjSG((d|-NZd;y!CYEEdD<#a&XSM
z*gk2#CZjB6jfawI;<0RxVz!}JQ^IvOmBQS61e=N6_JqgMb0}8=#Sro;5T*h(!7jii
z;j&rHBgb*m&Z{QuHPfO(=@6Qbfj at hgm8NYu=%nZ;5Bf=6!s)#NR4J!QyJ5WwGIJOh
zZvx*P*a5qXf|`b7<*incgWe8pRK}}_G?-!H@L5>^@vaZR-@)|>!!8j25;#5w at CmR1
zQ-28EKHzJy(BU9s2+(;?yx(XDnD@?whde2=jgy{~-e^`lCJ{|xNV1s54J2Z5Xy<*M
zA(wSOcwL)#sUxhm!Au7i9#*ruY-vt>r{#CjA}cX#k3&x$plzDUC{6V5(0bz5;8YNB
zlF*00X}T9IM)sO<ns85{;0D0%)s9!k{&>GwKHG0RYX6lN`*|EVj-9N8gAYbXnJ at 6*
zX4AARBJRMh0T`k%RoHG-OzPoo*ncbxS)fz`9hi>oqQUu|LB9zpJ3D_mZ%&J%ViLUm
z at Fkxmt1i_ji>Ql2X9$dfRcPgTpJ6L02pRy6WI|{_FG_sgT`S4nW&M3Fj~o(NxH2&`
z3Uh{{#E5H99i*ssH^2OQDM~9OgjjxfeZzq at b2pF$pA0F at u1wa_RJr`h at 6WREQnEV}
zdJ!q=XQ<_9)1Xq+&@_y5i3RfD;?8jk0T|~TPG2nI1IxZaOw!JUbXc#>UXrBFgK)TG
zaBp$Y4xk2_3E;8<wY|YhXKJgkaDwV;uN{Mklvhv~z!@wX2(##jbprl51aD!xLF6;|
z{sHvzBS2pQ`ZBa8B3yz$!Uy9R{ceq~at+r^D24^xvv~A-oq(FIqr}|ZWGSp;)<g+d
z3m?DG-WY%$VFeAu0Wpv8gz^XpiS#)-RZiahId$p^yea0atUkSL%>5y*mo4F2^6I at s
za0YiW4j=VQRC5R(A^s5{Pc_*Hqcz<l94Dt2%lJ&2Tn}EkMVhi--*s_Fx<Y+h?El8J
z%j*=|j}JZQ0+kMRK&X5Rlcx!Vnl6Tdq({pJy*yP?k}*XoT^das8)<T;0z*&(C%b+!
z7x|S1!(f!%QQE<Vg<44cBSlMnu{*-&Jtl;r=yX-zbfm0Al20$du8twbhdq8iB!Wyt
zXV4;-Y9<a85B5r8+hBKw#+cSDnr0*%cu_53;Rj?Mwhy4P)+9ddF(+g277r>O#Gt~7
zgzM*~!U9fV7Ypp+OK0FTbhC0)yKy(<G?N}Vw4R3#(9=KO!4$8|-?GkKyH!|OF8k@(
z>(<9>8d#prt}8Rx+|IO27J9c()0!m(mOoo at vh|Qw at U6Kp-oF0AqW1{LnSiM>wdxAY
zyv|0F!547fVNahy^aDUYf#VK3K7eoEV`n at XTk|diO-5Q|3l{;6;w0}U(5;Wm9F#x3
zl(S|KX!dFjl0qD=l6s~p<@aJeIG&y}9=e#84ivkZW{Y;Ki#nB2`3Ry17uC-R37*pV
zZpBbO-V^2<70R81Kd26#r8|jpI<7~N3=r!6d40R?qThTn&ewq1&+GT*as0<Iw?f2%
z!H}u4n$DA^IN0q=XyoCt;i8T?uh9WYup!Lin;7LU(u-uHE?N{VqrbfCEC?W#os)LS
z`NbzTpU#>?Lh<UJ=2F5m!4N~04_fmT;pEwTTxdWh!B<Z<NeQ%Mbv`EtLmpDjg=1!p
zTB9D0WcT>eAsBTDW>Oq<L2&*DkGk|bDYdLmLPzxXNheM+q2OMVL^5ke7J6fFhobCs
zQ_U%z@FtmcdSW!P!%M5<N?3WnkjCS1D6W08R!0AKdB92>;6pU1jLkM7t*0~DOnqg%
zp0ZxCvXq~1uh|KX at Y`9K&Y+Md1x}aplZkueseYf}%cZKdw=r!T1K7U{8Q+KMN5JJn
zm<q%m8G*>eGWE*5&6q+DLOe at 4ZJ@c>9`217 at 8!b-y#T%wLiGwxmzfDYR?E+R2*UQI
zD|vQ({`z`ZUTdreme$pXNfhl_xczfWy5SLggS$net%rz|0U2;QCsxLDg}>P9;_bR#
zNd>>@cE?{yu}@Pf5y8IiKb&*_PYnLUqK(;lK&|jpAv<R_SGwq=MehK80<Lq3cZgMw
z6ea0ezEHFoYQUmDk`3&%Sl}U%&ac{U&?ClmO<sL2PKEMpOF#K#=TQFj*225l9ZYXa
zKrt?K<3ZTUb(r2GqX-Pa(ik_gk`s$9I#x+rg@$P_8->N(Nf<=PydD+S?!}Qunx09R
zpgHXu(=R_J3$DI24!Njz%yp&KAd{5JOK4K at smt&&H5A#A#o@P>>l__Qn^2v*d-2y(
z!P~p*f|MYoI(6b|s#vCN#yr~O>N_3Wma9M$Z!9v at GYNg!2e<ixs#GcA?7q&1u7355
zs@VWssa_rNo%$nSp8>doA3p{zKLExDkg;LPf#Db4gGWqm?B4S}Nt$wWC0>nH2#vPZ
zv2S77kW=H0l-zx}Mh4a%!5>f!u}K=kRZ^Oqrbgg=czVZiYPI(+mc-1v=++_64p;NG
z$VNmR+9z=aO6o2c(gKM?_Sn~RE165NL-8^i8#ru#2n0&kXZcND(th=r{q<=(Y<^E*
zTharE8$GeXq$&aIh^1dWOtMaK(_pr+-4=FG30;&ZJgtX|8W|6}q}K{8AzU&KqBy1b
z*d{3sB8%V-G~xmY*+J!;BbYY^g=~gFLEh|1P;E@jX;}H3?JBe;h+$I`7NMJ_niux3
zo;GPxzBu{0wO|wWCL^X0vqfKoM#rb58ftRR=D-0XM6(!2E`XAjIcwRfrTVRDid^m-
z`#T%vFmOLX{N8=p*cy5NzHsrWD{$R;aEPOl!&J|f2r4a5#m_}03k!<sn+sGa_)eRg
zf0{%`KD~r(i5TSmNa*z<ZTia{O+SiP(2-Tx_%goZeZ~gHe1!K-^~*EVti=t!u*e<&
z-a_UhFh7OsOUU>b<MNXz(mEiBG&9q!*gM8g3=C=x0Gkn3FRo-UQT570-Y~;=3P-!%
zX$Upr7*&r@XR>zO9!Y4>`mS?oLZwWdzZ<!Mbesp0;1YSY{Qhnmn_TFIg|ZiA8U6^@
z5hA_rTO~NBe$|rSmdJBk7S7n;z~)o<9(@BsOuq7Bf4yFVD^C@k+QhUyl!3?26e+-U
zK;=pbq13}8;uzzCIj=Yd<@FA7!^4eIH6Es|w)-45l~{W7*s#Poo35(thuQE*28d9Q
zRooehHpWCT1f1BgRxpXd2QMTGo6hAYe?j8akpVkMgEO%zY^7qw5`u+qzn?><YLejZ
z$tffs-Ynd*3TQ4zS at pt(neC?}4Uy(%X}O}7UiE^h#;$boI at 7(fGz;v)rw2R at iNq)g
z1!-iLO6%}QAH-S`=5%zV4j_%ya`EdZMKo%+a6{?K&e{A_HKd2QV5y-Kzt8O85{q&1
zp9e+-j`L?%L$6YdDm04gTHZG614i5Ab+EJ_POf^;SK^;-^8S8+U<d3q#6E}5PXYZ7
zT)zigzE9}$pkGZmo_a0W^O-SDY3y`phz6NeP$QIFTEQG)vyc&+3@<_2S=(E{4~B%V
z9f`m~5a at W83%zdMhRge7#Yj4EQidn=VkehWr;BT{H4cbx at m_P4kc*de@zjhE<##{w
zVA?TMupf^&jw`my{cpSp+SgO;_oroVtjyh%6_y<%uhO+Hr1;~M#p)PxFuiD=pdyC@
zqmA$@W*#+>Gu_8EeY<F;g=IOMi@^!OMgf<2<JPkp8G`A<c&T8Ikohs)abb_J!l%fB
z(NJOLLUPGo9ESsUiB~5jP5oJ4k)Au!EPu0ePIgGCZapRt;Wg=ksuko(o;s<6p25Gi
z7Qzw8!Bi(jEr4a5AILOd%w2>_a at hl}sL(JNT}a7zayr at y&Z3xPTFphfqc#c~8ehCo
z>QXVA1r7|qad*t-OO)?-f=Xd`MigRA2oidLw0#ydH&SM_CUdd&4(7`pPnVZ^zW434
zRBlOTh<sb;wKDOxn6%1Yj;luq&L?1x5cwrsJ_GDW@bN=HK7@}@_lm?$>A->EVc_Hz
z7<+tS7g~B4d`u=<X`2{Rur=b(6kU=)nWvKYp3~2QSDj>lIKbz7FnSc at ri!XL=9pz~
zow1AVv)~)?rnG(rsfS`#^jI{@gcuW&vP?^R5pjm5(NM^MxQY9*na$G<=-Xod-fat-
zCBZt)k8AL8-T82hJ50TU&OKD7lrGC5)w!lzd)SB&XsQU)`O#e<Gngnz0UV?~4&ur}
z=Yd#+(k>NCftd^$p-Z0yF$fcmjm1U_+ECI0v+JX|*^pxNq;}|5+Px^=17;!m$eo6&
z1}EI9F6AK;f|*FWTG50t at z`uW{E0PGz$`zs+8U!t#<moZ)%PQnZxKPyR-LxCFp%t$
zug#58J+RN%hoCGQV&G9O+mhcLw#W&qxp}afAd6b>aV?WQV`M|IT=Fo`C6Qkej<^Tr
zI_OeQ<-Au0UEc;LmXQ`0JYa%S8 at ax71|+wj6*O!e&GDyE7iBSXiiJMcv<YNdn%{)5
z<N-V at AihLvbY*nm!Fm#JS@Rwm!P~#ShUlNe^#}0r1IYG+u-cw8AkzvKUz1<p?vr6C
zgRGgoB}iG(RwXp$G0kOg_mqNnZrM=LiO+UuVfoCrBJXJ3vq~IFr)Oss`h?Ebf8znq
z_`!I`7l^+r!bi9Bi`U!O#5}_BGN3h^FdT55FU6kzJ>ReY48Xhf-Tvkl{a>F{`ixc;
z-^}CV!)g1ivYmV<ishiu-7c0+vL>vSy%$oV(!!v>aE^I9A4;9)x3u|SAsxkh$#5wv
zf!4WL_YqQWmZJ%+rYojX(KxjUH`9U51d|IpuZ&L~Bvf){4(<9}WQq7%I^|6s*RvTq
z8JCSdd2lQ%-=Ym#^62SR?jHUy@NyzGi-*LG%HxJN7j4pm<zx*0o~#KawHGVIH}UjY
zIPT<VPq>1IkB~-sJIOfn2b_HAn1l>RCTaojV_^iH6)o<yY+SV{7P}q)Pj8$kEHMSB
zhnGxFD%PNfa#cvBaKGn${gn+)a)13<6VMKAUsFnk@nlhy1C<x7iHQp*W#7qhpKyNz
zIsO9r_(#Cgzkok|2K8(F9@~NA8jz4hX0FUDd>-6W9Bc8J-y5Chgp2Dc=rfY2L<Cdz
zI3PSBAg%j!Q6`sVc=6{sCFRbe7&1Nd$Yd4z+vm;~1P4Mz@YgWh)yFV~5!I3!8oLOK
zMYiBlHrVvk_$`^&zklp+f4g9R{}#siYrA`)qA$PQ<NCN{+}Yuq;X>P_QwmWAl(>eR
zMs@~XZxBqn6tW9y2~ig;Nqu7Mvn?HmgIKc!CM(ND6T*Xmae^YjFqz>m#Y2N~AN3OI
zIJ;IoQUT2F)P%tfJakszJ-cKUxkh3Wi>M39fbt9lLBzmW!<vQH*4@q_Dv*Lslt8cy
z$yp|TmMoXbTKd*?_kzZjWdj*YoU|4~5mTCabjl_%p{Y08DS!XwX;&N$o8jVV)u|aL
z?2VSmF5$h?ErJX<MMBC5p`5p6YcXFe7S*-fCkQ;n%Whe;iF71&5^22=0rhT+O=PD;
zF)Z5@`W=Y^x7Az`3g_I<h;tEK#DlY9_}Oz%%qYS=7BouD?-?ufrg9f#!sQWiyn)QW
zgdZ;<<L|(>4?{6wp}d8T3Yn=R(vodMqqJUleP?qNfjO8#cZ^uWxdKk8cFypgQzvLG
zxJ6s0F`gfS&;B`~LFB>b3p-3QgX{o4hWanUQ8#IyA~3lt(nmZe_i$x&WMFv!{KbU-
zJGMXGOWKiq>y7i*clTv#z#I1AX=evzb%RDATf_30EI&1%h`}Q79(kpk%m~t;IM0>V
zzaAs<)YjyC`p(eS_h#%c@~NF;ak5EDK*a1-kS*iQ?95WV*I&nFdBD#|s){C5in5qf
zP6nnp3;yO(aDt&hGJ`(t{>*B;mVKF3E9n~9vEEy;4~tQnIO>dCUoccWi=xtxJc6Sa
zlZiDEC-TWAOpRPgE{80u+pKFTj&cc493QRdaZDb$*Wjch#M>wH0}8^EMa8tWT|eQg
z2VoS~6dd`v>*jS;kNX3h2vbyr#^}h`8MNT25b@;U`x0<Hn~Q1Tn}HbtsYylp3FNeF
zG<17wX<YAk{bhKw)TPTURQPOI*jwWY_X9HD!so9b$48Lux8U3N0Ufa80iqh2xw4(W
z^h#GVrTy<Uvfo7G;Pa)bj;z_enX6eH^uis=EXYbu)AHKUG@XR`shjSQu=bUl^)3D2
zwVp6}xg;8C;XnaEykFio_87L?dd~xU0&+m-p>ytX-Xf20i~ajf<ixnl1CM_9?j7E}
ze#8BtFRV~1?qYFXCBiYRHa)q*j4?|jWc~144y-gB^~}p17K=7ZF_Z||1`DrElP^tC
zlP;wyYu@s{j)V!q4_0JhGe*d<s}}@24Gvt!D%AD!NF&Rz6=#80;*XNc*Yswgra%Td
zUjrEjTKIi2QR01sHLtK6T!nPmC@=H3xE_RRByAnMc=&7ou(<e{YL)VPIb&dPa5l=F
zN~CvnW3yQDO<L^A61Lq?R|`Kr*1rpno0gK5wD`uJ=@0(lVOt?Z5{SxeOhF4)q0{e0
z7EYYSYOcWcWE?58l-EkqPH;nd>6=(9?hS`lea5ot_i{}%H|bBcm_}a|=d)xKQW at MI
zpz{&#pF`$Pfbm19eiENqufYnMQWgQrK?az94Jb^)M#Qi~VP*9VozyA#G8jXiOK~3#
z*X4eQb3S$7VYuf+>CbjvqkH3PnCEGFDsd7qyu&fC&=k-4ib at e&)6lpwbZ6#VWCNOL
zfsqa?5qJ1)XMeMoMc&YeRBqh{{_^L4e*b^}AOHB(n=e26yAHVzL$rhLd~{1BO)H`Z
zuVLPlj&s-|7}z~3HjX%fhn&=mYdP;2?I12<#B4OYJPdN2WYEH)z(y*8K*+4=-DexW
zGbRvcC(N8IVUc+`JUXKa9Z{+GBw`pY#Y9mS?WtCRBa@Y+6^99myIl{Iu1Lcyu*L_^
zCp8S|E1tY#ZTp6Lowbs5*+LMM@?fEGjSq|FGTK|PMJC5gvUd^&=sam_3wVab2R?4g
z>UU_FYx(5srU-!{A2wDocbdvs^Ric6#WcI>kzM5oy=odUPJZW`uVt!Onznfr{93B=
znwze`nPlmd*iX)j+oZhejgMEsSk^Kb)Ncyn(r4WAvud9tVZTri3AH2f9no)}(}2x?
z74XjXccA09Abz*F{Y74g1S`d)Z9*)9rytBfo|p)48F0 at LoiziAoFOR{a(*MO5_vyl
zW9>7#*3xyf-;k<rec#g5Ct)mwpOR>1WYl73+^KPj-T}XhXGEPg)f4l0<g>luH$A{)
z`!!nnf-~TNZi=7(#h=~(!T<E%{PdTf|KcBh=liez9^8J%-DRERN*E`)I=9K?VPL at U
zz;z{~I}@KjDDoN7gnC{vdijrA(S#W^;$e)20cO{(1!=N&4vhluGdi_H7yP0biZHY-
z=KREiKPDGzG#{U|W`L%G(wCPGi{5nMq2i~9IM_4JAPH{?RBI1V0TYQk$4YZi`x4hR
zU`{HG2hH7NQ8o+yX$*)E+iWawu@IHyD2tap$;|gop|1e2Ny;92YM2!SQ(S+ngLUiE
zQ^Hf86lyw$ioi#>Qd;v0a+jN>V07oo!*_I;AQPK75e|4Pn5`*jxqOaHfE%aAgi)r1
zbwQhW<ULD7Y1sw6Ze&ruts`a&va0*xM8nm^G52P*{GNg&CK#z5mUMa)0FS`_$H4py
z&>z6ZPr}Lpgfei6Yi((zFaR+ghz?=YVFiCQ2982-6R^7iX5{%~;(o^V%V>@rkG4or
zS5EeJW;7MEj_82f7Rw*vKmA=<MxqkJ4VW!IM+iM_fA<ZLQ~jF7KK&(94g2$d{U`T-
z@caMWPyg%>|JUDpbo}hYPhQ=d1!W?~+98W9wQNw80m)fF!m at OO!Q}|2!ZzExgpt-+
zoN<0YBOZ+$dIdo|up|HgAOJ~3K~%O5!Le$l0(Uqn6novJULog-yoZ8{Y3(qOEQS*K
zubvK$A{aBMhoW<72U0a9L5Un1l)+&!Wn8#q)SCxG(G9x1pck7KPL+epSO$vclaL8*
z5R2p^eeUd-*2%HpPAXnYJvI8xED=N<8ZN*wJ*E!_#?(ll!g3=G^l0rd(&2E3P;tvH
z-w_?Y8vzA=mWf5v?Xr75xC0Hwt>VFDxUMF1bKp@{h&$joEDm0q4!f+~h?mFFdpgpD
z*sz#1ZEf^kHphzVYtx(e2_)g at raWzy%GKeX8e(17O;-c6pp&o-H(0aB0NlQS*=y+h
z9N2yvA}`_k5^e^?BX<Y_=vF!mvByPoG|)NLtAR5L&Ww}B?J0P>e3cunyp_A&+GpgR
zBrJYzjy1xfEBNcECMBAxEy7pG5)19cz~r@=<YtR5SkL#zpsbGZUW2>e{9 at lMP;c?J
z#FbSQfBGkXeE+}wkN?$AzxdOC at _Ube{`)_B_~1Wyam;IxqTMGIZXwE^xep^XZEMLI
zLc8M-L at 12oX1<4Qpg8Ja0@m!@?neKdSgBQk=PkjFgErhD8VwjJyM?C2bjB{302|5N
zE^84Rw7osBdz=?aZu1nOSF93x*IfC}7g`V;8i!B#+ARKZE-+Ig5?y~5{e?aHO8mqW
zde4x?8BCS@?~(?d3~wi^LtE;TESms~=tyTSD&3)52{7aH40eSRP>G`NX*So@?7pmv
zvv|OTAux8L+&SU4 at GRm!KwB~9d(zfTr?5*IyI940q-}zt9AEf;owQ4|NIf)52J{^Q
z&JlWwp0nE2pSMcrwn)$UM9sp+IKx3?^3WPLMc<zhM6^+GCD}6OHwJgoCJBd<_z*^T
zp99w~0KJEgSCH{B?Y9MxyZY>rjCDP+jvUvpH|UxTw4^VUXV`pxmJ<KH$GNm3C8;Ti
zol-ELysT)w6?`hy?TRF>nye6(U_ftC5o{GQF at +C@&mFE7P|ooHvjby{Gc)QN!?Tz3
z#M!^RG}`*t|MHLT|KNZ4FMs;!KmSL+C!hZ>KfCk&#eDb$j>k7tsG;mhy}8dtfikLD
zol@(NkBeimc2wxVx1fh)%&bl`3eLf<)B)^N&T4XqMW12u5g5LlC<7XZKYOGin+y}7
z!u3c<vUOTXPo8d=7HUM37zid|iSxt17(xKByHU;Q%~xG2Wynu91FO5S<j@;vOHn-_
zy6Y^Q)KHVt#IQ&xER2R?6a`<r{mjCo8^sdmCe%1~#}2}S{d2M@kTs&)Qp{#>%XEEC
zM{Ek?y4KGk6oV&kZ6R)U?$BqtKiXMCkc-B{!p7P2`|4gVZDI(fl0fHJN?TuC_2?YE
zV3$?Yq^_s(du1~Gsdytnr`tNy4cEv;w-yNq_h;{U_P9(B1+IDvU6Bd*cfj$_VEZ4#
z?Mv=auE2Z*<^wPv`Exf4ve2Rv7p>ZTndY5H0C+!FzVqz+08^O+8LV=Sv2FSZ;cgCe
z?7WbK5R;lVd+gxW(@w#{X>%p#8HPm6qTgsfep7$_8;Pa)#R&82R2858;^+7O`#<`x
zfBMCr{QmEK^z=`D_VVuW1zdpZmzdYr^r1hBcsbe)9~iFI(j_RC5>SFW7rJ5Qh0|-3
z8aLKkPds?|dgipzxy;(1cUcNbpthmI*TJAznCs&B3j7Etsvm)AlbZ#$BHRc8sO#zC
znmLV|=-*<?Rk8w!xXe!fp!I-PMP0VaJRp27QI#}Iv_DX-JtZ|w8rM2tAvnb|-u7I_
zD%e#dTeIo(H_x$O2^pEJ2DNP`&djOK>jsN<GIJcOpk-G#)4E_CvXa-(mcwm2`I;??
zq^gp=!~!*AX?qx26O)XbRa7R<{x02Qt4}Stn+)v};~jnF80Yu67;M&px%DK@(&_Z>
zxe4)T)lXZF!1|6C+pYE%cDBOKC2^o*18RWSFQM~a0LK at 6od<f~yoK1#KeI>ntUr~8
zW;KG(wF4q}@B4o5eHjAq1<Of1|Dkr*v-oPPJ8BX=5P4Be%Bi^v$t56LF^<x<MVj*8
z<`r}9-xm8 at +L(yo@oC3D{h$B)SD*difBO$#JpG?Pd$G+IK7rjFdc1)@eOBXgJXlfm
zT_^EdZ{Y%j5V{vNR{mx8ns%IXLd6!0Ayp_>K$$O7n)Q$~zc!gQFktc^(Dsn0N#21~
zeB3&1Y~@Tzqx|_?;-OT_R$)kM&ZY*ek8QD#oW44_ROse)%Ir>mR(w#_6uH~zD$p>&
zI<pv3v1n`Giub{l?h2Vagqf-92g<?%h_Isktl{S)v=WfAelRLoos6VBD8v>#greQ@
z!1Gz%eHQan{#LhVvh1bX|7&Bz#1h?@Se14_G3`heqq#hA*2E?Scim1MS`^FXUg7Jo
ztxh*-J1zU*7T0%obOomg)_e7{+O!vcFX~`V5YTFH-n$%?n*$>$rgnuLe*_$V2)8d`
z{>1!*2ry3tt^4b;@emo$;hLPVTu)v3?fu#hw~Qt${aJI(3?j$6zG~<DRAq;|k^r!#
z9rHUf)(mDlJC}A}d4{Lk#qIiipV#q?FZSorEQomj??3&=_y6+$`Y-<OckKW9doQ=`
zUOcA1eUAs=c=wmQs0X_ at qb-5LP3b78WfP1x!bdi2 at Mg37O&ACb`*vLl)9e7n?c{HN
z<Z at G-r#<L4dCO~dnxbXWW)pr;#^-YG0HLeft?7hxKAXV71@UCjj%YY*54IM2XoWXK
z_ZojrRxoz6^oHGzv}Xv&(1U$q*%`Z&uyD57eqOp*+F~^owa^x&<PeA3C>Dc3>-VNj
z#LPThGaTlpXgVj{RK?1cCMhi$qUZ-kKUvT>59lRFbWf?~)UZro_iVd#83CafR2P at u
ztCYbR2;Xqp!h#{3-J}Rw;?3Fm;QuG at U1BUdlQXd|;y>r!o0(NvtYVYRW>-JdBs6-=
zNU|}K*?<hg@WL>>^2YGmYr}%Il087P<p(@~VHk!NHVngF+MdP0i-82gHpb%_L6BrU
zx?9tFvYW+blhtIgUirHBp7Td|5fT3%=VsQ7yy~W!jp|}CD>HANdrtfjUwjXlwXtic
zQo2V|Qxps7D$qGtRNB;ls<iNciSJ=~3%MDfUKE?1LxM4D3b*%E^*%AYcuK$N&!iJb
zp91xJ;ORq4v(gIIt>@$J0iD})qh2(#@Tnhm-3mlvi7ZQ+DGr>7%W at Cf56`3tY1s|!
zXPA>UNBp-{+Y7=&S@<9cjQ}uJ5bG<D`ftzE?z6#6`>`$dP3Z}sl!EiKGyL&C`fu*v
zn!fd`n}P2a6+$)N5)n2yW&ac^X2>KugS47YOi(sm#$H|U&@2<AfLI)=7|hX%T|~oJ
zbi*m<!WOXJ)d?rKf~~t0Wb9NMMjwBt1YS+lV4c3?)$kgyA~pA7((YEFMGTt-VnhNa
zx2oJaMAGFF%O7r|JIVr>rd$-#4UYt=^j`!OzV;vo{6elX$dFIFE`kN)Wo|{^i<G!y
zrc-3q7k~y=(1OPgQcP|&?I&Y@z*5nyos_juN(bSpGJLhKX~HBIx4DnM^Yt>Mk|Cz5
zrp0KB(-aFC5L!*1Nveuk#UnAPc at 5PYo|v$j;O4D!@O~tUP`|d$Qy1L8L#K3LEGdn~
zYD<7vJy>q$f*Um3yiiHM8!E^PRq{gUq!XZ at 0P_dn`plYzIs<iUv`<=oy*RiC1=pbO
z8>Wo*sdP|%()}1Qh+1gTB;+YU#4HmC>lR>7L_it*(6e~QfS<|tZ3RXrB@u|~smlH>
znRll*(M5mEU>p|@`HA=Lw|{qi`Tjq6<M at c)K$Z1=7SugZ_li1OfslIEOrhfBCrS@I
z`l2+Jv+7i-wvhCNQa|x~r>*dguL*ysk9i7+TQU||I_I at GyEN9$VM^vj*$N at M_e($#
zvY?KI4|+F!imqPUgQuQTYai<vL#WiX+VyI1QZpQb8CS)G9=_gQaAPUk=#`X<c7$=z
zff*QF4cWVzWmnlJl7;7geh$g65xJ198l|tq1D&9qSbo!N`U6|o!WE9(7OCd;XpE>f
zxz|1|P&$-iAzj&VXtHbot$jK`+c9+bz}!T;^Jz30aNn4~hWnXI{XKSFL_k4R=|%|c
zrah{0^ZO*$pooRFvo4mqSTNtNQx>}d8O|9`f6j2;{Nh3nA#hFRgSupkwT6lb&<m)%
zXJP3S&Q`MQ$kPuUO8LWoiu6N%0p9?NDYq#Qou*90*RD@K)caH}?v$ISGeC51Q!S{+
zqAnJ{02i&t^X|Od^q&406??gM2S0r0ckkD&{OUaM{dppqW?(BwOcl7vRK={-)2Y;h
z8>E>baSb1GSr(OWKT5tG>f2Wh4mDsF2Hcq)Hi6i~&tO!R_VJ!Ss>?+s$08M}f9xYC
zDYX$%Qm0))3+&K>wB;i;SVo++K07=liBUq=+&g=ri6fE1e;J{OrA0 at BRGgJ=GS$Mh
z?p=aXsIjc0#plM-vv;S8seOS^YZlBN7_V+!fbggyS};N=b&XZc(5OLSWXu)yT<m;k
zbyrR-y4<EfEh*8=jm~O=JPbQiStd%EJ4I&|O)55(RC|B=;@94*n#6Sh`%w1hIoM^{
za(ZdWD})<%GdD0*MEf!qAy}g8TxcA+gf71yi8klXwwTp_egRuJO2Wl>`8CQDK%Q85
zdNdn1h`J7U3;Dg)MR8Bl%ED!}PhZqrPY-Z^@#Ql)+@>C^<6L{Y=mn~y6JrOb#t!X0
zRnNNa at sk3bulzkNKd!~TGe6?3y?FX)eR-w#_gh-;XN at _#JrJtEjL~RKLa5CSp at M3r
zUj|@rt(bUT<^Z*jaP3ilRFe&`cUSSia0zT%doUmgMrjo06qpb=xum6<BExiZBv=*g
zG{%vk!Lb)-%7_))ux_OY3IR6?qdGponu}htL-r8wzT`9Lqk7(|gul2$JlzzHmg92U
zd7!~I;_ym?eSAWzg!cNEpG!ABzyUR}q~sv at nC<(OIGjkdC1^DqAKC%gz at ukx-fCJ-
z`)eg4l-UnEpNy(QJQ1Xlabk6!n&@)p$j+@cZ6GI0x%ERt{tC?KF8p!w0#n3;$&;;d
z?piCZQ#9K>CD$_!zzY^>EByIjZC{&~OY0g;wnK5R-o((9#m80j`fG8f)q*J#|1N}D
z^#DEsP#*!)6CApB=3izyN9p&@GU|qJxzHb2DF?HMQu>^54gzc6zqr-0M&^Nz&3 at dz
z$=>c$(nk9xXZx`V6g$K7>mG^;b-L<!!+~YSj};py|Fhq3G0(s}D{2L#T49NspBdnz
z*A3Evfa|im7+Qg0Ti%LsmWz*Hhof+2&1j<KHRs6MgE@-N%lYdpSuwT49Oy7m>kt8R
zr9>2AA0;QZtR;)hTX=v6!KTq){D5MocBZ9W$ids#JTDiR89WJJ_Sq9ON|;{JvNOsI
zq0$P7#@Nz6ZmMBR(F)HSX(n?f(27NGm5#rYB(8revbw-y+alQy8Kj*^_2nE-(z-<<
zZV=7kZb4FNR$I2Z-LNLXk|Y}8vddo<m0->=XM?+7@|Z7A)zUEcS-ayWQNOR%b8D&c
zVj^n>VAo(AYEvhxLnn=jN!L17O)wz01C5qD2%-gN|3ypK&^$=WbR|iJnf at 8{>cIcK
z at Ha?Omwr+4US at bEpL~5GPd82y-B(_h*P-?uk%79BhzN1e`aLJ)qRrVY(c_wS`vi#~
zdMaQDIFJE%&NOUaQFl)uJ|*b2fO+}xD)#ZiPrEDUro#PVqeC97(5y~@;SN+T8y&Ld
zjlY;gT(vG1ku_{+Yqtbwiroxt^qp771d|s>c%$bVkT_)JZqd+8&EWP4XjD-v(s|so
z!aG;@X3v<egQsEfs~!d-v!X^<=~!<tZ_H<%y4n+Q2$Ey__IhUNqN4B@)WeE$u>2D0
zm$a%mbH>57fOs at 9T%>#Mv_m<tcgNYy(NoZsrEWEV4s(SaL++yed^P$i9a0R94Rg>`
zA_OxI!S}^)HI`0vxs)siqDb~bgB_=*R;XC}J}_we5nqVvY^8aLD|c&yj7tZ#)~s~N
z!&V at 4V+Xxdi&6`dznSKG`0siRRb75<?eK^19)hMEdy;xE2`rwm1(o#r-r*YE6H8Xj
zizbYm=oQ5?Lp6;_q$x-FnmgzXbYSjOTJ{FW?3cFPt&)mA)6`%f^?g<C&Q2b8YA|(C
ztfz~Q?>~9)&5Z at Lqeot*6c+t)DfUrpru|jx*d*}ic=s3>PhNpseS*3 at vx27+2o(bq
z#ksmv6-C@&OwAghq}9CE8C2)ykKF_&hf7lJ5`RXrbV$^-LtJ%%DQlNt585It;|6e=
zowV=@GiB1=MN0DHX0-fOf%EOrDTlq_FPRj<?5UI=FxPuY1Xy&Qz18^SeV!<TH!BX8
zol~at<pS9lH3yzBhX;zbWhy0W2<ylzI)$(V58biw8k31rYGcHg>hwi#1gg7GwvId(
z-r7GFe11JxnpU at A#trZVB`$tYFvAQ at knEnd5pkR*+%1kfcB}x^MGDp;Y3bk)?%1_W
zSM7bE%+F7j(&_p)YA5NzZmSnnSuBPfx+=Cnzv*Bh(T45cv|Mhm%niSgx_O}+3i)9d
ze|P|-pD}BP=>XSf4ZH5X^N0vX>4Z0Hg=qB88*D09cH55whL&pE9r}0;BDzn!`n9V^
zfBx2!2mfR}&-0D85A at fu*x!UzwdA6CpTY_vmwSMS;OM2#;`HS&fOkK at eDM)#J!=#w
zbAg<pRoV!yh!6p3VG0bBI5Q2&Z^WHdo$4ouFl_4 at CDHyO?u~r6Jp00ph<p*)A(KVd
z5pZ8vE;z=`T#SNwSU9wYS_D%i?)7mX@X$A;s(!;(MP*Y8&$8tG%4`Q;rVj?&phB+|
z?bdZAN-4A}M{Pot=J0q^Mo=4%>oQ}ty*~k~90a3CgqLThMz<rd&W|j=){7~nC1*|a
z#!!xuSO|N*&f#7fL>tyVp<Qow3DrNqo>118z}KgqERr&KMjO3SDNl~n`SS5T#6BV|
z9mVOy5m2*S%IY=9Ba+fMG#rVpNy>@Q)jQzDL?-TaM15ydsAm=*GIVgb at I7G6^umu9
zESRrjt9k(6L>FHVa(XFQe&ju1rR&A#Mw~o}(OCQ99LlI24}~<&-T?60Ox{Agsbbjz
z7Gu-=d75&Y_G{?$Rw?CeeezGg`s}^mvVxBuMfukSzvmZ?p4YHIQPgP<u&E|v?4GrP
zk56##i+>AiT;ZrZ!l*xhUOk4)6IAS>9-%1O?L~`^z9p!H4$PZ>#k}ZHt0dy47cj1+
zyE~?*SVVj=+qw9$yp at CzO5&EIeGhv`jM at jYV@`W4b?P8I#<1BFw`H>Dy;3JzxA<LV
z_h%7P0y>qj6;YAaxy}MiV%<rR-l3TCQ<eoKe*BvFX?(rI(rZ3FeKBgnD*Jv*?{I2+
znJl^z5z8hG7(oa#x_N%VazV~bJj at PXW&E~a@Jid7<6t0V{`zbOQ!L{T^Jmqmol&&K
z=h0l~&HR#m&*BcKX@`6*H<oA-kq8ef&)=7%!!ATv`10f|0!czOIHn#P{eGa{z(7G)
zjz%++Ip>PJ=v+cO<}90oM)>AdKb--G^vFXRXlBvi;2z}m_f0^V??ZAM5IXR7lNSIa
zG0bL9+v2|%X?oN>KqEjFZ7Mne*xIzp)TVw1m5l*Nuv!F5yds at 9knLN;uz#DL{r*><
zzWWc?I_-OGC;jy(`21J>Ya%9JE&>o+s9z<3H%GX0|CdlOL3Zy0^J5&zyWs6RDDxxS
z;*YS_XBcP?ri!7NV);#>mNMTJcAchKo6m at KU{wVi_^4E{cvwls^nB at ADLW0q3x{|N
zTW4LsV-CrS-k=8K6z{YtMZ$$ZMoV9MSqGRqz7F5OvGb~)T$DG at v{cA4f-MtRxu8}v
zd9#AdX|$w9_soD|aPZ^o3mo2jhF%orj5cXC$c(bIofoJ=d`^a38gA at L-GC#Cc4IPa
z9^^ho#eZ+7EE}wornCyRP!)gO)qh4w5LDA3_~(=bq+wlPU+VkOpB92s?T`>FIg7_B
z#MBkpWVzkRI^wV>$A0EIyp%N&alJE3tAMT*{yafSey^%77P<?zP<~zEf$zBy>eKU!
zAeR?){x8IJV-E$owsSC;>tI34oP>nBU?pXcq}|ePV_c+19D2E4K1({KeUitWy4pYX
zX6)2kJ%A at IklZtO<!V#p?5&Y^Z`1Q{e)Z{tf3%*b-6B@;(_ZlZ%6|4?&=ni+QY+ at o
z2FEY|3z(-%l<5)15!h at 79F2sp&~qHGuW;)~@aPAE558YedB9Exb0N$XsLYs9pwi8X
z4j~66!?_7YJ)dD&t|2U{X at s?;CTl~T$l`{V!RhCgvSpzsWD@<-EIMo-0i%LO8dc!6
zLlji at uC=-jfY1|}$il%vio$F~g2|-wtQg`1(hT*am`(3&Ed(p_bAg%7CR%DwIg+?)
znS~P9riF%3+c5-Vsu6aQt#ixWMW at Bt!c@Xns`<ost6#(63%JL=xq`ERo#9}yl_dhr
zH7qG?xvpVSCw&<&Y8kt%-7GGPesZ%(r7uw#2brd=>tB!(O$A&Haw67dcs6P$Q5CVN
zM#+<sl51)Y1W(_CwR^q9L3>a`19GHxPcBooxXU1VO;s%Hgq0!_A`W=(=-q}nL`izX
z;l6a9?Dos;J at o{*oBmEa)I&Xu1ZC>dne(QzMCvliFd!Pj_1#h^+U>yY7lfpO!L8Vf
zXHt at k#*uduG)D0W8z8kjU0cu^o-eS-PgMoejG_}(cmmev8|e7fdOUr5ck#!+{`_6~
z?bDz5S9im}H?Va6Iu-k7 at TD!)y{Z_uSu5)L2*bUf0Sy(OJp%6CI>NnMGge1y402)H
za at j-l1Va_<esG1WI^men1V{4(T<w9W6l`UKS%)U8uc987(1Qqu2>Pb(F-0EX=QdEC
zfs+<vBXeihIJ1O`Wt0{&HVpaGDIS?1uyAv7_64&uaMDuE3KloWz=~@1?@uklE@HKs
zZwd8?y>5x_(T$O6m9D+10u_}NgC{CA*U*HDwyqJLx9fiW6x#@gN{CGaq$%gLIzCC%
z0ozu5A|9x5_wAa9CmL0E3?paLP}4q;%hOFn#nLrxM4?2Mi1xBD8nuqxbXeMK0v1{7
zw46(+8L^qWrD52{1fvw#9y_FhTtLYD`G<rNb4-TPaC!C}js<m~9q@{Lz;|kA*r<zJ
z?#4BY!?wGcdV-i<r(+g$3Z)(htEj>}@uPsw2_KPV5pP5VTC#ca0nnRPeZitNyk_*8
z at f;3dwYK+Q%R0#Ml){N3tF+WjXwN8!R2tTPz{Wm~!+zZHSUWV2eCx-axHWp*AzH^D
zS_F;+IEClzUSiazU_1xQ at n#ZwYg6>??b)|}{po}9+jqbGuk1>R!%zPIGS)u at Fpe8^
zEpT438=ZzV=;fbA6~^)K2rqwT!mXnnj^qJO&K`oFoMHY5*nXdI@!$gT;T2XBVb~Jn
z4A?(c=ySsUj8HFuajH1Q1&;U%BzspRb`R=&N0DQujZWt$f1#zFu_o(SX*@q|v1JP}
zhw6eIk#T)-YUu0>s5Zhoj#^c2I47yYP+p3Qt93hus*5K^HN;bN4ZN()#WUrOszPUO
z77wQWBM-#ZMK@`NU+Ha?uoI?5XLh(G3-hy}u!Vm*`2x_g1X8{#b%u@|I?|yoXXa4a
zzX*vh>zrF1K0KsGp-s+}1qu5PXsyOCYOj~VzM*PkJel2ewB6<mSp%x6zDN#yKDtxA
zPLT}Tkg#27NVrIY@<^9hJ;i<`wc~V9Bo~TPFL)){A%s9L)7d55H0#nYYQZ==Q1Ox;
z?s4cwqW(>MeuZ8maFE_mNaCQ0G&Bmf7bR#hYYPshpT&-Vu2Da`&rRREs8+O`Gp&#i
z3sSvS>KKktsHLj0D%SEbR{B1MdIjhO2Apl6XK$_O;%$2NM_)aA_|0|1)ySvV`~C&R
zUT$2NKxP{^@BAcYouTy{&mZsc(ffaZ^Zg~B)-U1gS%EwO=)wddt7F3PON`ZM5AkYE
zSgnAec;_sDTv{m3vFve&Ck#&IWPg~Etb$wSD%!J)q2aROS8oenX6{eO4L&4s<L!}@
zi%9f7>SkR<O#H=^I~#4SYBOA;Sc-WfmgCg3^!!xugNi(uC0;wbd6=e$s>aC43FnUv
z27R&D3XyQ~v`6P&Yp6z-9o- at 2P4v1bCgZGxz6g<I{SXVsd|QbGXI>j+PLn!zc_;ey
zW<RtmfyDxBno8QgUX$QA0n`EGrT9X$#$+W8k_rf*dFQl6;4+*ZAue;)S#4o9y@{xP
zAJ%YY)Whz%Ge5$khvpaA2iSEU5)D~MeX1ZZxa~7yS|lHDZxWNK9u|Gur?f6#Zs6|g
z0$scgTZrBqAf7BALTMgOtB2pC`B-6T6D>C^$XlL7Rv7!UR$Fu at foTR|<Ii8|K3H0k
z9-{@LqQpI;1*4qf2;aki=U{yX(j7=IL2|w!oWHf^%eSXTzx~yVr{7=yvj{Ao;$nXT
zRZnJA*@JG~1;)>yOi#hO!-f0=9)9$BJpBF#INN`Oi+gu*_3{e*GBDf$%82G)N_)1&
z%S at Q(-m%OAOj|(qgjE4fi((x?ddi`;H`qaJ;?DjrHAM?Dc|2aGy0I%_iwos7`+)cD
ze%qbG#8jb5Ez)gPqj2`_zEk*`=0HmGnu+3}<o3Oh>g2Wul00h2=|gnDq8Xi)A{x_{
ztA#1#Lqigw)lOSYbiEb|5{t&vQHBkI5~spJOJ)S6PAa=L24<WVk1dqN;j{vCMJ&h^
zN=_Py<T@!~SKt=DjqMX-eiCRMI89c+{IfLpwx?pDM?=PHV at gR&3-?HP4uFGT(8C)`
zQ^f!PAOJ~3K~#e^ecxbk0nN_iuo!B@Uut-LQO{1GrG7-DhpYs>IX)O_+&ENX2hup@
zp$&*adV?K<R@+x}s+zW63w)n4mfn}Zjs6*h-(jdjkEVr7Wm=+BPNr&2<iV7ny>ZZM
zo<t6-A+h0f25`L4AlN-vos^*+`$9OfdcK98Va?wL$rT8fDDo7nml)*|tXCV-%eOZ2
z$*)a6_`NSkqHW%^to>16;PML=?bnWdbtVFxyn*esh0Ir|`=^)zJl%gD-~Yjv at cwrv
zJbwHLm#Yn)jVCzMg7X>J?R^<m1+r7rt%9}$+L=<bM5i<<WM>{ZcSqo*QL*yu(L%u3
z{8vIe)9(%<0Bk^$zrxT=?}K^kNPavVv;CQv(+!|4KUR~v66ic_QecAd#54Ci-_$&G
zR)JFWf at lvZ`TCdLWGC?XdVr6LGgvfX=0uFipUslkK at e^s5z2FC47AV?YDKPDK&LL+
zV&Js<p8y92WIlomE#vp3cZN}5C3U*S((z=eYB19*fM_*`%W#8qpAD(qFDQ4Tyx_gt
zbqT^rVA)NaL$vUy$zkN3No7l8O~W1$H}_2upi=3f at _`38+TJ1mJdDyDO&4*I;q`PT
z0xzbl?g6{JmzaCP+TySkNmNH&gr|`E*+?tKyr47YLqN;HG~u1TO$aGCL6ZB2=z<ce
znjw}OzyMDFotMqR;S?E#{sttev9T6zp9e!a`GTKNp|t8=Pe_w;B;Pr-3!rIyL?;aT
zF1Wk{8r}zV3)Tx1JqPKT|9-w9+Pxu{fAYrm?1PPcz4`(o6MedhJuNozX@n{a(Gk3P
z6}66-_A^i~L4~jfa4vW7!IPiBcOTrs!w;V0awf>h5$LvJ^99ALKM%b0`e6Ke*tlL8
z7+sJ<0$>8B3t+yq!{vAleC7l=9c_Ly3jl3g-GZeGvH9HV(gq;7_&jh@&lOL=3Lh8k
zwgGZ at Q`+|oj<2MHAcDx3%mwP>EC8{v*ak;Lw^baIROy|OCQ~`_g)&J`#u9{AkTZ<p
z^OX)f>@^9<aKkw6he}}8lsxZMZFyP~wy$(um?Yg6IV>-lMJ|?5P$*(2?$!~9H(~3(
zb;-Y06}RYc>){3Wd1+K8seq&u!S3VI7Shyg8{#@umF5nbLqbHvmVbf<!$d~0x}`#}
zX(-<F+OhvxrG at O|F0d`{UG=Hjt*e&?Vg8z6OZD#H*rzE{xQUtESU at QswD~}76zAx^
z?GR#Fs?Ie*Z-=4b{c{5cTspte!M-5i*VyXbR3l@NUX4Dth!kw(gtmyDpgLMek*jAx
z1v#owSz~L^;MP%|W0?O0&<Yyg1C<W|-hy!DP|gKdE>QIR3#C5!4|dPrx&LW~a)uYt
zEc?S`@5o2r|IT`M`Q-l5t=HC6fn6;Sx&pH?9Oiis#fXp3Uc)>+!_~znc;&N#mu|12
zTru38@%k at T+<Hy%{XYSod}2?>K;+CDb1GFL%zK5*1dNLHk>d0=u-X$YCf~?=wU4oq
zgTkXd at rE4h?rJ`CO9N35+j2J&j9Nlkbbe0kCQqFT`*C$4S8;nEt<KQlU@fFV!F0{>
zulQb}I!0WQWF+F3$lKabkdjX-VWr at Mem9n*-p2MD(IKmY2P!!7#jBG#wrMPb#P0BN
z8}ODCb(W0j3i>FGMq`c5oN6#6v?ufVX<VFT5geglCRNg9(GL<(Koy1CpVdzlckBU+
z?_8o=_D+)hXJ@~Tb9-H8k6UZ6jRAk?V&U%8KDW^zFH#Y{(YnnVG~f_t#gt{AH>AoJ
zA8Wq$ei0?vPrs=6b$-6FT&$?|r6#?=PB=rJ5ePz=?%Nn)*F{td=p{ZbSol{RcKwvM
z$wAYMXijG>wd at 4x-#gf7tm*J1qvc8{lta(a7+ng+?9B>W=4|*Skr6T^;x5J5G)5dK
z*ywk_a^`T|1X at 1;O#-d2yQ02evMGAKM!kP|{@z+dj0BNfXg{^Zz8CuHjLU*Q{@wq3
z{rkW9- at P?&Klu;2jQ8tmO_SWgw1158xB at hK_hWRrC-n|4cN?5vJi=#Ry~4eFjLmw)
zKr`-q5qRnIgy-)9fBJ`n?cQ$KT5VH04C+)$Mco1W892I4xV=`~UIY88xT?VHD%V2Y
zX1Et_ZeIDtJ5YAMTzk;G+Xh9U at X+anVF`gf+K$MULPOB$NYiNA-SQgM?trbJ&e_yp
z4+S;NA8yg=>>0!VnIqlFiXtUmypl}?b`DEp;bbabcHpFBEXC}YZcdOOagQJC?AakJ
zw~H}HQ6Vqbb})<YE)<GF)a2``6{E7*2xwn4Qe|*(_M`YG?R^2Gs<g?nNKiPtvt;Wg
ztD7nN`y`b22S8=&6hWl}VUxC4EER`H7Iqt at vCe`z7*(liH{NR<FZZHUTv-j+GJoka
zWG{e4Fc%Fgbr-dEqd7{D6w!4C%+ljY+tef+el=DsXV+9Lc=VL~a1dD#jd<6gBEq5x
zLUxhO%Uqwb7fWgFn)Sw`Z&M_LlSyA at 29<nL#d{ff6GUL{6LBR*QNbJoqV9WxLt@5g
zWVXhVV4z?S3l*&BIY#<Z)G8Q-z;p`m2&~=*_7hOQ3<6<LM#U8>gfM-C{eF+lX7y?B
z?4?0BA_C%q-G0XJ{-6Kz`Y-<BfAv<qID4Cw-%{m`@CsOc9^2>N$2`qoUN<lJ8MEP-
z`wc#M{yFS-Pw?#N8D73O;oi#y<DeKv#b<vC_~<Wz?|x4(ZY)h~s(`qHkq1Uu+ju!&
zDQHh91L5dIurBs at FGNv=8kao$RD=X8ryir#zM#KZ!Qz+<$ck5~#-R at Wv^A-OInugF
z8?0HpdiHD&GPULq4?!$+Ed$mHxBag={jek*03XuvN@OqF4ezX1e@&qhRS$9K#$H6)
zL_Q7D);Rw1bnV{qsUz$K$tb3|!>j&%;(?hXKG3gKb?`p)4YLZ0+UVTEN5Yocebx)P
z;aen0HA-7Sp=uez+P&wg`or&`6YAK7aiyJG?FVzI>Q)pT`_I<JHd%;IIi`4)s*oWR
zy?(G|S5Q%~^Y{rG*)q!}iNlg1AUIuM$bdkS#J3W_!riIW^$<DaMsHx+1f0>JGW3q0
zeepCTTCXGqS%bBrP%<qjkO3_zmZ35W=GKAMBoh{hb&(dPO-f>lRY`*<SAt-$MJg7Z
zk=-lQt<ytnrg5EOzoV8)rG@?3n*oey8$4aX^x?G~7zHCX^lcE%O(!D)=m{|X99SMe
z at fYCz1fBl|7z0!al$B+Evex;EfQ^0{eK3bb=fNH%!i=X+pW=7_!T)gb@DKl|Uo5+`
zukGskt2*sB(S6k66tcdLIs;>*fTKdSVrDW|z!{kJ4leg6cz%9{XOExb?q?J)y=)!h
z=l?bV8^VX*Q%rlHtc^xF&4T@<pzau(4S`rN6655yU_Aq8lU?sSBQRCP)nuMD>|^Bs
zD>OwITBNH;qpJ?Vl0Tqk&Lpi64&J%4GZci}>s|qgu|7S7qzWwz6#*5t at bDmlH;g(I
zgVZRZga~3-b~#*a8$0`yFi^^DJ*46L`xYu<iY(4#(@4?}kOc6!7ttY$AS-Cy^h_)n
ztfH%PHT}JOFi^m9!Gz)d1FCojN?p$1l%oN`X>D1w4McQYyrdjiatxxf`zcY{8w8x<
z`<4nc*s7VBsdexq3KDj>C at e>V+-n-;uFUnnBkr+7=A^!4u5?K7+TzaHI_!t1vZo7Z
z%E`r2*_s!*MAum#joK**vg9SE&ThZWi`?11q|Kdg^Z*N&&}{lAsax0Ofk5F&ln;e=
z2z1d@#@p at n6{t>~UFQ_7P#Z6F3uJy=19jA~h at h$~@%({SRDcE$_6Aex+IL$(p{FS2
zL36I<O3>ZMpz<N)_@{w#3g|ZgyaUW{pxE<wjJp46)%qs@uKMKlDT8sWE3uK4neq71
zC*^m3<G+9X`M3Z6FO3)P{>qge{o<_SM)V3qZu><78t!5oPEqG8RAMk$Yfe=myul1c
ztutl}n71$CYP-QFXJ@$g_!6(a0=)DZ at Hf6h_`(Ok!*41+dfyV7j*fug2v~0fw_gG7
zy-YYhtvGs#u)iWa{GQ_7hrmR@Q6Y>)v7LeK)LRNeGh{LHwud2&{!mN2B6MGs8loXL
zB9qeTg`6B3$w$vvsBxjp59|+blWv<f7i2yvR06I*dniF-xV|XZEeL9WQ<_c09Fibf
zu&783yXp{zK`i9ZNPD2$j-r1JRzQn&(UK0wrg9{s{#n;03swcAhkTP4-U3Qq?%JRq
zQgY`~22n+2J4|apa!6W=bfZf04<N^ALm8|oKv%Ng5UhKyWDj*w#YBFnxbn3Ju$bz$
zsOJ}imrhFNRYZ!CfQMe(Vv0bTR$4|!#Dpc|JB2HEIp3e;$WHvOEoF&Nmvtpgs&uVk
zxQ-=rIyjaS!@{SdQB|8CUF=&WeQqxLNDD7XO_11m8lt!$6@-{BiayJ9O`A~s87t{~
zX)=DZMqp)dqgY&?O*^H*oQmR<SbHGa)Jp{eJp|DOX6+4^PBU=+Es#D3Zv6se0}y@>
zAc54M0m-ltm7h?px1!j8>N@)zb;r#3<dcub-}#OI@n^RWe)Hd5)AN7rysY2Q)o0e&
zj#wR^VjMS+z1;ycj1V3{m{3SjVL}*aHCIHo5p$XuS}G<TvESaqc6*FZo;<@VpH#g1
zs^FE+13&X6;HRG3NHwk*o1=p9s9;zfgN9RpPccu534+bbALHV;KEjhLvt1|yFciX6
zebJQ)1t}H=V$5bcka@$T01Z~;2e(lks=>FdGlHTN2E^Ar0dyvbx+<Z$GduQ891McM
zH-m;}v+_j1DE>WsYRKO3<if2&b<uSh<&3(N-Y1(VDD5HkgB+wyIMyC^@`b7&K+3*+
zV~2-g=}l<iDu!K?uavckk~CRPWU at _k_d+%)NwJ^Dc=*+mxVS+w(Itniv9zUK6!Tu3
zn&%HZCtyfE at ojl65Ecs~=PtYx1-RPJLd{jup&bf(q#Sg&Zl4VW#iEnYuzWv;n!Q2{
zSK;;3raDbqQR#s@!IDCpzwHmw7uxN;b7g7^(s?oGJF{q5m-)QVlr)EKtS6K#V-JN<
z)e3P!0-GUWKt at dD%|%}Z at B!B{noPRkbvM|N(V|0%!hQiznfg<%wGjs3*|gvRvsPEk
zn}M1=3l%GT;EtvKya<CmHkHmFpvnwB{Uyj+QSb-g`8$~ApP5iL9}|twuwX3W)7RNE
zD=sds at CX0<|MJ@O;s5jRZ|b9e<8u4x72Nr9IePhDMt%G)Hn06WbbSZdKkw`S8tfsU
zf<gQtw#4k#aVX8GQlNE*nF%v*u-gyVeYnTdN6+!}lNn$9B5>yw!O?NSX7fex at G@8`
z>i!aPw!^gl2vsgoX}~;R;^ZaZqI!IsJ0XsRFx6PhHMAF{7_F_u!y|FCYP+EV2dyDy
z;Y62C=2bI$*a-^YJ}KJnPNN5Muz<)qc?paX+3(v%$WhS?box4!Qn%o;?<NicV^G7T
z*<lu<jKLqs@>}#ztJmFnnWQb%Bo?<RXd^s!VtNraMnh;4IEvr`%E|n8;~5D$lc!A+
zl8E5w!Qv&oWN_f}nc~?CZQh%Nsa?CgES{B{4AHz0hffhnZ;Op(@7($z^@o~`sQL6D
zb-J}!p{Fe36DJL(Tv|=@SL<G>+cOY)(asP_Ub=UCgS;3`*XN&8cn+zPLUcox?G2{(
zSlVHP(wGkP02PW7*3s0L$9c- at qNEsjv`xu1mi<V9A<C#CHrY`>4BI&6jTB35^j0x<
zJQTGiLm?;_ED}>M!R0Zu_MjIPfkcBO0AIWh=pKCQUxW^C0>cBy{&Se+2t at R$^-CD~
za+dLpfBYNkr|<n=KXnHm{7bv({8ioDWxDh8Py*I>J_l&UcG{Vm5e15ZQc4REA)34I
zj59n$ClIfpP*j~ks at PY6WxzxOcJ&snJ~+pGIpZ at w08UQ@C!6;$uHMJMf<f$|!BBwX
zThKZ|_FJ6XA)M|M7c;Qin=ob^1ciXvnIqC@UE&>`yHR>aU(h{2xc2<fB7l^<l(dH}
zu-{5{bA<sLg@Kc`z>v}dBpObyzI^jPm(mY{a%lDyP)zudyZoOKi(PSXj?)r7LP$Z0
zzDF6IZ{sbY(-GBibYeTrN`HRrHH&sT&?pj`-5C90 at dCVbNbJQ;eeoCtqdImGCU(_n
zl0>?2m<;kx>??v#u0Bx|Z{hp5^~o!6^MbbU)SSs0i)vL+HO1{LaI0-^1WE+j^htp=
z7PkZ at XXnH+cCqBHNL6V;hYah28U65YE1>H1a2#;$*<e3zaD^XA&e{?>VBNeZrRxCq
zr$k_|2_(a4d58+Hqn_l|3O5yyx8B{)XUU!_i4LqPZTF&a2n1Zk#v&SGLC&@?AE`$y
z)>xV&vXp(<%mUKl_p@nGs*bLrX2b9?fN2NOJ=~bqG-OpV`p!h%7F#bq0`&KQatl0f
z0eJ?cBdFFjJmmIMhuK?KU+~>;|Ka+*Kl=M`-5oysk7#%P6;`kw|0IY8=>7?0672Uo
z2%lo00ds*RN)1CxgjXh%Ik+O#_5jtrq#M80E>OkR<@t=uTJY>*ZVMwh796cAHYb3N
z1R4mm9-ye0c2|&EFs>@@+yyp!!gdF2*TC(GakUprd&RDrMQv at ch<krKPnTRx81nrZ
z&XmC-fnuoC$@d~&@YOqeqhb=f^>O6ym7b3ofz3S_!l;}A0gE|^@}ci}qlhVVb{eX>
z2FzU}gJwy|3YV1KQSl%%6lk4#Yo_CF)y{(_$EjP_Mke4nr2pl#s1UvI!3{5U`S&Wc
zX&N$a+%RfCP)mY68r)HVQW&#HE2<%=qZS~qE#0bULZGE{2m`h%U`+6@<!}-?d?O01
zsK+2yCck$nu|=#X1Y=3vZ(TVGr8wTKnfI_*-X{K=AIhOQ=()h~!-N-`&Mq=jkL}X~
z?RzWep>!r)1gbQpbnxVBGyr{a5$@f5Gzy(+YH(Z at dM)1lpkyBUze}g@#DrC-PiVn-
zDsU1+p|(6u>jGoqh&qg!4q3pICp4L0r``C*2oUA=9MoAcRC|V_;ggonK%l*k+ZUez
z{1})4sr9%P`WXN#02iOi&YqcZwcX=e|KxwYKhzI at Z8cuJCG~1EtzLqZQ`G%4$Xqec
z6<U2X#Y=W^2XkB0x%$SR?1C$|h(E<1N*kvX5@;5~Ol1d|fngXSTCfLWQo(*EOfJ${
z`>0z6u?}!LhgN&D%K)s77{jsPmP^KWd&O=K?61r^dB0QaCt$xf8m8#7vtug$XlAB>
zHo9&UDRwMX0x#75FrXfEjo=m&h~{wV1s+cGD%MFt6gqn5ZR)C<_Jopu{v0e5_w^`*
zA$?D3)LA`Xf#~Aj59&rbkbJ2uVdGkw_f8f*hWLlrsjbWPa9 at HueLeObA_^u3i9nef
zN@D%0bX9A-reGL3Et3PP2}X&c!*T&N)J`YtygzPYI!zcd>-B8j<ucP-79|W$N+8X`
zpw50WKB;%BMVCeWz;EWT0}qvS4XbVc3oXtPW>*l`@!Da&xCVq}OMZPR%N`uVaoBS~
z^WsUuE%l#g@#PVsHcGV1>e!Vt&Tw%5xlSP)tVJYe2<cQ8gg|=^XDlKC>wy<P(n3CP
zdzI2`sY!uC0zom&kPwtB6dR~)0NJ*wFl;}@2pu8-JGC=|7*#5&%tTTLU07*;x~z@|
z0QlaY{{H&;_rLYVy<7FoQMT)?Dx};)trKLPF-tY?ka-WOTj1z6m>H#v&PJF#>dUI0
z{WkYlVXbzC61k6ybNTCpnFJ#SR1m5dm2!5!l*xT_2n5~j4fl6e4f&Fji}Buv0<1S~
z6+8j+q}WZseg~Xi0oyGw?|``~YPEZ?vP~b^J|K9)bkN0CUb^*#aEZ7-43&XWwH3W)
zy+DR#R*tUUAE?0=!6C=gU@#<C%tZ@NcBpZ&31|W^7Q2>k at BO?RXp;Pc;@+SMSF#4n
zXPG-%!NM&RV-dc=*3X%^iWfyk!?ca{U=a+{EKq+>XAUlUr>lws>Z8Pdz_Nq~GIKiH
zgJ^?8@}fP&#G-wzPHY{&jsNV0+(`*)=5#83;;T*Ywk-IiF}ONpTl{^Q8x*3 at YT_z!
zwLVL+DVI7!M>1o`cT9 at TWTNylO5`7?nsT%1A|M6YasGI(tLmcTwPwQ^QL+rs4xg6=
z?54UDSl(E`b4ZNd=qek9b5WDiDug5}cO5?CZVO#~GtPQ=&{1QXsVI1GTUfSvQ>8QH
z&@8--*CsRoSV3^rdHce)hl&Ougp89l9YGopt$@@M0M9%8t!^*=DJb>=#e0A9TlYzy
z|LQ>d`>2&FZ%}aznzoQS+sRf5(=>zY6?i>)2S~s?8OK){LKBpM0R`e8XGipj0n7xU
zV(bf<T);D9kUf^!3<V;By(rezig(;(BE8$>AS)Cr(j*KS6r0gLeq1fg`_>-V?af(p
zI|2Jk#<Md;Egp343>0-tG-#HEy%TTln-0}Dy)G7f&G#uHj~sL7VwA!NY#2b!jFCS1
zP)`S<G}iW;+q~cne|EbBFGeMLKXp4-|5?PRlcLmFGFejZ6dGfv^vqq#t*vsSXa+MV
za>OiOR7{<Cpn5cFrx#B at 6e2(*7KzpEA1s at IlekQL%RrbI4c5sWyiHr)NXK<nZOh{5
zMx$V~bTv24sV-)U?%8{hr5{eF5qgSQ)i7i8Wohd+yXsX)TcIgnkH@R7ZVhUsUgM@W
z)>0~x9ET{neTR5sK<NJVnj#OYzdt3IN=?<R4%5YMgj#w>Oc%i#K7 at SQ;Xt@{5WMK0
z>oy8YNUMO_ejs=C5h_z-QgbDDZT|X+`dKp@&RJJlz&hD(prWx5Z28O1O&Fk9AqkjU
z;SmN(P4?iN9tV|UKz>@u?KRuaT0T9U{o{`wtscMkM?W!A{R)$;Yps~&7_(MX*;$@z
z71X(6o`Kc=2{3#N;0{;|BD9l;Av%CrfI0#^0W#ZL=hewLt^;P)hQAJ6T1=qD;sGKR
za|H%1CYG4(^c0!f%~6xoyN%<;95dqqU<Y@HHQ{)#m^b$Iw>yDW;PDoilhi(JV*?Ww
zU-m^6oE_sYF#`7#xU~GTB6o5E+}=1AKEtO8gIX$*lOkz4yiAZ3OVJd3m-yNK&<Iei
zvO7D@aA;BY_h)g-1ONPL)KL}l<d5$s2Rv;`59mO>+YBq{=xAtx2SvDdvXJ&gvv3Mh
zISA8W>R=y7un74gGM38<5O<0aIb>qm83v0L at KDNDx02{abkx+)fMW2^nUeraTk2WJ
z^EFtTPDRx=v4*-R*ieW`FGVc^K&@S>%FrA5?|P#`HtwTY-MKZTm<MBp#dbfePJ;~#
z<<teKNV8vFynlXBshi%Br?utRaTBXYwP*MqDtw7v%=&4}o3y)-8<Mo<FnUWcT8PRz
zRn?2PCYMhT2rGwG84<EB?6F5$+w@9W{k~bX=P&f2<knQNxF)wUkw&SViz?l6`9u4;
z*bSII4L&);!|(m+=P%Db`1ekS>GLE?zyQ$!TKA~pg<9A|2QpyP3ry#K2HN~hH$dCA
zr4a`>$Hjy>n0%a`pj!N)BEy)Y)5PpouYkx%?o|krDmEU1?WGnfgu>o2<&JVd;~XQ&
z;tO%74vvIjO(-N73UGB7IRCI?;nHwKfAe8GS&b!_c8Z&JO?UH9;kc<;aeNHidl|TU
zhnsJ<Ou#(Z!8uR%wdd-GmLFcKih*tM+fBi!*^U!}kFMEby+1&O9D*?QR9>z!GsM4H
zu#O~^cdG{l;Od4_;w+e+?+QKGh_&v9UAZjHp^)9~cM&VN80ov|m at +lq_7aO_FR-1H
zUW#>vhQCWM{EfhAA1{=On!lb5Z3%U4goqu;5q}qp at Unov?ES9f{Cr*paWtD{>fI-+
z*=vU%O}vrKI-->?U3Ar&gFq4uu`^=SP4apLt#Q(OlLAisf3^M8oV?w`Z>VR~_e1Nj
zXAdS<6#AQ(KFg7)7yWLI=9WZ3f}p;XuSw7t*P(IviNW6M*F06U1J-iPpgRDk35Mh(
zRUBI3wtID45Cn#z2|DuzgqEvsh7eI@A}vPuG*2)+WH9|G7yC~hzITLr{uSlvXac-w
z5g=F4TC78ux6oQKjJJW^Gw6PRmgk_=DQK29Dof->Qh^quS61v at HCof6hoM@m at W&E}
zs{6v5|M@%vtH7rh3$xnp9wLWDd`zWc;;;hq)`^p!#dyDEWzuXB#mPpoUMqH&eIl%m
zCufTUbJa7vU76ekQW{1tj_=u1SOBdU*1+j0;pDcZWl=m8RUpbxDVX;Y=E|s5F;9v*
z0sGl7-&)}lRSMUj;2WsBQKm67F?opl1JOFxrioZa+cowD!W^x-m%gM9PkmWi7e$A-
z at tb@vfgUmF_6C&9;uN&-Kau1iLs%|OK|K^E(wIW*5QiiDy$YvEJLAI2HYO5#|75ZD
z at D5zqTrgW?A7OS+na+|@hs8P#lgS)7H3_avbz3~tnoa1J at O||!(Cm-ZjQJ9?aZxxc
zfZ-a2QWwk~QT6*VB!7pCSu8sC at PCY@r^dn?se7ibb)W at xR2SI#;lb1g5TE!sS!$-J
z%67Q;ofBCCL&{NzH&-RP{Mt+i8-(MKuA-X{5(6?<KLW?5`1UIYWh0JMC<fZN50UL%
zibG=p^ybi6Uhz(=DwEXp{_={CPm_9^^7Z=B&Zix&o<9b3&#Dtd;?1sLnJ~%@m!2g@
zS~2ewd$|X$?}2uYFqP9L=usw+h=*PKa*WtVt0)jok#km$Rd?>e&V?|8pnE~x1H)kE
zXM^@`h^WI5O+|<<Oky?_E3+x-h!s>6#XWX(w!$_#wtud`$VNrv<k%NNAmXe503ZNK
zL_t(a%QlMp9j@q3hmbyYRs(hc5ROL0(TPz8nG{@Xsmx<fZwlv?o`cE`mjQKVI{+$B
zC!kLDF;vCmX;Tzo%5Kk~K5vG4(I1(EMO!R0^+2NDyQKl9AXT-8P<;`tNmx~ysKz~a
z*p1=@n7xmx?!K61q=F8E#Vcg(E;Oy^2suooJ*KdE-*D6N#{m+<KzDu&n5#3ZB;Mbc
zCPEt{R#+xAu^bMTiO~osr%(~rYbIecRnupL^4FO!+Ct|Q$>H~4$%=G;6N+B%pv9++
z1(h?{VGCt0^#hqwe=D_XA`&#x1$cCw0v!LHdt#O1P)k9J1+S at -$)8b5nI>_V+o2dH
zafv0`q8p=RQc_ft3(o}I*C`-C^3m9|7t)p>><QKe%~Yd*E1-1ba!bQ&L##!G78WG^
zppJ8JJmT;Dy)SGpzxbWui~r7c9K;VeZn~l$Wh7^qryZ(HP|T=x at UCWSnT~3)UQp-A
z&yR7=ui_Sef}`EHQCGJibc${YK0tX&-YO%QhEC;jVta@%RE$JUL&DerTx<!uswiuF
z*jIxUerCnsOb2ZagX$N%wq<8~5Irn(H89Gcpz$tb642!{fPvLuzBsdZ9&X6eJt8o;
z$kn^b{*Y0_7l#N(5yHL-R%^nYmw?TRFt9X{48uA?f|zuk`~fI&Z<%aY9ikFX7ZkN6
zvk2J%u=iA@*%(Kn3aQkBvvUmHVFqa&0BzTi`2WGW39AM!ExOf2Uuq9-A at yXbSk_W|
zh^kB9Yx7x2*sbARW+}{(L=;d7_h9*eD8kS!mflV<H7uYPp<MiWvGc{SbX6(~Fu6)A
zMs_4IW)pGM?ibXAXp{nNT5P1*XuDCAt2KRz@AO0o-gdkn5(!GnaF!+Pq03HRmXuA7
zuyI6sSqRJ)RQCpJQe5j~^CPL_ZY&yJ9vI8lM~OOmz{P|vD4&ubuV^5csZG7AwX3&-
z>88C2LF54^B{2+1?zG6}3$<JdGYx>OA$11vs=;0hXo?hqjWsC>44i4xzN>LIDft20
zo+(=0UvIztYwPd+o!#Ztd%rz@<yUr_qqXlP`9~kK-<+J<@&YqtE}->*5nJ0b>kJmf
zSZ5zqw;&;0mM`I?ejBU(Lu^;Kt at DpiW4B3W9b8sFTDXAP=31rNvK7Ec)x4~M6gCZ9
zUINdyHllC$z^x--vr(+pHs5kAQ6d|aq(K=*6tRSGCdD{1N)eRxU6k=Yw!1%v3u(<}
zH?l!}dtWI0QM^bMfZTH@@L8}GDhXWFT?MB-;q)_vdw11vz<^oU*+M?P7HE^VGcN-}
zc=WMwT(UD-@s4v<Jb+vLFqmxzAd|foot?{H?e7HxCsMDv0&=-fqb5o3OG?wFg!pCv
z%j^fLD;c$00uR9u5w~EV1Pvm*WV#K*?D*%<d?Lc(#32DyRAw`*6<utRTclzby`fWQ
z5rQY_MsR>lS`G7_$rPxXvT!MR at hC&MQ~#`kR5x*RwiER|4v{Z at xm$&|RHf#8x(w%*
zw46UYqz~l5HhD0m at b|v9)P<g+t5Q`$W!w{Z8tqn>3gK=u-2n-a#11<UmtE)k<3<gD
z{am#NJZG(e5C%4Stz?~uLoUI(iy@KSyiOa5q4ba?FVf)B>QL315{Url1i=ZEZh`rH
z5hA1HfMC(Y#<Av9bPWcrf%CVh*0+y8`aA#0<^J7oTz%y~eSCE1p4vh7qh0WaTc at vK
z7Uv(&Thz@F#!<1B9h3!gtx#4}nK9CYd3ug3eHG97K1LKUW?xRl)v4VRrP>cKyz)1A
zY8>^Te+8~s$QHDuhFx!`0(~ObUIOR06enxK$uV$rq*$+kvA9Seyi*3Z2IlVDUP=KE
z6~lOfVe<y2^FN2|cg?Sa3NR8k{x{Tk*{YW0qy;{bnnQL?cDW@jm1eehyD|WueN}OM
zoJL=tSSWQwm6JD(7eFqQmZ>THTw}EDtO`mV%Njx?(UzYpVeBQ;g1f8Ofk2fY)fV4U
zyFG3|D6D2Tq2vKA9(gDb3`7u_-SyI`ab9HE3tvsbFQbRj!Wb?1-s~o4)Zz?HSj4I*
z;RC~B-Evpk*nba5%2my|xs<x>M<wklSb@ECUJ<!3kj(b}trK2t>S*yDP46O!doinF
zEaoJCEs9~*ZpwA-!Kdcn7$5{Sv#*4;!{D*z<C6{ss=ZO at Up^~Q?f#k5GMD_`Epbo!
z_LK4s$Df@hddiRvrH(y5?s!>K0lR-sL4oRg*iU!MibaqLE&2HFipda&N{_{LHbK!~
zv~|vDCu&xQkL at OiX2e*6>X{efmLVG`zYM1Hwi6;3#gH?xd;moR$eG}B58`<vMc<-H
z{_gRU|Mu_g{^G;`<NQni<)5Cs@}(WCw1R&#JLiXs=?|x`etuWWt at kIKzrnKI%vEu;
zD%k9<FqZ)<nK7$?QBiS$f%hm^7r3e~qmHj)5LxIc;<+1L(hOap)ID_YS&VFHIiN4j
zOt4g~n7{-uyP2?`O#ypx1)Ogbw~h$M$Ase}#byJnSHNZjhS6_)$B&BwJP5`Wq3{4+
zeHr_!?*RLA=xnT%=xVqmKNOD{v?6a9baY%1<=1?@-8&}6!8!x4-UB}KIW&KHX6pL|
z1oI#TKk&_TwXCBGYi3FhI4x+B-u*DT1isNUyPtxjum?pr2?|uW!9R6&d|SkeyzLZr
zd%||d(7B7Npaqo#qxP<=agsgUgEKeU8CdbYOYJnpz_7_XM at d~@xQkk$v!IXaX<2B(
z8A_JV2lrwu^OTaWmpIhav2v~s=P3b`-2;JrYunkNGm^ZZw at 5(0$TM|pTXT`8{&WNj
zr7MkldK$acGc?&Nq&<ta;fGq6E=h at MO7CUjZO|;$lh@SQT1a$F;-$*>uuEsp$VC%w
zQOkoyX30>!X3D0TioAF2aec(E7n*CO^gR-Bi=|XjNJ;#CE+C9BX<_JNDr6?7h;kw&
zm>@%F_GwH}`87b_v*fHO#l_RTl$uTh)e^A`qPxO&_45E<ZC1PA`~^&Oe{=S~{p<A3
z<Nxe@`mcZc*6Tliz2Gk>Xg}QLZTZ^Q|KrPdzVVMA(*FCuyyEF@)rp2-0LwX~&JeAr
z5X`bgQLz)U0Q2?&N-GTG9jHvHpiy%CBS3d88A(}ufmon*LYem%3SlH*wFXX(tdgFc
z6V4}X#c7&>X(nuE#eQ$9*l9=D?+J6j6-w=99|po|qZmg5AAK1zJw at F;!n6gZSuyW`
z{hn}n3G8-2tpq6)%5GQBk~=o~B2Wo3#0^P}MPf02j4FyZ-(<Y<s at -7hzA{vn%5 at HG
zl&-r|5;bJnA3Wo_2UU`(vqC6gl@V&vzE1I+RgSD(6L^&Zl)){bM_^nLR+}RXE5>RK
ztdAI*HL$uhV13Luy7dw^cfX9)Y7dev>SSGioK~dN*cHuVo?JcZoxXY>9dV4}3j+$C
zzf)b4;lh%K?w&0K6M2=e#7+2vL<qGk*)6J+m`vo5modF$?jAnFXckYys2B%=vMYMI
zTT~Ebzk|*if at AO$xunDkVP5W@ho%EE2FZ{-jtpd>X7HwmRtwPpa8K<x%(9_mn|hdR
zg(k%6OI+*ZshKA?Pn{e;NC$ord=MU<**Jam)En9O`jq}1%aD3vUIey?1D^5T#r=_p
zcp!}ZrdL351i>wk&K=-VH7y1RO4WZC5X}&5Fwg}G?;LjX{h7p&Ldk`evD23!<4=Rj
zggX2z3LTY!{_?g6y*|pjZ}P=A-nrCY_;7XSekF&egT_gRGU6XrvH#Ei?tf9={j+aw
zo<IE7zqMKOE5m$67#KqtLG==%f+{m0Tcmpi0!Gn2Fude`*y8rI(l<d+&xnnMi}Zyc
z1X{Nk2E**uD_AO(D$dRdF6P0)P}IQjS{T9`OjE_Y2lhL{ZtKN=PuT4hQw6jVhEcIz
z5qNb1)GcK97`h|Odt<ijC-cqO?o6E<_6eGv%$D|pVC5LiGr~7~(E$)J3E|Ey#T!4V
zINEfk33&i4 at xgn|2L;|~!5malMPmYG8+W2*qgc=tnVg*+7fQ1vn4;xq4k&aOp=INt
z=?oeR7#r{a@X;55+dqqOeFp^(joP+%TM5UYo55KsutgjK3NcG8&e0u0!wK`Ssu5E0
z22v}VY>|~xYFDUmskv~Hx0aMV<J)dw2If652|JsUF^*!zeq~S`$JixC=Us>dQbJOL
zBo{zU3MWb8IC4Bsuv8>T+vIq+zpzTCCKe02>f(?`heoa?nB64S;=>wEDIFjg*!XL2
z{yjc95_|ln-`AO=AOFvBP=O<_rR5(tW4&ZnCzSHQT)0)!RNH<&O-7<hu3TlP1W-Ss
z;x<@k3wrSf#<k7>7f50IIEkAEZZMXIeJUOt(g`MzSYlmO#iTC*>o>3}Gb)d$cojpr
z1HzvVBK+DQ at 4d;F-+1Rz{?>=%=@)Bw2DO6!BY@>|DZuA{@)x(;>DK#K`>P!aW4<~=
zWmsM;?=aFO#(_|{8jTT(VHj~-W(>QBARRCe8>Z$<wvtA>Do)LGMvIU*`=uE5P<m9E
z)CfRWI~4@LXtMJv1L|zW{c5i`zXBeg0UtjBK7Ir|`iSu8W5v~T;Oa~<U0h(gIK#XJ
z>Mj<SJw=M0)l&w0cm{MA%t){yB4gZy9VNK!3E*@-Qo;S#3AawDCqOyFCda!eEl0US
zNJbMs9=;p6!5*hsFNaTf6oTkPNpF&{XHLF9g$!d}=^2Q2U_OS@OORm$U;~V&z-A4)
z^+l|XZ{hevu^PL7JA-bJ%{wo-MxhUzgA|G=)UI7bxw4eTyC&&uooFOj6f_^OjY1gY
z3?`M*4!sVOT6dQNI0C=dYM(1Up#%dezenK^*(`yh+DF1vRfy{$M07zPv;{JEZxuNR
zXVEV9sxbO*GyL+UclFMaX1BgZw?WWY#)fmI_K9La*?fWZv52v`Vi788e-7*Gpun<{
z!FpoiF=-0vK3lLC>e+kQW~dhTHi!C|8l)Jzvv5zHlVt_DsG;Qn=<@X|84JM}Omlk;
zj2X(aFYW!R(gdb0MqHrq9*l~D9h6Qm>Fd7m_Up$49RT5C^-8?K!wi-)(EdZa#=OI2
z`8mk=Z-U3V5iM_x^Y6XA`QTT+dh!16tc3?RC)9;G;SaU5|N7Uzj`hi%%fI;M|NC&d
zc=wl&)^e9*Cea<n%?4Dj+W03ew-S)yGuX=-tN9@&9Z<`W<6Mm57vH?9XE2FV*A%2;
zsZSs%T|rebGGV>4?jAxo-x6lsfM{-9VB?NYjuTQFS4Dw&W=z$BOJpLHVhdG`C5ysn
z9|F{>klEm$-QFH>3qOgDftnyAPIz$-aaJ^ZFczb=Do$?^zVIfnIqncnC`%FInb^jW
zG!-!py88v!**$f%!9OW~i#mj$d1TL?D_E+D+czsqK-Gj#w!l&-cznhF?r;J<`T}&g
zWf_qd4}j?zst|TNMarmNFf5>U&@1<_lIS2?x|ajE+LB)3cZx$!DaVzgh3Bqp<OmMd
z<#mgkQ=*J_`?k#sXmtpuR->+hfb{?q+^q=1iki~9TMsV at hswS1<}{})FlM5Jzi@j&
zl<fe}x$KdCrl58Wq;=n(x779}#>PTw1R7Lwz?r}4pST}_MtVr5{HuJ8_-2E{|C)3h
zhjs}_?w4UdP!I}d>U$6BW_B66lKef}z3iR6ibH2B2yOwiMbXJm(w$FfGoUjDX9RI`
zE*A*jL80eh-ZvP>LT9D#Yyj-_6a(J}^E2r9GKlTKFzo*bh29yo@@s|Of0MU=_Rd!R
z=7;6<^~#}a_z~#r%h$g4HQc&=TAw~SqwoFs?|pSFPw%f+Wnj4g@qlr3J5T`#1DF&8
z1JhJ-ez8Nv1}F3}ARAOV26)$PY7t_Fcx%{2QATkholS8H#(J$-k9OOgUjahLjUnSQ
zD74_q);ep8&uh3fESGjQC<cG(hZyE2LWObC=W4}XD_hu!c5m_U8fi{blKo>GOZ2>6
zt%`e}A-r_Y9_kh*p1JI93EVmEk(0 at t>Uj8|Q7mV<vq8kDXRTA<1DUp_0z@~-+0!Y2
zrC$x0pyef?yadn)jQ7CDuR^(?h=MP^1KB@^2w~b8?j4Vupm&a(c#5i#rb^AvL;~a1
z{vdOHj>AVT*%7q&x_O~s!Q%!k$7GEII>8Io86^SZ%rhHiPXPOpe;fcF(2}x3fy<Qn
z^<nuDIP^gPcZN=UN#B%K0Toi`%2V?D2{%WL{YO#@i*~DleERf&oqnyddX#jLAh5U}
zVyVkaFE|wFIxghbKKyNJacb)en%87h*#b!Tz}KHs!@$x7a)TTsA_nVJ!+F)ZG?Vd-
z5S(BT!BDPHXtKhOD-cbldNx{|2`<?WQ5ubgNl&dQZRUVzlZ_~_!)<W+EQlsxyo-S*
zQ}<#*<=4S7pp*xLR(frq@4ZQv58k=rpZjoi`*YR7)*pJ<NqPJ2w?RZWx%b+|cmDWW
z53Zg*cynBDKeriIgU%PA6=S_Bz*IqObSP6n&KO9rzf#QDV2vl1uZp$d^o_)8l&5G(
zg1>KX_XMH>E{gS_I2x^ZUhD{yth^g6jqWuh*kcIxP2=c$r&oZJ6>QNs5{7|M+-R+a
z`yZ^c--lm~i>3y0+FXf+D1nQsa&yP*P>WQBR$y}itX2SKMcpf=iJ&w4SRM=*N>O(K
zLofImsYCC^O60++W)G%|ZY+*F!hs<bbqZaEk;s>O`GCpYAeFlS9YJ{oI({9xzGI#0
zJOSGW!1UZ~sCR(QCRz$*Zq8<GNmnGj0I^L+g}G57m1%MQu;c2BgEG_g(jnE<z>dpS
z at 1~>6<$SKivP}pw0s9KbOsJDF##U>_I9M3kFktbyaX3fPr6wGj4z6=MnDyF<!M~oH
zk0o1<xc-B7`-0rSO8QyY_ayP}u{u)5HT(L!2<<S>a`769Pd!K?)B~y1VXv^Tc*tSv
zxcO{of-u}LLgYa~*_$A at FVXIN8iy%^P>3Kp*uF+0dtrr2w^8T}q)#Ba1?dhdmmpk$
zu?Mqa<RhOD*%!kVz#5=qFn!W4d>Emzu)|w-0RAjc25>nA=@keSq%(+SXt at s}LBR)u
z%y_Nvci*JTAG~u_e&NH_tyjF@|8P6}^6PJZ9ioccw@>R%hKCRS={MiU{K+qm<8*f%
zL6|4-YK7HUFsS*z7qTvBRSd_U_7yuRD0+rL2{YEV*mCrerMBf6w_8b3bZ?I-Gmh64
zD~}o4Zh@KB>2HdSU`g5^@Ps-&rT9X$KyiBw9BoV?TZUexIl8B+m;%O;9&oB`%RXjx
z#cLcShVQdmDfiCReeoS0*lw*5&RbyGE2f#CGhsKGH-A;@CTHnRG1 at wGbT&}<b-3+v
zW4|=RrAXN6Pi|NcXjv|C7c|X?@uR-&6Ylg<DyP738#LYlPCg4N8=&r>(-w630J1$t
z6-M1E=82msI#@M+G(kAU1u`wVx2(;i#FUJVci{XJb|w-bZ6XiSov3qupv~8u7YoUN
zAE&CQ&cK?hebz82hS55F9*wosJL7~25nJAAtYKw&Acgw3y-Z26|2(k~dtukUY>xc|
zvD1L<nhu#&gVL5V0p~DLJABv`=}a9~3ZM7JW%o)gi~EC-4cFqp={`m2FyM?o9m=Z?
zb^<*m^F|v1IgCII-=bKmFEWM`$p-9S&vQZf$hv#I4c4cCoS|^FXNLn)s{k%R*n@bL
zqvXu4g^mFngXw8kSyM2&6tf(I%3bL2Du^lyU4c|FV1}?suN7Yg4|@<j9CVh~2Kvi4
z_3ZIG`}N=caCLmQ{(tPfORQ$sbtd+$wf8ya|L>z-q$n0ult_`5TMtX}qm6cVTb(xA
z-9Uf at nIs61Q3FZP1C5kHhAm~7K at cR!Aju#-NPs+M>7dg<+CfX8EIM}Evh}bfu}G0p
zv5G9#``-Ki|2b#xmBCtT?|uGz*_K<D+EzlKP{pcy|NB4AS$nN-eUJ7{^P>OLbju9?
z at QeS@E<(c7*I%69e(MKx@9j5!jqvEkutMxu?~>4G#E#LM2^KRU214wCAqa9#*d+$Z
z))cbQ!X{E#!cp5ETUfT_89>6pAXo)0pl2gtlCEI|uu3f`7vFPlJ$&3}*8Z!D%E3Pv
z^gtSVW&8MkHH%{O^9)R;HcjMNuT(@(Y at H~(BVMa6E#01`YK;P5BJ4K6ZUbz#gz-#^
z|7N4~&S?wmHiBtVEB|rU-9gT3{FX(*0aeDD<lk~RiwhzzvDuc<<(@s%v}JS=g|5N7
z+FVyKA=5Q*I0jZv0mC(Yp!p1R`UYh4I<U(~NtsW1G;g2A%uFoGkW*uT)le!+w`ohi
z*&!Y8ys7f9i^qS{vDWUnb%m_si$Z1Qx7i{PxiWGv>1RLB>N^AoVn^B-^gtK&n&U#h
z^$uQ*ZL(ASieCyXnK})1w at f^I9vV at PoGOOO&hMt`rdne1sHQ1d>VlSjTJqS>3Awl=
z6PKxOzqYmquQb2&9-PzeLN2QC3&&1+pH4nE at 0YJ{h>GAURMfP*ow<b?bIa1P++|57
zl3F42fPgblJk!R{nQ&x=uEY@Rz&NqVJsO)WfGLCM0KjE{PCzt4>gj@<22eOgjvqi5
zc8D~BDXXuJ^XX**=y@<b1mR(nIX&COn=hr4lRuf(zj~)%9p%DJZEUN5>M%}D3B%Ci
z_}P!1zWLpoZ*CvleOYjNebsa9f?jE{17fEL85>v_h!FzNM?#ORH&GJxsURRq1s=(~
zP1p?Jm6DkeBw;-WhECtxaRTPtn|!(GauJZgPzzoT6^x8UO0C6yJ!rA-2aCvMJrtbZ
zoD;A!!?9!%c9>$6Z5hnwTo_2ZdG?dOs;Et+YSs$2sGBljnl&YB8iDPGuszeFpEk<v
z-)@2N3>deBaZ8wX7O6N1=0r$|Fq#l%OqHr8!rE!(w##kry#~Rj1w4<1je5iHuV#m9
zQ1<~yJO-_w0d<E!8bO=4At(P2Xqr`zFk0f*NN!V8SVrXbz@B`??TAkcYN(JWJyksb
zOaw!Fg^{T3B-#968WEZs*Pu>b<t8$rlo;Cti7 at U|S*$D?Qu=QXHQno|UR%xblh}n^
z)a*;nvz@ZBWGW7C6F^%*Z7Eq?S%nr5l?RT1so7;1Y(t)%dY*Q*z`>c3n^Y^m4W+SE
zpyr?~%hkQ};yjCI3H{I>=Cgl*v;$e at _JCV<xQq+(DNy$m+;HFZ;iAz=dkD4`l5`B>
z5gnbXdYeeG`tn{kuprKqKpqctDrN-(8EX)p22ro at 4$ibeoO{gSWl(>Fo=#mAVb58o
zh$<w!0pZ)o`7~0Vp6=*-hw}-3H(mPWN1<DRFvCNzf2zg)i(mX=ee<*6%C&3h;Od9(
zy!P#H-yBaLy_9iwedsC1pdcDYLf2VL91#KwIBG`}1JJP`<`HS$03ry%6H@I5lBOvI
z@>y^KW5PjCSatfs$B{5g2clRNb<F5;v*-|Aeg&9P)fO&Y01kV?YDHLggf1$z(h-GZ
zq6wJ^V-uel&`>U!wG(h9te7ClxyMS<Rg#YYlK>q%d!~-%ZM@<%0%tqx@;6%iHygtC
zR4|?~wr7Ir6xf~V0&zSeY<GldCZrLVrW)C(UN>fkAT7JQ(bVoKZYm>(_WqtByaM<t
zK*zx98hCXXi5VC-kSAXUb`QX#*$T`mYD+d16>?3JZ|m4Lq^u~)Xj}>?tAQQub%`0Y
zu*`S7x^%IS#YtAW>vj|93qvzd5l{)jo|2i!&06pwgxCv0Bn%x8dO~7Zbg)urc at AaN
zy~3i{nl*C4+Zl^M`O?jDTfjBgoEE8IQWV{su~;;F_uq<;{PXn;- at xXTPY!TVVKF;2
z;^}NISN5rZn$CMs&<pOr=XWoA8`iRW*@Jl+$Y#OVk at HL^Y4#S<EU2WhS4MG<Rj4K~
z02%-!#Biz;zrn^-?r-%%3S<lb?7-N9xYu`y^$pjsoMV8lKsbVNrlCXpG4ydnq@7x_
zLqM3zL88>p39|$co<)d11m~$I*$xqJ{O<P2@HSujl{pX>@<lF+lb^gJe)!@SzgS=j
zm!E&&xf`<#m+!pwz3<+fP9MDl*<B9<Vjp!J&H?B<wLA#6EbW69)jk5TC-ec3X@itD
zdXa=4o!J>@!)+Ne0y0Q4*1fTDvKF>ojy9^Ac*jFdEcwTKAu%46`-ycCSVisZhaTuU
zeSVBODofIzF{j!|u){ZjKtT!>F0esKp{&J>@~PwJG#kT&n?U=97AU4j$<DOMiWg5w
zCz#zt*p0w$L)dKXAUFedrwRq_Hlpy*DKKtr>e&&dNe{&|S>ZA|VVa at A@1noAUIu1g
zVsh}HQH(OE6g)fy373G?HAp;0$O75C1v>pEXv|1E<%!QDup0?!l*TK)c4f&bv^U2=
z>eA1R(+D0qXF=d-a9y9AOFj2oV_JxD7H5{t>Renpxe1xEoLl0;!jcJ?5 at DY8+6plu
zcG|R1$B04BA2>u+FvKbxlSN0r<iO|Ro70eIe8_Edht!C!T4@;@Ezz@qbr`n21W~p2
zZhLMajkRym&)Ub{@5m+BX;m)h%BeNT$+CnHT}4i`PxZ3H5oJRiY$ucL1fd4Li1s*(
zkdtPDrYgrP&o3Bli#?140A$uFDITEXCq~ysp>4Ba$&sqVt9~vMh&BKZ2tJ;ZEp90T
zd<8_85IPMx39JfSRsN=OjoR#p%!J5-EC*n@2I}4<NpcDN=*2F*b#uFU>UO;PnN&oF
z#>)F?bot?nU;N?)i-L?BAN~1RhNtiR;I;4F+-x>4VcuL1Jz~e|lfk0?>|F$6!MtH3
zv5Ieo4(K4r^A4D1<=2x6X`*sfRG>sN4x*`ELD-JYhBPYx03ZNKL_t)*EPY|6Fq>br
z3r08^-(DJwovk<n>j7BzK)(VGVgLm*mU1tW3D_kY-KbKbUAgJY8OQpZis!eGibAxr
zowIiLG1Q7jjT%>*C-*8=<=@;CxNON>DXaKwI}@hK6u~>fZmZq?ZVPNrwdik7fbE(7
z+HDBq7T9eG<IdEfqaFtH<Xx;fJmz*PkPJxz%1ITd;S$h410J3NC_>T}boxzTdml3C
zN0nyn=%-OICyh8<EZd}LwW?1GRSY|z+UWw7k%BhTvCvdeXeP{-AVxMObCWM!PMc88
zz!uIx-o)fWz09)~`(&iBt`mf)_8Kt?VyM13O&DJ3zo>xr4e!2PHaCIsB(CJ7bM_cM
z75S2UaWL4|XQn2vSQ at 8GIyb4gx#K>QG7%8LCWfNYWoK at fL#RuivJ}mABJ%*2mIHa-
z>9Q&QjX2sT2x`-@><_s)%vv%5?*Mc_i@zNqZC-&iaFAXfZmb809HI-47CutKzQ|U<
zrM<UR<(xn?0v>8Y>dfnYJ49;`A1N>2!sCg(8q8o)>t^ltEq|G2os?w&#UDnD{495O
zUk;mFH#hS~ZqwD5Qz)s<_^H4-rPvosR_22JKKGHIpLzYvogcpT+RfdQlb2-LTn`a3
z4mK8LHT;OZ!W@y6O%Z~2*RfMdV&4%M6EJQu=gFveL2+>;FlHR|z^c~|ecS=N6bokW
z++mgs$}@-tJ9&M1>v*1^W8kO<);(c009|j^nx0LWwW}8DEHbVtO4;!Osuu*qY>u5q
zYHX35l_uC0d%xJp{7qCCMF>qq)J#Cg7NilHC^T0U+G8g%#>h;_LKv-JPov`H<EWkf
zZbR5^1e;Sk08R+IjbM9blfjNKZW)tVOiW|IGzn&(3KBum3`ztJmjFK0E@}H7aQY2k
z)PKuaCx<a9W}l`S3PR`hbyQd$(xg?j+hi_!d=EdV%%`SR-CIDKVHQ(E@>GaVZ?+ce
zuPJ3Eu-o)CQ_^Y3EuBJCif-%#v9qPT9XzcAb>X9ndMTmd!c&=4>W+b$gN^q#n_fHp
zZu20L!eH`)CJBPO{WFRsxWCTi30Ap6PRmT>YJuFap)JF9UsUBubF}oq5uI#{S~}O|
zbo+N`Aej~)-#>vU*9A6Vk7RWLl;a0v at O#S?dci&eCsZ&c0GAQMsp08l at sh4G*M at XY
z$Zprm45Eb0E3=`tf^F`rVt5m?X at nY<0QtWOK$4rK!wivY2%Ld%H)5n`xxf1|oxFQ<
z44=K-9e*&jchFC|-j`zEVrgY*LKz==@vqFor4QZt;rHLTdG_e>OKBdj3v!GDq3_H)
zK5DV=I$LZSRk82fnUc^M_dSRL*eT6m%pjf+AXs;VRS&FKyVC6_r2rSki1YJhGM^f|
zDXHF!e$X5oFos at Dzu5fPy^zis8WQ5Ru7%pC-Dl)#zs#h`TPT*XY!ZH@@{O}u78@>D
z6nYs*(Yq9`n0DhlnOe at c6$`h(g$I*UU4$l4j6NBIXHJ%%I(f1cVH^eHMk%1XEo0m;
z#?y at P4A`78c4va=lrU~Y7sXq`v?JtkgFL<s+Pn at r{S(mk4W(VqmZh3??~rFg8cBWK
zT|SY~U;&M9eG`<zB at 2Mx|DrCfAerz^nnFPJ|7E#sc2%`l7t2MVshBuBMHURqs)Lwk
z0Fx<GBhYs?nRYOpMdh?(&*R4Ke-qyE!f7V+5@wQyi!OGZu{m%ClyEaEz)R(*Lq>wC
zoTBVza;D9crKn2amcCT>A4%w3=M1z_mgc-E%|zpdX7(aNV?)u#0=F!gVqGlDmb at 5#
zHu?i;ma;xMBUVNvS62!MSMMlcQgnc&O!5x5G6_Z;Bk~S`Qd#0lu=j^swp0}*>cm9a
z-Gf14RY?b|3s_HM(<O|Ul3ogXszfxG6tmg1HG(Y9An+MLkCc+xzw>f>{NQFf{I%QN
z>NvFwou6cfzbN+S3qFC6@$5%lny=mX^qqI!e&^<cyZ3I);{?gmAw|T{i$YsOD!h!&
ze9>-~?I0KoT3HX)K~Vyw1e*0jJ6;3F2Za7m- at Iwem`8_hGD638(yHe?TkFKu1q4=(
zLI|SE-d<fDyVxvx3^vJ7)oklc6N*%uK*3n>C8VM?ZF2mTFehNj>S+?};*18e3fD^R
zcB$N8(*=^SE|D5BRq5)ucKdpHDH|tI9nU3e25J&N#B5P#mc8?=nu2*&_+{J?#;stt
z1xBNarZd94BT&kqGyyvS(xkp1&RR(XNdfbuOIldB at 02+b4QKZQ$}M#lDoMv|5f+pS
zhi#l~L9G7$OiM>b_a_&#2(AlFn<89+$+c6>QjNF(fy|6F3+Bu^;fa_VsL?O&SH)r%
zOu-@;Ltz6+)5%iVi}-;Z8oB?15XH;Rb#dTHU8agdipIu)LpzpD?6|a``tE>RDrLjs
zk>vzZ7SPg))2VUcv?<K(p$SV#t5h-L0<~w-NwHb5l6xK*+*&afdmjQ7@m!s%^~MVR
z{JAv^Y^*>6Y?lWl84#!kh0_a_<VAqVbx-MvS`FCQ>8Zo4napme=7(;h*e at cwvKJwU
z<hr~iQ~4qS`3k7N4U#be+h@CY`}y<`UrpEk>irmpQs at _Ox}3lE{#=WF%eV3{0f^w~
z4_=?2|K#7ebGDUN?!5KptGlz^3n|Uli6wTucGTYeh6r at M7X1jNKXwraofiGo3RtZI
zhLxZTgmn*GIwl+*3Hp^Xd^CHOK$4MW4;QvBEmu_~+ad-gsOrce9Km`Z3{k0l*;KG|
zCgfD at ha1tVvWueICi)&gO6TKkjwGd6CQ(SmLax-p*4ZEhr>xhU-*mOWnKLM#w>(f^
z@{0eL=V{riE;e$3i(iyEH%*i at j*q4UOg1^B6isBLSUeJn9rAtvcJ{)a1!EFr;!KUl
zI%*yO!-|9Fzj{*|tlQ?LV%8xRYU~DSPd`vi&l+1_s-3SpoB6(Fa)`tpC^$SODx#Yv
zUu-L#k^-UgMx|pd_+Hnn*k&x5HMEFbsv<Yu`!}(PQ;ag|s at cj}zW at Yl_7P6~Ty*5c
zV2;Yy`9u-GCEu0X1FJEHTR5ohQAdR<|Gk=1SU@;fV;(cr<*8`aa1~-%AP!gEhaUh!
z&9u<|V5+HYPKa=_gcNAWmDq-~Hs8a()nHU{ReYoe2<tS!HY#vAK$Q(cRlrg^eh7#L
zyB4Le0;MhR1u7GOrm90Iu0L#_lje6rdXQWK;@hAJG4m<9^v<i}*_B&-?H6aw;oh@U
zp#9Z%{;^8_g~h&%tD>Rdo{f2UbUeTG*}r-J=&2WP-FfTQ%?EeiyOBmhO7kHi#Te^F
z5(6Wyw7^Gmn2gpn^*u23f`gSVQ;&}cN5^^y1oK_zj<8xO_kP`}#||a|CKc at v7$GXh
zpNSC6%qs at Qsuvs#gl@3qTd?>z_cv#Y2MkhhUv>yN8xzOvSWAj!#XZG4=mcyh^<4>p
zl(Om3ZPIwopmi#2EdaFpl_vU)_Hl2jJ56V>1iO%=Eq at sc8wBq#i<JUb_Dr_zSm{Zv
z#q4`M>_QNPz{QT%sdPE%M3ZO5MN-4gXvrbjLd6{ucDspkKw0>QfUN-Rv2xIK)VYB~
zq$w5-n^~C+O&1v&XwOSk$)YgklFR~`^}trl-trG3z_H=$xB3NXP3|f^kqk>Gu!XTp
zVWU*#rz|{xJkn5Tc{tD>RN^qDoMX*e<58%kb|_hz7dK0Duj0&dVXZjttlEgZnu4F3
z>wy~WjIcC^a%C8ywJ~Ad3zw;IANv8vT*BNv9#WfoGALI6jK(S>6 at wrz))`4YfEXTw
zLMk~BR1S;kEtN_ARb0p?J{D4jP_%+Sm(@JC2G&Fi`m5WS*M&wa7*HaL;HuuY-MgS2
z9b*0Hg>ZK3<}SZ@J6?IAn5JE{uobgR`ElC&i#z+4gKZIVe&-Pg*I)S9eB%>;>(1jR
z+gING!JDt1oo!zj$9!D`F?5VLNbU3kq3a2;gL3W(MS0uzgo8DsUkkbc2vILcVzpxE
zd%|i3^ee)8(1j}nvN2mNZ`G%U5JZ)-Api#*uwLuFAO>BqYImS6d96f{$j!x?1z|Du
zsy^)ObV}0<<g9Z0-2@BOs8mD8=&7+)AS~%+?LA9UO_#`Ka4zw8)D(%@^(vQLcMN*K
zHncpTEb)q`cI#D+3J-Z9i7e>Xr1Ua_-q?QWA?dH%oI=|+G}q@#RP_juB}VE7V#HL6
z7@^)YMX7AX!;4DX>xMfI3PJtMYDkI}gngqeHl=g0!)nZoF<1Iu?Dd+By at st*Q$X2w
z1A&S!Qk}qfv3<@~y^4)8Rr;$m#-oYRz+GsV)`T`3r!6L8%47<BE(d^}EoKWtp?!|O
z(ta|#1;ho#e(&OBG;Fn&7HP0jCNXm{YdJ!_wzx4X^vFTkyFPTOO4W*_?bz*e)VNa5
zOAdOy1}U(W9}t@JOqP^&34uotkLNspifLZ?mF>AmwZ<T^-BK`^FsSKa$+4i?X;Z52
zZ at Dm%joT*ZVxxxA1d^*Deu5lMBF6M=SUq|f58u1FJNRq2`}MU3zfVOizBEVt2^ISV
zv%yYh=VTpSzBa%7i~q*`?$UF&ZvWu+&C~l2Z|uf|X-tQb5xLX$F2F*InGt)!Ffbx3
z?j8amMA42vD5qXX4+yrx9Xhq3T at Aqc0601z#s61~b!UFqxl-f$pcBH;O05!T)rg}!
zNrQv0L(TtY=~C$hWVyAs;0Y)$n?)^^HybUyosW3FPw@9I(L%;fEn}qExpKLniKQeg
z=Y}bfb2EL|;lt)-F7C17H<r)>4^Hro$hs+B)__P1j)Z;?^u6Z$az_hzN$GdGsLk1`
z6-#BV1S;K`7i}TM@!2Mrz+wk)U5xvbMP*x9H9D<KprdMGkfqAt+fGqziBprY>>_8z
zEH!U;^0X>5vWrm=On}!#eeDD_#A~OPAQ$26y!`(r0A2RdqKa1zRcd2du9gHZS=t~_
zbp>_(!bMoW|18%6uy^`xmu(Ygxu<#GTD$rS=VltERypglR9SFJv6ZL^SoN_HYQh?V
z!o9@RXR72!G_VZWBGxu`ph#soDrRaJoZ}k+4%Hoy9n_aYFh42qmNbuzz3T=n3sIuy
z(5i}-jO~>{oZvD&5%0i*73H~-2%KC%?e5dLtOCeogzg at YawLq;hVI_;>B07^`RcFV
zkKJH}K2-c(Dr`xA{>45oXXu7H<<N$9`~f#!`pkUe6Q8^D=*jfT-CMU_-EHO<c3Zl>
zIh!K{;Eutuf~Fi<JxDq&Dlp4rG;wvU`B)&6vv>AAgLdslE5hnXaIgl3m1fZnLB(8$
zYvACRus#q3n<yMp@I@dB-dAZ~)%<L!nDi5yK$xwt<|G*1OpSop*%0QT$&Fj%LaM#*
z=vc-=XMh;y-==gk7S5KTFkswXfRRZL%hEA79^;{*+xh3|4Jldc+ObAC#!jc9(A5sC
zG^e6L)`c--I4=1Hn{}ioyD?RT><cuMj9@Y;yIVnX31vrBJ{qUGEa&_ZByMyNR8*g2
z97)G;{fUQSq*cSVWj0Ey=?(&bq0`sQW}6VO?8IBFeX-iwE4&VuU2I#u_xTi+CoQ8U
zv2?5U$=avJWSCg{9IH#JUFt05()C3*g*~8fFSFRYUTXFotzlZWMXHkzsKINBGiPvS
z41w8TR_nUCdHlAxmsm<x=8SOTOT;ZFp6V|GBvz2sA5X2L6H<B>6d%;IFj}U|Eq=9@
zJ${QYgV5WkpX_JWEj3Xtdn9eASaW(ET=m>w)-GMUe8UA~fM5;k-vK6yv^qnaZoj%a
zTi?R9U!5aKW1m5Ps^Q#^S?p=g#}wyOa^AsZnQ`gL)AP%}_#5|!D=*%<d-wj$Cl5|;
z%wxj1lf&(pqQD#lEpc0ty&0V-1A@$HkUjp)CGzG+-%%+NF>28dy>_9)N<038Lxp(`
zkLt2_Sfeaqo!4I@?Zg&m9!hNrJF$WlsxxF!AA0wgmHo2a5vFYbvDrsBf}Z!FJF1JO
zLPczf_ad~!DhRcH=Y}~4LJ?{eJQUJ!sk33$)e|M;N(XIs0R-0;=v2`YFbss=iyi5b
zoSKm9WNa5{vR;$lL`>x%WphUL?mZCcv<B9ZovAEP+2E04c~J^O{r}RHu|qw%F5Ds&
z6Sh7$PA-eMM-30xJx3M|ocAnRGTV*VtM3yT=N{%f%1zhZLZ%BgORh_Fg`L#PUr?_x
zcXP}osJy~{V)qj+w1Q|B(S?~oC6=;SB2&ZXZ&bZ3{@8UPTqel9!-!1fDlPjZP~AH<
zbVzEUn6gks5jldZap1CRN9o+rTq7tQK7n~{e=c;R;y+J&{z~mHA0e1CBwyCAjc0an
zTuf`Ey&Zse>#ERQ+X6N;YK6IY&Qi%4GwVJ|cHhqBbE?Kjxh`%)0_97}!|xwJb~xnK
z=7n(jgPU9Y-0lAIONlOU$ozAsUdjd79riZC`}9l^9nU`W;wR at 9KJ~ZnY;t_%y?5Sw
z_3UhVZW={4r}=O<NhC1PDLql3F=q&BJ{3B>D0?w!vt4X4)J``r6*^~(7A!sx`T^+H
z!1 at q4H~>~hgfM8);=l%fNaM8U4tP!j%vyw~-i%~44t5_LFSMepmN^02t%jZ>h&8W-
zU^hM&2{q~kn=8gE%b}q%bQVVGT)G4X72bcrAop=`%O#Wsj$&6uwp{g6xVY#8IOyRS
zdP2vd(^o0J#`cg#JxtXTrv#z1b&u2(ZEmJ0cNGnG2nU$x%vlin{T!%-<iHvMFIa`g
zOfW}Mhv<9?u+M@`e8jEr)3T3EScRk$T3|x#l@i={0*X=&qxw;_$ym#M3;6`W)zb#W
zA+;*9r7;~VlYs@@LlnMg{o;MkLgm^6Bygo2Hs)o)Gi=+NyU;Wn6B@!ICa;}rg_oJg
z;99(iZRh6KM5q&4>A>4RH?T<?nc0~0*JXQfyxlkKYY=t|is+)SgFVKqK!C-S7M>2r
z$Z{1N at 0)e`vZxoRagW>HW=a4$W)OG!*w*z(NuR66eQE<kg>(@-M_Qw=42sK*^KS;^
z3Mf1RXd81%&xYaTWqNS?=6LwmZ+Gi!X<2K3eDdXap8fly_ZRZ<mnK`l!O_wD;-@}$
z|H_Te-g<JDUwL@%(W_@?({tlC%Vs+t&LiRsg*~WKb*Ll@>f;PH%(!>Vo|QVumK9sO
z2P;Y)Ap}Mr1zlvNZg$G?r%<~BWy&Zv&8F09vBI(}R4<3-Y?B&Qh`LDIO~C0!)xJ*E
zbM^(b>Jz4#HA+>Td(pc}dz-LOxavlIqpG}YCFS0IhQf}K(t8w!PLtU!VuumytO5oG
zW^}!=mpVO2*%GihR*GaIg+d5*k(QgAojqj64p`>8gYnN%-9>E)7n;K|m~ozu at m^4Z
z7aJ*ii)fz{7yH_#8;#b|1~gw!MPZr at zR8w1KrHA3q3iXK^J}cd$X)k9c_}XPLhgk=
z;e7HFdES6j)ojb34n`@IhDqx1m1EOx`d6`eFWORRnr$I#g<#Ef9*mJ9_Iy!mnmO6}
za^5C1yI&mQWU8EYpPD&@reklQkf8qj<Pd84T$|!f%LxEcZ$6T&ET7Q4rqJ%v8oP04
zcZEiU%3EN%4(1(%cNb0qLM<7M8qXgob`_Rh?_-WaI;hEMZd~V+qZfL;P_j0aX4poG
zPuX<9fJ9I}0OGr#EKz8DHqwLV=SQ2b%C+CPA0t<Kr%e$*0nGkK`|lk505>QSeBjv+
z%`gArZ{ELh<I}gcQ+Va^{gYQWC)0D|2$@dP;r2{oHjcAj49>7nLn?Qy)L6mbSYTi)
zRJKI48zKY-1*Omhu8$kMlMxgXHGsez8lP`jvPL9W*C3T6+$^nfCX5qsa;j9sF8T<~
zwbM4`3|a6pNY4=AJ^R<@CPYI$^n)QP%>g9Y{HUn#=-F8hrEAsSEyKsMOPAbzG)3AW
zfJlTc5V}E^<<W|L2+Jj927`@$=@g?PM{m13KaivET@=?}1i=&>)*vvhPz^Ue<iV(N
zzSQGVTv3 at Eo;wh!bfM+%?C at c(2LCw)VCG_TOa#Q95qkA|(gvc at aa5jX1F!90|6CX3
zR0}+t*;U@7PRic?CICxYYSxO+_DQy?TyAK8e($ldVoC-wq4AAsY83-w>Qjp51Zl;W
zBhX<FT4~rZWeLj4a4YuK&W;H!)^1Hzu=l3v`dcrYg^?T+;GrWeVS$#esnWdvL;=a-
zFS!(IKj1n at z6$Q{x4sdL@TJvu>HS^|?I at r`0y$HIEF#tXJCqBj^z>}kt&(u8_*0GH
z1SQ=Ai27WzBnZtA(cl$y_dzp9>bHpFtyg!uYq$8RUz!6YwKk_8-xu at 8D)#5GF0#$E
zzLPNoJoDTO^UJ^V_wGOS;a|G7nZhd%?>~NZoX6*;5pwn<AD*4%I42-8LxR!03@)Ik
zr+MfMzA;=pvU|;=ECGotH=GE?o4#;)t(eqgAf>mEf27QfJ%d!ZLt5WG6g+*qBb=Nr
zZ#t%>GO={n+_=FKEhFTxFJZ6Uzligw>kYRMEQ(V+D=ie|I~rjQVPPw=q_`Q!J}CXL
zv-i4-RQ!%|vFvrfdRY`EGL<8I*=U%1u!FJ)oDg&Y8_1HlT)kLX8H~!cE;zl3ZJ4T@
zIdoo(7!-019I at xa+}Kt(g$ArziabjRANMAq8?5L@DKL;0HYpvYU+*m^Jb)pTn{+2C
zu8hiB3C%*ecG~`)g$6<i1_7#JAX)MhS9Xhst~;xR6^3*nk_6i*8*SDPUNU>yU`5?0
z9yanqV6Lj+pxrvR*#OqH>*O23d=&_t9;lql`;MlNOQ{XH!bFYz^8(@wji#gsU*y6X
zBc4q`V*42>9r}Wb&S#+c2EdOYJXOd^aLxw9Z51j5kDEL=sV42D^v)u at pj>x;sMiU=
zc5paZTOT7^!WNO5pfM6ejzGKv_yjcLFb}6MgePy^+;xBTc6WF^i9xzQE|l|Q7yEN+
z?>4yGdE%V$^!1O-Fa7dw-hb*Nzk2Iz8((>F at 4>6%w0UlxSk6vxxH(C2-06^%orY<w
z7i4pv90*-U#seqg;rfEtl(($-rHe4y?wLx*Sm6K)#pSAU*s1B5Lp at JJs20ZCo#4qy
z_16w|p@dwSJ;6Bko|FZ5?c2kAL#rrdwI2>mmRoQu)Mi2Jadd$y#vfefB4`wXg;KQW
zO1X(%;{bF)ok~k*-|6zRrHHUkH;HQZ#0_I8G>5NucfmZ4tcyo<>{klES-jJ?Lt6`q
z(I2fNXQ$;F&9y<vDooMP_}b6C2$DSh(Q*dz%t(`dAYCu$df0;6^Jp14NSRO~2)Q$A
zWOEI<rLY(6$W=`oJT1zgr$R&ITG-hxRw5~3Icf<}f3{dhPC+|z_76W)xC+sVx9><|
z?d%KViD|(+@zgmn3MH|#gp3|*Iu)TF)LjMor$O;qNW2UV$DnW--~)g*B}9grots;Z
zlzoovWm-*(PuSIJotn;F->hWh11HJlut$~lLf;m}kRj58(o^7guUK!i2QKzS%;hl1
zR+JsnwO?W>^_GF_#&yJ%b59^7nh_-0w4m1R^+!py4lzos<jbJ$0VvNA$j^p&`h0$P
z|Eu$rzjMFu)^=cqA1lW2&%M}FYq?rFYo#AC6Rv&m#{ALG{>J^MKJwRY&2;sZCuiGN
z&$iQZ)0lR<v;6q%L=LA@irZwyWwBz|c{Vmpv{5^{>6+2Hm=TO~TPb~^bcJlpk%BjK
z#bPblvUpy!bg?qJq8=dA7C1R0%rm143WYGtNw63rRnLFnb~)SzO3)rh*bWD3MtHUh
z#a$Si#bBjnS$dKA(t5{6rj at M$6-$zp!W<D@%vf~*bugN%!8o0EJUTU*G8bHM&9JBP
ztzqL-;Q*BLwB!T;^*{|xw^f#V4F$I?-j1hJB!tMOe^GcZ3P7=OK`qNfTEGwx^Zhq*
z6=gv*#dR211y-F-5larZ!5jp1MnMe56bo*<Y`daRey;u=o24Z}wFY2=$^ttkZrQVu
z3O8MX?K2wIi(m8gaU2?>1#^k_mZpCFQNw3<;g3TxI<57f?iwUM2MjL&{f9vPbx?R3
z5(a=ejq&4v%m*NPsw_1GQ}v$l!@Jmov<uQU9ZNg)T;M8Y#UT(f^1_r27eQjC5s+pP
ztv~Ptl%7*d1KupAg#9UZA$l!vQP9Fpvt6{&Xv`f51BB-Cq<le~IV(CKybQS^K#-Kj
zFAbHG1SA0@Ysl~(XyS-CBBpm=olfMIJpH*j>~;13Dg~cJ<R@yYx&QbX)x#v`jQ8%m
zv3lbVe(T0t-}tA)liPoABh2r9VF>cko_Ei$dl?Qc3y!Y<$444DI5>9C#<pS6#h>T2
z&V_<ryt2!4$?oOBNah$g=PG$Fb^=+ebE=ud$T=G?n~~;>$B!8A-OYILP`!ABrBE)#
zJiJ8&lug#oE!A>iLA3Zg=Upe8P>SHHp~|(g_OQTiQI^RZ8kkLT(GPIx*cdDskrc8y
z7?i5I9)SMH*iAhtj?L8sPG(K{%E`TV1c{p{JygLEdC+xZg-Ax at Nv?F=XG4hDPgFMS
z-UZu8MsxH2<fR*zGhfJ`pA)%L#%==6&Vb!xU~|eyBO$Ib4vz)hAz@fS!%VnIy<%GY
z?hFYPOA)e-^F-B_qF6Dz^*}pq$P&9>FhQE)$Bj2WEI~{5Qom4g9?m~bwuT}@jlG;$
zA&Z|$5MG1%5E2dnehLUjAX*t(*iPy*xWEy)EK|LJA)i9h8(?|dut-|&Pu9$5XhF;^
z`$e)f2zp(~zKbUCXS4w}uKWBfke&rre~4vx<KFw7&);K$2uQHcw$m+GmeTdBYPoai
zqJ2}eY}^Q<&ZdC2CK?1w!A at 5;(I$i9?S%6(001BWNkl<ZTR^xCOxR(y`kI`4_)FX8
z|Ld=<KlFEZB<aWUzyHY<`#pHce~yqDtrS;BE&OMXAK|U<{Lbq8zyFVKy!-lZzcfAm
z{ueqr`)D8L=U3f493BBjmk0+(g5v{L=0pTK5@p^rU0*bM;GCuC`n~Wg+#HZ|t|A+I
zZeIAaHORrd>Lputty%1*QE+-nIDG`1J_I(SU7Vtwi5S7TwMU>}eC%ZSDe8g1CEW-`
z13-3 at CX;C}GlJ+%7Fz6GYM~{n##qEsCaVw_#mdbLCv^hK=z>085vQ$`!n#_kEj330
z_hi02Nz;vThgl|I5 at eVKMJWcg0P1_G?{i`xI8f_Yuqf7D2;t3*wttgLaRpSKeOna#
z(8#XdY;S0`L?#o%%~`Sf?HS?h39viSV3<`D#7n@zA!9fYa4!bGvH6Xn1Z0$5Un{yJ
zSqQC|HQ$)bZdjUsFOVL!agx6D<0{23v4O#sgL3{*Xgrtzbvz}mJE!)26k9TK=pcLu
z;Wa2+h0qlsUV_9ymxUJdk&zG#n$f&~s;=e2$eT3!i-Y20Fniy08<O4zu)&_-SjWdq
z0FBE|H8+{L(g=EUb13?I0xH*lcxPvCu8`#zw1>p*vk-m+bg$R<o9p*huOqpjxnO<H
z63UCvV%}+?CzJBK*LhpqB_K(M=w at m{1zOeSlZ+7J|1QAldysSrfVSKnygKdv=9i|A
z{SRL|xO9Cd7rA5pw2S@z4}ZT^!v4>z^i4B1N)zt>;Jd5W|KOkA_`x6jpD#VW{f#fk
z?%|DLMZ;kyHx7q192_Sc9RcfO#_AxWAB?I=&1f5~V48tf&gKj6MZwNuY5l~LDuXjw
zM<~^wCY#s1es~$%9gxomn^R!7$&g8Dn6pLRC5NH>vAx(+y)iw7tL=gr;!XsmyDOeE
zWgl-icrzg_;_X5$Qn}e*uod`db^?J^G0PwvtOe^s!q78 at gM`%zh=cO(Lo`N`WKetw
zB8)uWD?D($;RPaTahR*GPqNQA12UKQU{R#JqvGN<S-QZY5inS++}xBeWQK`PG8f(l
zj69hj?o6<K3~Ww;>6F2o(Om|P4uS4avlt3 at o13m#mg9zSeJXVcD-8o`FG-{n^xOyl
z+JjCH2H^`_HuoYBm&IQXPHJ{Ss!m-4SOMVx=q^L(2of%V_yC|D#L<e`T#7YFKTDPE
zJNqlyF{D;}#G=KDGDzkI*KVG3dI*}{1oGWxPZbo(kn@V<e<|IY&r`lHqJd{<zO}Rt
zeI!6Sf{dR8#qR*!!{QcL%n6&WUYg{z_V4vc^yS)Ao*)3}l$qmHBVsG!oxYD8AULob
zgh{`C5ycoFIo6-SXTb1XU<C4jZI~~8`7HeX&v&2rFJ9~7vWEUy3jR+V#`&{AJWDq`
z!jp&Ztls>_Kfm$D at BJUcJForDjl6yL3o*_gJy^}pA9OOT;)sJwz~Ld`;8;7-zEe{#
zXHt;ip~1#+nE}aK)OGhO6?&2Lu#b1Bv*hOQ72-)_MxHbfJWqn1#Q;ttkamo5RzLZ9
zGRH{Kq$*Vt*(lA9-${*bV=7&MaP9o5>55?jEnob2N)|IU?1HSev{wA0LpwqHw_w7g
z7#ZtT#^I4=2(QhCdH}?fr8=EH4e37y8t(x42?W7l8isIyNC)ATvesE3vo!-UAt9;N
zFA_+0O?K;CVHu2eOljB1=Nbeqg(X*Ss at fp8UPSG6W`}m3HOu$xu|he!6UDfPL!dtv
ztPVAphoUY&MU=kT!XnJtJ!U4O-z^o<Z4<L!nBUh<!M-j5V2V0PIlC<BQnDq5EQJ;W
zfCEssMy3ORFM+}VC|rS15Aezagvxyf)kByh=>^)RH;K8TI<_xq=?COpJqaXPZYwmC
zHOXxFb%&f!z~i?8xmOFDwpq;<T`n|iVWSW$k6p_2O0<7HG-AO$$Vgf&XnGDZ-vISr
z2WVHP1G%^sc|sbf(>TJMD|eK90_uuBT045Se`_Bo8r0+J+E};OZMG$%S!ol{-2uWK
zU;?mOy(XIvet!GRfBxmwNB-R{%M4I=?mGI at y8VBx#s2*YzG8|Q48_XQJmQD1{lV(y
z at BNb-Z-4Wjy>xp2wJ$_Edw#XzgH=e^`!M$FVZz}daCn(;cueY*->JX7GaUNBS^!0F
zo+&w2PbK(4vI%1Ziy&k)Q$T41vU<IXh;g<FG7F}}z+}N8Balb!_VXl|c8n>DhF at pF
zoSTcAS#KO%09NzzMyG{UtU(Q|uanJ=!m(<nruvdG`XaeAVND>c)`a6@%MM-(R%;WB
zbpWrFS|NwO0v3Uc??EsrJ0QFHTR^rkSBMqsMCC$P43D)#XKC(ni;yGMcs+KP%}If*
zJOY%I$z)ldkO?G{9%OznP_Un6n6j`IvS#!KCCs}M%)4w*PR969KimEY7><D9KyiCS
z?ZTDAo)FD~R=e_M?~;Qq6U)bzFSe+qWizqgwbqmqHacSy;7uJetw6j2Xn^n`5Dr0M
z4ba*knFGa@i7QrUYE2@PYfC8G`zIx5wZ-_|vwbmji+!I-$4K;`<DAOA0x8>ss#8Jv
zFP#A6w*frd1H_kGQC+e&-zOc!tOu0xoG+{)3lz{G&2}o1+|W38A4f(6b>CP{RP6!X
zB#RYn-JmS-^fHJ}Mu=t-7*OM10tB6Ya-#p1=>Uwmz^RFVkfUWMTPRQNG}h3jGz_mh
zoU^0;;A`pZlV6&C?tl8)`s&L&KMwyaaL&K>Vt*kV)Y21MkQ;<Y@4mTu{p<hNjW_<q
zKR&$ogFpWHJU;l3ySTl+Ugcp3a%0`i!@+vS;U&S*CBphpFsy(+7)y=Z|3p_J$N<e`
zp&o{jQ?p}euCLVY219dEAn3?z*|8#8^h>~Z(p0NF3+9P1Pte4ti80R^DHHNeFlT=r
z>du&3ng0R_FowcjFh%e at Qrm@SIJ3eKvEe*x`j3>rl at JN*4p?6j^lQe at 1H(Ea4ge2I
zX~p_uK>q at 0x&@@OdV^%rv7V at OeA(ngBB{azi**j`#9^jp5Vj&?i!cPkZ1v9x&2yKi
zj1O}L^unr(|A1^eAT7vdInh)D$ulVLusiuCb`S1hvtdk+GUlBk9jjwtwbli-iuMFd
z0hzLTA2kKLFt4&KGFEe&ySooVw2N5;NEkre1GKi^dkA$}ym<i88WMW#+{2*VG6IOB
zy?(CCVJp0LV=o}SLK`eJi3Gy(Kxo^<q at Sw6IJw*pEqNem&|`D&ree(?lE9K7c~rO~
zy$4L+fzVd}9&Rt7hX*(CU8W4q!3@&Ug#~$WKiF={r(4O@c{aP^yA<yZvi%G=+=s-Q
zSlZ5A(AA^DPui$VW$aKErcSVuBbcHoX9GZk6>j6>C4H at aUF1B2LR6f;>@a$zxXP$Y
zVLpKj-`DKZp0|{*etAp(-skD#|J7?l4~PV_j^-bUeg7A(*u$j88U|6**CENQM)d;R
zo<79eH@|)O{qO$%b8r9gSNfAXe{_Sl?|h-_<{O8-46D_AV;$$=_%P$(vf%Kt`sNIl
zlgnTonv7FUS%AsIz7@WiNtP3ceYiQ)Mw=5b1+%6V6r3MWN?(E$77(B?Pf7$>LexA9
z@&rsXnb3#zFtEd7o}@5^=4MIk#k_W7Vm>&w5T$Cq%f?p^)?G>@(;6 at WXLLkZ4}#S(
z&<|vtJ%Lx|8rmHJm;MGQZ-D78kar7P+>D?XtQTeLhUy`(hnu6?!|LxI+Q0>$mSQdy
zbcA+3x<qXVbTm=;fwDqIt}bRPBDO3OcWgBuBqV^g_prJDJ2-v#7~=^roeHQ2hD!<u
z4lCVP6#YWkpR{g-p^WoVrV1tM>kSwop$G9A!h;rXbjTb)Sn2nK1EupJfH~Sh;CNds
zi`lx9 at WO5I8K%1b$*Hosj0v-k?}~Y?*KSqHBt+&Nuds-TTa0o at QuhtgVDsV!ufV1+
zkLJseG=nMWHJb&p`wl3-2f^-KfhG3Wlg#Je2my^PMO!39-XE`)?BOlB<pWrUpMi84
zGJOIZz6a^<6+u)9gb|!03lzqV)g^EA6agRzA{c9Z-I>80^^nVz8?W8J)i*HMni_($
zd=wtioMD?N!hInA5SRos46o(Q)1Tjd;EP}GU;GcZv9NP;f$08n75g7yp-T(PWy0y%
z7I(h??bTb~dgaEgKmN*a^6nqr=*IhBSclz>^?Du-x_o08(r|p7ad?Ha<6mV2ChPVA
z?!+YWq%0GIbKsr2)Fq-{+>Z0R>Qkh~k>#)~^4 at 7BpBikEaDk5}C*=$zEBctlVgm_j
z%*DKGo)rF}Y=Ps83y+aFgM|@tE|kwArm}dz;GQF#5SVay01QVeEE-n8>W~ly^&a9&
zzY2;^LDD;*eA+CnoE)wcGNI0jy<XIrgC0O-nHlssIwh{*JZI-A3u?!Y{mu$yf`DXX
z&IL;H022?nfRESBl2n+$S-nayjz~}5!s-3r!|qAK^w>mAmjnlE!f+^vN6&)0XKeA@
zf#Q)0h at c)FnK}?f5ci8es~=1c3ekpkG`kqZaJ74#tyn7!7L?7BLuyi7=}1#$YdEIv
z?WebkOeJ1Yyu+ukcmFJly+1B!c`ys{avJc$pJ~YyLS2^UJOh&IydcT$6~p$&cY*mP
zfDxdn6y{Rw+g+JYYgBzDJ*TyF_}1J=-goho1v_j3=~zxgm_LL(eF)rt6B5qUi8t&o
zWNCpk5C(&&X5FJEEA;+(Spf%D$TEVdH%a86dqM&z*M>~Mx|_*Ts9hof>=aL^xJ&xm
zfIJ3e+M(;eHg7)mrQOf{k6$~y_NkpX^6?|UIe)>6ecl5!c~Sgxo{QD8cl=LIPjLJ7
zZ>@gtt*_j8_q$&iPTu+EjWFH+!eO_2zVGMb<8}Vv;W2eruLA2Uz<QlA1XjUH5*2E7
zRM-Z2HfE0FhPK$fXwl}+*6%&>NIx#BYfw;6_<)A%4_nd-fMjuhqMbbwX$EhyK=GL&
z1_vdx>P<6{lR`oZok4q0WmLK%+;mKzckBoU9k9AA=mx^-K(JZ|(2&qy`Z%!qIUv0U
z<R^ek4T~r=g#H25%CO-Llfct?ec6|#_0kWupc&1uV8Gx-v8p$nr*gG3H#g!Ih2sc%
z*vypbAz_7=lOXNRFg^TzoZfpI;|U{YK|ctFOTfWFkMMzC2My0F<iXJ(GB5H}_a!V^
z<cmK-JIFKzq-7B05keg}k9AT>glt97F>-en&E7e4wBmokVsmk`S3#pL=&7uK$$|y4
zEoTY3bI`?i4bISqnbqkP0Liq#ugRHKRAPPfAW5lA5IOA-m>}~6<j0Wo9i0&EGuA!X
zdCTPj!TI~vKygH*XOP{a)Na1_N<PFaK0wXXV*fsV49Ewd?vHF&K;^okCJC%GnC_lW
zxez2oe0tDpj!BoXLN?inE~;xIXxar#y4=+i_QKI8baetKlHLTY-UP-G=x9sxr7!Q|
zzw>!~;=g-s=wc;!oLlt$B`Nk7FCN;0pY;uu<-eB*J|di)p5V@Ff4KU=x4&}Zz3+bI
z(%HM;{N<SM{|7_ZKDS=u`tcPUUbzA~zAQL828JN$?D0ZW>R~Ai-hr3G1kYkGfz)(v
zJ6`eGHhsupmLSW&s|!D40FfZfghV>hrmXbPY=C}BwouMMnoLk;yRmt$LE<?P=Bz9s
zc3j_Vdm}NJ68eF#x<VM%8LKs67zFX!M?eRk0p&-?`LSY&W#o<!Qp#8<+K5_YiS(i^
z3P~=$Ld7ef`Mey~5h3$@Z$wNBib$KbB{o60Hi8yAf&Gi$Z!EFN3zC35Lms__)A#-b
zHYXWr!-zx1a0DD&yMcK1(~#jQQ*%;r6e~r_UW<|ms9ul8rb4dz2j9N>pS^$-#5n9-
z`^B4CY9TOKh8mme0!@|g3+E4(w%>J5r+LaqT4L5}iQL?K&O~S)Pw{vZh)J at tZzNBZ
zT#+Zs;+=IeN at u`)6GHbuxp{oqcj?PNVjoDAMPa|!4%>>nv}~R8v`xwZdHfWZcF6IM
z&oQU`<#Vf30PBsm04B8%s0hvlY-^o3A&?Z!KGg$J23wE=*@92}a}#uWpk@J~*9El%
zAU;q?XPkjmcn!O2pWi(7r7!m%{Ri7<-Thy9HqO6_K&$=#!r^Xi>{i`a3jfIiy7Rq1
zx^(+nzxBa)zxU5SbawAg{(hM5|H8p49bdi7H?BO5;nEet;pL1~$LL9+8n%#hHghCQ
zg4qNcLhr)}z&;<^11(fJN_!1VOR2l)zhEyfwFii0B4iL~7R+`?kO*L1zAuPr22v*M
zwt|inDw?x^Qx*FJ2D(GS>X5NM%;+zF4Eg9qa5{y^DFk!rG|Nr`0ieFJU5sB$p)HD}
zA|7d#q4v7%=27UyEMN;{V9-Frt#2)5J-lT9(kM53)5W){!|X{{S(N2-a*Ex9-@*3L
zeT-+SbLfwN!>iAOuY4SI at RVY&RO7M)OP}IgLUGQAO;F$k%L5b^&3`LU$_Bff(;>8l
zs_k|qSVyXG3kll+l*=B$yLlEYC_ld3ZlTg#6v1Zw01v8}ixHT^K!pKDHl<(&rLj^p
zMT|*x0-4_d<#z!&ZP at d<uw5=H@~&vz7m&61d8u8QipgLWJrIMm_hm!FbiCi+kGulr
zPXqi85Z^qvu$5*B-~N0TsEOqoFAJ^DIZ^Kq=|GsYkP84h2GLa5e|l~8*6sKD+7mCl
za6}TQf2i+a-t90Pe=Tia`qKE~Kl<9i)1N7D4*g}u?0<ZWKNb3)SQ~!w at NRea=GU+P
z@LT`);hk^)lMnA6e(MWIL;C2IOZ5Dut1?`9ig0vUurfoeVz$=TX|WYxX-4cajxISy
z-bm*iwo#a&HgnZhwbBu@(IcyBu`XN7zoU*0eu>UrSUft=Mp$IsLjVn3)c!pf($Wvd
z2*Xvxqh}%AF_7<p=md~av3kC0BAo`WmjL0eICO^46#-Pme_{A#U2 at jWj!OuI6yI=-
zd=qM<;Z1s1J!N at Oyb65gR<zC*Vts++2Km~;f@Fm3cEFSGVe{@EVzbqeYglItm!Cqo
z@@e4U8F1*z;*>%_G8oH(nX5o2^bmtOGLjkQm_Ivp%L#?DT1NXv$fW#gh%LNxIZ|_Z
zjSeG7WdY at JQG8X4q4t-V!+H9o72|eUTMz3DPGWYv&WaL{B<tP@z^o00b9O`^va9OZ
zJOXkGNl!rOT_C?(@OdxnswU6H<~uXhEZ%Ip713uGq(kOe3%Ca!`N5EBf#ny*keqM8
z6!tN^Kl#qV-nMiZm_81Q-$$m~b#iMPiG5b6ECpC4FIbjJa^-M!U|K5!hXTm)d(l7!
z$vSxwi?XK>jCN|ZE62KnS-*{ZwgZM?%eeIA9scdl<KzF$Ys1i;n_yZY-p^#Qe}Ddd
zu2Oz0{Fw+3-+pcNz2E*{ZoKik|LaTh!*74#a7Z7$atY60zE+F=dZ>XMLtseE3O8g~
zbmY0j^(mHDL^g{twdwL)%Fj}ujIhU`XsKoUUB{0A)0J)pW!+N)SjcXi^7!Ep6c3R@
z2IVt=cBX)Jd)gj|*CBFTpqsLoWpk`^1`LHpfWsHy%DlG_48>cA5tbcX-eX=cog4Rr
zf=0rN7O6~Jio0L*$)e;mPRhKDrVZ%qA$Iq^ip`TJNRtZ7`r`xiS3eCodL9%HYM~&V
zU_5#+Q8bEOBQ`3N1TQ}~5s*o#y}$_<lj_BL<a}<$^F3)bH#~3w$*#1!?evooK{6o+
z0%2Ib&t($MZ56abK$_<adq1TvYAJz?{iME6Npb(Q1 at Z|bJ%QwR!TB*Dn`$0r(~ZJ6
z(ROWA!r9 at _9kBE`LOlq}-?tUKrBq&U&of#apBG<Kg;eg0cO5c+1k`;KLMLVCwiKFi
zGY#!MM`tx7V3vf~cKOmF)4Db#<)r9M)W!wkECy*Ny7K49)Eiy%J`f&5Mt~3d*YfGL
z&u^dp&%WHf^dD_IF~ThEsnET){CT@x{zbz3&&Q3qVog(I2!i$TQ}c~ae(wJDPyC%*
z!cV_)@4fe4ee&?Zb7v<>#wT<*ZxLr9biMk!XNcNai`mJ>#@d>I;Qrz&w=iY|&N&bI
zpL2<>b6*uHzAF*!_cUJpKHBreQESwCk2eu>#cJ5CI6Cu1 at 607LOaPsMWCNzDc+8Ng
zeg!i~wm`fL at K9cehi;24%asc0VjeeIui?35vgQ(g;axcqI0jQSMtlC6tVEVbuKaQo
z`(|an1Y7WhVid2AmrA>opqM)s`&>JK0s&cnc903OyQ>W<0WnSpt4omXs;W}WK9T}M
zqCQqeZ;z$CcXoAj;3hj&Sx3lH{w$t6WD^WGhqz$h>em#yB|~7ea1T{;atX=c>gi4y
zOwr=>n!Sbjau8*6Sk1*FUwxINI5RS)2CJU{*&&O7@}waE`2?6B0P_z)<D2?>{ys>a
z05XF(n_ai*3CKKxB$ohn59jn^PFXW8&IxKA)++2aTBO14Tdok<RIEF1kSq=A%46nc
z55!ME(u2|s2;VK&aBDW{_d{uZ+;3Sl)4-2pUL3A&;V~-bz8tn<>f2=Zj<}w#>^<~z
z301*N0?Gp<?m$SuoDO-&FW}MZH^=qoZubWtOh8%?R@#Q>XR_GuCuot0l9rz|SNxZ>
z=s*7pf9w8ppZv{Rpl4pWd-vX}_Z~icZg-Mp_m~d1XNW>UL%4&HA-uEbU=ev$I`44g
z($cl at Zz)YGl^j<;kBX4myV7Q9M51GFwSnD>S_^1A_>B_U9xzO`a1zx+$9}Hrq4r{w
zs0nQ58IUs&trd^7&<j<>YO&RuJ6E`-#Je%XQ;p1TA5=SU&6#ZyCeV7Ci}KUSy<^mX
z%9D{2Is}et+rZ{iVmZ5RSzWq(dk@GC2DM`d3Oh_A2%3G&9fMcT0R0Nwby}3{(9mfn
zEMA{jq6m=+yqxyQ$XfiU7yy{Zy>_0OZ{0jU)a+rsz$UXF$j0k$o0(9&@GI<Nhhww#
zEm*q%LT0Z=I_0U=QZiU(1e@1Q&ZE9Jc>~O+p!ptTej7Bu35;(-^6QX%8$xFQZMB$N
z8hKXfS6xV#WT<K!Uk(GCaL6<yw(ed!dlrhOyG5SAM#N0#&<qVM%XBfHZdn$Cg-+q&
zAt*l$q-P-Eu4YJ}vEOzd9a*yO&`it4q|Ml6HCszcN*+nH`+Zg@$E$qyal$5VAyYdy
z2OKky7}Rf&XGHGOvw=>Z&rcqFHDCKT at 5dM#cFq#P|CuZH=RHYqVfR}`J+4M)gpBp^
zQ}c&@;n(kf=u?01R-((V+_`=G)rSurJ-6G4Y at X2JZX+?9=#5;slvsl+qTaZi=|Yny
zfB$*U)^-73|0$>%v3G`=poG?^y?M-RKd?*!O#vq}+A7zihpm<_he|fB$1i1WCJIa-
zd2C%t*F^v5w4_a@^+7E9b;6~<l4rxQLKB*0O63M8B<q4hHIDN*LK5SIdsu|M5RcwN
z05NOqBsG2!Xp*Ar?$6|fTO*w)KLW-_prjpn3_D<T9TE?LI4I3G1`E8lPM^i>33#Cc
z&~AJJ<z(0^+YOwMy~8g{MazXXJbjrqIu#=vDyr9Hf-9fgdXsu*fPI;4gnJiJu}-tP
ztW6-9m3Ao!z-0fgzmQIW`964hfHZy|JiY<UZ$RePA at Vjv9s;xh<=I$M1j5<`QTF_E
zyGYfjPfw~Ul9i_5mlQYapmWpBFPIRvG-j at pQh&GD0xASG3e=~i_68{)XMR1jP$@qI
z=IiEF|48Q#&#G;qQ`sk4)SFLW5MgL^9%a*(AY}U^igri at 06RULr7?NJYz<3P+O2bz
za|BTW!UWn<#7Yo0Z at oIE=Wd0opP9K4qqeo~XRg at q7xVXrd5nYXr!CB%LagW?U7bJt
zsn6a2;K%;<t<$N0<=wY``0DB7C(muRknu4c&Lc$$1R6A{C<`HoJzlS{h%_il2}UlI
zxi&bVVwT*nReUOFUsrBp5E~0+j|7zVaYKa?+K`5XrGGy5 at -3yklFRZbEUbfxGe}MW
zIR#;3hG!FmMx&;=$(A%ewdQMMU5+3XXr;DK{`D5?hrKv9-s@T@6{kp|Y|~J-2}^3c
z9l6j!Uu(A9QEn)mB&>E2c~(q4W^lIx_0KAh&uWeB at RD$7LfzSvz_S)p$Hl28gy~+m
zM${EvdV5e(P&QMZL9#QPK7%M%>l{=lpjaQ6AG|VWytK?3dMz`MCk+t743SAq%+d}>
zC!pybXu1oT-iGX62TgB5rtd(~4}p9az+(VgFr_lNDUOV)<|}*WTnGscQ8Gv)E#*8G
zUrhd*uD`(YnJ%8#T{}W`I#SrC(u%9}meH&skeg$aTdND}o&_ at yPC(O#K{P|ciDNe9
zUOT4=7pfK+7J!t)#fh<$1DI8+Pk~fWg=84L8Lb6teW+T3h*$x)rbma-ogNEmKBQh=
zkVkLa91nlvc3eG`V98$XH1#tH<NRnakDu~hM3uJ4T;Uxe!SS^Z&M$uU@7}-q;$Oe@
z=*j%b-8(;cb$hydZajnRPH;GHB}(Vv%}^sR|LmN-<6VqMLp?*uu57}07KOeQ3Hime
zPdS(7>dUCwBBEN+&z*g=ym^Y1uV-d5&d~_jw$1f0wSxo`vYdhO1dt~nc><!x5IHfb
z-2|d!3=R#G)~Ufv&M0f)QE8b`_WW=V?O<%bB9u*ON()hgN9ie<$9dtfMOCwqv_r>f
zg&_U;%6G{i>Otu-C_RE?Ta5AuSzQO>0oW&ipobEBfrjW|mj#d!l4rdT3VcQ7d1!)>
z6>O at 1U$Ao~^^;+BofI#ql-2ISECfKQI6~_Cs_$(y?|jNLC{JJ+A^B8cnEU{k-hoU%
z1Wm64+t+~Udyx4J83lHA001BWNkl<ZAioXCZ-eBX`q$6|VLLEM7WxeREc7P^zjsJq
z8=2KXq9#zNfkE7RiqO&@9fK_WzAY`eynk{|J61XMOYtlfc(8co$hk|uoc;CiaB>v^
z*nwyUr57RL2|(L2m6I)&7kV1fX}(R_q6-j(N->q9d?X<t1PCRIuuM%@G8^&8zRuE-
zJexr>Al(i$BBD>v2An)UpFH|1p8B`$$AASL_-C4p^QR~>?9HqTo_5rdhTY()K7knH
zIO2Q1|68kX{<Ht~#*;U{^3vt*;eUGda{QIcm($U;XP6GJWgH%5tXSg+Dd at soSUK%^
zmeL6<e<qhsO}MJ^&L2`f0 at u`{N;GH!YEh}2@An{?_IDf2VUhw6&KpqG&P(dp>d)OO
zLE5vLB{PB|Ug>hf&An)_6S6a383r&kib7rZp6AL3i^QYid87Xj3uc=+G+gqfV8>0?
z6dBQg5q74>lz`K>fd{`0nKH5nVkeL*zXBY;4D<)~T$>z5X}xk1a at y^^|6JHE?facM
zfO9qZ)0*BDXUDq8+q*s~SD_QwCJCr!Kt?^d(kTdMkaVJySviH|9n=7qKxn_FU{}n=
zTyIc=bCxy)fRt-BGc~Dzvd}o_`6}AYUcjbVILBQyY3IhiyZzcs7ZNYpKkw5m_bItz
zMUnV at Am7|@_))D4v at dubl%9daZz9vK<|;J5w`@H21IwlJI3I{oY*vbiT7=-BzGODP
zC+<|t$+NM5T3Qf;jry0nhYA;t1RVFT<tLXvzj^Mz{POyRe}Bu;z&UDB^8dwR|7T<M
zEIup{PR~y9C%^r_ufFr;|NfVD@BZ#TxU$~<%C%#B^!QR9E<KZR^=b8*iDXpDs1Ax5
zYPMEbZ&U>t?qL%|M_$0X1(tKQx{|3}y=h&2>+QiU9ZwcFfiQuR;_$_ at rF`FhFaq1f
zNALUo?Eja}d5hPrR`F#QwwO17X+TD2l*<)BYgOdZ03jWlh&tqkLgyDf@sfA1ooHuu
zg6r!OE)z*E(^gPsiCYk40*xc^=<ARtZvw&^z_h*sT>drC!DV%(Y>Nt;VVB|G)O71*
zk~80=62M}UM$r)<ygzMLb_J*=*+KFI$Oe>mfb1aH0yxvJ%M*Z6x&AUQRj*9T8Y)pI
z0~%{_7hcd57eO*Y08e$wLsb#8(-{46vMuR(UKae80RKLuit0fn+H}zVf!DZOielrL
zn?t8+nikdw<%ZjDfc8w#{O<|`KYa|4HFEqWz-F`U<c3-H&ay^z%=ErAa7xs;I}3yc
zWL_c2gp~V2@ufxqOb&&b^+;9qPLTdFc$Xm&JL*<n8#kZ&()?Hcx33*sd12|D^Zyt7
zAARAg7j!D7QTOlN?Y{Np|M~j&zxt1UUY>m8Ke=|4U%GT8&tJJJ!`17+ at fE?r0Ce6(
zcYyTjb3=2()y>NWRAEp$Z<R}2m5h5iw#>BP8&??S{XgIR?*3oaeeHKt?^p1>>lce<
zbkC3ykw<$<NI7R~USBf}O6}wo2t6|QU|9itV1;s3vO)9z+upkdOO{<_V&7W(oILru
z&w9W5ReFsY2_ymP9?VR{1T$u^$Nu4;{^iF%kN at z)(RKt@Oayo)9CpvxR>YXFBfyTC
zu^A0827`ei2t%|`gM=i|1BBGHy8BjlwYs}r_ukArkG+?FthM*qCvV<r$p|E&n-L0C
zRaa%+%sgl9wZ8Q|lI%0u9=qXUk9)``Do>R!QkpkE0jMCJK&!jJ{oe)EK?9{rK<3{A
z+I~_6k&@Xh0|>H8OezEu!q~F4w_=7`0?S$<O#&ec5s}6Yk7JNuD%CP90O=5T1(MG8
z9ql>*o at pkK1Y6O*BH9}ytBgPp8fml8r`^~AlOL#E|2{aIiV;$g7bjZ4%;Tr;dTDT7
zkr?c>p=*ykcKJH(5^~FB^;9}pv*k2BsZi!!K6JXw??GM27C`+Zh*psDOPhv=tk7qH
zEGFEFIR@)xmW2BNqx2X-xJ<$_@~ps|Da;v!5Ew3jzFxmCK8B2zpe2E(ZY6d3+l%pk
z`uB?`|HrRXu7j8{;aRc&M!S4F_EV7~!t1ZRF#g<c{mk`)PyL at a%l73T-=Bvk_I7Y%
zci&gLml@mJ0i#mON{DEMV^AXq-mtjPcjiLFdeBSihvsW>YNQ;OXUfLXKJa0^v0DH2
z020YOM^1}@JMH1csD?xcZYVm-JA2Byv)Fm7OCmN#&@siEH@@S_c=izvnwS~eSUthf
zo3sg6Mq4Zg at XJ7m6f~O^B9M-O<39mCcu|X40nlgy+I|``+J>+)Di~h5>!DGeds><r
zy;53pWz<ew&_F_?G)Jj{=r!b;l%6J783NFnT68UUHjVTlgQap%IwXr}onTs3o~G~=
z0{Q6a!vJewh6a9=K$bp6?Cs}>R>uMBLLE at 6;;UdZQ22qu^+W at 48l<xczR7-_!>Unq
zG_-+0V)mrspM`szsB__T5Bv22AcQfveLn)<2FjO>Dw^2D_U|Z5RHIW5r?t*%!_P6Y
z?=&|7v^--{V?RL+LTTF at RyeRa1Uhr$os?e*#~1$o^2R^??b-Few~9gKXT|;-M*EFP
zB9vJ%5P~pX`SRz-pZ|@2dj0h;{L;-S-Tv_lyLe(}JKWg5DAnG1!h9we6}q?z1;C at s
zTOkWbPD?Ess`yBTMKENpxe1ElO(XKKa|wipcJE;6F~zs(^oL`!SdsB*q>b#MP0d^$
zh%G0hTC>h*{RhsxOR%<tLZvZ$ROmr~ksXE;b<|`B3RQm)5S#k9$QGUqv^DVH_dvBq
zCvpLV*(0FY`$60q#m^66Boc(K1*3(?9gsXwtXvKiFSlY%#yd|38TY~K#D&E%vUc8L
zl)IF{60mL)p(u~0TLo#&T0(|h|DYXJ?Lmm|UpP&G>zzHZ(p!U%zYZHZ at -8dJR&bry
z_mjgjr(H{V$8Uw71WGLqv>8?vPVks#p!7Hu3OlXX_doN=q^jPC&wlo9AMo!4%CCa(
zwE-(`0O72`nYz%nAavPK>=Es%P5CX+mO`^`LySF?-YbXEsbi`^g%TXdt$^|vv?PRz
zYr^=s+JE at JpzryYpB+ul1qtE1la2G|V)A6<D`uyB>7dMyo%5Hw$3O6+cji|=aO<r%
zkDq(<_QCVbs=4MDRJBW)2;ih36eYohY)Ml}64XS2QF5`3jlvq#lkAG4<S at HH<G;xT
zEYZd#tg#4&v7MCMDf at -s25PJEJNxOzZl0)+UHiP`Bvm@u^b&^j(f;S}rIbB;V}NO4
z5F|1vW*(3gRQY*qte_eQ_keB*kS;ERU%-W>1!jx!pUq&6m1-*OTbhDM0MP<)`{`#3
z2CGFDlR#8F1p#$$0sgMOF6u-Vl7wTi1&>En9QV(mB=9~sor1w*(gW0)1qP%{lvV<p
z{jTea2^Yz7f{1&Ih7gNNoUC~8g(uB`M8O+C;!QjlT}q<>EVr2UX at 4T=+T75|uU{D1
z?-N%pNP4H7J(WbZ4~7c%O?T|(Qy`6tJ#92z+f2zv3w9WwSgNYKdlZ50fvHUbH_1G4
zf>C=_tVsj*Uw`jpKSaoX#vFb%l|MOsU24saI^JVm4|uZt=BN?|KwT(M@)kFDj+fp3
z7m9NqK6W at O_J1x&Ctje*fl&lp02i*_>>m5jzjLS9dH1b1UcdYMciy=DXYH!J+^yV&
zb{UGm1g<Oyz0<=21%aHPhyJKv#^yo}%9`n%zs5AEf$Ivo^+L~rv}{Tj<fblq!@Z(B
zaOn?}!9<}}uhu_i=}t6gXq5Wq`rjv&Kz}2M at tY$JIt*~t41-TNt at HuG6uIo))QYVY
z;}(S4Fz*<f*r}YI2;dS)62^0|zYByK9I~jx;u2!!ucg)x-Xg=9 at BhktbHW;LFb2i<
z=~D`Qae5!gZ83RDaQcpV%4Yohnrx{`$xCO at o<zSDAuw6dpeh|2#6ug`)agd*qeP=V
zwvV}YDUA~U)Rh<omLflWAn_g+cnZUgLxW3 at g2E};iBOhju;z3c-zRPEoO32j-bwZ1
zD@riVpy7~y$*YdqhmbG=y33H_ErYfQOpK72VEP&yatME&Go8QR&9JCQ<c7A&va%$&
zfPQZm?JuHuPK1HNgFAsZ89T0aW%24~yX_x)tsL)kXT|>iPj|oOxs#9M5zjA14p$$4
zUw8d`|K6KjdGRY>d-b(He(=`o*L*AR3(VSv3MvV1q_KD0+KpWRRIvG!Sg+5NxXQ_A
zN3z~7`fMTR$75hCysje*+4KNlqdo87P)RqBoH!Kv^QqS^L|p+}u at M>>2<Ecpd_9F|
z{hX13^&1VmN-}4^j2%LQdpzIRc}qRA%-3LrT>$11LInbOvwSed4UKde-+T=|MDfl7
z7+nNhrCfT0(24sQMRD;4ga;-t>nzcglX&k$h=ElyN$OY{90=)sS`1=3)cR9 at u$@fY
zZYhDF9yyc*U7DaI$g+)v0cz|3$v<@-bf+p2?+p5}JOSxp3O0C*G3+iB+R0k+%-d#A
z at P!5fz%~Es%@b+5-Z#j}v(G3<CUA?_3cbxNkPkZ~Kye35V@P)i;JYT?%R)~EHG)pC
zjMmOJY?NLJr%40CmZuwR5{~{xW+fg>VI2+mTxah&Fp6 at I>wDK4y8c|T_rW`7#r~U9
z{fC$zvqBEyQB5Ye_MQ*dSKj+?zqV{=&%OTY%g-O*zjrk(A<Z$(1YEe0P6T8MX|RCG
zY_!YMPqKSELF|!Mm-);fAQM%|iBv7hp&X*q53}s<iZIH6L1Qot$;qyTdOS&$iSd3P
zI28^=?AgEN1Obpi25b&-0!cT69w^A1A+v6uFn~JxNJDcNq$;I0iD=J6r1-r!hDfJT
zgxwLiJMNc)2ngjxvuuc+s`SMrw0cuYV|Z+Ae_L~`$e19^3A0XC&gn-lthf$>_N<$e
ztRiL|tT^=EI=!M(%s5Gyv%J&(J7QswM7PmA;J)`Y>aPf=oA!vIvt(0Q{4C;>Vh2Hd
ztq9++BntxJzH^Di_(X(-^sFL6bPF|3O7tAs&>^Sm)5c_8qsFY~&4M;e4b*q~90;Mf
z2a+i$oCEVc1QIx*^jZnO=M6l2Gp_65tPRd@?5ueUcJ`XLzl%GQPWMZpv^QYNX7aX!
z0>}%b;KGHfZkNZuDChpYH_nRvHwDMXS~rznxvF at ZZSQxFzW;CC*?-61y7l0Qo_pi=
zOV2M47gxJulD454IVxN!8kFK~X<GtR#MpI%ISgk^{@Ka$q3=X=x{ElyC_`o=bjg|b
z;IPo2@EFP=Bg1Fo*sF_T>M_WS4;?3Y%5;S)ou?Ci+b2NPoN`J!FTj+}$aV)vA?H!x
z6~mWR)kfq at pfv$725gC|b`+HzI4XH2VR(x}WU$#IOhMgikS?lkk3q#g#Ld-xQ1TH-
zjP_ZBq=lCi7|K{tYhd-wQ76RGJ|LeA at B+~q_z(a%J7|3mS47P~=#|efHjO at 0%q4X?
z`ln)4K-fo}Dx#r>GP}w&HAHWAA*^-F%57(6!=^boa`tQkr=LrV)DsOdKZ(!x*Tou&
zbP`Tlzt`lHUuQ~iy>#q)_V(u)PQQ+<oQD0!L4;#2ZXif;U+KVM0*A!_lA}{D>U62*
z{x`f~+DUdFc7WM3IyM^=f_=WhObts_U5ouWcgnbOBM_>?P~UrQRek at hvts`j1oQN;
zh%q06etFybm%1D8|2ubPmp*js&fUdxZ at vE2=i8&^v34m}M5u5j!<D9c>+Jh4^@<i~
zX93Q;7&+0&<Wqg#-SzB*A*&@eS~;Y1!Xi3Q*5Xj=9M^mDA)H~iy}f`?e-=dKK=lN4
z`hty-oB*S-n-&@BJKV&t@61WLQlA(pG6-vudHfUzWCb+nN>u&dlxHqn=vW-zr<5S9
zAl;D$mP7q<sJxsBmpEbT(QjWZ3yvVtrSDG<|B*F*irWb~5Jg5t{O(59%|`WY)_P_K
zbc}$E9x4<K<Aec}mh{!v7NrQfBsznX2BR445Mp#8405y2-M%<|yRmEUl1i8?U95Mi
zToY)KtdqAA^p?m0l;Pu0C^McB%BO$$5;o76r5sZUy-(C8%4PmElpO{+gDsCcW&<jP
zj&w>34uLxpwhtGz`SLefqx9XuI at Qnhem{vtB?w6qkY})&3o2UOkD1js(Awk%%|(`W
zM#5KC^4N1{#r`h=+fM=AqEsp82>Vyx(LM5kfA`L4`@Of`eC^d29=vgIy;%s_70<{?
z;Yx*PIG7)Iq1b&$J{jmUU2~B0gj3TR10a`<N6KXWbXh~K3=B!QbaMTRoiLq(LuTO{
z$&1V^TA6f-l`Lkh(7KFgAnPzvf?~4&qpXO;f)57M$mp0;Wz<jw@U~hkU<Ba;p3QYI
zSplp6JIq4ZiP<=?q3lEuo`e0HK-Zcq{s=VM2WX6dHg(ZysS1}MC*{+7gNTeR1W_Rv
zlw~6)->ntzT-0X;lA`XSNEXg<K`P`@$1LUu#xdN0tm6-yOy(lYlDhM#+)Q5jP8XRR
z4 at JwU<@E(<WD|u1DfaA=e9^=yOLzS~36aqi-6*qYM%u8`83O9r=NFO#Sn`%hlh=U0
z{C1Q2FdA22F1hHZRbll(V(AG9gDEzq6~sIO*<jres5jP<VGg6Lz3-5mXLDVLq|5+f
z0R at Xg)Q_P+aP^^F{l&9l|Cdzs6XwX#vCG311ui`HzV70C|L*Mv$MoFmFMZ+p?s)lF
zx8y6nqoODoR7rFRR(I1fgKV<`N#P+(vwVD{th0}B3=J2zLsmds4)&O28dC@O^2tMv
z)+XkjvI!8jv;b-;u^<oh;oiB!CdJE{A;>Z52wPZT6*9L$g3ug9W2nfg1kp&X7cc^2
zY at MhUeSMxNPmlD$(heP4?9m7m0;Ic}ITSXK@{%n-BP8bf&MnzFFE!fFpqvO{C3U44
zUlB&phZ8J8<8LDTExn-{XOvpxiC`!#4T}<l=3<gqpcFs@76_s*KBwh<N(iIe2~zsS
za;`~DLk3$n%4yxmfK9UN7lvf+kq#Vs7?E>zU=|#n8jxskHdsW<=@)z+ZA<xXD7&sR
z*V%PAXkgaXd$i@9P`U?$HAIrK&nX$$t^4xFfi%A{;-^YN4<&=7pE2a=b$tvBnJXze
zh7?nf9D^`{@4}l)dB?}jiv70$+R+o**$osho^5s4p8SzJZu>pAUVZ6>7w+G=ecdmC
zdMPu<t|&@@a{y!v@){aTj*N1xT}vQIIQ@{Xo~daK!yj^OPO@{>nK`}J_vQ<7BcVVx
zEPGS3)}A>juKIOA(irHan}jZ0K*VK%+yX)crqVd-0?^oW2L(t<2+!369Hoj+MET@I
zrFQxT!zlbyWUX2(T18?w#P^_$>=e?y33QDj>9PcP7bv%EA<IJ!HEU<AY{aEGcv^ub
zXF(ff?<CptSZt5k4ILk(pL#S$z$de$K#HB~&cXbI#Ij2*%sn!ANhnQ+Lf(#1Hfsg#
z@+rjqNU%d9F3Lkz^<00bkz}w;$kd<Nf^tBo?1MdohErv-H_j_Bu=W}>982SJI_FJB
zPx+7mN_4Wb-v~$McSx3}Gk7_Qhh%S&4s4)?MlwP6x<jZpu6uI5McBxY<2>^=?#yiT
z*1uLFxLq(7YBx;<+Lqo}6+d`Z?Emr~%BLnXC=>Kzlnal%x4ZD3AH99&t at gRsZ~f`>
zzHT0C4soSxrQiZ6M~Y)gYj;M`SLzcYs5L}~u-3Am$MBH}xl+$0>)i$QKH?Y(wl>n&
zHU_s40__9RsU<RceS+{%U_~|-_f$fc-ApBV>tYQ)CyXH&nSW5B at r5WLX2FYuYeQ`l
z;u1HehK11gtt4p~tR_;i10Css)V&Gzk!7*~m6v;K3KQC-b`nnE8(AqECkdx?i7A%O
zr5-h%eVw+5MU{2>cA%#s(Z at l8i;U4!8Y?T-NPGTREXi4%p&g#+g>WR1?&_ at g#A;%l
zt4$I;4<;IO5kxwxiLP&3rR)>Ape-qb(xH_1wTW at H0i?-;c227N)-JLzglzOVU2>va
z4+tMzpAX>*<YXgSTb~0?1Js!Y$V`L)la2WXkDS5Jk!_q$vm~K4MqYGbB`$4>9fNTM
z3M&Y<AtLqha{9Tj`|tnKS+V~Xad#+73y(!i#ACL#*WGyk- at ZeW$8Wv-!k at mdJbL}Q
z)DF!t&ER}di~^i_&QPcMu@tj$Wy6iI>3;(O3iVx&IS6tVQnhJ1*(kgUeV657cJ6D3
zkI=3<HsUzz_Bj=rC=QLG7aoy;qc#W}p$r-p8ZAI%*2krJ;8?JH262#!5Ly5^mx_ac
zdtqD(5z(bDgYCdj%B1iN6z)R0TDj&}LEIb|?esqUX`f&ME3%N2phB*Q?+XMHLPB66
zPF*z35j0sMAX+RKjKk)29+ at sy7Ikv5^e=Kiu-sQ7T~G@56BES<68*I}GI%M&KQjB~
zI1T7E=29}5+V>Q_;EeJ}r|1%7;-fG|AoF8KOiMGdl=Os#f&Y_GU-X4CV?R2Ta4#We
z#FS<u++~nW7F8;}m@j$WtWBo_*vD=R${DE?4=g)PGFyk9sRnFF3QV-=e%EkP5ZO;g
zoOWk1yP0SXp|N^3NeAFq2>}>`5U{H2myX*<eq#L2|Lk*T#r|9N$bv}>hmEWqX2#_w
z-rrq#*WbSV`t7^Vz47XopAT*OSaYAQbR7yF1EsT&@XoFa3r~?#u)kr4oyQ_ZTj0o1
zr$LxXj0L3iMepFP3 at LSN8^ocHID<oL!kuAjlLx%OLPPYP-ZF at x)*?YjQG~kmo+jG{
zaD^!Q*Uq_65fl`PPy;DWrC$ci&=_6l)y|m&VudoKTvN7j-DwBa+)kef(F!OpY6fi#
zr7&@kDUB3HvSlr?P754^*{#2gwze8V?(I9!sKAi#F{JDZG6B){HrYjpEooE0uo&Aa
zFYrS(s)_vJ#g@051WG4PcxMN?MMb90*A2A?N%1LW0ictd?x`gO$oKVHve$>*7n1BA
zhJDk?i*gW9Lcxk(gi0Kujv%Ip4K&^v8z;d&Yv^2bbB&=#PAHpRV0)DHl{=?h+lk?%
z=O?E_Eid}X${`K!1(>#UqHqF)6)2cPYIJh-4Vt>G7mM*{+Wr6FpY6ZvKl$2OvHuo#
z_`r~tn*y4>U~Bh$cjNp1?wzi<dh6vEzVyOs`PTKYa;OhwMg@8--&^=OtLrX-HZr@^
zJ9_|@7;OuKg(|Nl`$*n3*?6z)qEp6Ab3LP+vu0!b!yGe-hWJkq52nVL+cBh^v>T32
znK1`fbU8|7k$}ltM<)PDqjBW#bv7CWTkz@vm8Da0N_<r+jIHAO_v7Y3I0AJ?S_wj<
zYTWWX$Qkz;IaM`)G0I>I^LZy{&l{JZg{5~{@dtyXFgJ?cGlGpJqYLr^J#Urm_du at R
zBmulJo&qIjmDJ%wdW{w*pQH38B+sKhz+C at 5$BDv3J&-~TpJK=EBlM%Xion5w*hBJi
zp<J_pzJZOjSPYh@wBfR*9=eJDV;Wc$451UfPM9*Wp`3(r;(~i))~p?ro`6Df7Eo_x
z;bQ}r5U-3+?-+tIZfAz<oI#gG8J=a+o{S(|L4z?Ga9AP0EA>(s5<I%PL)V~Qwbk<v
z+z<cM-ur**i{t6;nO(xSAEa+_c-FBN1>@Q~zrWjl<cDs*dh4y{?!Ecq^YH$$_L#18
zL5gxjC`-F6JoUzEsar;0)HmSkYxQ-=SYSFKxT5uj-u}!}?oyDgx00Iov^UJiCI0yV
z!qkH>V%<_?JH&D*<Ta^>`Y>}b5t0^~iM>gUIn=`{MjbMO*z%GzfJ7ZlJB=$Oh0B64
zoSVYiDopn-Q%L(YU6?}vG@$ZA1|1nx;B8WfArcVN0MuIaIVNlcbLuoPk{EAYN(^j;
zd1Pg_gG6^xTlf+RgBw`=>@$Fu6XPcqJX<`kQy`<>Li#}S$TZT>bp7`n?Rh13@`zs9
zNFX(LSul$Io3x~cvZI1FAh{?iO$Cyv!Q=eFJU9d*Z$8nS<8)|6US#uhtBhM2LN>fc
zE?B!n*O%qIHuXsA(gCosx8i=lw(b%DcncJAdm!G0*!Kn$+4M*tXMau;5LJ4uas&1?
z$gWX=gOd?L)4?|ZU5C02^Oug=OP{%qAO5NB_x^)V>|TEFO2nTTp?w?Dc2ad@>S>z0
z7p`?zzwgKHtlGU>uYUE9UufzFkDzwd>If4m;L55;A}AOypG?P?iFK5j(=YlWQzvm^
z)|OVA`1cX_<&f>IHn49}3&bZ2`w2!+Za1;f*CzvBqB&a3V@;fYZ|}1+Xr{A(Z4ZbC
zkx6yPr=>3>%9XvrESirC>C{9mDD0xheqn(p0idaxr*-!YR;oee1XApP#cKg0?mcbT
zTrPuT{G*;?sD-=$VQiZU_1_mTn7lzd+&6vFW*w<hY&st7B!htX5Iaj`Im31x@VZ%;
zS#F3EP%te51q3+D>$Q?9aSsr`TI%f)Y)RXjh*<|4tsQJ1K+;nOPqZ5$)_U$CAlJK6
zu3vLKt_`ysmlM0&#0$0WIoFqH_HXQ<*Es#MiLFB$uV-Q)pit%<H3Rr1>PnPKEg-+p
zeF^U<fxzhmDrVppMDvab8YwB>+hJnYl@~}WXj%{7mGv^5f9a^c{+auSkN-qF`O$xV
z{sYf^VfWhmRvM&p=4b!yjq2wOOo+kQ1-|@8A0L1ISN`G6aOeO1>zB8h|9ETSKXC4f
zRC^bJ at l;S2cJWts-+2bw020!1emxzE<z$3ghMf}WqA8CrT$iy&zxs7f@#bc}4@Vg!
zsbJHA(J!fp2%ZHl^eRQ|nno#r!$|?*Qehet0LEJUMG$DJzBX{i)+y~K^lR_u2qX;x
zO7+L*Dc7T-+5i9`07*naRG4;^yBsrYYgNUD!%u3IAq!A#fwn#f6eT>FnVq_h_nmq0
zV6rfiP-|9fX!K^bFcL@$ojaU0ug7o{?G|jJNfpS0L|GUR2Xbt$6!a*xI7ZI$Y(?~1
z7<y>*0pCLEl at o{uUsqD-25U$HK~VQ_A0x}ig&u~9;neoaM(Wnmuw?T-OY%(IHN$#7
zsfHbdk5HdB#hFF;iBz<_qmOHl{=6CdXfZu*cnNP#aN9JopRoD%wjkz-THuD2Es_-@
z67~vn1?fL8uS@-|1%ec4uwB>9_Q7hk`$FAZe3s|${j>RFKk~}X6Mu76jpy3v*x`Ft
z?7yvxeeUOODaE48uzU9&(5HXpquZ~4`lmm%Kl$2E>`%L=xA#JI{;I|yj?5#83m{a5
zrrET)oV>sIl^xc1TI*3gvDk~~WwSB-Bnx|Z+ee;+wRR|+ at Io2HArAYiKG29Qmawpb
zSs1?An8-<C334v&EeKAFJe(G_7!H9Jf(DGva#{-nnu7Q|;HJqDlWgn`%a<WXUjloA
z6at>zgr7bEN8SoPWfaH`2->SkSla6Z3pmkiSwRCrW08!8?FVn&9_xQYRA#QArdSmO
zmfLF<37}w1_~t|*6<J$s1~Kz3i&<ncY9#5dLxyc`ygW2KLo+s$@4O2sj6<)gMh)1|
zWZ!MbvJf&R%+P34o0JG^<t_GxYem*@_cbBv#`swoMl)NZuFQgTiL&|+4gOw^-w&FR
zzVBB*B1s2i9*nXc$*EX-uj|N80=?b6hj{%tJb+fV>!v$*uw3re^=fwDi|fyp=RWvn
zTaW#XSGKQw at 2VV)ZJL!7p(<w?wBPmsz6DedQ+kw%0<^;T@+W_5{Q3Xqr=H@&=bpJd
z4>z~w-HrXrsP--b)0ql)guP~`lGEt2U>$qLN_bdTKcu|%h4vx&(OUci4??dWR{T#+
z0=58#vu-C(Q<A|rAI$4LI$(zU&g6*StHmz~C3UBmQ5T`GFp@%}`J^%WX5!YVc#3xb
z-c3v!@j;oCN1q0*4z)0j#*q2<LPm2qlC0oIrcKwoT%s{J#-JuLHjuQ2Z7&gI1vYzV
zNQ=M~SXQ=QXmxTy3*iw6WB8a{C1Q3Ptu33w0OKC4Op<?vrXy)*PpPvXepQS>o&CR0
zpSc=2wHaFH?LApmEiBeBNPkU;`3Om;0yMuVs2*6)h~4;WIa%P>31geOd4yCGd+0Ko
z9P`&;$tFuXD?KrsskTxwRklw^uge?aJq188Mos*Fyi?6bXFr1v5Gv5o7V5COTpZ0_
ztyl9Gx_0&~&)<D8x$$q++mHQ?gXzw-6%E)=8{oOKV*l-3?DH>en5P-c_LuRs*Iyfd
z_Lu+h^|!wGvo|kJ?>w`+g{QaoLbZPtn9m5+SPP~U015~4osuRpe)GwW$s{+K{|#`m
zzzYE`oKp17+vg!n(DbA!H2u`;F^}S-!FZepI|swSnaD!5qYXevpBZ5^=rm*ZEh2EN
zU6DX3uo8cMAHc;E5VxZpzGI-Zz~|;`z|j{KohSrcor6r?36v8EnFWFUoGR?<lBh@!
zJ2(MLZ7@d(CXW!jP8iV1g`}~98Z4r23HT0#dwSqmidMWnAf1MoQwQ-~%JC%zg5MNW
zQ$Z-BaY|wMu$-K}ym_o!S07nKO8<+Hk++>mRPiDm0B<wXp6KQ`K{VLhr<^G4>u)oh
zYN(d=2w(&bStn1Yr7HG0&KZ=Giw`&D;Ofq#fcRhxT7mffzjr*vDr}=`XZ5PyI;a<;
zWxXt4M0w?-(<>kTv)N;R<6wUI{j1SvoPFP-eozwkGQ*hCvts`pR`79Jm)`+jc>Y(%
zU;4G5d}`u9`^?2{xjCP<H}<cg+S_APV^--q3ovzhvvxjpF`LI<gFLvOdE?FVu+Dxx
z1Uhw^Sy4SvXx5+X6g+=Z(eIy6Vr<fhx)G9(OE6P3D?;YsP8p_6Y!t#Q+D`(5umcnq
z0k>}gE$ccx0mokg9lxd!ND)BeZD9HV1Xn5KA?n-ilT=<5a*;+;pLnDi3-nmJ_bm!8
z`_D{5_O`sSVgf?A5AqKT#wiS^HS;xTZ6|<atQBdqgUTqDTot`^$PKz{NfC#k4=eE+
zJIK at mK7hDO9evC%U^9LblgLTv5(QV{wFg^hr|vv+_Z$eU9^S!=Jfw(YGc!jgm|mg0
z2{KB!JWIM?@<wBb%j*Ohf)OT=``O!P*xBFB?kV9BI^IF;XQ6G!50;0MH`+tjwlyEf
z_{y{8h4&q7UH_rw<oXA1P3ISCN{37T+&x@_4O!ITtk{1i<N0~P2h^qV*2^!9KlSrJ
zd42iHFW$Uzu6|~>YM$P{Al3OxjM=<UW(PV@<sj@Jz6E>fVH4@|VL<^DqI=>=C?_wz
zIewl4n;{DsNyRpHJl655;Kyl5HP*)7aC+!@-)Uk{95ziV>rWGC7`7o6&LSCEHCQr`
zMi*Kj4Q&DLDp2h8mc|G`TSFdv8fa^ESSSFRJpmbC0r51!I6$z1pgMsdT`KSr2+Xlq
zZ#dj6kb3ZU*eUdb6{x)fq1H494alzmu8mn_KKg6Vt!$v)CRvx#szBBjdSp--dfyuW
zA^NEcAgu5cMJP&YQ0R>QTlZ;hA}2+48 at l-j-+?q|Ri~^qTpt at I#*jZ-&&p?sx`K7A
zU5v&HolZ_UDK=d at e9E{QVVyyN_oPO6X-}`Y0v%>(!xrkMs#nL=L48E^>ew%Zc0a+B
z>mRGmf6rT!tKU~|UH;&~c=!6saafytdE>Qy>V0xn?7uUM{Q9V<<EcUq$BPv{`78hP
z_?74Xho>%Yz44L#ar^XitEnzrBh2?4#s&07atx_T4MS)e-3c+B>{v1!f8(agqFDRF
zyK&E(V4V&Em)&H6hPkrfZ0rrgrR*l=&ZcX4u)Jeh`=^qa6h2w{hP4IY+VYLLrxIcY
zls5t1vz9$TLIGO70v!LTLPY||d>1sk3GkLVZo>HcG2~{HAejKKaFbZ%c;b!se_z(=
zA<{eT5JNk7{{Yn8f%tps%89OL;t(12Q)!nfurtqpD)i@}%2b$@nyJ}zlc0ihZ3MHM
z@CeeGP)sKYNC!}(y9lGTsuzaui+!TK_J^*9bjL6rInk}tDZKeu=La86q{y-iF4g25
z+J`+Wt1Hr$>EvM$Awrf+2a?2FGB^|@I1Od@!`Mkdi4ex<!WfHgj@6>5o1<{hETr~L
zap2wlv!k7N9#mI89OhR(_+Whg9j}k)=R3BX13du4$z-y(Dez~-{;yEMU;pz6mjohw
z?)iT+{-a<1$WvS4Gymn~J$cudo2&cRWpwTmVLH-CEMg#xDjlWUMmhSK)V&Wh$)nt8
z!vQd4Q*Q3Sm9`hwFk8};lef800bfXRL?j1%z1Qw~XP<w5r*&yzs4nY^ItWYx;ynnz
z1K?SLyh7K3kH3IWA3{O^k4M1XlK^c&q=d$hS=S0<VK65P2n3%xb;=g4J(L%Qhb at If
z$<s;6ASZteYF`HYYXBD6-*GAQMGwPRU<=C#9wTrC7n8iGG%*`Ng0qEiUoe#ls)}U^
zEd(o&co14$ETaX`ng0(mMRQ2glSICI)EmU_CR-%;O+(Mu7m<E_PRWuc(^@&5VzX<R
zV;%s@VCfnuybhG0oY?6HMejFWC;9c41}#sjkYz>}rfB^fbz7lcy1G3K2hFjs+f|2v
z`2kHXKkN4X+QH=NQ}z7%_aDs9y>nHRW#-lfJ2-po!Z%vr&x-wD(V`y%xD!*1frD3G
z9Dm|tKlNDi^1punweySre5-7JV0+J37q2@^x3^I61GWFEN)^d;EvPf<Tr at _@3VVN3
z8LT5G8sUv2@Bq%qE><#CVd7}7UCit6F-hFb$PmHkfpikjKf!*WA=I-@<veYo0TH}}
zOdMkn0bc^#;~*X at tH&3R`W|HQS;#^_CBRpH0D<=qZ5y<Jw8pT(fLfwDivBQII}v+&
z=$ei2`Z6#^86w<=_*X&U4T!&=4ld@x>=uH?GGc1~X%4vamIDBgo9fpaEC?OC at D<YT
zH8ljGF$kvxd}|J$jcN$6>RCFeG3YGIH~Jdc_i&=XbL_o0FI{~`*Jl9Uf#L0-)`e;?
z(?AYcXpUEl at VNL+pG&f*jHHAtIg1<+I!#~ehLoTn8V%UV2;NVyTskz%u4xwTwWb*@
znnfd_s}5*%@mbz^;-I?lK1?rvsGeT>o`dP`<yFDX(#Ue?au^^VKR?<4-JBKs@6rxG
zLOI&ydoUNcw^-m)|M&kod-=J4@`IOmZvWR8rs3(yq^>Spci1}*6eGLw97C!C at Lj*W
z-B<wSgr|0dU4z>Uv8PTs!|gc*ZQIS|=%oDJ7zHH5f17uF6vH-xY{YVDO%6FI_JMm?
zBFMncKX!A0Bz+8h?3~q@;t7DSL0kz5Eyy$E`16pvZ-GlduKl2L^ksoaYXmGQi at K~(
zyY(dm`iR4<R;KV5>31uzy>v)`h`FFb;hC_6gf}7n9-Mze)xPB6z1K8HR3Ir4Xaw*s
zm?rRU2FBFjCsr#53E*h(76M4T9p=Fbeg~0bP*_4}1qz4ov@$owkcFYIdI48_ at 6`3*
zecBUo&n}{_cgKuWUFmZcAVu0a5v%&tNzmu<Lsm at QrT1DE2k;yu$Js*MsRYma1Uc%9
z6%d-D352?tqG?LB$4hCJ{<vM@cDtgclj61%7k?VFN53>W|2^IO$`91 at OHUq5_O7o+
z)nowwr2SBY>qOQjXa1(ti?d??SGB{>**YW$aQMUD`>pY3e*Pm*ZPOn-bA3;4PIz@=
z?+R7>mj$zlT~kbuaj6$s(}BF0XK`}L8u0Jep`5p0a7E***ukhyDFlEzffPNXKp89#
zQ7C4Zky0#WSODGz+DXrw*b54!<OP2S_4NA%i9r+WK)4Pnuczri>K7qz9RMQ-y8M*c
zBAaKw_=MjB9fa6ykjZfSa=5 at 2I^h`<h<iwi3FKWWj+>~BWU!EkK>QI%jsbrRlDi0D
z0m3oFuafIT-$jpm(G!mm#4!AL=!OO{dN5j2s8Tli5Cx5iOkJyW!P0>#re*ce6rs}v
zId%Q6#tuha3>)lYnYa40D#aAZI1aWOVD*@XOFN6OcAdt9Tp3IgNC<F|{u)%oCal)k
zou43tfVM5rtQe~$&@Q@VsQs%=>*}tnnvQoqhuNb)TkJjg`t;)anyt&<`|9M}<HwWP
zE+Y1xA{j*n_<LmVYzi!STXpVPvHvbD{8^(NL(by`!_0W)m6yi9^DqC=_4cbDyZP9q
z#WUN~KE1WuRp)LHws!>1IaNWHCB!k{S9%Wz8mj+jU8+t!#B$Q2yD#?Z2 at ZjD)Lz at a
zhAdG?1vlYsp`Dz~5wk~5IdM+x1Cl_CBw at QJPpuwu7|`^D0ZhSegy36{uOatpU^0hX
z{OhKg?XoIUWYkAh{WAA%l}MiHB?fBKWW%;L2_P=kp+N%Rw9Hlf+uOC_ZEw<xZ$xTa
z>@L8vgvdhq{M71qgJUhU;w?)TDG`b!sN$Fal5uvHM;q$al+11V-eW;lA{N_Hc$qE8
zDbosIK-Z03unOKfb2u&_X_uhCC(?t4d`Rn-bP0eFP%6#T7l1#~901Y7OAq2HIuz)-
z0&N|zsDZF>zByjq4Yk~9eb;qi8am#6QKpZ4)a|_c*5tzbWOnI&NAvSHZ%?+)H-(F0
zL^3+6Y+SD9*Ym>)`ZuHCpB4MR;)NfBE?;4t<HZWU{fj?6e&yr;(^EIj-TughY4`NF
zYO0Hm3U>D<D60;H7APDritt1*$_+hySsRP$T2c3G%PaKVqp+MP@KK}{==5&<<gvEl
z!6(&<@^#)Tlrb;{hHPHVxDp&>A at Ukz(H}I at G4LRO&OHj5zfTpfz5}EN+!TSvAhfnD
zEx^v12R>VYFf2Y$nrz6-&H6|_v1x|Qe at x$?*a06L;6hXmv+~>fFAab<I%w!^G6uV!
zwwK%^C|_Sfzmz3sHV&QT1H}AVZ*WZft~*4Vh(y3K)pD|t2+Q;u2sK2O3I`dzGg at 8<
zY$8Zsic6bO3oPsxtxf=60z3g|rsJcOpe}$yXUb$fBs?lKp3ydhrWUjdk9ra6uv{K=
zjjz2g;bnf<lzYF))5m|+ZN20E_`-WJz4+vEdj1`^=G*7%vd}CFVosl#SV+yL!p+QY
zdkOaiKJ*92S+PHRydBK5egOp`eD?X@8h`p<|KwA<;gio?+xIso#q!4fB~<6H5+)N#
zp$TC;QejooB&!9D_moqaIh*kuHri!uh?C!=MTRn%9fGtQ1zXY2X43+9(?T{1&LS<3
zXmi0|r?TcXQ9lER<byBjwdrCPzJ9|7f;0lufL#7Ch|dACf^^4VDgZZE?-~|}u-^1U
zwu~%#XofZ<qH=2M^HWWihUgcLl<hrK!q4`cV&9*KaA~StQx+qr%O%?)CIC1gzc-v7
zh5oy^KV%b24PY>rihP8Xl8z%<C%_^mgB^ta9>~8A!J+N|D41bLVT$gcl;QR4SYll=
z(>93A6b at rhm?Rhs(m|wwNI)A}w5>;1w`dm)R!b4TI6iJy_3gIln$AxE-ae4((zDpU
zc~I`W8`b%D`^o-0?@sq0e{;UI<6Ti$)OcUq2fhmrZB)KBkF#R`T~_cTzN%IWz$>r3
zGXD6_{WsUUm;Tkw8<$tl%(;1bYu8s7A0f==0bJ@R9ja2h7T@%29bhANFBwlcvSjr2
z<)p%Kjc^dBfQZ=#8iA-yeEfB4=epbG5Y~{*Q$WO=dEI#{45olw+%;hC1TwgU`oLcM
zdlDRQ96+<nz|IevyX6Yf-37TR$n9wn<dM~F#e{`iQgcSThcu0(!$`Y+?bL%ZuX0pC
zvPeOw$j<u~9Ex;+#KSWF{lvRx0$ZULj!;i`;<Fi0K$C)-5`{ANgHgs#XZ8vjb{{<S
zGm$08uR!tu2=@VcfZ$ikkLOOsZ1zPbBWo%kTqu>5W?-5@!W6_4O=qH!9VTi*CL-tp
zqpMe_n`6}V3eDktbc;pZuKYn;uWE#VCTulQod2AgUjJFzedp_={r6yY?mhMR+ at lB6
z?JKMCbfPGqc{Qk4mCtwyJP>hxyA}DfV*g#f%vHTo2c`mx#R?z)<)0b9^6`KC)Q#O&
zKe9V+pPo;e>cS(0-E%-u+BGsNLFEX+ufWk4X2ZrHH+UeD%~-t^jZG$Nusm8V=JxlP
zvK!f-DDdmnwM3h3n;!=C4B;NmM(7O`&J4fr9UKX009ggd#lNXuHQgcL9{}MPGP(e!
zks6GVGIGQf09<xxp=YgdEX+mEm1jn<01q+0naJ81D34=oo-Idnb1ppyv+plCmKybw
zTw0b!V=&1a9AnCr;`nV28YY-YnLDg>MZW?|4YY?=*pE!~)q;GJTsrj)&Qzd92Ep(g
zz#K#q2xcIeqG#z0r?Rf=&^Aldb&GDXK(jc6KR&9P#o<BMuIk_&x-dgmZXfXI%Cp$I
zc`(^|H;N1ImihU|kH)(<Zcpd?O<7XDoC4V)*jpg*w{7=+R_xCnrxg5*twW5@fAV+7
zpZbN5Jhk0@>X~c%_01_aH}<cE>fB{uT<HzT1t8T_$KtlpWIvS`ssr<eE_>7B_O!+B
zX at 74Mb@Lm&;UbOgWbqyveT8W5#%@sTBcp^Ys9aGG8c5 at 15kOn-0=7N`Y43ym5u|wm
z;`Tx1RipT^LOK?Vo|e&Ysc`4-Q at j3*6V47PtI<P!ddzDjdG;75Th<-Jd`2xr#zcy=
zLbrannFAw<1_}~`g71Cn*_+jTfCR4`d%pza2;`3-atz?U3cc)Lh{c_F1g0$nt{}Vz
z!We=Ph_=9(S@62q1v>_X0zo>25YV*&-D-(?aSzS$U9_tj_0he?uZ~{}9t-civ@%8D
z-2<u4Kg-i64vM{ZVSM4;nC{)Ir~5Y!rrVcRRW(XXnW%M8rj;M4rt<~qCcVga!sD#i
ze^(d%*pUSr#|zxL^~(6;ANy~wuU`B=Za#M5_?bDiPj6rJ)y3<;Y*vDK4A3EDGEq~k
zt_E6qNO3*gSu=+R`UO<~dkE=k<l>iz-CLAju=Jw0yZO>{XH?D8I{bk|-wOODvDRR3
zfD%%-Ah(Zj?(cv?4K!~8?VstSGkFgPB|JH$0~V!q>|zIi{<(zc#e>9Q2Y}#Q!j at EX
zK;}STi`qOBn2cK<x%V32YnXWk%h+L&_8Uemg;4r+baRZ17Y??lmDb>xV~D>83dXMw
z4*)q%Kfew<W58`g+%`z25ZYEu9b<)FP^P9sP1pz_D4VQnT6A@bre2_19-%q9hj#G*
z-RgcFR^36{)^#fkPg@|jce@##|7nb`eTlap=_Y&c!sPrr>-o9I4(7X8R+H%#3TMun
z89X)oj(J0)Lf=%r`&qF+dwff~e4X$cFpY4uTH at 2c^1qG0`tg7A)P?!WAK4$ZPj78^
z)s;sWTYC(09f$!Ql?cqBP^-P~M*cnbMK+0-4E{(RtuaZ+;^(5*d at A;R5f%%W&`8g4
zYGMC|scI}~VW@?zPi~5b3t}#9M)ymFq80U(+4~U{=PX}_v|m&uY4s$iIHw&dR|=cJ
znMDCoC!aGn`bj3{@sh0vw76 at Cj7}bu at e4&rshp99>NT95ZJkJ&WrVtYN-}hd8N5mr
zY!#*n3&0;ENDU_oh<^Z*6@0jx0!%!&V4A3&z-=M$Hi%{r+R~WC=%guSpJ-)KnIQ!D
zPSE)pZQY`+S7;9(pj$jZyEsI<x?6Yk^1wG;-3bs-p>tb6dGSETSD(e!qX(neb(DKg
zV7B{cGv2=X>U8JAaXFb|S`~=~8WY-v(BbC7o=-;kgmYHx&mP~QRUSP}{Dgz1c9&oI
z!%vJq^$S1oR8{}}GuOB4o3n9qWB)p;z4L^sG|bxQnUDZ!I<w*3ys(YznDuUdoytjH
zN95JI6Y_eok0Pf2iHFO}_-ES4hIH_-Wr%VB#1Rm>-XldY<aEc^>j1$R*#2QqaS6VD
z8E*Ay2pvKA958x6gvTJ(oKdA6Isk<(V>wSK(xCCMet6}ka!e;aD-{CChUEiW at psAb
zGP)B;=s=;-c*L+&fmJvLg<~MxSNmmYfQX^f2;vG5Zz1pu%-aai1*tB3Cl*@c((5MG
zZwP4H7G2xIH!YgQ5t`!%XqSg*7x&Sw?zdgtydK)_D0C7!W(3+sDEAI9zV<9{T{|eY
zo<O;G6SM6b80}rFr(5R_#?$>(IWAFBPfwI2?bgiJV7U+L325oSlZU`DS!VNhdf`7S
z_Ggd8o6b8w3LbC;-n at Nl{QE!u53e76^<y`$oqO=iPPuw|=Mt*@ON6S@;w_Fq)i}XA
z>eo#}s6@!Toh0kL<?Rc+9ZDj-uYPzNEBy55tlZ~ZiM#nVY{5xvT=F#*iWDH0Z2a#h
z73u<nXTbdX0lolPeHGMv0l-RS{pEWRMvobvzJhqQr63+9oPVI!wSF=$_8f8U4E7p?
zVjzHnvq>lO2NF?rX=pT}QI?>v)Zd3AAly^RqXnWU^Ji at Fi(^aXngcWj(FBBv{(MrH
zlVeY&Qjen!tpHu;(bWyQ<srJ&0`=k$&EZ{i%ex5mQ7yhZXq!-b4|IVb<s5<b-U#E%
z|AMxz{Q=Leud3b0G2M9#)BQ*5@y?}#$!vc$9#0I08F~Yyy~;zWkG(>5y|6!w?*8>n
zh~F8-|E$=bJ%*R<25+6FY4Dj}|KG<iJon!}b!Gd-k6fs_rzhLKI(LmRod=Z0W#_6g
z7&@4t8cuk-^iy)Q*o`kN{i0VkEyCnPLFdTLN3h^=>W#$KJap8JaI;gUNM*UTS}>Vb
z5VQzjxZwH_XqFT`XW%xZd<0ZI3HW1(KL&Sy0tpL!VmF73KLB#u097D%2rzH_IO1e(
zhW+A{>=2MNDJAzs7+um7rxH4l*Pv>a72p>L;YdYM;TY;x- at r=?rb;_>x21GXt{^-C
z(F}|k0tyhT7Y?CNz at NAmc1b|+f=&W_<I$~_Xje75;|1#aF52Tmbjw5d<$ZL`k(Vyq
z4T0|XPC73Iyqmxmy9YA5^eoS=AGocn80|cP>E7cg=2zO;?&a4fvkMPqvzZj-X52i4
zO?#iWDRSRIOVqPsfA;uG$MO3x5J~FI7yj_$<4^z6KX_^@eBzm_TdSMXQFmj08P(37
zLsgmB$q`T#YN{3j$hSbNk%JL8jRk+bA9|R|wNJ}B8IHoq{ub~SCD(h2<>qQYZmGb+
z5Gp`iz++;b>;aIaGBhZY^5#ZsBA{XmsQwznT>`alLHr$EP|8~%sR3#ciYLM2#{oA2
z#KOR>`%WG+_S}g^7z9FIIqy)5f*=hzG$3ga!U`k{h>yYKq5&asQlJUI6@<nL9ns9X
z^08?aTq@>bU2uYl5FjXQF<QfWLDMwo7Kdn$?xR^e&?V{deRTCb$nv=MEe=AE+6Tas
zM(uf?!MpikGdlm9qw319($<ap<Gm*^*?APx{Tuac=jy?9=iF*M*+N-zS~@FJJ^J|g
zwa%K)3j0~HKYRQ|WBCE1W?Ed}?$=%$fAZ)5(e>qP|Lo=ySL<iyQa?>qSM6LROy`18
z8I8yYp)5em;2;RT8AiGxS}&|;bLuXjAGxy>tpT>bM$t5RY_Ndqbxc2hok2Vz9D*Ya
zn{XNK&Fe;K_C#(DUpxXHJ*J06dspEQEX*2!5yG1a#!P<*!a6k!PBY4aKq8D1YCsNw
z&;qiw2tnT~QQ1<mxB}eREC4D5npnJHk!+JmocilS581%1N>%EO#6nPW(`Hqps~2cj
zOSDJ#(Jt;|b^HMS at GgA)VA<8HSAC0`g1XTJCtz2>7jyV>|DdSOKg-ig2k;2-8~^|b
zyGcYrR5ZB^np{9Ny#hD8h-!YxPj)Zdoo=0fb2{7cRaInWU>S at j8dY){#F7{A&6d??
zkF#Qb_V{ym_xbXw&%0%Xb$;V##xMWgfA`d**WUcdxk{e)$M>u8IbdhsVKOOEIv8$E
z+SwLUNT|V~0YcZOISnX|L&#?H&viP!pYm~2;6#SW+Y**HDQPz?05Z&oxCDv|K=~*F
zpVNQW+y%=5f<|$1*J|;m(mMQOz+D8PKtKtmLd8^o(iWrbLllU)3gSuxso>le0*_K!
z6uiMwQYeIzi<!(plQ;&AFao?PM>~(ucBog!@XHq6;vN=<chEHr!tz1eE$+SEEf0^p
zNAOJ#d5L4VYCp(m??sHyeYBWdyj9GvpqO7mIlG2(ei@_L1&n6r>SDTmP>rW6SIseU
z42{mqIqT|jsx8CGqP}jfw@%YNE9hs%{_OD=4da+BJn!)PU<~y>dEqm^Gya2L_^+O-
z`18-)xIDf&^M^OcEvxyyV6wl1*<^x(k3d*xC3X|-N|_*N!Lmf~ZH9qo1t)smK(g&w
z&Zx-Dwl)-hg?IXV+}sj47IpHrM2>p`R=;H;XL9^Kh}#2rSA)1i4RrT`a36#fkcX6`
zfVdF|BY;O*oL!+ExGg!g%O9njTQPwXiAM;X#zXo}KO6Ye{R$PSuzM;I#G&&JT?aIE
z3u#-_t0Va3F`DHO{PGaZ at x9uw9vt|(u6-+zpxkvKATWcg`5Ug<`xiXD_y+-+2W9xh
z^zzEhE@QNP4dv_#%B?FH%`aj!+gq07om)jUuglRCt`Nk$@lDsqU{R`=9!^_cu6r8&
zRp7Co75lTtci7|P&6$c$6g~w}Y?TYVb^F%%cYp39*Wdi&FWkI%8PA;G<)>$KT$SS$
zCOZYDJG+?8_b at 7#Ai1Y(5I`9p#RSBqEe{323evU8P0wDlkDnW|carFbGpk`s_z{j7
zucOQdehdfW#k(R4439B?rQ+Rzv}gl>F<3;7wS#A}rRD_S62#kTyv5rPlz<f4;D=y=
zAEFE1umZXjfCl0lIFh6!4MG5o;Kf0tLMMQ?V(wdywqBrHwrG||2+Jk9<uTgT{kp4<
z4niC1PUByZEcS~6JlZ*+@&2=JcJW{|yNqIf4dvEljOJIhm`~5QquJi;qsi_AS52iT
zD>z1G#T$>(jF)czEyfIrEs^^$_4Q<>-XbHW<qo^`a8}^Yiv8K++xILm{(8pNsp};^
z^Kbt7_=~^s(Wh|y$IqNQU)<c<DQ@hJ>uNe~P)!{sd*?9OK98y at QMx0r+y{jtKs*9F
z5X}%kaK+R-B}0~3${?x{yl7^wMcVbJQMACdz=`0@@5MT3w0+PB)j+7$!a+&|c3?My
z$V7!tMAm^j5El at PHTN_CkitA)Y9O at Wb^!@X1gZ7sl}-yU=|K``q>E3Qqw5$UFq)Q7
z*EK at z;aA7#mMyww0l!+Hs~-g4EFXk6ywL@;)DePbz<DL_xDmM8KPaYq&$`)_1D;<&
zl@;>w{35E^#oA5x4 at T4NRWX{vIhR2!y<jLtS!$j3$rf9`YTDohV|jq!6YyLA-!~|X
z-`1;LPH8gEV4SmJfA;u`gK;oO8cZD?vI5cH)IF?o`_@;-pZ)d!<@zh1{JEPre(}fW
zGr7KZZd`56`1*WYSL1QOXgWi=vxmuiA5}HMsOZ3M35VE0FJY^|6zl=2)R;>MD)0$e
z7q1w-cFKh+IRS{PG$jd6VHutngfddTIK%MtLJx=dF1sZp1c+a0s7JSg54EN%1rHxq
zDi$(nzo0~bgUAG}6!7f`ZRg?JfOb{Gua at wOL)1+NX;%o%Vcpi<LGY-h!yt4ekmwp=
zw6o-D=M%;B{Ktyv<+ny#7vbjDFxtM1@%%E%`9+N97wXYu|DYUit%_=l!qK3kj-QO0
zckzirF6N&f;jxF52;{7+yvRTF!a4nqPMs)ac!Zxl&Wion<J$?_U+?UE0ABs-pNwDn
z!(Y38`wxG)I(p?Z*Tvua@#%~o-`<^E*_vTC9yc@@2}ZLDTum^Z&QXoGQC3s9VvM5F
zj*=1W5(1bcdB%u1<$se?djK#*Si?SISL$29cL?GkzSF`TJbc#x-4a4#2}&L!Ue%%r
zf*64SbmSl?&;^I!3xrU>w}hq at v~`27_Gpf4-`34tUoY>-YSDQw at LqZ^8V0CvAXk9L
zQ*g0!z>}S4-FWw)7+(NQ_EApvQH;-_obF<@eFc;G`7oZJf8ZuNuUFM>S5`$2v8=%$
zgQz=TbEfS#QV`BM>9b;g_BeYytl;;BrdKu|9^S|8FMn$M+UI`#`m103tsBR;KmQ-W
z*YBH*c{-jH`{S*0Z$4*NRV}Jfz^G&tBSKLWD2fqyRDxZpA=i%K;EeOH;x7puIJEj}
zXkc}a4h*ke at j*RNBoy#w8yrG_57B6Agbohk0~*iZR#3Md(#W!Dnpc~qsnK-sz6F9u
z2-34Bi2xqKjkXSXwDX%hng41r-Mv4WUchL24#n&oit#?m`8l}hKFVqjqv<xvYF@i)
zeo%}itD>C16$RLZ-k at w9Vo9H^Pc+40VLl!DSkEy%E9Pg#{_ImYdwf&7{Ajz73Ka+s
z?!8fd?JJ+W^2#6m+U$)#{oTFQotJ(rtnU0s2w`hn0OiDSH7Vw!@#s=DD$1e?7?p&w
zD&SlTVuoV at lLuJfT&Z1saPYw)cpwBp7l6<Pc<<r6uIpO7DS_{Y&il?c at Ew7C2k*T?
z9D)=dM at 0p4(?Fx@MK{{{s2lIzDyG{Q&(5Qm?_o4Qk8*krquDu>lRfZc57l(X7uEc(
zE5~n+s+o7i2+py3o1Iv8_K-ympF{x>0ELjuLLsLo>R+dg{w|w}`B_mvdz=;fv&Ua}
z(eE!V3%NF5aG?MR4u|*Oa))oebpG&bU*3E0+E?6z*S>(|>tCsk?jL-pUEKQ*(bX5o
zED#DJPyrNdIjpQj&lL;;BS@(v5jZe2m`4yU!G(jk(cPjP|6g2;f5#Q0Ba{<xF#(Nc
z7|r%jP4`gF&to#%M>*R=Io(A$+rzlpT2eK?H5!lWqL`s5Tq at otxcXTE9|TP6hcWzY
zjJ=W<`ZK8I>~U7?&mP~I-Muk8PF`0bg=+VFd4+sBFIX+^(Sy6Ux9bOQT&fp$%I5G6
zR!483Tik<l4n;MBE5;~`F<d!;8%^M<3Ah-+jm98Xp(rQdq5_v=kQ;%@qH`$U<f6P=
zav4HVfQ?;K6g;3B5>Bde^(`p#B;n$3TfqA;@J)2YJU}|T4Y8ih`1LM8&mL!wulMo)
Y0Zm>X7-miADgXcg07*qoM6N<$f<x8#+5i9m

literal 129459
zcmeFY^;cWX_XZj$n&94I!6|OVCBdOkg1Z!VDDLiVh2mPExVyG^DemsB#r^Vr?0f%&
z`@_vj)?{X#b=H}gJ$paTv-b&yeUd^4z5@aP0CX8?aU}rY4Hy7`i$g(r9Z{n};CgM~
z9F?R*0Tm-8`>!1&!;ezpukGvSPOR1UwL!I))^r2_K)C<>-~eeEM6ZL$PBQWm$n$TA
zQ7BOAf&K=sLvNiVG at QijY-~(yod9AECZC;5jKQuJPUc`K8F`qxKL#NH00zj2Lsi at s
zj at muTOzu=y at 181F?M^S6Zf08VRhL~JpsmY&M2&&E>~8iDs^~mvY9M7A^m9R!WNH`v
zIZCjr;9OT%lmQB^znhdnSKzT<w*lK{>9H<j9CkRPO_#;G*2R<Sd~#Li?A`hsyFcVs
zPuF}mE~@p>fksP*R9_Ef+IOo*g&R+FSKDV?z5T%`0ssH^|2r$NCc+t|jD-Nj^1|>n
zGtcOIeX?5<oYy`=_TXtq=fEk(6H_PIYd;8p`nqw#u|5Qcz8kxbI?q01STwJfoquF~
z-O<~n=i#TwXTh1y9;22Oo7=Zb`gVWq(4qg_sS_>m^{$<d*_GLm*{%245QK9iUtikT
z8*9-G$=5%kwEvg{+&`C!D2qe}ys#?G`L<*tE{Ut033ME1bL&5RsO<FanOD=)GwN*X
zvvn6Y46e{-$2NGETLpK4(ITuoiQvsY>3g)PUhy<)ckf>$a=9+Tn%!4 at fG*xYIC at z0
z-cmH~zjJUKc_#60_|$E-sCnzu3ZxV937K=BboIWtwe#5qv96y{84Z*7atS&Ap5K4w
zsS~{2=#fY_4yFcT&t)Uf<9tOm0Le3l*<A8ESGDq9*pd4Pz8qTBnkrnp&EbnhY#<bQ
zN_O>qT<&~oy*MPvUxC;!?KzIpwuy%Q?*TqVV$6)bti4<dZNB`ys_aPo9T at MTUadu9
zUqAQVMQX2=O34#TNE#jwk4x?kfh at mrmSDz-?<wZ<5w7p0)Jt`zOtp8JwC^}bKkU?Z
zljo@I2)|O;l`Wkl>)n<1gs)-JmC*!q_J)H?S36zy+V#Qu$6eQo=S{VikCY&`l!o~2
za=v{$mBJ+O5mZxD{OC4l454_g|0jXL;tl^Y^V7Z+;v(q~LJ2OD+8;WyTl1Gq@^%hy
zo%BWfscfybZJW-U+s?ZukvTl-?VvIG*}HdVN6Yb8RIj!`0eRiXEXSXLB6mh2f*p?~
zo+nHX<m9dw3VHg%{uaV57sJMPAsI0&G`bXyh_a#LetB2~)F>d33MwUZ4DQIRc6%#U
z_)+{}q$qYok8f(1+4rE__w4-U at z9sEQ%12u<hs-6;d-`X at 8M<U2cfmMd};?4<)U;+
zir=|-D^iU!-116j^}|?ptWvEv^7p7Nd=A`%OFS~sg1{=|0<f5(xh@upP8dDcVt+7@
zEl>uJ#Gm)gz}qArt7e8tg&GAA^V<vC%W#o9HlM%i3fr+MI}Ok0MNKctA}^)c_jCPZ
zhul4qd=#>ufJwy8vbMA%|F|+N at axQdO?=hJ9-8ldciuW~rmQ-ykMy4W+PquIUy^A}
zX^=#=GdFg5e;ARVCOr|oQ0B at trPz=EuEdo9j~aj%7nFw_Z#{$R$C1*p>t7=H$ER7#
z>9z-1IL-HQRM_WaJo`?a-2D;r<tdxxY<L9fKFj(z2I}-UO!qZ*Le^7lfI9(9*w&|I
z(RC56v0M&%>v-;QL*6MNYytT|94T0ul=*Ki$OgP2>eqOp#SBT}N)j at FMD@EsUO0%q
zEIgn8Mg|TcBr}gbxm4J<=F(!`b at OgIaG(5TJn%7ED$88tE=%NbfNu4o)z`j?0#b6e
zr+|Vh7)g&x at z0Tkr$z}_1ATOByJ8mM^O;|s6fjd45hQbtU2V?1S&f@m|2~Z0|HICa
zC8cY+I35FXYM9UV(H{kJ>4#OI1!V<N`vD<)SM@mn7P)sc9C#YnnLZB98p8MF&t(t$
zq1jDm=eC!<1Do2wA<^$lb$%YFBSxbSH5Z+aJJ;7vuJaV^G~WP!sMt;cPq=H(<==#^
z^mAt6%|i>2!T3KB2LgJ;!iIA-;CbP1 at w)I~azSWxy{!~io0JH(0a)e?0Mu=wsmPqH
zH%<j(QCWH4(@8FA^fiYU720loEwhT8(ThA@9$l_4`fR><KDM7ebPX$r`-&!I;L+3d
zH&oC`8VWML`Yr@%EQD@-=JoTF)!VPv6Y~zc8~Zo0laKMcHiPv%b$5G82|iOp2RM#A
zmfm#?juQBk)x>g3 at 2`l1Ti_=G<zR|cc;=LK!f&7UHFMs-kp;k;Bgv@N{oW49Ryt0W
zK<!1;b#fI=QO46XT=K4)fA_RPy0owLNpfvZEvFql?b90*q%yLA5mrEGB}5S}#~{_;
z1hIfj#c$gJZv?tuX1I$TCI&Nuk-_&0>(AU9=`Mr7nttN+Ah4yVL_bUq at LLl?jAsl<
zWauxo9T%RiT)6X^_u6=Q-n{GdTC2XS4i)w<wR@=deVAHVSs9X$Y@`tW<RWRyUEwUW
zj!pTx{r_Ho-Rv{BQM<>#d)7YpEc3o+h(=xq=`|#6Ir7WY+r8g))TkU{n1qx$YF(%p
zQ9S8EO0wo-&>DE1T$r4j^x>wuiI58-L}FYq{%eOr#NM(a#W1bLRMbI_bp6~CZem`s
z-?q!1CHy!e;5kG3fnFX{#w>T6X^c)8jUJK;`G_O~LzJzqK&-ig)%i_`RU>Zz;t*9l
zA)qAW96hmaV4fcX*yC|lCO4pt1*O*6z=NJ1KHetjSrA4GsA=~heeV?1A*Z%n^E73c
zTIu~L^W^G#+i`M3?(K0Hu76i9;&b!{Q;^qjz532fIqH%^{PpCE`n{U}<5xVg&byJu
zn33OfryJv9tZ5Ccb^{KVKa-zm;_rArhYZKa at S_l7u~7Vw+Mwvd9|)3EGoSNU%E{w~
z(F7!*$c6^2 at JQc%!|{MPFt0+nXHawH2^ELcKQk8BsE-WV7NH;DB^VM<WY)017YZ`O
z;P401Tc=c%xKaa7D*%4CySQNpG{^2-Z;k*YfThsCUHt4CqRy*5sLsDKb76!usCDNx
zayew&s1fkikWA6vhyp(NfVcEicro}-O_#d0tIo$K<JiK_t-f`)%{M|zg7-12J}*Y(
z_h({KRkj0HJp<7#RR1?!ujlaCRrj09*pctA2i)sGL9cCE at F@fdnN{xFa_SdeO2Xj@
zF(v3HMEMf{wlSP|a*h+2-x!_}M9l<ut;QIs#REW<7OL}r#6brEIP|1Rs1aY6V=|qo
z!~q0&C<z33pWtW-L2uVk#*no3w0{7SCn3H_LsWp-921LW4BFDc516_H<{!H005#7o
zuBKr@0SF}lHGUfmNt^(L2gD?Gu!g29k}4>bUh!T$6-#0&OUc?cG6Bj36GA?ilTZdp
zyh+CPBNz*J`L636c^w`oCVZXsa<j(l`xo{wuK%!%>2)+p?oj}YXOQG4IgMBv;B=@3
z_xyv`{(Z_j&H#R{kH5)@mdAy?nvaFA%h6r*lbn3$_{eEkG!P|sa1zwam7yby1xbDx
zalz8fQi&Ym90-hlphYkZP?r7kTH!I2evHwHqKj+ at P1fpbD--v@hM~R at hdyEthK}S(
zrMdq^j#;1z0G7KHk{oFu1*?Qk!gax48=@nR at e>50;^H6r`1wt=QXh_>sN`7ZE(G$z
zPxwzime70PQ+mz}7Smp(=_oy}isAvn#oxjuafIP+TjYqC7=4C88r$AX0{G$iCRArD
z2reGCj_8H1wO>ZpS=(-?@}*YqT2FnCsL0*7P`VC+h?@1xwj_71uqgi<*@ay<Hq}@E
zQsp1_dY%qNO6hTZYF*|3x$)s=K6aJC4%!yHCNPNfn`c3pbe=h<!F`~#=6Ic7K at c@W
z7F9N<O3a}<XS$quCzyU?Q*|q@GS``FsPXd;Yq%EsF9FdkNI5Nk70ZuU8Q}Ou$KxL)
ztesgNKx5MqD5kJG>aJj+SvDV&eyKV=&q<L(%Ft+6x}Hv2;cG+~0T?sq)#M4+a!tN9
zRgIGwP?Q)?=yi+doReTvvk@-dBL2o2Pq4X^(=N7!%7U1gfj9{<&eO4KkrEeM<Nkur
zl|FVayFP10FP9=dm*;e)D4O1BhFiuX(kSt-`#y^O{?qFMjIysQmfCh49*c-Phx#6#
zv`!{=y1q2|Zv81gdEv<my~!Q!TR5#|RS0~-&S9kYFjov?s8c?~D;DjMOiKzPn49)w
zpce{4q$HT?-#W}|62>|dojO8ez1M`G$R0rHRn$z?2#FKlk&z=xJIl%1)XspNlEF1^
zJ3#(U=+d45J4Cg{Z*$!wa*QxF7yWPQ5<g%B0*ZC-I#|}>)v*{<_#axv1mBzIsDyC=
zXkjeY!%==HJPiiuq2`RCsyWwi(vTluQ$IXU9T)KK^}RCYIJ{D7fkN}KtEBRZ!_D#j
ziS}qitLu`B=S9zS&BCHcS?A(`;9G^q_{3FYo(Hn<7moi~0r5E;;8wu*!D>sY^MO3$
zSO4mrC7;)sr#6X~5SuTb^OyJ<>vt89kvJ#+B!Em%mk_ZEHER~s{~A#OF8(sA<SX8(
zOIf6S!cH{X@|u<FEW9`z+c<5F7Xpw8tWEgVme=)yKXu7W33LZ<a+;S{d5;iRYS01y
zm0)5Oei~_uWDUqruHb~vnW3CpQx)@(a)9FzP95BnrHq%<Y_~lGKr{$Bz{7(~OwiUC
z=wbyJI8^5bwVe4W<fe`(;)3Z5m7EX<CR(Hrk`RH2bBP+?$D1-d2O}Hw&bKS)o)aRA
z7M}!I+H>4DEN738$@fA~;zuEFdxMSaL9byRiW2t^mnptotL!}9?W=6Q*nenIcz#~B
z`EsccbfHe?Lg>gMKZ&v^E}d`gAh`%kL!)L;Vlhw9y;9Fb#noVFx(-T)S4Bgt2l$of
zI;1Qdj8U-bEMK#eWTv5f-nefFY^w6bOfNn7hKHK-Mza at P=NmOWKg=VRLEoP!)lFJG
z*8(*u((mM3POh1!y=|ooKc?)FJObKA!L4b<N>GGbKVqh{u at _eqyq^H<PYx3WbsT;g
z3J^(=l40fT__~kEts?`<Dnbb2z)A~+;ie`Yt}dl?euH&vzsGq8p^fk0HmimH7fY-A
z%ZHaod)F6(zC)C_Ke1m(6 at MOvCH%i!f#dmkq{#VG{&- at iGv6rrT~@~Vhvsp@sD<<5
z<%J!$x<Hqj;Bn(17Y?XEngLg8j!pl-W>g_fS|QjhM;?9<C<83E8&&Oe>iF`MfePNE
zQl7TPxbf@)I?nUT&0w<}T5It9vhsmT8tltc`f}lM`V#?w5bS)I<k5(Pb?v9|jN*i_
zIN*#p41y^5FC)I9aZjufSTVp;B!(>FtFz_YLuX{HX*YSTpC}%ace|}B7=HY{3MUwT
z2*=MkPTE(w=Tq7>2T7%E7S4XIHMs0J4`XX6NMTxE2Oh at 39-USrl(n`Id19I6>LPHu
z?D3oQZqUl4+1GyHFf1-{QzM-;?hrNp(3|AHoUW<k_Vx$)ExD97^2^CzwaL!vOxsSE
z7Vqoft*KtF6~5T>Yt5)e7q<BYNrB8fQU$hm3S(U86HVPsr1=)OX$`@3h(C05|G;BQ
z4An6tb9KH!xoo(VX(On_RjW~)0fr0T;rl)Wk<!Dd!Yy5}msMY#gw8kDu8zp<0O96a
zud6S=0NVp$Wnxf7w%QXopr2Th6Z#nHTqdHE;ZLz07Ha}pdN5W=H1vH}8H^dr-&wri
z=Dci0-~2RmArKGmt=O2BX*kodvy8)OXk^s^<_{_h_?x7;cm}B|njTf_KVG;*5Q{e4
z$-upD;*-W1BP*_>*Mz=zjCA^5E at lq)>l>iSukF*8zArh?E3H|#UFgrG{|5|<XarFJ
zofjvr(VZvGjVsF|!nZ@5yLL|_<&mzsEBxMzZY}N6<@<QY#Rg0C3w4lm0`m#@ADTJx
zqzh<UXk6vsBK9=ye4BT5&B4YJiTLmFrH9m{^YxaC<niBkB|sFzMs>s0=NU}L3d1}p
z1b at 9z4Wm9Z_Jh<2#35pVI2*Nr2!_49s7jE1XiP~7)MhYj3ghDw2~;!SkN@}Ln<Bt+
zb+DG8eYaA7)e<4R2Txxsm8>*_pUdGmQ`cXZ`QR?(l*)pt7;7jPm7rQJ6do`=noXK!
zN!qVO+&+O;XdSEHUtd*&frfL?p%0`e0X%TM`&z!Q!qRrsJIU&EoFb>kZ#k;#xwam-
z9QccB?Vc2?*?(XyTHNMe;pJcKu^-s8>an}nU)uj%`5Se%<MdJY#`|giqH(oRNPg48
zF)aQlznewt=ySnr+!j{q0~T4%Hav6eSm9d^!hxF0@lu3A)MkruQ|J(<@q1}`|E58m
z1C+0Xv)}2(5eI<rmi!7G*uTa7!`vzAx`Kl$*W|OtDF_HOKI*j;!>YfOI=|Ijd at qc<
zLu|TVXv<mlhU at F+*l<3u=U7s%2k@v*Sb#fF_7omGzbXT#n`ip0*mBj0O308IYrWq>
z{BwiS!ZN*`&Gmep(rONEM-+73q9|4Gbu`2QL&=kZTIK6%h$<mL!%%<%xLzu<6I0wK
zo at R8be<fVk@8sX<-qnW2xM0TaT-~fj_f@&!u79bG{YNhPXI%vQgZjb3J{Rh%!at{P
z^n{&D+&7sUm#^>_j~_S0MaJu%a0j*-I4W}2g&l+g?2+Q%)-c62LlT*+<BqzfsA}Js
z1XDY*UFDSd6-d8_P7FDSa8Stnd4{zT84_3C=Ors;3EG|YT+ at yDyu)o^{;2rautA*7
zt-f;5S6Y_qzw-WE#B}ULckLVf`?GT0xaf_QR@S_@*JunpZtU^_83!iZAp46QGues%
zaZ_;dvF^YjV!;_pHSiO)U?&OWBV%0MK|H-r>c&(i=H#}KtePUhy<J$_FfyG#%?Ep!
z<G={_#x-5vfA7{8WnLjVm@xi0(so-ho>^3QymEKp%B668{X5!r;7`>4)oS`mT%vG1
z7R7&pup351?E0qfvzSOymaFOM*Im~Zp3D`kr>h2Er=`nmgVI)M2ftx4V?J?N$3y!9
z8gYVw8b|^@7(~q=&Tq^I-wbH}yKz6purmcsrEmuptk|Z9B_X`mE+ZG(Q$VGr8A~_I
zub3+*&ZR%$F#AwebhV(T%foH0${gCM3fkM>`yhukY&ClyS8b;IhQY=<TqtQUan1yb
zmBG`tI2(Q$1E?jvzys~>lZc-4_)JS2pRl!9ZONQ1$AqHGRd&=|{a2r_*N%$Cbgj}|
zET|YnryE*Q%YyR at 7#EMqdP!i6k_OfF5Xp5eO>U7w#B#CVpXOxkG`p{vZU1}uJFU*~
z_zfoc)GImRHn9Q5n`y5S|IgWsQmlVDD!F2PUW$$FysYSbD!QHX<=IyDrMk*qvak<h
zdN4O%j*&DS(4j1%sVM{3h$fTCsKrf*iN~A7P&3ATB&X1V&ifxJDuo77nQPryF0XJa
z(|~3C$8aVNLl`hdEQ9f&{#v2G7*8y@SZ%FCiOX_nMTgkvRRU3F^L4f)O+$Qbg(6H0
z`{Xv9&NqzYEbl0lY6WtzXuzB>jNA!8sj at +8-WGlsq6&TiM3*TXPe0x28I$4Zust%s
z5I&T<g=PYCu>x%5D at 4{5wnc`U2F-NoXlmB5V%uE&Ld~2L_Fyz65gxGc at Ptdx%tX{K
zH6)#{R=Bw6@!UIVbt*@s|5O`_aT99_TD$MS at _P4kbIay`%HvuySkPxz_ms$ca at F?<
zG;(#?>8nllU}mIqSEA;sV8)j~@E~0SFbPphj(f%J7<^aKI+TtUK1d7>TF|B-Y5$*(
z=y;t0qxjU$SS;SU#}hRl5N1%Zf|Zzp6wIO9b+*#)P3!c2<k|MoI5$n{p-?A%UW%w|
z!*(=&10hqp&teL<p|Lx>&{g%q!;1c1^#<m|<{FGloJZb*CyST_JI~X<R-EuRu}vba
zTJ;}7`}x&wRZCP8QL at HJVzaWHhaD=au@p}EtC|rf=p#(shv^Ih<LFykdR|H4uZT?K
zWi*@1=}y`Vxl2HKba1t+qRPyLjg}vme@>tw6kA?fIm_q#f;OcvfAD$!!gZ^tqFhZ%
zN-E;eQ?!DP3vV6tkG%aVLU%h#dZCfOjM%k1UdFyWt9RxIJ!0P2U155U{&0EeBr|$3
z3HKBT=ak`)O5DL39@`?*R2$HN_IQy}URO(pCV!;f2Xh4GL8|{Q&T-RHU#Mvy=eWT)
zIWwx at F`y<ONF&OEhCh}W{<_ER;3Jex#N)o*WJXW_!$Gk&Bn~+xYRdJprx>Un#!6Rb
zP>Y)d*b}}RLg-Rk)tU+ME1}mDr9)KV2zuN5=R_QCBEEd&xG~NiHO&-oojVK$A(&wC
z20 at zZX7{AJ4=#$k$?G?}$$Cd~(U#MFgv at Bjuxqk<{<5>Lsxb|U at WE9hz>bz2k*Abu
zp*n3>KAre at LiEYsDVZ!ddQ;WgobD$o+g>)>DT^w+*Vdof^YiBmJ2wkh5yIlj{_CEL
zg8E at gPXi(^xsTqf_vnp{>Mu_z^^uru?nTQl_i7k=D`$I at CXF(- at 9cO(3lJR|DnbT;
zarolN13C~5NXx#CSq{C5XV_(j`yh|BOy>zpSVezu3AQH+;F3MZc*mAAaguxgz=PEG
zgHBPJPlf3)!5BhRC<z0cB1Xz$=<kygZ0K^Csxm~}i)k2bNA>|)sS#^1E)jr2k<jKw
z__Bl`&JFcj;V1tCe}uS at 8BztX*cp|^H4=sNb8Gdj2ypnc4L at Ho(DT!$uggz=b}C_4
z-1_|f(zsuAl=SF{<o1MNdy1bdA$P$&v{&KNxbrO~it4?$7uC1OY$k?H)S^Y at jMm+X
zK^o at CQcOXwCXw_%c2lT#PSLyU3HbjJMp^OJ;ru$EV#t?022&NhEri`xc|J`}zC7`s
zF0bxA_lAVZ%Sv&rk5d%!)iC+ji5rG)Np4eTdJ5xd@}tC-{aW{TN#n;Hb{vl%s{TS3
z@XJ!CR;+0c>q{q!wMlsqrW$#eUH1p{H#zEg#c8KvReDnCy%DZ<)_7&7+RTK-k}fa&
z)TtDt{NH|;8zp?6cKQNG2|M<7l7-2hGhvfP_-NZPuB=z9HV#N7YffY%%YtZ$MQ}+|
z;Yc>9bmtwValoWN>*3!M)9l~)#NVZ`P5)ZgBXl{Wc1odD!DLv{_-exFCjdYd^<}Ea
zp~s3XJe5K5)JK&&jcE$k!<Po;!3sW3z8`7ZIw=>puV}yT`Xz;2dzWX~erPk$lDgJa
z>-7(OhNu3AUT5!a7-5l}dMu7cb(~wBzT_RB_|M8uCawyPJm at bQyi|nLs`2I*1gHKs
zfg2Ro`>H0r;11D`%^)z}3vnEQW70J!6ZEQd+kKNYtr(2lChejS>>Evz_vdqn0|tD4
z!I7&Ph^)Y-3x}sbdm%L1(1IdP9#+iot)~U72Tzy&>u(Gk(z?+&#h_G<SB3=^d55zs
z4iMpoikQct{!N`YdneME<}Tpl3x6nfZ2(OHUk$p})BBt#xN2->OQTeZJV2wIQ#im<
zyQFN76+j$^j?f<KVWQ2)G_8=}EoApM{zI&Zj^}}{jypj_Sf_#w>6ljRcetF0)%r$s
zQ`(2e4&r=$uo6Sfhw;gqHiL(2pRbkPXY2Wa^Iq<p3MknU_ItHU!vB?^c2m!YfQ>h8
zhsXJLkDmJH0sBV^C#x31SB2%KFNYl0Cx3Y726+>xKW^2D=H2lmFvU+eoO#UgFJthb
zzGJabku`Nu)dOtfa9F1^2ru;H{{0T$8!%js at u_}fx0;HKA4hcbGA_C-(h{rjsx`3R
zpTI`19DG*ZkbXxrC{-8|)5X?DQ%Ja$g-+jv;D1LF7LX?%kopT`L56aS6pNbr=uEA>
z4w_q43c<iIki1Y*OLoXo2Wy$T_Sp$sq!a?o00e+C;?LO^SWs2p3PU7Ur|IjB<#aMs
z!-S~P&3L*4&8XhSD_W8L1VHulubuO_D^l}`LFAS;0Wo^DL$!qTl|izE2y45;ea{nN
zPtRZD-9IK9w~B7mK9Uc%jHAr_2^xs*k at +uEAC-DNfT!+@opTGC&-+$|+f=IpHkh3q
z)1|Bm-!eye2T~m`910M{nILS{p#wOSq&Q|LSM&rdD7Yj9YG&#e%z*(r=*7Ch1!4=l
z-afKC0u+ADA3}OiM#sU5L0CNgiM{Xu$Ln(jUBW(>@Kv>o87UQ9x)m_{VUUFF+_-fH
zX}Yn}O_;{6ghjp_?4Djtlu~gn&>TX2Q)Vn6e2#&_Q5-;dP-wrHWAgQGNU~BTt^lqs
z&;fNPI9k`a==g48Xd0^L%H+51T+6R`fLcbHMgizSh>iYS4$Gtn><mWm6phHlU39i4
zPao8OOgH^ty+o-^KKZwr5l<iWs8Uzgx?0M)1LQfMmdv~6Ci~x70Ogxi*Y&J_{JT)|
zvM|5rvr>nHO~V3PG064=wRwE^XU;zv-+wYYqnzjLUXLS<FGqXiKF5q5<}F at l&WnFe
z8o8EyZCKP<O-ItA-lo?f@JS^`n79{Eg)v#HmXT0S3X<VLlQFhPw$KV7^f^o+90?ny
zmgF)@Y6=K3+x8meZ6_#G=ed;pWnuL?=yv)8Kn63gIfO63RG+W(@SK^r{O>rkDrn^*
z@>WZ#joT4;xZ8$TVRExj at F}jBTfZ6-FK1AdlXJ7yjV7^+37$dC^E>I)@RTa~R^pR9
z(pNk-zgt7|EB^@6iVZmA?tWsY9Bg}Etc!J}FHrNP$JDUsm?8w+>L%^NQk>JG0jn*l
zEel5O;qe_b$C3-KyMbe=J1}L__txpJ&`?K>1bjz>i{Zn68=X9<EO2-9#M-*KQu$~#
z+SzDeb<-W1y&_a&i(<d2+RlSZK_@~k`nqoaqIEB+uK_aYX{YjOXfNCA*I_n~(Br1M
z?I7K%pv{i{?A~;W@lgyh8T*%TCP(QSaCgt!1Sd#Mg;ZfMko(AQiK-UBTPFw9?*@)|
zd)t60bF18V04K_O<pc80M-hjz@%14MBd8ICO}5nJa<kK2BN#*Zx!OvJqpDUsy|U*m
z4h=K+c(uNzCHM>BfsJqG!jS!&Ua0(uyZw3=I1R(MoY`&BkrCM3n5Jr_I3ifU=4Fm=
zZeVOsO|SBb)MeFahY!Z613!aQ=OxEi`ic-bYD(sg at TOX*PBIm3bX1s+3ku=)CT4x^
z4yQIib#26|g7O^^bqJ82Ug_F#L^xPPIcMSb0`2}E#6A~aC!oskkr=e@>5+$JxRibd
z?-RKdTnc$zN0-e`=}jE20?FMy?6~#u1Rdp1Yr_-vLjEJHtX+uzgT at Y6pKkZsgm2Tl
zZo6C+{?^->yWjqmycwZ8+RY#U6AoDTGdZ#`$NvRVN*Sc(f42K6zSbQe6h!LB7j!_l
zaEPJ;Z;T)c`zB{^d=+0<y{(Kg_5fTwxEjM<4mC0{F0sHTh?DxV+3YGa)gK`4RXQzs
zCo^{NmqB<+?V`j@*5k|g#&*S&3rHI)Q{;M#_X|}c{wivFIK8cP!#g!3I(i&>TcjIB
z8k5u5diXKO)a-)CP)o_T&|lH#TSJmHI1o}e8qW~fQ(YoVOOgemOq&uzGb5!V`C_+@
zupgxeCE;Yp&TRR$m3afJ8RBv1elvgediBjP!D3@~R)4WS+>+ at lhRp=Iy=~!|aXIIq
z#D|z6c+97A7oEC4-w8+_8^0W-I^OLsZ~sL~r5H8+)VXrw>m>GXGz&fB!z1?^ZS}Qz
zjD227Sry{DPgIZD4nIvhJ9Cz~vBh7u<G`G^j~T{S(#naap~k=PxJ4?B3P at 4|cp5MC
zQ7s6*cm(|**rS9stfW at uK+#GK;Xdy^qdEujhcKSlRuUngS}?lAdpSkaVUt&5)8yvB
z%C)-|Oo+J0wa!abqi*|KC at 6ytYi7#c{qnYH3nLaLAbq4a?QuB;I(S2HnVvHUc2Yu*
zL_GUi<Vyk#1&Icbiv)CtZ=2pdsfU$l+ywZwKr_9KWIysEu;Y}2nzuFzZ|s7QoS9@L
zm>3aD*LxCs`>G<+jXcx?nL|FIC?8Tr?9~II=f+=Ke0ZjP5<xP$q1->c=#&r(@p3LZ
zR+<9iYJ_Bp^xap#r?j1@x~_iQu_AvQ_}ZR7FZ$&v?&l~M=hnO};eWi}S}hit*yroR
zm)+5*Ps}T>e51m*-pXWN-jVGO9M`k~V%&rM<vjuLiA-^0&;&$OAfa?d{&|5zZX^aK
z7PSpmi3go^)Syzeja&&?u<b1i6MNfz-r@L66$IE`!9AWkeR*u<LgCSt=A_(g5mlc9
zw(0pe)F(=dW%+|7*&7bTQRYh1TY39{@1t;6VL0#(IoV%vX%kWh8(qt}rDaf%<nbT(
zoRQKaK8-c;)41_VgXLfmVms%jP{O^pGxo+aKj>P5UjSsf@)x`t=5wOiGqMgo*grF*
zb-Uzd*`+d9(XFIAK|RL#2IN|NC<r$gIWh8&_EY`b=VGMjhsNmPj{({AwF_&4mhWqs
z-$fWEaFBlAA8~O!p&1qNw3v#)7|H7VR(Zsd96E#U-f$+WBURSZvhv@|C`}|LplkJR
zQJ?B%Lw?oC((HU?HtOz&FL(S?rSx3;+*<KqMy~uvYE4Q<)ObWCEsZz>Es8I2*r2y^
zVhQg4VMVc%6~-SI_LNY(dy1QWc;)xu3Uy?ZxG?%T&q(QhRAm&8F!P_HzTA9;j)(xj
zg`A&Ntw%1&YuO4f4<MpET|)HzbyLDje~Dp#u0vi44G+-#rW#^H%32$af_X@_@Hvx^
zy}=rNu8#$t1to!ax-}PzutB(EN0UkxR%6BEFWXQ7^Z<asjByBi+BuD2NIX(-rrm}t
z3&xZnt<nST;4+=z=hy|zc+w-k34C+P0>p2)-x9u;f|km&kBI7;Txl?o((`su-?nj3
zTEzl+v|wUMp0V#Ze(b?i-fI->J9+JVWo@@VJ=AmWZ%;Zud4s9{1Id|>LVPQzs!7v~
zy5&{v`B&A|?ME!~$3Ob+hqqU(q|2OX-fNv{T&=4aS9_HvN3onccq9~q)>uSxQpwxv
zgF8Rr$Ka6 at o4WboD3w@;Fn?^;S5*%EtT3)@Ct2F_nnG7^pWDO77mMJlB4GOURDvHw
z@)O0z0#`_Gsp8fOJ1mO(FPo)J>8~N(^Q2P-B{?bUuv7-#Ddp~3zd_*B`mM^Rt%N4J
z-u|kBnAlvnroYP_!ar$z1h2MoyQ}V#2QiCoMo{GtAzlyaZ at tKV#>Z;bcZd_x8d%O2
z)}8E1k4-&@0<_buc6$Rr#~*0oK<0|toH}?%D7x53h!a>u at 8kLn-oaTQSYj4ykf8vR
zqPHVq28;t9z7<Eg(If$&b^q||_O*Po;?_7_gTf8CQ1paLj<<uCQ!c`;qZgz4X;D(1
zyCciV*(<tCn3%B@v*_KmUQuRuUjGAx5H~c$=|!LGP${$I(@sH_SZ}-Zis$8^c0w~D
zBAO8j2V+e#ix_HBYUh(p4X`IqkVSBabI(v2+NB%@@jiS0%~<=Hb!^LaiFIMhZ0Qo<
z+i>OQ-jZmW9}$%{hzBI9y2`D08dv8UfBrZxp*TC0xK_u-pf7)e<A*bR3cXiRqxR&N
zKHnV{x9O>Jfm&|3;!9Xo!r@)Wu|ZR3>ENBPp_uQEyrN3k*ON-<XfW+ECV(!Mn{<;r
zGGBt7cUnRCKwzXNZ&|*Wagx#!n=R_;j+m>MKm&LJenMNCQu`HNHzDUcK`_mW#=ZkU
ze)6Cw95$R{6#8g8Y~13aru at S8k5-0#63h2O<=rtXF=MT$?SPthE7ZYrO{6W(M3Dr9
z(!rGP<t4X=pKeyJU&H(U at y&O^_UrD@%A-uSVqgBnYT at Nk<o{Tv8^J%hzy`aA<jb9x
z{X-U8=9L?h#I^@rsuQ2)z3%3q{3JdpSx&ADs^9RGr1T&K?ncJ#<a5QiIXJ^Z%}{K{
zTs!B5Gfy;`jp-nkoya)!(W*TUaZpx8c}qNI4SNiyvGg|}{q)6pET@|U%I{nlnqI<Z
zu80j`L{d at AuhWkwNX}REmmY+@3z3x9TDd{8{t*E+=mx}N^Jn}aZRit{@s>AY54peB
zLI_3?u#54eKbT<h(K}~W#_A5@^bGJ5b<ln*JM^&<mi70*2;~rCgSWbG0}&Pw&_w5W
zzqv%$;J4EZ-%T-wVanlN3RNlD%RD4<u+78MTBi5^MTiSWre7Gu0qLB_sDn%-Wrz<G
ztjfYIxXG_&Sq6?Wx?Y(5BAZ4!S2XAtqjM$T%HkXnzO-hXSjUboU$kX@gg9>d$LcH#
zq%oI>mM+JoM;k34y(rv@{x@>J4a0oytL$+0TJ3#e9h4$}wClIHA^*^FGo*9fk191_
zffSFQHbwCTwU8!=QTkxq9_}y776~(`Cm8v2Wa^Qu=atvmw_CtkzKD+gIf44ysrs9r
zfk^e-V&7)-l>%Wu)GyibPJU&~uql5(L|3LxijXfix+xQIo-MrmiSYSawb`ovHNjlR
z>^7PeG4?9p;$g+)S`cr2xR9;tdzfc1kT5ItoF+L<NOY#QyvgI5(<zs at Ezx(=lYRQo
zy+8xDMpX4T56nV at 7&W*TM)P#U@LsJLNuPYriI(~r{Jq1B^RyH&fxCyg?^%_e%F{+A
zOV?Eb$A*~3UiAT~54FMF6(}><0~g`0q;c_4Z3Yp$dL)9S%;-Bu*@J3CyS{xQUybVz
zCoF&NnVD9z-n_TR(Z^QQt*)y$h!<ST@3K2~PaIPgmX5Od9Y40TG#<so#0aO`O8?*L
zriR73wr%%I3e<|U3m%aBUPxcRm@>4E(qS(4q{eEMj~SxI^Cd7*Oo;WsBXz$O$I~=N
zawH_wM5<(uh~3|15cE<mjs83xu=E7nVn5H7Ggay1Px%$Gdk{&4MobKE9CmuKInS1B
z*XB{PqdJAIIQYa!!cXh`J~{Z!PXQ!;Y9BHDfUSJk32XdSA5&FeL36ZL_wXhOOGA2C
zF>yH<A>!UVr6 at kq#J+eS<i&_{!jN<%>>W|qMkl}ZA2z4$WlWya*)!3prFe#crfXO8
zb9kT6zTdoS+2E>U5P3snL4#EGT>f%WT}_Bm00+#iAG<$X$=K#R4RX`_-dA8R6C->K
zrfY;;!<e7R3a>m(p;Qevp!w0zSR++9jb04695E<o8&ZzcPsN3-s8O%|k9M6mzxBTy
z5<(kX$h|Iyo@=9wbw_X5n>?{PUQ^=#s)broaYGB9V12xO;b_Uh)XN%LAtpZRP`kG(
zN+gs1{S_I=62FD=z8u1&>&66S0 at rY@Ln&p>!O-kt*+WPdwRj1Y*z?hqN5 at R{d)tCb
zII&i-FlVSp6yM#@f)OGw@~PBYekOk7s5$u=+AAYk*W at eyl>_qizL3=g?{&!)58W?^
z9f)eD(DRDuuD<FiAwqdc=BKZhf|1civ!+DrH7rocufm7%T=y<a#FI7l!fCe<Xs${>
zf{J%E%R5{kKZioh6rm-RJdjk7<C@<}dTk*3(2$HApMDg;A8>#p{SlHJrz2-Ajk!I+
zt?2#<G&F2m+Wvj1lz8C#91{B=gd(ZjZksZQU`S)^O_d^-30#$5lLkYBqkCM%wfZS#
zPv_m#NCRTKD?|p&50M;8iffMBFV4*3pVo8RUoJX5s&D@L>Sa$xD>`XFJXmBr_}Az8
zucgudqLRcC;{rZ+<;O2)&Xw(sR_AM_w13uJcTRr%)^zRX`xDnBN+l(&BU&J~K_Sl6
zD;RFqCQI7W8+wNp6RUx)o!I7AltI*vgCVj!ocJYAY at HGkjOE-7lWM^uUiZ?gd-$gQ
z)L347wL84x at a25`VHWmMK at rk2@<2a2CU%J6%=j_#dv1CGK=$drPmPsAWzPo(QF&80
z-RB#cG7vU222hLwgt;d62p|szf~H4%f36NAiQR-Eieo}I3*CdwC7~b(V(t(w#E0H0
z+1Z&J+C|=NMq5=*@L<i*B#MFL`oKuh2w?gAL-)gu)Hudib5Xi0co*iBY!EXdJPL2l
z@udf08otmt6O$H2Kmb$jmuW>oW+Yw3h57+;iH6;kXh5EZWot>LFiRjN!gp7@$Q*N!
z0ctm1#9P>o+(f}XS9bI6UC{}>x8s$6XeHV3PGll+&6dYYsO_aM=wHhJzlyug;rEwM
zy%ya(@77BHjt9OtMOeLnuhjLjwhc1aq<*5k|5J7mFBjzZ(Kr=40hIrcA{LLRN3V?$
zGDIYfEaOLwnSpx~kkQ0qo$G&y;1ou9#{gmYg;Zk6Fsp@ha5W@!iZP|)Ncc`p&%BiE
z&_~6WhueXlN!gf6-Pj03Q0CQWRHmPDl}!77W_-*LJJ>HWl|N)>v~&V$Y#3l at A28Qf
zq~)ePuB*H#!1lqGf0QN2gXeSWtzUYDzcZm9>J)sivt$?5sWtV5u3K8uy&ql#hFw6D
zy|GZyMjixUf^3iKfFznLODIeWUyNH!K(0uf&z4GbhFeiLPCqoD&|y<Q(Q*X>N|3cs
zq(fu+>wb6&91-otrNJw}FWd=?p;Kv^j<FKe=v5&&qkW}<;D<A4CthC)xn{TKAG%+?
zTJG`a&Tn~acoLo>{nM9ZO0WOIS2szx9(~V6?Y_jP8-3f9SRdEO_D-mvv(%1aVspR%
zNkX!DH6(#%0AE}!*(u9|6QmrEQVc?q>Cj3M&!aRUmCWTpu#m>Q%xm58zMZy*54`ym
z at lr!To9?W=>`|`?oJo;HqjlNt+hIHnE1r?pap|YjvjoMsiX8M_AuJkxx7zghl53#8
zG`r%0%S*z9%*4Vp#p*-%8|S@*Jl5b$6-Tn)1But-SG!y##nBp~)HOEuzyo4`ySMp3
z6%f~aagy$?0)PM(^SD%|lVL)?(-A#PwW3Lrgh3HLl<0zd{z=|0>+L-Oi;SP~>I%)T
zTLQsJgaj{K!kI!JoFwd|Xje}TzwtAxk%`$-F<PiZX^*!0tz}-RErK!^Y-}{u)k#NV
z{((8?_9p4}npu_nO}d|;Ux4(Ff$IW3@6qL5J3<Rgg>1g;$|Gj=+Ih~2$?S9A1Ec^k
zv7rC3)ZMmQw};V}9&@wn=ifH&kJ0Ei&n=e^+M2s{Qw|?l$Oqx&K+;<9bzR-mrly~i
z;&S4)^3^xo$%IFedIC2s!R}g>HTCReTE>oS&S*b&d_=6NV at ox5#T1yNboJ497ZTAi
z^w5jviq%L5ONeb0rP at mv_!Lz!)Sr7LCOmKngtC7oAuS(5K$CC442S(HIiY~wzmij<
z>iz*gLS^+_AqlaO(<6u+K+BmB8%N58`oZN!h$3gmFqQ?yo_tUhVqC7d*OcWlKaPVm
z`mCiG9r!tGudgx65}&5G7wTXqeXdCVrTX*o+s}tqvCM;HKNeA(hoAWiZM#m(CMkg9
zE3N$K5s{2vqkh7dgcBvIxeu6AFx`&vb7e+5e17uIO=EHuw;}%Kt&DdXL}M-=P-L^J
zlnIr6!=0ItR-jzzac84{iLdYR@X^EiSon5e61jH1ZEao*RC(jeGQ9t9pu5)0DD1Oe
z<m=|-ao4rYUfIFEU;q24GKLc~o{#4|e#hJxaUCrQQ9L&8d!Vss0+<Gu{LGO5OZ)yz
z56X<;8$E&Fl8Vv__%~q4eP7wndY(7VM))O)I<rRV>7X+1-%S+y1<#(Fhk>C8#IfNN
zMV~$iW8fqWf|hOD-&@Xgd?y}UIvmEHiIF&u>k>UJwnvdG2#ZW5lN)Tba9;5~W2c!h
zDqarTNN?ca(j*8&B+_Co>+n!l1b39oPORgu8OfDN`WP5p;I~g!VMpZ&Hq2;<bK?xa
z^$zvQo&SE=;7&oSIX4Qn`%UR#0~tJ79sp<&4<>B%a|9%B80pTFrDTTs6ht?+-kR2I
zqz^b at NjLP(wQ$a~%bq;FKgq0~71;WYhFQ|F;)cqM3sKuC9Vd7X?UUyea<ufiepL#*
zA4<q|z0cwqA5K8csb@{`O}u<uME|7h{|Rkg>yfdIk8_w&BkQ at pahw146||-(^O4Yz
zfQxA8LkDU^f6?IFKvTtd#bhJ6yXAi#WMVq9jw!cTtw>!V%{tk@;&o7Nxh5Ba^dd!7
zS+kBM16<gY$#Fp*Z5#R4ZhSE&z8TW6N>NiWuPN;EmH=1Iv9T;Mz&;ZijECC^eN-`X
zU#E3irZ^3y3I!XN^j8W<7iGUCoC^50&l6)~Q?a+5OvvxZhe#jFcmNmd{5S}7ys}Zq
zi%u__?(wU597}k+R*LnOUveW~&NiTu)BJ;~j@Kc633dl0WW4amccSW(8;X?<vDXZh
zCYx_)Fx5o19YR$tsm|~TzHC*yQFQhxLrvKoEQz+J?lvmp!E6k$=WX?OfwPXFw%rcz
zkO!fxl6(fi9&WGU&KM^6R*&Mxz>J#XJ&kL2yLa{QEScBV!Lt{$XvHkz_+eNK at pE<*
zxx#;J7Nq9&c=U3<oUgqV|9i6Tp--hkZ^VTA(^BmS@~-(D#c$viMNlXffwU6WiqL?t
zhlBz_-5+%iuV2%W8_gxLCes=qw|3s88TBq%QfGK>M?vd+Y*_T}kXgmg<zi}{2vt(G
zL)$F>`qU)^U`SDECaSGqhVbNKg#(kA at mZpE#m&`rqt>iB92Tv)BID)Zmoz=LPElFd
zJa=ONK^00EK2Y0lgA8B4w-hyQ1Zc0QUoB8y-y$YOTlweKa06;U;iDBh9nI3h?rF+j
z;hz`EXM|G+q`#4m8{{XO{@9HM)~>Gn at KGXH8p|Sw#{UN(jbcKpzfVBZ_}bB|&_0LV
z7xkU5LRqO8&xX2{Fe)BO5AJ9vn<$fx0ri|u?TQeK`;!n4Q5e6z?vZ5^HP1M1!U%ke
z023SRI9|fUtd!6B^n!IsSljSMELLwZJ)Q4KvKgE`{_^LR{WZD!PZem#T2KGz<C$xW
zt(C|Zcgj{fIg`_xr1mcxxz55(;-4J3bl~SCHn7Fld@z4{^`M47f$0+n7iqaIXWtw`
z_{sz*mgIz1u`tBwpok31ePOWkfcx8$rTUxC<*IEzMQBN8pdN>{uqO5>)@$A$F5Cyl
zC9Ha%P+}=0yp6=s>dzG$m7F`UBLnBEZ?OZ~;c0UB?%Cs-uQS8a2*vTWl37AH2H1<K
zU?Xr2NO8=t253e=Av3I98G-aCeB?KEF|YJww>&=aBclp0;~@d8yngP$_e__gk7Q3(
z_cIK~*6R`UhnLp}<@VSHr}F1W$&~;}7e&$4wqWPJh!$6qu$-;FpKx!v1LnU})XLCj
z?iQg~O6AAo&pYmW;QdL#nd5<-21tceBrZ4KYAoVt3F1na?g)KRh?Qnt6v$V;5q{aQ
zsYP at Vx!kLNx-&#w^6EXQO&$GTNMjW|Kc6A at oSeD4te%xKK8<c(ZIxRlHA~Hn=L@5$
zVTyN0IAcgC15--RTW)2*(fWVuol`$rNM>}i(MufWX*38Y^m0(LKf6UqjL at iV8`rEV
z-J*L0)7AA=W1v`Fhx*zyvHUTT$H!0WZX#=q#I_aYtyD*zVG|`*&vSJ=`eDMX#2uqv
zYL?ga2GzMZf1gS;&8ol9PbP;$i at es9z7Z@4`f3AdfSZT=`@V_~`K#lY6M>xBvDF<{
z7xSxtZ%pg%!fhI&@~iua*8(1MWnP2Fib*U#OZlgA-?8-%0`lw&bRGIEQp&><<SD7%
zJ^Au237=ElXtYCEGo*OuE;?Q?tPFQy{*8u~dXV$Y7rvPhEnng~78dTlNsTh?njiGj
z*`Y$OFU_?^(m?OAlQ`p)M>Y1#(tFX&W2xhm7u|PX{X?fs!`ezH+46EaYx3w0>RsJS
zWnXOhzp2`px}I0t6WxlFN2%9kX<^L`Y4fV*hc9fO1Vs}NYa(NN-hdKu>p>Ur(n_4<
z54S3L&SDX-*8Al{jsNJaQ7;J(he!+}CWdpzw;#7X19;!dq|(I8IPHh2JDxq~<a(Xi
zq)EqX7@s&YurCPbY=9x}JeYO36~H`#G%IlHrZc?;^zVryq-QF#QR!W1vJOI=oW)uy
z8a>%nDT*Kq+^cX3ZyeqwO at gIp8F(A8y0+E>tRXTvaz{Q63q8{Om|GVHj at Vm>(j9=W
zju2tQugX}Tp!4wTaC5iSTv%GkVa2EjUzB-5%MAzhJ0IAmq_UULDm1jlE1tCc%<&nV
zDy9GMuaA+gOE#>Ip^oztm<5P&c^W<rkx|i@4}uG?9|J=XlPN2K#i{Gx>#(qb$u=|u
zDCl7<f@VG3cHtTjitp!;UK=oZ`78r2jF3V=`*`HzX@~vdID9L)&(^}TSG5N>`<L1i
zsj&YL<FjCjSM(s&>1kE!d0R?rajHFc+#y at VLqGx^#7QMhV2W!Bjq;Xe5H>Z5#|Y<w
z+aQZYDE*<l5$8!!=1#;tl%zC`IL%rW at 5jOs7S#P~{TKg9xt^WohAANH;RAhO5rW{k
zs1PYB@nUq{{e<%TSy-j|kgZm*d*;OHtxLIw*cHowM|zU8!vy~#{M%k3BI8|BBn8Oq
zJDZJ=FB6i5mb5Zt{`;SB!DkhsmWtn?Zx`LM&tpC{)K`na429k^e=DTbm>`H7foyT9
zu=w4Ph_gV_Bgedmzp;o;ASUflezQZKbO&dK>^K5On{HG6mf+WaoK}@<U7jEsBbvKV
ztnb|AnsNMHyz1{1t6#o#PM)FDKmOpTk)DCn`RRBDFX^fnf2xfP0ipLo!~;)J`osJ!
z&xwat<=i#<ocY%oZ0@P!mfjvkC5R_3mji-gHFkNfI{bW^!)^zmUfY$ue><j7OKYb_
znQfirO#!<%FD}J@B(!eAsN35?^2h6OKKG*!iB7kq6Z-C7_tuNY#R`l!sD7h`&w_ao
zIO1^Qy`mW0yTIbz#)x)LX=tUI^1M?-C~q6I%lorp<hjCkSykBAtZI!17UJsrMY)ye
zHPH7wnB2x17d*_qyD&O2YgDmg)W<_UP0T+1O*IVUrA<3(-qJ|r)k&@FSB_j<=j&DO
zWd5p?bdp$=qVPErM=O$;-SxGgjynaA3X$Q|jJ&1&an$#6L>jlLi1(pZ+=@5%XT`~3
zT!c9^m|8pm8I>DQloJKDg|h$_a2oI%QR&`s=QQIFGy?9>z>R5y!2$r<s-Q2Y<~eU?
zo+m(epLHz564m|6J1H1*rh4MJsB`~$r@-izVR>P&<e8E%+}i5DwE(0&rv54~(VZ#q
zd1mu-3p$;)NFIm9cna~MprVlrSc4o50o){zUOUH$zC|=(I|Ks6BXz);pSN|@yAJ?0
zl8rc@{)#;zvkt>rg4hS4yjIcu!=?58Ha2}<V#b572Y)Aeok{Lz`8YE?Y!)~c)QSJb
z50U~`fcN1wQB1+%s93bE9NBA;{^r_MAu`nZc3L3l`OxU_zMv`ADp&5u5AW=M&E`%=
zR*}i at YkH`{DfRa6(3Z-dE1ov3#HsSAp3li2Y=%F-9JOo5+Gx7aUPiOeE(o0LCeV!z
z4t-QLT|O!)v{3ige$ON5hk(<Tq{u^LO?4gy%&kB+r+@@&9s5A?a*4$!xf*Cb7Mcti
z5W70wfx<#U3%$Bk_gjojRJR8OQ<^fGj_P-a1f$q@GOVPGRa;7;_!Ie(a>JtLJdf*l
zwXn^+E{Ioe#yRK^c)}KcF%OXzl%akyzoOkh=MHVGq6HXXhc52R4$jAwt<5{aD18IH
z;n)KwP@-7*Hw_v(da{gT5YX~#frCr+T{#qR8gF6Mk$V6WCjtFYrraQensGLG=^m-U
zsj|Qi4+ts^<LuvT`!4Z3F<>!%>wMs4xR6B{KL;4sS}i`h^;2LboFaF+uA$k-zMOVg
z=IA>`w_ at ulfNb?=HQul}KdzKnwb`gRi~;IoQH8-W_j<CFuqE1N4)?JwTZ6awrtkce
zvH*Ml^b{=oRy(IN>*Of^RLq;nZZlz@)9zYFp{IjJAZ~yNT-+YGK)q6r)bH|O`Y;eA
z>~m%JRDacenK^s2zn(IAd2(1b>Vh-8ZApY6ZU**_>fuD9C2llykQ9qd|LV<#gpA#0
zfQ>Wv>y0)W);xI#$eaSfPPb}qJ~pr49AWQjxu=Oh^(mAk_~`#(>MH}HjGn!B*`*t#
zYw7OpC8S%rJET)UV(Eqjk!}%`PU#d0X^?Jd=`Mj6 at BiNW-cQf>Gjrz5{9>L+%&gk7
ze)jVDmAcmJuy25bgoGb%DvD}r64)WUua<Mde?_)hyVEgMj<gDZr}YJHb5zHFQ~!=A
zt2M@nWI&t*n{;3leT=IQ+fab=kQv$V#2KCY343$Dx3<(^S$pF`xC%nYb^N&zW6V$d
zvFH4tL?UnN>wYAvElxFH6%n(^$;+`B`L`(GXx^|}ngtbgf<l9aN$%Zm(q)>ap>1^Q
zecgey;f>vrA+xpdIAmmdETmj(izaNO1P- at +7IrPU?_LK*^+^eSE@&J*IRFe;MYn^M
zIVx at RI8>xLnKSIyYy{q|o2%IEh~v$PWLx);UYB2he`DsBItoMtWq+nz4;j+oe|5he
zl4SO<^t^xnt^MpCtMkF;=RkG6ny3nqLW9(Aj9Er=G2om2K@7^iZFJP3%p^R#!SIk3
zlo|dR74D$V5W|p#EXQ-%O9A>EG}@w#0z=~Xl$4{kRd#cxM|)nm&$2%p%G)gv;7)?U
znQOHK()s}O87I73V%=OcNB_&um`)bl%aM8tCSl!UPw_6Q2b;1=>kSAS-MKj_c79Hf
z1c=Fx*ZY$g*it(x1zsp7;=9z5s4Ck1Rll<RK|~u|+xJ-rbfl++havvfMcxS$5>!W)
z*Nu&vAE-V|6!iCgu}6%^5VtXoEd+cPpKwFY$^)GNp^nIJ^>idRKA9szBkMmhe$E~Y
zzMOOK+H(8Gl4yih<m4LxUMKM>^{{A4tuM`|dxw-AXv_Iv^9?Se%boVAxT>uOLGGQP
z8e|c6&aUjTTmIIHjdXRInD|AjN&a`M{DxAjt$4FK=wd%J41Rs1E&6{BdjghZ_PqW4
zHqh$|x%y<#$c#ZeI9JgJDG*6XPoY`57d0c#(!6&NfN6~X^ZW83eycoJDnSg{b?+5U
zvXNA398(V25tv;+RwU(f!tA_2>)foYbUMtUe1!*~C7*{j+^c=Tn$?|jgj*rf)flM4
zCcC$o<7%PJrqvcX*W*o+O2)3}Q}`53Os`e%5;`G~!SFtwN5SqrwL=}i1nNTexMk&<
z-hGP)Z+Gvv$K*kV)&-y^w&SBAS1Hg?sYLa1MDF%?{QQoJ$y;1!>jp2vQc_4ztkL-X
z3xNAz&UcABKk%)O*O+*n0+v+pJz3bx0&@xzg-qX#`oViU1)z20KeSM*Emyqg2<_}I
zv)ypgCM>|Jp^3@;2(iA$YU7$3S@@dpW^(=OO$(TpM<5Rp4A|oDCIcBYgC^bxN_duX
zHSy|d70U)3nEzK=Q{|Wp{!8mA9_mFYg=*6d5x`4c&qW~ytP2J|>iNv32jAYmy*T2m
zH|-b`IieE=P0}N&C|r*8SEV2$*P)IMv3rjmDXBb20g!$`$sb)vx_CyzXA|6CTd1hu
zYyDW5-I~Q^VPMH6!VMY9(%Gixa`OtAcfiJ|-J39mnL?ukpJZ`$=N9*-8q=!Kmdd|m
zW)w&#ymp&LyZ6PZ6%pc==TLr4rJ|47EMSG?hWdjv<{Ds(kkK75j>V7;6(9une)i+<
z2FZl^qZS)=|B)bc0;80L<s#ENHfQVm;(v_d8Q|qHG%wAo)?D=s at YNEkca&%rYbr?=
zMgMM%^`_4yTNx{IJ|u!qm<geXpYI4^A14(HxG0FhurN=dEzsLPOOv@gmq{+<_7(v@
zEC#sFVHCTyX^Dl!1r!P8qYYDW=_U2_xfWsjmIn*#!zkV=IQ==6fX%kaZGzy3xnY7#
zjU+UR%Py+Nur3?m)s39*cl7i)jh+*5ls&Mdg7SZ>2owZgyQ2!SipqalJ!rdFGSd|f
z%-yoIo5060F<&PE<%V3DXlP-?aHr7J($FI?E>U2M53DaH$yz7sQ427_QUpJ#&dTkH
zrIA1m6V<NVfu!*iimOn)jz~}R%IaeTc(ZAHNoEs=o(3PYCj+(pkx%waQ3>^&t}@<e
z%O@7kxgrnav&q79(zolQ^C>-<<iHvPF4)U?9D^E=H;mT30H1dOi@@!7v8!1D?QuVl
zCR1meeFzFj8ZJmNZeFib<%AHE_qk6B62s4M=?fwoUfEiFDM&;LcE#d=L*iefwWL;;
zyY$gw5Ovh#rr!(yH~>T3x!(bcP=6v9c%k<_m>ZI17uN#;ziki8Ov}-_wNUZmxhtE8
z2IZ%Jjph>2f{)Y5Ya_S+_C}73<#L79gr-Q_2n3=LPoPJm!5W8y#*%l83fvJaJPbKa
z-yuw*=mLoY8YIaBt{ahW)W@#299{ErOii4Fh;c%(r2Vh{%mDu-{8KFg)$@Vm?Stt3
z9&7dVwqU2q^w~kin2-KAw4vv%23!ny(6$aF7Pf#`L0>dO1Et0RV_TM9%|725O=Fin
z3I>f>uOn(t4K4ws1rwyn8f!CBEZGUmY(F0i{jS6j&#C%5gk)OfDBD1g6F19X!0K2x
z5n6zB5P_2$vpnz<n#=;nLzV{AC6OfyaXH}44Y9eB%oekV+esgKq06>SG$8K;0-B)v
z0AehuJ7!sq<vgM^Va?DR44kZ|dvfAqVEL{}uL}xLX{f)u*MIKy?YedEfyc%dAZp$u
z?g*xyGp55#f~;v<DEj=Q+gfNC-CV2es*rIrWt=gTl0N)Rx_p^vvF0$B;sf9W)UfHK
z8$E4xs6I^3wG*At13v`xU;@mo0{RtZ>VF~e;o+vT*T9?aN`HNra6UaP+Y64q4x|99
zkO5e0+P*T|noERZ3_wuz`0)E>>_EwA7%{i@!GWilbH^)^;-w#|JN*8Bhv9hPOqJ_Z
zV?keHaFv943xGcNcU`J?h)@JSR#$KBONQ-RM_s<^(@S%yO6s{MW(GRY#j~tSm4DX>
zO)~8<6xLnSX<`sUfzkXmr3-r)d(^EH7DNpJiXhc9vY1O*IK}cm+U~zs1>w=^7%!l$
zJaIR!5NAF*<(Pq>DxliK3q#h`K_X_ at XN)di`LUr(Og<r|^UangD7Vo10%9rhm~=%U
zU#Q>F9R<jqc$8jwZepL^Dy1((zWCGkf!cro%;JJ8`O!P2U4~zi6Pbv_9+NP8x?V?R
z0(UFD5rP7HG2{szwTMNHH*dp5wch*$;?EM<Ml3(2p?T_rB<+h992&4u=MYh)(=eR?
z_Hp6^9gn?vkYs4Rl1-X;e7{!{V(AlqU6{r8w#K116K~t2#5w<qZ7u)hv{Cbm(q;~Q
zqSbG#+`spUP)gVaIZG77?Cu3=EK}zgeU4lYhQy*7#oxY{b|pXWVu*|){G|gd2f<A{
z`~%@V1Hm^<K at PcUUH2`T`A<b#rQ@Xma((IZ8>os&JwkGp5X_PrC_<#QKuykw&)l`E
zGgujwIN(>TxCjl8m<n>Qa(5wr0Q}8|BitnHNnZ?SesOO1W?Kg!u`(buiwF+ at QWjk;
zV~lZ%y6<z=^sC6K<L3KgCH(p&32&Lyj2!k0bk5n?976}MS4ZovP;w;D&Lk&gX?^Ek
zSTTgDJqRNx0KD}^L!vPr?~K+_Jji~ma2M*2tACWen>NsmKjZb9J?mr5XXh~rV`;46
zFN8X*He_KJ6&Sy6RBfzTb%UIO(#qlpe^IpjX`I7jSrA&s%W1T5i|!PE_%Skw*X_te
z1qc97p at y>p&@7s|bzF$iJiD}3njg~Fl)>;4IgR5N;RKg0ve30 at c#Fjh!a|F8wXL1H
z9I|pcQl33gJjQ1`^A>bcwRk at e*#w5D88Y_{o@&5 at o7ip4TwYi3JzH-3+0HZ-Sh|x6
z;#XZ;@p9%@e*pjb at Zi?<&AF%JHRBUiv*5sp56>AT1Nn+~Uf~ko2YFK at 5HC$IR1{E4
zE+G7FQZ9|zuSVz<Cw}Y!nJ`RVxlIb3wvJpBup1d400ZT7(*4M10+||U`QxYsiivv9
z*eRmfWViI=wI^u^JL+ih+MdTyz_;dK<49ce+0iXajXo?S9Fepq6M@USiP<k`JHQiF
zac6TS-fpFgHHhFW*n6%fW<!}$L8*nv2&SUfSulJhfIhSVd(m$}uFH${PK-x-J`8nO
z-}ps^eVn{)t0ATTwYWzfDY9d?htqoX&%6D|Bmpvdt@%-DJ<Z+ISAVWYCC(AUx3gY$
zkVMMoc5L+Y{Q<^$A(fN*LXpTba7IU~<v2bWq5;cMM}}7FUy(_6HD*((K!*CW96*CL
zK;$<3U8M8LZ$m<aCSkX~mTNCjQq>OohYklaG&<J6LvmBMvpv423;&Khphd)QbCj`E
zPfu@(ji&<{Ws(dU<+DEdzqRF=`Sy0y?0M$O_kLzh at 9r$!LBcP0XPP1nJ-!{diBXZ%
z9m7=<id;+QIp<ZgR2^yKLeq=Wii!-$sxVNmN at ns;WSHj+9hL!6`1vH`r!<qyNr&+t
zYW`p@-$VU&MLIgDO^_fMsQ<l>jZ$72+5q6r!|v^YH8T`u((&lZlj%www9t^g`8o55
ziuQT8Ct%&m0ab++B>_U&Ee7=iM5)op{tiGH8Gs0X!=<MFP~*!HT^A}0zQV8ZC*V7l
z<`<p7v!gclJ&u#=OXJ5gVCeB@BJ%0m{+owK856DDMYXAyaCCIFGyx@^C%sCc)gp$~
z){vL5yC0z-Qt7TVD)owDew#&m5TTH+MJB6lMR4$GVskH{Ifov$Z<79Sgkz;?sk3sa
zY8dwP(jXRpI<NppUte6a;UZ)-t9)R_h)=eKa!So#JglQy`=j#lz@{05+z}aoy(Dq*
zQH5X$k!9iAzTu|hC$nJR^I5?)|C`@P-62$`9obL?WZM6q{r-ThlV|nk%|x-sPjk~d
zN1O+jx88Y)?@-3!_F+IGh+lMwxldaKG00pN4rzcP+VC{7;z91Vf)Vg)4bF;c=bg!m
z2gz7K<UL-uBOT-R%q_EYS$=EQg5(9%#AkO8I8j{o?`cZh>tk`*W`4GVQBb9X719q;
zvNWWL+F0?0-VBLTU&(rX?Pln&0&DfR&8L7g-!vov7C~nwjxG-1X*2^>IyEsNp><MH
z{W at VJ_%U?X74W;tsOAGZ-RlZ66NCUFeeshi*Pbc=_-t~VIS;-+!B+el2B?6tDIxpD
z!nh at Ic7F8f%NBB<mg{yD<oMnByAjNqGpmnmncG%z4+MYzzBEdH$g(dlEP}s{Iki5O
z%69t@MYRG&23LGYFJK)lw5JX#X0g&h|26T4#c56dN5&kx4EAc6{r2H7N-sE>7Y7SC
zhJ<xN0qFo)IpGnrLi+%i?vvSE00x_qkmvOTM%U-brbPAXDu$j>i~;QXyj8cte=W{`
zivOc;&%k)l2KwK-B*~kF{jG#9x#{Wr$$ekD2~V6c?kPm=)qW`1Db$>>xL9Gt+-J8O
z1&yx18%^mLZ|l*bE*iOh^=jZ-pe>MUv|p%{Aw&$<@KK;C1ZEf_oy?fp|Axqb7)dD7
z(P0nCiS*1*G<2pY8LvVfF@R4vB9Z#A(Sux`)p8OE)-6TSXc75pQ;t>R9tEBVCGO^v
zcCZJpgn7QoGsi+=^wAUzn|7Yq;bx)&35UF*XYLRRu05H at m(i;Zomyvq7m61aI3Q8s
z4Pw(Yh7r?S8ci#_!G2e64pE6dNi?+o#ceTHt`DY;O=?fp?s-qp`tT)7pg?ZpSOeE^
zu!^A2wz3hB)~mt{!Qnc|;?*Gq=1Pf(5?kSbCx8X2-gux)2`~n=yYy(ds?X)}p5GUg
z(<5P*&0(@HzNf`)UbrZ9zi%cux|3jc5=<sicf_gkqKuP1T9u*fwiUW!L4Q7tuLXM0
zl)AS21$;BG4d25okO>9|?f)MrW&m3PFcEzH;>B#+#ST8<q>+3=*pYA2>ZDsIL23mL
z)8eQSBe~Y-bK$@yUvJm!z|BLwY>??77}k}`&>1O|W3|^Ca>~D4n&0EA&=1h?Nc}YR
z=j~55Y%}HCG)6aCCakDA(C{z;2cP-=D3a2|#=$s>)ds&Ra at V3NcSnE})BL1VYtr~C
zS`NY<#d at U^5K`WTe~Sn^S#)WwYcr#t<L_(MVPXFLb7P7hP^Li%Fab^rN|oVwU(-4^
z#_^Mb1`&N9@wmt{x($pl<LZ&Os6&^9fMC{eT=Oa(|0;#yir|(`LB57`I~&;=$Rvsm
z6*J8{7T97m5x%xbK&Aa9buy-vrO)r4f$TaUvi7=?%^_$1ic|PR%?K9CgNBIL)zH>W
zv at g6kLQ0xubXgyz|EJ0Lq1Z=34WTa+sPq#Wb~tul%67-V#2%0z;F&|+>D{0;b;t<(
zFZTqOs|DzJd&7S^nSm=D8$0rGJm7Cn2V<$%eSedBp0hx98tNojXD6!f|Lr|Xk)c5c
zf=>^*aqohk$FVOqyDG9vtKB7(`|wk8!nU|!ycH=BOpKj)?pk5<<XQ;$$6l<5l0db3
zF>wZU1*OE^Cv9 at k9c4`U+=c3dA~_|I87!XryR8CgcN26x(eKoOCH=N@#@60FL0`%o
z1sbB4iO#{V-Q{Tn;><WIGo-^b;o9teCV$6%AM4ws#;u?=>D#f(^;TqdfK+cfhHUHi
z5Mwc`K6efXY1ar3 at nO(ukmhpFhpE{?gD?mWmKWA?nywXM3i&_*=&eEKDsrmBZd^U|
z5Dlr4&E!H7hx)7fiz0?DPN)*aoAP(2<q3(nU(E+1k#dBfnhwX<uD6dJ>G-Hd+r8Q~
zK-};EG5%IcyDX*_%vyZJc7!v^Zb#2 at EpOGN-G&;IPZb}iSV@`-oa`z<;00jO?YKDc
z8<S0IV{JsGVi;FS5{UGM28nHoz_-&13a45+qtlsdLJ`+S-~*`;XWq_kj6JEh`#i6H
zsNdL1>Uz8!ky0?arvz-3JfFOPX#YJ4Y=WpHA0jwU)dPRe+U;L11?vc^Kkf5TRV#9I
z-(x5yO5KBL(Y5O6JUyHd8Hc|@bTmA4TC&K}_HBmb8UjScBl5xq^QIXh<a>otg at B5^
zmVA_(pR{Eg*Dyl-b1S593m%%WI?@R^O^7nca2)jdVJ{1CxeMuqDa_x!mu`IP?ISg0
zv;6A1v+84vV1W~#g3}hOo)mhA`8~FsAQPNoaJep8HCSW0J+fCDhY{HZqYyj`^t*7z
zH)yi-qRO3;g=#UO`tB0g8 at 7y=CuLB#MCf|fb}NkWH~_J0Yudq7XOC0;9$|P<{gjzx
zm2$>l2Y?a)pIPxFLYj4tx9^#INe_g`F3*$GkOlpY7po9)2T_8o@^edK_N(m0lYYy<
zoo!Cjs4{o%Z(~{>$hw$bI7a7Ai$%Zq2s|XL6?qM|+S7*Ms1)o|di|}Ucq7x7uQ9#;
z1M%*g=}2GG&D=x&?OuoI^DdRx<7)QHp19wEfW#XF3X{~;{~rJ#6<|;D`SbJXaeY(Q
zIT5$yUFaBN6NHg(9j&+&;%DDYn>iL{j&K>WY&eI_>pw13<GROd0Y#)zv6xey<A*>$
z7_R=MH;k8Zuu;??Nr^E16kX)q!iv>8D}eiDk}w>zIw76eYBKD{7kylhC{SurvV+xh
z8$d`RmcH_;I*jN$v!S|?iRL)Qgb9Ac^xh}+Pe)UpZ)bnLJ629p at Nka8uKJ-sh7C9g
z-LWzcI_wDt*sx^pi20f#alkGSYFZCmb<v}l3SiA#lKoIwiPxX=n&a_x+~(@U1g`n`
zo|m1X&_!rxP=1$Z>rnW~plfTBHxCic{20sW8_X4rzq<)vB+uNcHff=RNKIkk`5X#!
zmB{NXe~c?T?i<CYTTjwZR1>tT(4jzmQ>$59V>t_qO#q<^dH&|GHh{_?Z5zQ3p;0HH
zHE}h#x+ob7uFt>N>O+w&k)}@qkA}Wi2Oex4zUBR~T*wELak(`m`h4 at huk%*`&i&Ea
z-}eW0u8*H2$1gs0v1Kz>PX?qAr<)riT(lA2qJheH12fje?t}>H7h)peIhmuBf^|@h
zEz~D{zFs#rVw~`40!@6iy|&9fiR(IR=%QPzy)kpYv65RfD7wbZ#t;eb+c>)-cE2f%
z2w(rBler<vrzN%&LRjB(lry{1L@udgH)gE{be!}jHgtaw+lmHryQYXD0NJ#|!UqXq
zEA-r4(U|u4MhG3ic@<m$aW5|A_reatMC7i7t>^)4;l2-46>3U5owB$Mdm3t!bf4s_
z6onK&i at eo=f;nY3ENYb-;`34F%7oMasH(3rw@`d!^`%%M*y}&IA at vx1q+uz=`Pu|a
zixpa{B4!&1OIR3mz$^g~6^~;TM5ZiQ9{zILbm0EEyGQ{cn&r9=crb*Dy<hjQx~EfD
zj&ie+Q7CXgC`p3#4?uDY^wYbQplH?wDdU!`O{SQejAkvtyDRv@kDIRfVoTaMb(jKM
z;+<=+_y4y?l_Wd`0xr{^BJzWrB_8`Zsq>#2#_SGK)uo!jqbD?zh;q7g`Im~ahyidO
zrmx)iUxC;x3Y5@{42X68$ui%cKEs7LIbSuKk^a(@_ROi`8QqWTp|+K<5Em3Km5&sf
zb}ZJ)b{3U{?A_811!QjDD=`V#LEx|MRb_^$v)6NgWJdXUHD7WC<vL5}Uw42$PVECD
z$`OeQgY1H+XyL6%9Z6h19fMzB3j_;9r#ys<+U>W|hWMPMM03tzjOM-s#7WSMN9X?R
z5&hV4&Hfsk{VgCNVMqe?t(-$Q>koPfnjZop#WM&A-4az`WMv7h&(69E-4urYjE-KL
z5~Zci2=57M-oz^vhHm0?uyTiPqMxFzBG#M?x?8#EZ9$b8Gi2uW2wMwzwZ`4tMNN_4
z<N%^|k%nYt*Lxf8xCrVyW;PJA@<Cph#V3n)3D)=h?T};nQHZJnMrUAi+s)Ucm9~q1
zqwIm;zdLQaWs9MS*_}wM!T$a)=$pSc;2#!rgDerW?fOh~5OCf&{vq!XK|noU-Qxv8
zjtoGUDTVx8pX at Kg(<2O{c!d!oRrY$0t0uwV^`Hsg@klsz<3=FI)@u;dl97^~7NPz;
zqKMx#mg3!6UbK;5g`3R`S9(#_TF8O>L>z$>BF&!#w9#J^(vmA`-Vt6MS-6^*%)d~E
zr?cpbP+`y(BoE?S64r+ei?Dtd40>mBk=qQy_hd(_{d~=s90ZlJ at jlGiqIf(8BCWPd
zkn!QGZ*GLZ{$1FW`0y7E=TNYth{(fOR|lgcBQpLrf~*zR_15KtOmSoc%Z2 at ucP)vh
z8yr(8{DW at uyB`Yak;L!kMHp&iqk%yt;hNI8-(Sriqs6?BjGFr3SYt<rWiJQQ4f-&O
zlmZ_<OC_%GQ@*h5V!ak!A2W2>CFm~GvLM02&K_GM`5?Rgm**u_g+LZ-$1xKhQpfwd
zzfc7eXS|!;d`mog{!vgZUo6POf95aC;0=&Ql8L#a{vU1iA8_IX9X26(o4aPXxph!&
zb#W>=HM(!7kT at V!)qRJMvIe{Wd%$~Q;LC3X*?g9~Jm<K=Qn)Em1+wT>h!vc$TL_Yf
z0>PZ0NikWc%s>8w@|h#nm?n at 3vQ2GY5RQ6-+*I->=nAdABBBz}pyh^yA(JIdW*tl}
z9>h8@)BLLW8-UBEa2##Z>&f9q?SdQ!GWP|Tn at D3G5bN+=*oU5r86g-OyT*`c$sVBn
zuB{-l4_7-0J?EWfWFmOSsa|`5UXN_p1t<pNfxw9R1i$#3Df<>O+`w)J+|yqg=F(J0
zPH2wl(SPh<Y!giioOz-q#wYXIIAm~v-u-kMQ*Y>SP)83D(b+PDTMri)B*qd3fs3lj
z;T}h2jxU_nG--he7f%5hh*bg7`ZkfWl%KzV at sc8}UP7yXPJxlB`cW*wo##kFAa?>D
za)&}E+I{*BQQ2~iazJY~@?(L*Ix!>2!WeUZwr6r|ZdJ_h{;EmM>XqaBOQlt0lzsny
zpxl3wUlR8g0J#6b`S+sQRP1TdY+z^K41VVug^y$R^gmjFU1d7)s6SS4vF{nL+G5xm
za}bBF2!==^w+th}OX0RyyNqnaSS5oAT!dkna3TJ0ZTj{SMO_<NoO*4!{ZcGYIq7((
z#@}Z)c_>-#1$%ia?<Rz(BRY$t#n)AHL{0rZ7zecvlEjGNBePf#EW_Y~VBEw_!)c@5
zNpH;J_mEEKQLYxsFge$)a(rzvCrc;QnRKRldU$<U`b4fTjB1>0VrR))S`mor+K!BX
zgy at USw+!kJ1fXdeaA{W}W**hdO>%jRzD_W>iM}`Ij(s4S$wu_1QxZ3Z+n)}1>x{UR
z^gMMsvujIZ96RC1L_Iaa=<tyJxIOfwjk3%VCc?BIqaA%x;pX33rQK}pYhHOSo&}_k
zbob+pdm~xE;HiDYZ^Lkgpo9nO2Ptvo>Hg7$mJM7=#v%pTN8b3r=?feQ;29zW1S3HC
zgk48+fLl#8I}R>-%(d8kLlx}ykZUFK*l#pomp#g`DRNOe8Vxw%Wc>%-{Wl#py1v;I
zym?ZYw08e<*WqH1$ld!~>>Sly0(l!BN<~d?#gPHyvqwbb0ISzLSFc^vR@D5ksiJ*m
zp??l-!FA$QiRu<OF1DYZNZ<S$)10V5z{@a)QE**XHmo7-jjrudQHLg6`w?a;S8va(
zz&V2Exbjv0Lr^D*?qx|nsSkaYMQ}TRnBljag>2s)6G$Mq*Ab`k=X^38wW08M;+2)W
zf<#2$=brfX`1wFP>?QmrMh06r-QdhSsk)F at 4t*TUq;zwn$oCUhCLpyUOsizHFFa&x
zENo36{!N`<Xg@Sz3MMx!f2;1OuJb5d2;>ySx8MyW3uN=BH&t6<$}+r=VocBJJ#NEp
z&8kMhgS-IKHKN#5x_Pws4~769e2 at cC8OD?+G8K@{@H87}X-x-Lld6*90(fo1+!1G#
zkui3h<S4&<A$F3BuZG;A6u)1;{8mdVRM)0dU$13Yk?}Qy1q5Pj4Qy_@SsZ@n`uKfK
zGU%c5M7*`{>a5)Pdb495E)n~0PM|V!Hw!iGkXYu=4caBhqzY6NwBuCuSA#19(&2Zt
z+axu=QV;j|ex0MBeeE{n$Hh>w2|xs>h!!NUJD2Bw(ftI*bsqiTRAHJehPBPZ@%i*D
zuv^Z$rdTXGz~3|wv~(CjxT#wvaUV_((5zc^p_b(=3 at ju_7pc%%D@*zy%r$A;##c+>
zfAEoj1&l`(O^vV*&_UppaYNaI761Muc+x1TU9Y-$Q#c6ANGzyGADacor8TCW;qZ0t
zRoRrxY1&EgwRt<`L9!VkEp7=h)j=+$-Wpncs)EVGH$_xB)=VYaMiZ^yGKn*3i)-_m
zdRRfPWJ{{dy*cQoR%bF^NwM4*6m27Q;D8*Mo-1@jS8W5>&&A+xPb!C3Mfy+TGYx^Q
zk>`6DN&eE0Xnd<c%xY<_*7apRn%^gSiUot_D;eD;01YH7q<t&^_l9rn+{&#!t>}`a
z!1rRZ(_5UuCLlSW0eD%2VER*IBuIUcU&FX%^n}1?%I|)#!|S2G`e;p3Y*`XqgKdu8
zT@}0vssWi}nr~CdwD3{CZNZZGFEVou+awpbKXdS1 at 3Yix<MVZwu`6ZZ)de%vbEwL|
z_;i4hVpYK%ZuA%&&*}%D9>JpNAmMIsrZ6^!E1K|zPK&5a6cU4**+X{U7d}Bf;PTL0
z!5muA(u$uf(6-yDd8|p?DDK2_lu{Iq|4p2(k%YQ3zR)>6)dhng9ybkXmyh&7z#>=d
z;!|L!_ZU011^^ogZY^1gJA(aEGQYQ`p>N`d{_Q)~-*!>dW_zp2N6bxHlH5DSimhG|
zH^>9Zc5Qi69tvK^ct@<UCj`3{@D&PAjGA315@mr|BhBYj6<gO5KUlEg5}_cdySb*&
z3=?a6q_H5bTYXdf>L%sMu7*&Q+XR)$s3*<9Oyz4OQ|&M7L0l`=GRr0<L#Su)WEeeB
zq;h9<GIn$%yY9rQQK>rV^*{>|Uh>|?Wg&{7r>1zkZLzl{r+&!LhB>{HegoLTvd(h0
zPT~mkN&+qbz9S9F`y6^%vY{SH*C4=qh}qm~xh>s-IbkTGn`5`N>G`66AFJ~vpZc5D
z0wc2*5^qH|J96v(KN8p>2)M(3`e~-fx%Ts!u4?s8eW$!M80pT*x&yGy3z3vlA{hy<
z1!HD?<e(paKoMlAqSd!ecAN^S>73CX_^Nf8D<S=(fZ@W56}{Nud?*ZyY{mCe%a?)>
zWg6kkqw226Z$8am3amvD!hgxNl({W0H2}~^WrX?p+$a6~7!*{CzliQM;FJsQZaBqy
z*b}<Q+*R$PDjg32dNhnbJE^vi(391O13%H3Qz}6$<G*Cu)QM^`11Lg9t@Z*e`_+;Y
zO_v9F?3*!9C2AyOoAq&d>2^IrXnf#VnqM`(H=WeSTSh2Eql3Ys_V~y|siEGG8c_#_
zG6RZ3)D4?v<wn>nK%72MET;}HTR;2Ymf&@rb^I8+KDLxW2i_ntn>kEzT(=Mi^{K&)
zwn3B&{nP&m%)XV9BhJIR1ArV!wrB;ZzjgbR)aZb~C2W)ea4O&nD<ulqh*_y;F^>o6
z=D{3_-ccjO08KpiXy}lRD&9q1usQ`jACwL-mX0$R&%qj~VsFNf_dn^sG+_71<w at o*
z6eu<LW$w;@$Q)m36AOGWo4i}d-@bE_zYyj!quDJT%)`me>H<_?`~)v99*|4p<92sb
zq-N#t(@7~tAgMSxTd5hg5uLl2`;?WEOvXHoOMFPO1F{%D8Gh9wamQWimQU=A_I5wU
zIPf{rpOr<QA<|pq0jInjHO$1~lZrYe$E<{vwx>a*_t{r%9*ETs05+e5LD6zhyJyfy
zTx0`XX*pr+Ykp3-VF0ik;Kz|fZ%0K($%(OH{rmh%KCr#iA{0E4Sx5u%LsHpYznfxn
z_*iJrErak`JCo}*37HnX8MXo7H48>WKUwWSOt3OrB{>~5&Ew=_L;E3Hn6^bT7r{4F
zfNhzT?M~*11ZlsI3Z9uLhr=$lbm<Od{e@b|u*OYZ3HW27F{d<w2Zb<i0-7I6u__}f
zRjA*b>|Rb!9#K(NPjA%_ at u*rB_~($;$mhg`uSO4VKfSMAqXlU*=Po>CQ4xDaV7}T-
zv*#qU&nnDeD~}+EUFdHdl&i(M*~tyQ%MaZ65WL~Z+2!Ty>lQ5%M6jvfR-;)#A;V8>
z at kyUMaYnxO<qln0m5;q>>aI3Gkjt*e at vgR)4XD^bh8&$YKkm*it+K|6n*lqe=6><+
z8eB2&2s^*$yvi{SKeh-x#E_2-BJG!^duJLOjl>WNw+o at GTW>@Ok4uKUML-?KZ$wKC
zY-fsTlLzuohmleXX&`K&fkH%n>)hCV<zY42)GB*x`P-ILP_CrG>x(jDWy*ua9^#h6
zHUqiZkJvN^?t|@d#cyP)7`@_5m8#Ry#^iM)fB07$4e?rbdYN<_Em(p(KWbsh0ijtr
z)CE&4S_NgpCopT4_p7PSv9aHmeB05B#m#LH>^zp%N%N&NkcHhx4;y2(2Is16KK`s&
zv6NLCYKGk!lIG&@cVmxQ{d%+i71q1cNzF6I)Xm(&@aywRyQ_2Vn*wehM@#l&od^wd
z7FA4f2O&4%s88m at 2EY(|%+YaxO24nevhi1u>aS3H1funRCPSP?Gl7y}Tk_;lXVy!K
zzJh%TuUifnNg2MvJ2tph{nF{|4OuI53hs!K{QEXhs`vXn8_!Sglc<7jjt0{86O9oc
zlFuFulK*k7FSm*JWvmHo?v9$-x%@b6xAt(ev;UisJ|7FNd}`h6=>toimzc&3M$+Q_
zPNn;G==DsQa-kqA{N<Mh>iDmxh^N2Kmd5`HvaZZb-E2a*QJDF*Viqj!U{>F$>Hv at y
z)^o{vHaAI4qjA9$_<es~n=-oQXk)El<ih}ay)<tNx2>7Ksb*}kf!V@*pk62`;kN4)
zd_`%`<^Xw*Z{kJ21(yXLEaDCZ(z}_coxbTcY8Hay<-2c-5<o9ogPg*~Ff!E&?#MI7
z0J+_K^AQ9>M>eozFP at V45l2N?OK!4tcrHcZTLXrx#Tlc4aji0O59dYA45YI&HX4>l
z5a}JGcD3@<q<l`A%B06i?_<U1&`=74kMCuzzD<}6@Fl?c4BraV!{q9FbU4h=k6?FI
z!utFAIV17=3s7&5Y*V5PBHjMRRV)SqNBqL~6QATD^u#%<+=b7V-PN1m9%gMj5Kr{P
z_ht~oLjgKWK>sslm#-v6;7;SG_sGZ(4_~A&(|`*<wBVE~3N?_py<Eqx)R&n2xsoXR
zPf!3TkDOf(q6hD~?vf;`U!11YW)eZB=Omv4kTR)ghe)Qn6|7sar?tP(r$4y(SqBv3
zgyI({Vx~49)81Lp&*OH7{Rz#~AiL8XzJ=()i5#`xdPqPMZs$@DYSB&J6*cil4HC!O
zUkT5n7=Dxff#h4h+pyw#RqRm)T$x8(FIVU6@O^ZDqzZAcj;+_FO|4Q~1!cI<Uf?ou
zcZZ=*;9H*LS}5*NPka%E49Q104VY!)yl#e>#dHY!=t93nVzNl>V(y(Uy+#i^JX8&3
zzK;^eIST2QF<<6SuPg{zlvRu<jrcSKFkmQUC7lBX=h0Qc;}Ba0|1|E@7Odh=*?WeY
zbRPjCVgdrHLk-{O2))OtZhJhSMn5$isQop)^uefF)0;H$3bVhmy`ovCW?lpxk_z=l
z-HUL1vu@>WX=OnC`1kKkw+untXf+E;n?@F3OS+B3^D|^jqeALJ+&sW~{WT+Fz-%7y
z6HbVue6iG6f6Y;q?ssL*)wO5Ir;~SUcgNpLiEf_`<%bh5o&L?9kMsWtjc<3<5zAJb
zUey>?F!MMOr$Z-Q8mfW7#9ii<UKTnpRAQMEy0U-$MDuWqv+h&L1>`j+TXY%ICO0q$
zIc!C==|A+tE4llUYaY)I1fqCR^CeBD&KBtzn&V&=H#238Tob+xU9$YxHpB2^M6$dC
zNXyl`(-``}+)!vta|zK!KT1x$TlKfk;U3WrO#_M$>`(IOBas{oeF8!^jl{$*^B3oi
zhEhc@%hjdIV7Q=pSgRI|GK3GNJ08}*grjARk~(wbJJUV5Lkvfq&k;=fS-5seo=D8-
zv1Ajnct!B*=GACGh;t;1{z1p*-gRU4*v-~gj65a`xgXTo5Lr`nsAX~L#<$N%TWAm0
z?GMsrTPlRpA!N<Bl4{=VY0Fh~^xwk<uV^IJUnS9hqw_zNfF2M#c^#MmcozNn{VD6$
zXFMn}d7!1{;!!CXD;&-kH3%B21(y?J&YhU2h^dTUa-i-=5E*ME3s5m;blsW}$vP`j
zRgF^m-=E^-Pg{=iH(1v<*O~@N<}%XAb=OI{$aqw_i2o#*N!tJEqe0L;*QbQ8<jaMd
zr}!Mnzk*kPCIdgdnR=-etB40AS~SJ7=2{qi=GQH;TWL*y%y<dXi?<YauN(ITEZ+pX
zUBiavaZ>x-P4w5lDee*AzUl>qyyf%%<2LzQPNrzICspYKS#V#2J$>3 at f(F`ri4Qkp
zrCRM$1!|*P*w11W8->LIEqpcm0YSzutsPa;>!~jiz*_-WPhxhzWg|VGArdliw?;+=
zUi<FQCZ74H&ymHbLvM)WiHxj*iK`ER)686w4c<7&l&?9vLK5Feg&jb}l2;Juj`$Iu
z{EwY%NXe@l<&e_8RC!<qI~~S{A;#q^e}~fF#4AY@%WE&-(1%9DGKa%6_>Tq35TpDN
z)YGxsR+Q`j8Ys0le>;6#JXI=XLf^W()jy}KA-8}@-_AEGVr6r at Zx_3|*-e_EU`k<3
z9}iN^t<(&i>UWWeIjeR%sQai94>5UY>_YHB*y4b%o<Ya>VV*Bqhla2$1*#G4^QN~d
z%VR<qRPVQYdZ>af{@xm``2|#!Emg<|tj<O)Z$;1a$p2Fg_RWyI+$0I|br9h6Mcekb
zcjt1$Oj;t?bO&8JPs#&zsPsvp9@+cm&G1yT8qFMoCRuRFgmO3tuZUGsnppd5JsN1G
zy>#-ekfq(?XZo3=pC5n!;m}I<sS-|Ht6_S*R5<u{!`uE6M6-RwF>a;YhTu*p^Tj>q
zEhVFN2K>6wRb*B5nMwpOtwe_+EZQ^F at G8+oKg2kZ718)>)`|<}QQVfhWa8fM_HgjT
z*Jkep8Wh{y5I*SvWF$FrD;e3wQSG6EeG>c5 at UdO`^iOnkaRO|wXS6g>W<j!VBmW!%
zSlDMvN>WA7 at hj(wS{N$ZGE-<`sNc+HQP5&RwBqc=v64-|RS7oL39Pk_f~33rQn-Q2
z<+U3<As8b+Gn`YExKb~#e`=6~{osSzV;2OrVPQcDIB at 2Mpt&pxV%=~CE8Em$X5yT!
zU82I6h1?D{dWuaeb5oH2Kp6YNSTX}N4-l|%LM!7PT9)LsPY+4gFJ*n&8ZKXY{?m2)
zH7WRV8 at Wl-0DkRx5Iyr&%21GP6@iK(`k&<?P{-~?TX^sGLaQur285XUxm=wEoSnwi
z3EyR?*j3z-xB6jB*%7BWNLtQG2!D`zb^NKS+T8IRDS;e^rETlb=bLQjn^C~~daA|b
zy3K?#R%%H#E;2!GnqPDu-hg%9d!|pQknz{ud64_W={LiISh1}$aq%1?CC(ZN2(<=W
zU-c$mg!G2$7ns?|>>*VG8xhj%f8C*kgCLbzJIk2>rQ=u|`Pqr!)Aiizb$=Ix^kua1
zn$t#AzQr3QA;{f>vO=ngXA1A-A7?j-Cim8tEsq)a at K<~|@MGX6sR(&!W6AQsVrCez
z@H8~<O6y?)MVId_tCbO;)4V6zr9C_5&v-n}Gy>@|&PX>LRAfMKIA(p_X=E-FmtNG*
zlJHl~F(f(rStRMV-BByt&2rOR>1P0C+l9_`K`$ztb-1d>dcYIi%%fPHTL9UmdwKC>
zy~PFht*?R20FY!ofg93_G)3DbFZVvrWh5<qwqGuy-caa!NTC98KQ#r#isAF5;8<eU
z)yjt#IL)>{1u-Vc*;!#6>Az~4 at qg8{uooQ!;CYtwucN%4-O1mEojBwRuS|#@v{N=O
z-w(w6BP7;Bv|d=wj1VJY*GU#s9=p{-DD7+;W%$L!Ldr?NOb49_Xt=<sB%x44#BPD3
z_D0($MAHjoP)Yx$DUyKgf at hK9a@pS6@zv|^gbJUWQ3Wd^&zPRo`&H(Vb;LQN7!c>k
zdzcy^JkW^YC$R(4aB(Kg{z#bW`$>jKkV_FuoF^6|y_E_N_}eDM(7wC$A1ob6h^>J=
z4~7$NjR?3OIc>bx at LPdwUxV1)l+VGgG8`>cuAY#?OQ$N-HD!vaJnm}`&>zXuOv_M1
z4(xnM)7qT>&D9aD|8;xU=PU_V63)|F)?TQ)tH2z^S3qlg7R4JV-tWayG%Zc3So711
zU51ZS#L0C}+Who}JH)_KXB;1k9 at x{^qkn5|SpJfTEpkt*S@@~ex$>{&>7pA(WClL~
z=8G-`zye}23ElsB!i-c4xU1!+;REtL)bhL{!(qV4*qeFqzdU*RtNw_e|8%STuJ%`G
zLzR9ZqJyW@;>PPg1)u)gF?99(2FK%RYXkIiS5i`acbwKtTE>@yX!JOcKNwSq8lfkw
za^mGTMx?EW%-iipZi|0$adE$(Px2-wd{h7cSQhY)=5ZR3NYk{zLjsWzub+*dC2<nI
zAX60qQi<(a86a~=@lFvaF6lcv5m|1%b-y}kD@TR2oUdD89d5#P$*lDbm>(7NZ(Rh}
zO2QNnjX#=;Gzw(dGqv3}*q|Frp`eL()8JU6_k{r*0J=9)?LO87I|x_|yLJ<QF+|j%
zoi&k$$k>6Gnp`gqbB-;fwjlahsREIQ@!HSjFBV~I)uvi!SwXWTyg_;J)k7SC##|wI
zUHc;f;qW32ZMgwrwr_5ELNyuAtHQ1fPd!W^hGsiQ at Tgb@*RiOxSh3<Slfe-Yy%(7p
z@{~Ay42LdC8q@&GW|7mgWD<Z$)O*S!`9X>%oE+t5Z1tu-qW-!F1Q9p$5Wd0JHol=z
zCxbfA$^8mNMNQYo#_#$Ip$Izv)O37!a at 2@$d1T&Ov+d08*T(Mp^0Wl){h at t<2m-r9
zkOBAGT^D92#uE4UyIkUT!V5Vo-@T+KSO;fha2Vo370}c$Y!Pb>G7~MVvPscRUls$p
z-^AGJ6 at qAg+$zV5bL)unRTQfH)bJ6cTg at 7e)_2Z#M#B|p^i-wB+M)5T3Uy0u at BCe5
zP2z1__xj5o(H~vq_+y-=9={+{<J{B{_rb0mTMVY1pd5+?!gkIIdx|yYK at id$q!Tn@
zpCHKHjjCi#%X7SF-CuR+?z<e15^-uAAYPYX#Y~vit}R!H#Pp(d9tz*5Z&n94-&1ns
zFY#xn)~I3NBYvis@Fh~9wVy}k%HC$1;TB|}bqW*w;WVOZ-40K1j4_%ZWJhtXo_pU5
zZSaFMASw;Iep|fbxRPQfFU!%ivKy(XIpL4`Cc;D9k3`94pr1~2drCGcdwM10vUK27
zm|%&kFa{I{O;@dTku}|2nW042<D>EBFG9V)jgWTr8(T^Tl55rP#-l_tJcvnR$E!n%
z3&fhgP?%E|@H}w$za^_gm9^@@5fv5P at 9}*1?s<bsBJk!YDv8rA5bXG{*#Z79`uM8z
zKT{_Pbg;wdJ!iRbfa3WM{SZ;{;6%CAU;vPw9ZQD$x=&hxMWcZlrrozRJGhVmx5Wm5
zsYelhw%X$Z=R#1pgqFD5+*-MC=;wO#A)|vI;Q2=JcKfq?iSH%9E_`92Kln};q-0af
z$|92tk4N438Sn*xXE-H7N;GJv*WSUWS=_iL-o+hMk_D5FmR^3Ilbip&UT?5LGgHup
za~H+#gqxY&|EbEL15!M?hm(n4hJ&H8^|Ar6AK-Vl8ms4lfQj7g+a+*5v}Wc*8ybMH
zhmpq#%%l)=6V|nG;|ud*IidI9MDZR~xY`M}wim{;TZ}$hYQ2+V{dPm~Sh-*2kr;va
zRWO^~Rd>R;`g3haYw>(ekJg9}Iup^uPK~lI)inOK7@?)zdB7`lES4xyH4!ny{gOqV
zHlY=qAB)6zf|TZmp$^-uH9qgE7LH?VUEnkQ8*oYxG3+kQgh-9yZ4~r}ldq0C(3qr+
zhA>)j9xxAci_uvu)-yAv>hyKJ;rjfG2U3X>xDs&8_RrH1wDkw$<x6G04ul2WGzB|e
z?TtR~dfuJq=8x;C=gUhljuH)KzmsZ}vi#BAZ_i~83=eCH1!FMFE$334?L-5I1>BUv
z7j8OoaV<(Lb>3pu=M!dceBp1d^+aFet{SMil(E4>V7gm?>Bj|$echILl at ea|y4oMF
zNsC_dRmp1yP_?3?<M2oVJYeBmF528Lp(r;dT9&={@_x06&CY_bUjs3c7KW8ORf{y^
zQ%qaqT63T&d%|$}4NKso6)U35RQxb*n<msIQ5urimzKZL;}0};^TW#RbRN?~a1$su
zvJE{)+Ojg_JCyPT^M#RxAf9Qs_B3<mTrtrq1`%eeyoW{~X8we-(H<Vu^%HAjMg&N9
z9P$tIzACK*82vJ2Jivs>_h7kv5eiUjnJrr&ugA!RDYAw2kJn-$vZTsE)uj9<VMf_9
zbk}Sd6Nl@)1JygyyzUmdD8=>ljJ28TH!fMwy3ie3rY=m~H_+rnjy#e;FKmE;Mxhda
zEe(lOdnC&wUHRXSf{97_l=-bTv;3l~By0Jo|4ftBH~*msK&DaeH-|m$w&HlqI)ujY
zV at A5YLi{9n&+5XkzqE?N<9?tLQ>g4=IEM4_(|Db1(!8N<n}+KPmXu`xAox5wgrTzB
zL>+*1t{$HARg~pV>ctU&dGBQn^sDKe=OsC9&E8Y38c5v?s=L)ER%NLGMb?{?n>}};
zLzHh`T&mS%q}jJj)#cWNUq$AR>zS;_Y#3MODU*y&odcz4Bi~*BW~dc#j8Huq*C9{@
zjuuiU|7Q3s+kG#r(dyjID}CB~?3*W*{bugc80N<Xh5tB;B^dOaRIVwg<ykc(va~9)
zwjVore5{vQD&&@AliSrT-Q1lgMSfMHnDqclJJgH+jjM-mShM2V(`RqRR3M-=&~RYs
z^J|ky#<TdByqPP878gvQjHuVsT{T8Te+bFanCjC$wZg1<MeYjVRXs09Po6QbHKYu^
zHa4W2ULkM8O|L)y&U3uubh+|MLgk?Lf|6<}tzD8Sr{;f%%mW!+FaW#jZe~Tyq@Cez
zfny6Vg>mEpwV=-F_cG0#Y at 2pg`II24g`Aumg~3k<TqASc;Wtl#v;xA&mQQEGhgUH)
z<<7Td^J>9BKCOYCpGz7bvOgV=ht$+E>DYp0Q}srIqNUP9|5s-x?1)37q5F9H;f@;U
zY=n-piIyggf1Ab%b9dZ_EsWN<aPij8@^UpZo#Pcf9N<IFt|YArhMYuPvd6E33-n7y
z2F921W=+0p&j4S4OD=P#;*mH(0)s6+$WJ>#WzT8r<5ryDo>eC?WRjMyFy1>R!aG~v
zA+Dj%Bu)IhOABO$VAreiBEhhj8wA=SL9yM)&6U#(mRP%!uLqA|6JrV;&3{C&J)ALP
zX?2B0>8-E`CcL(o4-SPXt*zYL!vv#M`<BO3)L<@<C$ZsMVkM-wNTLP?4b!kG;aBMs
z0c)99l6F~a1Q7^(<PS=b*K{&|2wu{?^ed}#SEUmE2eVI4$H(ts at aAMAoI3H)#-r$&
zkpJ;k9()Ij0oL_`?@kVLB%W4T4LII;w at Q!k!pD<$dDYqGS|9!tSV17kG@rF$vifHX
zHtJS#sNr!%nvdT9qXjr)NSO_t^O>b at 5ujZX3s~qOP$q*oUy@*1ha%S2`WV9E at eUaP
z<%@l>ARxDma)XAmx;~pONYvV7aVhJgqj!JVBBnFxL^gC-3mdQPcU@|!ewe-%?H4e)
zE<n@!Rd}sfV-4%?pn5H`LzIg82#*`uV5u&&W3|uTVr8)Q*oncpY+0-A0_G6C8(1H@
zMRW60#ET$r6?%abpO9o+C@`vI?*5M5u1{eJm(O)X=0>9=aDkFaz|4z+xS=pIB19h+
zL%*(3asVhX7R|@{jbybPukq(#8gHKYjPSOWn*lSb-nWX^WZ}fl^K_-ryx0GfbT)cO
zYMV5CQYtLTka{HSpaVDUM at 86kKxCa=KZZK=g2I}{IuA2vuyuLOHlgFi+o9yM@=Jyl
zkqDCK{)}}JaJKt&SSoo}OXR|DZuLkBC~n+(lrsDWgZ)PagN={kcXoV~URplQxqWv|
zKZKubyX6NO(u3GoH|E-bUd>{U{Hc(|DrK}{En0}{H&s##OVG$9DBBH`<=ubOBV>QS
zqy*K97(;W=$1OmMdhHk~Cq(!44cVVD!{4L!SnJ<MJyVrp+irGN$>iI!4QYMZ?LvRL
ze at Q{KpSeNw;`gJDyQ@&x(mls^HIG9fL)^=-49mv%F66<DRNze-|GCO_Pi4EHrjZ=E
z0d-b;)KM(1_~f9^qfj4$6^RPJa1y5ajz;W~$?+L{h6vT(3qZ{pPsq*mr0uJM6dH?G
z=5|DfFnw&vX(Ai~u$VJZ_Igq1a3(J`PJVOjLMamDC9ezIs>J2~?D$NcqDD9|AFiVd
z-9B(ib3A7FsB%ykmjBLYjK;W2*L;<i%OIzFSxe9Eiz(E70hZAt`^ZNtmCH^xER2)F
zs|v7q1BGL$Q;URdr42`dGfR*HA3V2SDN+oIIKCDOv*~4VzWsq*9;V*q|8V{EWLg7Z
z2eiZ>l8~O(j)oV2{sH;_G%<5gD890RH=}|+bopI;>gfl}t_3`_>UJ6g at 3d*Q at R&J1
zKhw<5Php$~r8#mafbnhhZy^meRIN3mDG{DJe1XMWswfMN85)MMVcNVdC!h3NEOgri
z(Q7Mtxr@B7<9G=YV*Tq1{Y%TX4&`%PLF7O6RWCa1i)Z-Rj;uC4MUixRH;m_<D&lja
z<@_5PDn3ZpO7n|FmRjM<qN>P{Y)_^vR%%>ne<1!KbI@;1#OO0fdlNbcRj_c6JxGzZ
z_8E;!*hS&C7eh$6DNvc{_t&?D)j at aVVNTGCmi%k|_wVc)6#j~NN%LCIEmIlxQXD<@
zdADEz8j2Fgx_b!knITr_a4r*MmZ?Z8f#*LuWj4U`2 at y3-SZh1L@QC?k-Jkd_ifcF)
z(*Gms9UCiagDt=l+qP}nw$rg~+jb}E*tYGYW8=g|$96jCWb)oScjn9f0kxmfs;afH
z|ITYA;B)<(lsJSLm=wv`?vCpOx3xfUq6){LF-k4LM#4t!0X?N*-UjgkWhNs@R}mS6
zj6q0YEaaA4NK^CRYJdS#@Y?76&p!gr)$;wG$fUG*4Qrj*;85kE9fK1Q1^=5I|92)!
zH2Rj>|Gs;vm)G;&G}%(dugjKEU+ at 4CWkc!}!a`Uij0%Ne0~)XXCeS_;&SN5>DK*>n
zzWp3~Sm;PH7~fBR!1umTko8na#DzroHv-nhVl at CgcD0m%DQMD#nz(8tcoLT#iQDa>
zrpZ^SaA7YT<Mx^QXWM?5_7qPGMT<Ja+J_KEIW4Mq-BVM#1c8+53^KWEE9i6;7K`*~
z9?k;3A=&;GR6q`+PL5D1q at Kp_w^m^x6=4^gaG)KjSA_5)Zq~JMa)_2}6W at th_T$4h
z`&MF4W%T8Y5RUWQaQ5u@ig5Q(3TM0k2XRN#-wA@%kUMIFiPagLXgvFb0HWTg(-rQO
z6(MJtI=G`&R{jIrM3bjYP?Y4_lgbOdEEOS_YV+L5F6AzWk**GAbbI)CK<y==@Jxe>
z;R!l*B<HnGP2P#gz;InZ`W<gPQm`LZ318Wr6TnK+MN&NxR(<x;6WYWFZG+epEEVPt
z^W79v4Wi(`M!xo!mlxfIR|R@$IN`R%h1Ylcoc|6w|A%(M|8{b;KCl15Wfsd2HPbNp
zHJKR4yH9lX$MaMzwW;_p$Aa$gy`Twwbppw6&#6vhr147|jtnRxOuRo$(L{CeAM~Y-
z?R`x)a$#94M3%ZKCRBPNlgJC_W=A29Tg>!r(MqFR$^fcb;;5X?J2b0cvFDdOf}RE<
zPZEA6;-E>L)&XMlzqATHZ>^s(n0v*iJj3F9oS3C>QWeO|zhat&nnt?Fk<gbSXn>kN
zJKxoYuezrkD)rr9=hPY*X9>>^i0STo0OMseZNVaqn_%QDC2PM2+MAVn9A0KB(`E&h
z&It_*RCAhf2xG7Y-nj at D^vIC~Rs){x?-;v6gi4b;3gsLHw|;;?nX&c551kLw0{cpR
zSSPE?NH8pNWDokQ#bBy4jO1zJ%<U9o+A(Qf4q^#FBe=V-fr2QNgI_^-!P)dq`j%(g
zFaIjXP@{2lFz6q|0?(_^wkLE^1|jaDSPl=f{r_A8uNU+Eu1d+4SZXvLp4yQAL0OCZ
z=M?{QSS5HmK-L%V&bPZE!`mD7YLoi_j}k0zInF-ha<n8_fGw9xZ@#DnohTqxWac%1
zYZObzylL<-B0GMSfex>(?%drgnYS$OJVe at p;(oH;O0 at wUg-54vGu(H##ky4N{vng{
zdz~*ApUm_!LDz$jEj(2H)Ck{>`kUE`hWN}PJ{UH1c_kbVk|OKFD(27oCFV#?kQJ?+
z{5t$frzlCKPU2cAWkYoC2-+~-C~=JzR$v>}jLQ`71nZUz0`eNKoVIU7P)6Y&66P(&
zdJ1A!(<~4dF|a}S8CRZNTL4My1txgP2oVR~FR?t>I)GJOoD7UhV>WPTub#jchW9Tn
zv{n&`o~8Q6NjTq+*F1DQvmXsXEUiq}AXqzU7cL)@s4I&hG|`QG2OyI$9=0^>1chNe
z^Uy&g?B5de?Cbu=WPY4F?f9K)GsJNa<Jmzyb&-wu--iZ!*7Y5=EZ~`tVBE=gL*Z%z
zV@*+<9zqo%ZlTM}ccCW{+fT&5U0McA<FiLjcjsc-V}ZW^7o{TJS`GiDJ{_I?N^h3G
z@Xkvl7c&o~$6B$A6yDOWMLwIh2RoVxjL<CPssT|1je3zAm6XQ8kR|?!>Lg6eiA%AQ
z9|K)BpV~pD-auRhKEW9C5+J^z?s`|lX-QsjJPs12?%}#SxigTpwy6bnG)l>xlkcY|
z2QE>bD0Z1!y+%-xeWJb<>QuYl*7^spurP6u{B87Hcs+&N`u6dBVUCV#rj>oA_56Y#
z)LU+^*1e=Ust7KldSkbWLS%cnd<%b9G9d*g#iMYD04`1)3<R~<9;e`p#cEPH)8+w}
z2RF%7)Jck-!Bo3s!t3X;Ko;H)hp<OETU~q08x!r$5wK2e2mK%<Q*ijddQwzP+?)&p
z@gV$#vc(JoVPc?3>+8^XmUO(Bfr5>En)YA6s$eZ3frR5vgm?USMDTDH5k}0Lwov at w
zkVg%#8q{^Pze?r)#l)O!my`$L3%kt)ST0F*iWlbmF1dF02l>WF<DMn~oqsY7j6Ib<
zPvO4Dz`nj$*ejfWJ7B_Ed=h6v{_pl&kX!<AI|=t<urjlrE?$;SuEahOmP2LM`DlH=
zmX|)r8a5hA?Q#Aus5$-tI<7QPhFQwStxmzYr$@Q9Fy0uCAwiAPM`L*LQx5@zakC=c
zf+z{~uVN>u9D#MxI0%YP2xZk}=pgvX<)GIERcC^NiWPU70J5!_Y70YEE}p(^M5VXl
zVu!=`WJ%f>L6Dv#gmj)?%s(z#br~mWfIfmPxVbA&9Cs%8Dh!Lo4{cZ#*DQkT0Y&yI
z6IHYoE9EjlJGiCEJi!SRX->o%ko>bnBFI?t^bx!W&s2<<QxaVc>+GV)!ym6IUVjSJ
z`at4+Ak}!#W2#PFI2NY%fg{nl*yi#@p0NwXy(?~<n!!E~3OHD|g@5ej+Hr^~4i5pZ
zLrnQ&CdQDesD;1Jg<!h~1KoFqr#49oKp+4`36K|v5G|-_C>WHqD8$`abw{7F_u&x;
zKR_jKFYJMGs_}(B)CUtIgFYe7D#&0+4`WrgM5f&87vuYy?f-mL@;g}miGRQg*Cdd(
z9D*Ex1OWd3tw<;=|G`D%?(0gz;aRD7-fBr3pTNvXS_8pM$IA%kXVccdnH_vs^ueAe
z54zv`>zp64{KKu-6h_MSm(n>`w}R84H(@ayJsqMmc>uz+Rv=~GW~U4|*(go-yl&;h
zjB+ at 1DoSQ%mNS)#srq0R*CUGHY-;Mq(AZ#s+yF7aml4*%N)xLq5jkzo2bPD<I{`{Q
z2;Ndk2TniEXxEtvV~npdq!={0s<$qgT^lc6G>`?hJl4$-co|~pN$QFah6-j4h!8X4
z2d4mSeu_&bIQ`x~@&h?k;CTsw!@QJju)Q>OVR0#Y62llTW-?*C*2i$7P6p$4eLO%d
z=`f1s<}y`(DqDs$YJts}v@*kUrxU%MSI2%QCe3^P{AzkRzDvv1$bIn?c+cTm%BfOU
zl^KVICi(6 at h)G-EYl%akLEC`PA!wwqF@3as8?>~*f(mL{1-kgFt><cZrYP!XI$~Io
zU|~tt#7=1hPi{*g+up#MCw||2-Bjf9-c;P@$&-?6uWP}%b<6xG-xWvbAB~`lF|%Zp
zUZ32)iu#-}LF4>l3&m8*TsX!vdZl-n-dTPzdA)lx=%e6I#!0`AEi$bqK-a)W6wu`;
zKAJ_c%*p3M848z=yMhXvBpJ%8D;U(M4Z=aw#^bU%uXxNI7V8M$Vh;odAj}@O8&-IY
z2^7ItweAr)mXyH&I5ri33Ije`>#d)!dY{Z%&%TFk@;VaiWLGvN`g1_<7}H;Bg*~sB
zY-Ix7TAl^xWk at To<)S2!jKdFNMLeoDj8ST;s#oi-=eV3`UtR3})w`(2m<}2w at u$N(
zB6lPq|3u;Sx?~&0H9aSirKOcn=+~lb#Y%Xqx<-q19<mZcU6!CoXgrOIhX2VFl4)b9
zQ-fq})l{(e0E-)B*h_*+8Z<Ffl^t7VINTJ;XvBFRf#&H^vyhL`TeVZ3*4*6|%~89(
zoh`D3lZTQGccdi*3)J0HT6K@Dn3PZ^CcrLzr)Bje6g1R5S$ax3(kKjL&jnv;uJuN3
zxP5hZ34xm$C$0xq1_<fgW!Ds8F*+kTM1}C18k_7l*UIBR9Rqx4EmJQQ8KblZmv&y;
z$^%bC{!2S(VQM`kQctZX2RHTvS|%K6bx(RJ02lwstPNQJGZfAQdg=<u9K7(Aux3%X
z8=l!5Skhr(sKl3X72Ao7$$3z#wMurf*)mm0*W`-CH}y&J>{jo|(ss7bUU5*;r}*J)
z*r_!DUkrg`2_PJSd%ng5;`OGM*F)7#w;Q48QLO-x3uGO+H<PTci2{oNMK8&(Ct-)q
zl2hNJ7myI|B6t9hz_ui%lhC%TX#e9)oS&4HS#OXXdkF=u48d$RUDOuS=CtjUHG%=0
zp=xq?ef2LKpM9IxG3V7OVN{XYSvBMfI3%3*dox&pg#NMD&MA3qJ2EJxk+EvK6P3(0
zZyv+$0^>XW=Cz=1(Yc-|ztwG{j0#5!IWK at 3!qDbbK#Evhh2$Hkw<k~}F)Y<9Z`TVD
zqQ^&ubq2j87FOPgGu~@c4Yl)a-b;`2q}J-ZKO`(ilS?qc5Cv!DBi*JMkJR?zit6A(
znj9pU3HEh{O|qR$>Xcy9$`x;Fzd+&t^;}+X$$FVy*BTe at rba8sK-`$ZR8nOLF>Rla
z!!f8`gY<Cp>sq<VSb))IGep at v3vM4HAOG8`{PjyTovvU73{g%|QBj@lq&2WzM?`lp
z%b(CAqkRta2b<@!>`|?u%4Xz*YL5qeD at +<vh?(L>@~G0+hU;@qldUZXF+>=CLP)D7
z91w~K48gXdFaj4at}I4y!J)m;&!B`P$lKnwy!<E6X~qo~J&Q0(TD0!$&w)JlnXpu0
z9QlKF7-n$^K0--Yi4O6PbH&x5SlFyu&JxV7cwl{{$3P)xuydefthLz5!4jMZylhf<
zM6r!1Eq4R&a+1{+8!%H|!b1jfTq5xX7w!VWnGgEz#xgENKf}QH@V<S?!it$AbVzl%
z9X(o%2))BJ$?KfGPZ-9%T0g15tCUf>iSdqqxfQ(}8fKq7l}`Z4x{U<GlhO6<2bT!V
zC4C@%ueu8xHkVd2g4{z1I87;Ui86=P3mLD(J@~lb74-&~99x}*Lm=|Z3rR5E_OKl3
zQFakZG!=KcD}}9=G#<N%uPT&tk-i$k-G?m)$Z3$IK%Q4XcRkJMQf}dCdCu5dSj6xo
zj6Pv@d{uK6{%FB~yw9~`WwCDRNd-<QebGj;T^(qupgVlFN##`>WXTn^`nUWThv>vP
z%Mp%BUl;ba$16BoNC;OpxZ`mb*`;tCQ8_dN&AlEf8jm&KL;1~4lQlbT{Ay5Qx9ylO
zH_ID9JObCILR$a(Q<!j^W$m8#TywHLW4OrIo9+2oAo9!a%_wZ4&i&CHttP&#<E~qF
zp@$0k7WM0yk=zEAZ;c>#Qd~NI<r3C5o;|t2 at XD5|!q`hyl$XA+ihZIW`Vs|2HT1+8
zS{_9;Y@_q2`gOPnx`d8nOgbK}AL6U?pzdf!$X4{Sf`<~wEukQ*MWzV02)#08(#Kcp
zmg``-i=l9nql8T#%Dxjtsf^c&!3x73e#<SaSfrZ8EWw<jqE9qrEt@=St%|WlW1>*%
zEb~XGd?gvUcI7i;pAip<;}~uM<%EVw36>o1j5!CI$vCuChW#1`m`hW(MX^mR$%rRz
zAGgwb5TfRLPa`&$&yseg!Y>4k!f at IE%ZNzI%76|tb%b%2?{wvNolgrXQvY-p7$K<-
z%AkEMsdEiq%mV>MEr2AG+05NmrPSt8Tv~!LsfnHdwrpOfqxNVE at 8Vm;UW<<`h5uzO
zW%*5Rm+*@(${YKLb+jS`y%Bv8?+N{_AVs^wOob2+bjJSh%pWCdK9!v?fx5Vh$2eI<
z?TarBMN*Nk8KwwLHLJmO>R_um|Cz&5&*SOJQ_uUUwR-woa79sQMNycy{_LA=>L1^d
zvRLjOhx~s55gU}~LSy$Sdk3{$8Ug$As}U78qe)%z=a-+>#sQ$Hzgf>p8CRXc(!8 at m
z&sAQl2HtMTRjz6C-sYN7!eM0d>Xhn?B1LLPM269ms&+k*4-JV9|7rLy?eUC<TZuh5
zL)u5;wS|Vb0ToxJJin^hFX#|k>q%3kPOfljAv(ovQH&%OEi==ww!!Rc{DhWpR&>6V
zG#{Ds5efR>nUPhuh!At03T2QFdFS+!CEFglUfP6idTm*0HYn?AFv2tXSr^WdT;i+W
z1^2BQ9|ld at iB=&BmcU)PKa9uS=ZcM!#%lPMagSS>7CV`KK9&|*)phy}+GDhyu4>b&
z%Jrzpo9DO|v?7hHT{!DmiDL}~SMobuCHLwCH5<GrjnZT<XpJxUB}I<bRS&6;1B(9D
z1dbA!v5RIDl;rm97RO@X`G?aGfZ)+l=KygfrVwqspkh}c*9|;uy8WCs1o9WV2wg7z
zf+r3+z!bT5yy*%cN-c5v7{Z>=W%rlTMxVPeN#1-PnI at 6n^fnA2cxdwuQ7!TR4TK2p
zq-l`xG_ip-#;-afr`SB&%WCR^{T;tjA`%8`+GaR-HhgG8FwtufiHF-o`R!n{#8T=M
zazhSR#_g5+lD~4h#PTwnr;?$`YCfeY<%{<f!5QH0Mj0RH9Rh5YNv8CFhqzd1hF?|^
zr(cTrC;%ePRWP#m{ohibacyFc@o+SZNZ6y^6g@({T)c00bJ9v#^vB(2{Ad&PPZ>mK
zt`_s`ZPzws0SHq%95_XoCa?G#v2{Fc3q6(^&|0i>K`fPZnk~MC_DMM`1iq}k`735S
zdq3=>VP%O|U5K2`G$PG7e_ieO)K_wCa9*__18YsosX)qjtdx!dE;0qGleEw_R?pPC
zT5EZoVrDHg`GC>wvCSfCfvfpowVb_ at H!Rxc+um?ZrxOpy0I3=+hV-$GVRAYbDZ6EN
z;*_miYpUs+-n=a;k}?z8d9%dc#P*SkCgrYC#En`u4=0925cM)>5-%j<fTn0Wo%ymm
z;bc(ZZwEo75@$;5`R6nU;s*a+(X~Rtu6(B?vZsXh+`ykVe at 2+Trl(I3=}D<b@K&I!
zByB?I3f1*xN|iH{V#HFs4D!qxMy-CSb;29hMR_$wF-6_>AEH-_7Mh?lYM}dST3Vx{
zk+X#+aan3NvuU_kVGLTW4ojCo!zd(46b1;bxDl7`P$_dZ!6i;uxSJqfQbAErm~Xxc
zR(Sl>Pj;iHJ99&_wn*RRfGSc;4Bv3Ve9P=civQ3;na3ncQXQn1n2t2D#<z|U1=2)q
z{w38fgWd1Y5T942lth28TRGDK4qyAlO5Y#1u1A-!j4!$Ku7lBL!zUxX-EG2B#)_D`
zuo}SHCzWLkvnwjtxP{3w%Fvnxr?6o@=9?+V+qtazL1ml;fmK8>)RW7HKw8FtL(J67
zw~&&fK1~F-5X_U%CtkR!4~Xi{xx$=h<p=P{V}s7i7$cT8ROf<^#4|Fm0Sf06Cln{D
zLwf*-tRd_-rs7T;Xthc#W^rfWaJ&W(!e-^E81{&S5z;my+hPjUw%V4J_SQ_S0(iEf
z*+n3{e}>x+gEXWw=#!wcEo~>{MbZn`2e-DkbG<j(6w(d)xZ7J=`1fbeez at XSfm!2N
zY5iCB8QWw8eg8`sy}GqTUV)1DXB{mOMpmXwtdY@G^1^uaEKK3e=1zrU)s<uv(Z*Ya
zLKx`u5>anjM5*Og8P%iH^be%`q7KDDhG2|%w`b9C6^*7e8b#%1QGC51iB3FOt)ep8
zIHs1SvN34cJFb?qn&{G`j3xB<_2i!G4IJx#*cS<2t$z9=Zn)$1muW8^m!Y_t03u;Z
zs3XcBZf40Qqy^O8X<6#|V%6-FEGyjVt!y}y$+*~#gTSH(%j8X>lS&D|-vIi0qpCVr
zX~=0vh>%cP7KHg!TTvefa}08~1UrtFQqQdwxTZ>WCTA%YvXCcn+6*yt1~kBwAkXQx
z5^bH%%0j=72)i*ja*;nn7vicRIb8wkH2lGns*B}YB%`J<tp0JVreh<sz83dm_?jyh
z+9Yng?aj5r00A?bi~nazf|8}N>m>@gT*6PgMjH(qNE!csk!K+G;Ak;mo9vP74^hzF
zN;(-|eJ4T(TMx5>{;o(yeiXckeAz+pXi5KHKr2cOjh4=n3_W1!X3-A$XyJU=|NK>Z
z&VFt-6qYiSRK6?z9Qvq}krgph$EBFHowpi1TS2I6NJbpzgM%cyt%v9f{M&HS2Z5Uf
zt<kW;^TW7jiDwxIlZ|&F<WTh5UMHkp6*cUlHAcCc%0<3a2ycz6o+1gun;d@S@TXl?
z0G3u$p3Eo8vJA&vAT(l!q{i<3mDrn8Nz8X6<zT*a`7X`|q>MK at JgO(vf>17-uYfWP
zQ&M`-yhb3(oC2b@%J+JeJ2z=arFNu59==7eenQr=Dz)w~$V`U{DPY(8_#x9_*+qE;
zR-cAGb=hKPrNnZCPwa&jpj1OSp&MrOCOq~pP;GuJ8RMizFP{`@_&^fzP|VOU)t$3y
zk${U=>+xZowG1IGbf5yqIPMgBLGQOUNcz+3;ts%=l88$DCJos=6e=~<W=wbIo**n`
z>(~5g##>leXI1T;n)#$?bF$(#M}Grz-Cog$uO(-X=TR6(P{OzIZ2-h#2=1a_iSyQn
z^ZqRsiSe34sm-_NYFr}JA`ABRyy2YqB5aJpP)Lm8+c>gAsO{`#`o&C7*y_uzP(?c_
znc<`42`ue(P&8Gys6lIi{1g|A9xKgn&d=YhGFS!DAhcTYjun+xrNQ+35oR_fZ*i&C
zR$wh*D=O4Bs<p=3&J_s$q0NrNs&*ggkM_}$t3`5)4L}a8fK?iq4?LrDC+jPPZ+aTO
zXVF0y02<nG3s<gFL3$Po>kdr(;wF9xwzo}&MTvfh$2nTgXMWw_zdD-h{hYkuAoq|n
zUW~>pNF at -qN3|Wky*-lbOl^P3y0qysdnT$9Ht`IeU0*I5+|+UT%C_<EWC|lhlpAyO
zSXR|8qmF9=ljoMJ<mi(ON}Vy<Rn9Gi#S&BDH&QOc3W_)8t;Z^&1H}u3k{{8gzwXXo
z7W>oEF+T1L_s74&A$wh`;wQzRe@&(o1rLL28ngbW9nK<{v;l;^Isa-Io6=^N^<vqG
zGa&X(f9nlUVkP_*;s!~~`dxM*;C|<KUKJ2%eW5fKNs?(!Vh+M{%8A@WRm8)@kb88P
zKpu(elG&MZ7Nlyn`BD9P!Z%snhac}>gf8NqClxmbg51+Dh=KibH!#LgatQNl5_1dK
za%PF_&@}D`9;q1t$n;ck=%n8A(uMj3+%PBdi_|u1P$brBeq`*Bs`$AF(#3!1aTub&
z-OIJ^XGb0 at Au_9T`?~qv8RhjCbuRnKlUGaAbFMJ!VHJmDvrXIk<mrvBt&esX6E=Bs
zd_8-Ti;(Y2;xZyq4{rq_;3QnmODnSLL2|DerV9qQq7mqqPYhOaaPq<!3u6n8J%|Mn
zoZxg_efL@6=u<fJ6_RdcG-(3|-qbq{G^K44R}{dJk+9W|QTT#NoULL^X0)A=t3t}w
zm1VDPaI?xgV#D^G7D;(H;Yf?6fPzbk5_TYFrEJMj&A}<ec%<1Zh@|H%M7UkQ>==@N
ztTmfHd`#tkow_piKM(Z9GWGgpYSXUhz-oe!_|xtDZ$4-H-<tQd7QufA#5G;z|8@b|
zXp!1*z0&2e)4}`s<!mPz1Q<XLmpJS<rhxOvlG*FHx6W?MW#yh8-3pE0dP3(im#OWJ
zI=>Ed>9Ivrxr(<XD%jtQMQUii8PjVL6pSXwvwc`QwW8*HJ-TH0+etjOYoYbT^@$0;
z8KqH5a5QdJJoe+QrD9`PWK^%B4;VxNGr<w14l%?b3GF7Vh_pC%Zz~AAjqUvuf~RMO
z<iHW%3lb5UrlobXcQXf_AriHYh}6yL*m5a*I??<4zY2O|WR-<@4o6P3wmEGY-oE<O
zg-Z=X2|Cib_wGA0h>)g5rQ5ER?Bv?;IvQxg<|xo|7OK5JarBiYKxot_K(#`y(^KY;
z9|3w<LGr&beJ<v~1(N|Sx?-`-ac8t9YPeHI_Hheg3v0kiz7x#jQS0GC-o!q_5~ZOo
zKAl96l<(~NAGTssfmWGQgsS-Ct~G8UD`{pvg*I36ZU%_nQXN;YPNQ0j>0G@#U%-C0
z&<|Oq=}t${DIh0hDC>rf9i&ot{s?TpfYRn8Y4-Fgh|!U>M~&T47YJELUzC}fT-nOv
zYQfiFHgJcpCTVK3dC;wtrWh3bN!u%9wKdqP9JK_JUcRC`(;CFwA{$a7Vb-$zPtATv
zX at I*wWVT$<)MnZw0&T`^4cpg3@>->W{a(Q2thyl|R`bnCcWA!~?Wnyj7|8#}L}O(+
zS)&>Jo;oPkq|;MW>klNP6%{X37-s9rek9cXQVkZ$5Ri0DujG60*yf|JJe!Zz#?s2#
zol3aHA_aXiL$)IkBVH4u8M-7?tGhO*CKdMdVm-)yRO<=dLz9dPe6=ov&w|5S7Inl;
z$4bK=nN<gj|C&D0Y5u<gMY;E7@jF<bgG&(4g3TorYJ$C}X2N^<t_~ju%<hb1_{4JT
z`02WI+K~xzB<2+EBWqv#tU=dH&1j*dU$*0K`BFXoLSvWERjyDW&E+IX?i5(+fd-n7
zx>weyhjOi^NwRE1Zzwrz<4kGF(05_fg-`?<s3QBT3pnc!Bjf!D5}kMKDMYYIoDQMe
zePsIh6kSd}1t;*AUE7Z#Uj-{s*va8^XztFN+ttCdB1%1z*VQSrAxv2%Be2HnifhO#
zEzV2LcW%(A@o?n_3Lad7f5J%6NvkA3a*#O_Zc<w*!e)JVlGj91SgA-V%%bEcX-w(~
z>q>d0p}0zY%N- at ckUnIjjrPZvJRDpulOfhEylFWiEjUdUOcuV!Rx!|A4Q;TQbYe8B
ztf6*yhE5`sFiTizU9ISr4FohWWY9AcCe3a%`|mgZpif9kOIr;|Wa0uj3;p>!!SjES
zCFA<D7Xt<msG!h++JWT(jsdKose^~?V7>^r7v-0axc0pPJnftajzPRk$({*?iC?Lu
zjpx+MDfmC_v`kZvNDsCpJ+#40`8eNV2lHet$Yl;M2Z~D<Kgz7u)LMt`Bh!X!!ziBY
z%++MZ7){O_rp+<1P2)&C2mb|ZLsUz!8&|^Mt%1{kkBZKCCYErl&6QYMRzIrZM#F&U
z)A~mBBUq7tl&cptVyc$($gzbiJX_U0K;{QfWEacNcTG7#V6YgUT1kv_t@<e&jQ~ix
zk0s at h&7hnnZ#Z;!{D$Xh at 3<SyAEIWmaXB4rxQ`CKXZz+zU)ITT+I$DSUou^0{Zj<G
z(fHc1<0Oqem?hlMugwvdqo)%Y@k(;EE3G1$z*`j)OPmv6v=O-pnCHlvaL>-jl8-XB
zz@;(fN`lQ%5hUfBoabBO)Rb`N0&gCO+-Fbfg&Mw+<(Ldhv%|IsNPN(&+LVTxID*Xn
z*WLiZ>(UK$t{~T7sqKk5np?p=rr;MyVI0OiF at JLnk5Gx6YR2PhL0Ih=;*H-?TItfY
z>-`pg!cvq)A?yoM;UWLXW8e at SVbiNt_9Cb*%l^J8Swl^0$zvn!1@|~Pvo#Yyw>7FN
zPTqV7In+?qae7x12Kp@%V6z~=nCc`!R{CddmSn|srFchC0+E!-i-<UY4eu1aJqgK8
zR{AbsiB$$t<gadJ>)_Ui8Fr@|e5Y0 at xaEn_Zn+h&zl^MK*fdo7LitF{s|{@%Y%cUJ
zT{V36OfRx;QXg!2HJ$^k2X~lWPtx at Rf&zPD^Mzgnr}$6K2G#ly3Eh*NfgT{);2$#r
zdl5>OHSx%bcMY?gBNvPsp%8PqImC7n_8gjCvT0#nM$%DVW8}6hWfiUDwkkC0?HZ#q
zD{kj?3J(u|%Aluj<l$U?pe3^R{P=ESl$ouB6OK-<&IUGbE5~7PA@^#GtrN00oa$O2
z9Pyo}bP;TI$uYKF=k=0fm%bH;YyTCx9=h5ehQ_EjaVJ2)L!uC#J~q2dk04YFhoP#T
z_LEV^%Ylu%Gj+W?=PO$w%BFrL(SmbMA-b^>N1C^2?Wd6?I!#Q*NXOLERoSPbI}{^3
zTh2FB&*Yt`vZHbI)B$FlEM(VPG4gJbhpsgn$)z{Itpg%vTS=(?8gD2w=%k(RVBlsL
zNSlKsXbdoRs#e7ymH<Xe?Ah1HB=y}1dhV`97Y*$$eY}q2#=iAFuACn1HHma*z#7~7
z at U&3JH!dzMfha8NNL@UX{v(t;$(Jha1Z^;kd5-=r$<tpE3Nq{cOq?i-);eI{J-fUi
z9|#XV!bOzcNdzzDB<CLIl8V6)xS7H>9{&?3UMI)KidHT)6r$NP(fFm%yvs$cnnR!Y
zpaPfD>!3RwJrhw|Z8n$z-ZyZ)3*l$y#TnT(b<7tz&btu}IlrdyY_XPO6CSR)M!Jp1
z9*OLW-qus-HI876cTx0I{Li0QuE@C#7MJInsc#FtOLgJj+qDm;mHc4b<jX~FS()M(
z?4GdJ5bw~q-kvRH&KFFYPM9}+JG*r-{Y0~9i3s_Ra#9hS45Q_YsLo%gYP;`D_}l~%
z!lut>q8GR*QDU?<o>#(Y;glm(bU5UNGoZ<s!T<0!zjxjwVQh7+^!W2@v}Q)tr9|0K
zTIf)e>gqvofa{p=xSh&9+2{nvJzwu+P6p-~EzFs3{ZMK9ZT?R0f?qFPx_gs&dy`Cq
zC-tG#j{G10{O&NlW|-cu_OS+Z134cuA|Wvuxyd61TxA7ifMw4{n4pw0P>p`7r$GIo
zBEo^tq(pR*V(*wW)MSr^jKos;0v&ms<KttXwyy`hfyc;!m$kLG3l;I<tX=~o$(yn#
zq#);cK%}evcPFxa^lKivSTZ9&awZ$kBadD1qk19^&oRsCNMp+HJUP_wEg1}7j~6_V
zANeo!EzMqb@I?fMpoMMmO92Z*_j^aGm1*mO9H;^$TvBUf8c)MK@((lz<zL`rC|Mms
z)_PX{OZ^YwUhR~YR!kiHos1FV|CpoU5#U)Q<P;-$g>4IBUTXW^z2_)wtaLy*Nvs)9
z^=ox6cw6oy8x*-zMVy|*nP+yWfgq5py6O6Npk6)ROr$6(P?1%Lv<h7V;^l@CJKgMv
zT0rb91w26z5d>TR`{J~VSwC6}<;s$g^30QJ`N(tLaHDN$#FUYdKdQ45Jom&M)<%uN
zBi>(rFNoYPEqq_Ez3=;I`Jq1pFn7M3|CYxV>a%sc4pZE=&V|BVBL&`DaDN3jOl%>a
zR7e(-?nOT(k^EuWp};!4 at Uu#ig^UxPzLh`Whoh`FX~Rd<a*(`&oXAx3WSs4NeErFD
z5p#ib{r*^*Uh7mrwz5yH6`36Z&-?$PievIzw1d{Z$2|6P{6D`o2r6*%JME&8z82H}
zt_JQZZO-cTGlAAY7=ZOScXS}ROFs~74$qdz%8R4$D?6dXK+^7%M3r|f-wrnQrl8v$
z+IMnA=_?z$(q9Txavk#EH-KkaYiYzU0al39P*^rbaWu&8o>Wkhv%t`knplV`mn4``
zJ7Et2tnuZ)vW;6BuS3cxB^lL_!sR~wtSY`F)aKs>>P5wfFQtckdr$?b-O_3Z6R!+!
zKmq?8U$419jF!Srt>utX?GN8#7yIDlb&)RR)*qDRP5CYNL61oSuRoRxHdc<@eYaOQ
zkf15m*m=IMEl&F%b6YSzhsZvjyRd$LQh42r?GfArzxbu_dV_ZyJ~-`j{kAnM`xvZ-
zu%5Q|T(0Bd^I*Unvxz#C=Gld}ZUuA2E+PwzFNa^BbKT{461HoJY9%*vNLkFwefSR5
z>;_<r*LH6zpI5fR5j5k<k^T5JLvE}B)>>nxrH}~YjUR^;`ymfp5B^Miq2HQ2?{|;o
zmu3#vi5GA6pn;r0GleUfZLL25cT5)iW5rgy8;sb9)tT-`Qr1h~vbb;TA{b5B>k09M
z#a%2a_rl=LH3QV3IH_@{GfjUPo9E~&`fVv&G+Fs&Ii*hN+(J%S*KDG`z^JVx<;B{K
z3P-5dk@8UX>z|-Y(PHJJF-uC5wiX4&tq5^-ei}ICd9-!YP;y(~Ofe*narBRjTiMJn
zV2X48O(yxo9-LVjdCAIkDf=Z$6atM`BRts3OrbR5&WO85P6;@=(>h*LCYxDVQMlcr
z8vOdC=s4cK-N15NOi}H>_q~m>#F3l2^HH29($$7etQyLoCu=)O^z?_Tws85wORQEf
zqE#!Br5KzY5gig^qx%-=h7EA}p{T`t`ahinND#hItNlgPjn{SM$0XC%Pbopaiw#F1
zsJ{aM(TFT-{*0>`ev%EmOuL<^Y95|((So`(6Pp9RXY3Z88ZR`7hnzBjc^CE2pFm(&
zny{5JOIdtj@)iR9;J8M7O+jrq<AzAu^EK7e=Tn)s-XY=dK-~S%wH6P@#2nUN2+Q(n
z<+z9@^tMbm{5gdKXO0`;@G)6jHxvWRqVNivya<(|4(`aHMx6*r-B3zd<Up&&vKB|J
z%4Kqo_S9StpR_Gu4|@d!U3eoc!s_vkDX|5UADjPrgpkHQb+>T3_tX2a>in?$ZrCjQ
zJ?~ETKFWXhf%V=_4%M<5xeTDKw!XM_o>7Ve- at K_{+hVZIvbm`(V$6^v<yj$Y-}nAF
z{SNa?3lscrcw<xXZKt2DrteWiey{$2gVXbW4}MH9zCVG8W*Mg@yz!Dc&eDi!Mni6@
zEvPZQ6oI4gLPsY$>N(V{)9A at Mv#|oFr6sr_ZzFBNV{!_VbCHvIAgImry;9g?O6qE<
zB^9a!Az3lx^-J=md?=tCX_H_EK at mdMhCOfHIR?Z$Hj;1 at 3eBydc()R!Emjt*v^90W
zDolJxM at FX?&oruKocIk@gOgbhNZNJZW1!P88y5~D>U)JM8n%}EI3+|V9k^;1kq^4d
z?GSv~-D3(Oo*d*uP-D;)qN!zm{%r45^BlbC!QFYUc6yuGUajv%Vf2E$+}#C%yXtLC
zZ*fa9M}?^=XSpn`%C^?}#|vO#$x;r4KKJN18zqym%xg0>{)S-s2ySv08m<!%52FlT
z{?}met-((fk&b`L13v6LuJCIiNCE|GW|f2JkdnjA>$+iEgW7h!j-Yp{yYDFb-s at ED
zEoMSu%mq1AG|1(!5<FYd--e~+5+ZTz69PF#UW9ciGQr|LCDevzGStaSdUmwR@#SeQ
zcqYz4Qk=~gwSu57)+e6BmebBlLI5~vLuo(Ygz10N>vwsg&6rggjhwvz(ehRYgjxxq
zCq8>103<U>z+(gh-!pazk*B)}`55xwN%@xHk*WS!Y5}vWq&^#3^-F=evF;obW6KxM
zG(W?B_9HNMIli=BIE0P$5$9a3tOZ&ZvC$YoG>(i{%AlaKO1N?4+=R at I4ue!m=jM>0
z#c3$6a|pcvPXwN)UFUdQ)sWO{mP7HcT|41!S^k5l0A>|`N at w{^gY*9`G_N=MLx%Cg
z{k=AJj{sfuNs;VfTDKyD-ki2VfIo?(QaB`>+X>Mi>D{(ft5ypt?)70oW0zEjaMTzt
z`xcfrFIS27NMS?pkFt(|5hHhvd{>2~qUAtVh-x#6HX~d0L+(OwjfnZyNC?Izpr9E*
ztPF})L~49?sT0X%QxK6lXJr>x{aHr#<Xe$6g0|qV#}?Ak&=|`E?1iXww?$qVNVt@(
zFldBR)Z)7`FO=8MPFyCVqqnjOPk=0V?eN{cUWfU*HQaARI`4bVq}%H@I4PH`su#ri
z>v=~zRgisQi{Y+oO2P9$`!_7Q?K~-Qp0v`obQIxiDHje7&b7F&_gWuj;a$kp()$}i
z{U4ZvH_zr}!nNmE!?G5mydP|hqh?k`AMbN?i<q!n_{z81R&_nI?UL`7$C7nEi`4!U
zLe##N8s{MnKD;KpJdnP|<?{AGCn2TQ09~yaa2y;u0&G1+mhWxM7AK=RM=P*9C{PqT
zWRi?$YN08UBRR}XY(<NuS~O70<<pm{PE9bU*jCwgXt$ED0tf`upIL*bf+*{NlGZ{>
zWYLr*xaByc4cXI>C=5zwb7FslOEiiX(?@89mX?9Z(5UunnE0~~GItvZ(ydcXB;qT$
zuJ_JeIr|2$^+9}|W9?0=b=CL2JMJ4YGQ!~l)GC6OvqCX~QYLVd|K%WIwX-TDqdLjB
z`~j8v6V+KJ{e(;~p37rGkl^D!T<`gxbrv*2sb9e>*c9_mB<6O9h(2GKp8G#A_auhS
z@%f$((gQ7W at dox{Eu|66o-UDM{jJckJGWEgz85(r%q@3KX@@5*TBXKP;SqNATHS>{
zpAcagp37id)9I!~md35vBlq}N>`5I#@{_40Rr`Z5`Aos-UzZ9o at +(S6Rezc#mb^Dw
zeCxKB{x%DX8vUkNTtwH^Q~4&wa}u08I~52#bfS at M{q6RkUm9(?bTChMkY+B^m{R46
z1(C>JmrbnHNZG=|+JE=A9=wb^-=PD21OZVV{hm8flYLaA8ubAn&<Z1i2Su at QCf*b6
zU^)Bnr%{n-LS($yaDRYk4@U^V6#%UogDeWx2$>o;UX{<ZfhGh(E8BF~(r1Fhz<BwS
z4Ms+m^(9n}G*5B^W@;5!do2rge>CvD@`B(Fy2K2^BXS;X*d7Wuo4 at bYkGv*OGyVOp
z-i~t=NadM4E;OWRG=7v91v=rTbu#n8 at L;oK2?&YLsP+4U?m_15{3ZC;8{X29{e%6F
zr1BU#yV8XAwzX_*!4^|C&76Vwg}#-u-95*0L9H1|JH at OVOD%RMLp^6*IP|-AzGheu
zzeiE^a*a8Ay-)FWu?+?IV%c#>jlM6<VgkAkS}x at Bv~e6BOjNhIwxr8Nka;K-F=0lA
z@F=t?{fsv!j4DX<1vhJ%pyg0<d5Ih>-T`6?`7p#Xt~W{J5Yw19C~)W+N$CD+`=mVp
zX6IdLspHXwmK;sB)#G~Mg1*yeHw?eXl`C&HY`bm_%08wHb4j{ldZtuTd<EE$H3ay%
zkPbo=itJxe2nk?ay3^bJ%n`dCEr8&8vvnZ5evIFhQ4Z|cou}6jM=bPjOC}}waQf9X
zm321!+d|ded(&!1<z`^_i%rT?s1PW?*qSHZ&1;$(I72XWkZpdmmU6yBjvFM*3#-fN
zIYz5q4If1aPtqwYxc3t3bsfn-#u*<p+<CgK$`8e}m8;33AFio_B{=NQ{-o7=H!D3q
zG`#g&ddV-j7&nFWD^FvOwU%fK67M)V4&_)ch*6=WpNl;6f?b9}FUjeHcAbcnd^Cfj
zt~=V_$5aO-Qv3Q|IpM+QU#vcs>iLn-&3uz055?-wc#U%7(gMryKFA3aLRv-Z=H<0S
zYLF7iVwhrcXO%1|J+GCOT&gQ<S1;U^{W8K(f}8Ibq+wfNlq>8$s~xN7wr?T$bQXFf
zCj|Gg(ZDLDQR^?3w(C2EN7UH!0vE`x{Rss7 at w`j<>!|ni5wO8Xwle4zJu%5Z&T4%*
zlR<8ZKApNWKuv+mBF?|w?bO#yfqR!mCLzWUFAip<NI@#TI?)Z&I*k34>pqRvqoR7h
zCy0_ki47rf5i0acI-aYwn0y|Yk$+wqJAx8v<&i!)j66P{h4B6y0h}0{3__K(QcVT<
zE}#Pvo>Dxdpj1>*lB`d11DdAW-O(AH&7Ha+)%Ql5IGNv4!ag-6tr1>Ev+)cXZ-!)p
z7zhr~0<q`+n}{MU2^{C(T7ST$S3rJh#lrD^^mFE<r3QNckfv2b5kaxs73b|LE4u)n
z8KBh43cVXuZJ3T*dK6JR3V8j4pnihPUGXE%G{$rXGd3vRZ$|vLB)RQ^sAa5_U(ae8
zgx9j`K2^Y~Q2#Y$$1yMW3B2eR+0&#+6Z|w(!3A*9pX_&{lY*K~n7AEXqSd&uXOHd0
z)?eK`x8IdSpQ{&+-B-`OQ~0tYZ!W?mfwdRiwEtndRMH4&iD)%>x8IJc)Xp5W at bfK8
zo-#GY)C>w6Qkx at e76BM%JETFauG#S=jEA6iD&30`P2eAUT*7JB>(r-i#oMTsN2ajp
zqSU~+WCtHlEH*+TZNL7C#Nad=k%kxEL=i=<12;2>;(*QePv6B+Z at EV2R5q%QfiUI7
zpBrOldW5+O^WyCBRel2I?%k1$D$IJm)(tf)QUM!Hl}|*g3TBs4M=0vhKdLrNH;Kp)
zwo0`Le1o*>Ks~cZheo~mz&1W;(0a at 9In2&B7)B;Nsjaq!aUt$-0;Pb_+8^%z5+xMf
z*M#-tcSsuY-6gEdALJaa!bs<GdKBkcQRO;zQ1p?4=#*EqLW58FHDIj6>*5R6fC$nd
zNK?qUD3cO}#$+CN!4Rs#bqM2fnRBgjSlR+KkM*V%KUXsAgjF9rpp$Ror!nsL1dU4h
z+mZ+s_3CzfTvYVaRL5AT<=1(C9v6>!UUDD^-}V^j8S9u34vewv%^ego<ZV3fnD@R2
z@>+|Vz=bz8ge5rKKq%1ZDcCJ*a7YxYI?-tM`O*)z0<ntTW}CWsaI#Qk9ur?a&R_G%
za|-zrmB4{Z^D3ghB!4MFR}3Zm_?<O)dYik<3c-TXL?L--<)P<Da(7q4ktI29B3)P*
zOJZ%xB~|-0$|dpE4c_s<9|x*jlu3~^)XWvm;fRW4^Ee?PiHwSPu4*Oe7tJ200x<#F
zCN8Tcj@9!zn%EOlVlK_M1&Q?(F_#vMQiPB;x|0!kyQ_7J55-n)t_^2>sXJ-I_DY26
z*PT$b)cn{=V`JLDBSb~+=*6eC0<X$cPU<_f1)VIlO_(Wv7J@z#51>!Nh4Iz$RBaFp
zRAd)!$wS79z0%#&B}BT3seY~h$K^E>`|nlbj1x1tCXpqph$V)`41|R8Jglt+7hV2h
z7L9}6e0XD?@JKM%h5;I9TY>q1rkLL)qHi%Jnknl<gOKYKgPNd!rCNz3***%==Hx@3
zD{Qw%!s-bO5zI^fE+u2<;~qdbAt_6-eCIY|#-^RmkX|0cIIP1M1NB#eUKa?O>H<;J
zYpemg#|r|1OoxFtxR0i^v14gf1~eJlJvX&nN1L%(ff^ab(5Rs3!ex9Nz%^Kvy)$T=
z=S=lRY+CJK&Ko)}1e!W8-4;Umjb(MgR2C3LW(^JtZ}Z@>wD~I8hb)H-p)~sOCB^T~
zRe6Pes}&y%H~#fSH<y&PlDJTLcAk%T#*`J2<c+_?TdAsDf}SBL&ac;GOlNUC`_-w5
zw3Bm?y?cd}+EkTNGnv5C%4Il)gwt8qB$KStftyP59yaSZv}@&Y^iIDnMhFk5<ZkJe
z9oDnKp^GZM!(lgM%9K%gOj0<Ly4JCjYCAr@l*P^<NPlzhQf(i^^0(=1WVs+vZHB8T
z?;#8^XsZb;EiHZ|9F<e%61T<KAx^ppH|xR401gi_-@(E&9F3&fn1)q{lwS>H8bW!H
zzW01~U~K=9=-;OB(EoIV at b2vDo48;1js72-R4)%rSoyQXgpKz4*DoM1`5?qU2{qp;
zsyB}Np2q^*j03iE7TOL>9<BPQMUC0=6-&aRg>A<()=HVQ9rxYPS&u;FVa+FhM~gok
zF9rc~7CX>XFcUS64!hrJcRJ)g>>N^6)ZTu^WiXG}`{RXb8Z8|xMqK(NhlLW at h9z}E
z at 3^v&dsrd0-s|50N3&_M7T$}r?j;5G7f~+4QJz<qP3d7*6&8^5(TW^t)=3qtY at MpN
z+fI#pc4K8!<-?b(tW@l)uN=33D<V*uwqGmcshC(JnzOBLW&Ax%MH6&BWBuA4dGGu@
zhT+=bG&grSeamgNOmI~++>8FXHH${r79Yv)6wDC&5a2*FPd)h&;i!N|F~icyoTUQJ
zFdM;?<<8DP)SUV-O{0g2#!FWQttAhDXddo0ALYz^v%d-G`0)8VK(*KYIobcRB=!5k
z09wiK^zCz|Twv0$X@vfu>SABy<awoMo_-PC4z1z*BtV;o?%IsUO=+FV6uM}tPD&Q@
z#1bs+9Z*EXnQ?%=3z38Il}AA22;~9FhxmZ(0ObJb0LBRNiO>Pxf!}e*4MqdA2DU}y
zWn>4Lhm?cgo=f%j4W0v#Sh!N1*%KS9jD~g898?cs0F|S%J5D)z^YQs)x3N^y3j9}f
z{wTmUDr?BbFCpb9 at PISN{m1p|Iq3(X);_$(uqb<0iHLbfqOz at Z77H&fnS7W2Uu5BI
zpM=P;ghH88k~W-x4v0FIyQLdScbR=)5a(zGqzZXH^t?Hb6<X&htrl4P+pHU^w1VY}
zj*EEJQt_R2aK`H#*Kv=V2IpGT#Fh2btRnzKB{XTi%IB{Rtu^t8inNVz-jNfmT4A&o
z1cMqPM at v#e)YDk@FHz{HW;Xy?Cb#<}Wr8LBy~Jtgula~^*cHOPWZS(TpV*&&{SDVk
zPMfNKbX=Ze?7YtzRvEq{{nR=9`utS$nilh1Jf*~*aX(AJYa42Uji+*!`*YyCfDUK?
zLw7#-TgrN`@}WxrT?hnG+ZzU?kQfVXocj|!Y|8cH1iVWXXqP|uJ&@{oG5X!Zetjg<
zS%OGI!66ng|KBdaCnY(eLRUSSMlrB<689~v&UfY~u1xvm1}_&ES32b{nM|8$39)~G
zy#T`zF>VS6fRbLfA>aey)?*KB;GV at xW*3|v!VBkiX6S$a-1SV%BfUfXCRI at TsKY{c
z at EGVJ{Egpg{Kvt?T(R}_dfHB9`7|I=tsj_oWdN`q1K!nK+zIUC<+&k!)et;0@7#)(
z!^7zR%66WSKq<Efr+g$dk(k;e{nfO%>*WWKfynhCGnZ*tnJ-hWui+dgEuduY$VT69
zkT_Lzd3~?a3R#e3V{>tV)xP!ggFXC3&IQ)&)Zk*Il2gQwSh9BU_SSa(iV>f=ST9TJ
z_c%i%V_)@41W{HFcCVOaX7bKEX0GtmhF|`g=#!xD;$(kAcf}D$@V3!h at HW4G|M$x~
z=*{Pde$E%iNm1Lv>D<UQIr1@?lhYO$e(#TBT+Q4@(M45xtQHCm@W0AJ)wS|<xST#}
zYYtup_=Y{R;*DECMWfx{X?PC&15%&vOy8{a)g6bfP!`|Jv|m5J-n)g`0>&OPpxgn6
zu0P(rOMn!U*<tTGI|hxJsp*-|BH8^MJl<;le-ERDursgtIDh7UO-o&O-oJrCG4>x!
zdhen9P56}50L{bT3hIXpK<#+M_R0@rzLhhiIOX10J+aE`!oT|W`+IwVm-YhJ5BDB&
zuNA<x&A)H>WiRwI;8390#D1Iiq2;D4-EjIS;HdhexA at E}ArtQ5XFpuP6GR at 2%BATx
z2o<igb5mM0RE9anPur;D`P@kG#W0y`{0?=Qcrf%`K6hG;1oc~3QQlaFr7c|S)U06#
zVIZZ45f|#e$Z^3>wyn?AVJd!1AH;_wh_nznjg&L<@5LLHr8A3(xSU}k6I<y&Y80er
zTg>C at ri=&bD7HvE7cPK2$d0RoY1aT;!H>!zp)`A4JVvj1i&;U};6<hElay^&I~{p?
z`VK8$YZ}*EqvHssI+tY*I=|y)IX&m)OUkp6bUZBn8_j@g-<Nx}-DYpG)g8BUkM1;;
zsYWuP-zC3&7O~JuS#0j(j?kTxbiyAk&J&C{kb&ju;WizGKZ}VUo%~$?grWRtY;uik
za6RE<^xM-kxEo~acxs~v_+<EThj-KA0U74E9lGD0*CsgTYV3G$cQ(afl}7N_-L5^X
zag!jsH9b%bO0w{&L1nLh99>2&*^G5Gt#c`Hvv$?Mb6YHkPe5C72T`d5n$VAM>&2}<
zw{7Z)B^%4gnK13g{s1e!UND|RC|zA7okLJ;eOO=*w!^OHS~ug&^H@+iAYTxcsTB+4
zX5dU??9W?HR7(BRIns9*N&j2LPza$XIjXMrZ!*{mb`bqE()E<seissmigP<{7^bON
zh*sHIE~QC`<m4;&*tM$*1N2IMNsuDOXkNAPgw>rNvg#b{5@|R;CG|?kqm_;z%6M<>
zdb}ucM6zB0vMi3u1 at OC`Fd at k(=bCW#*}U|1TF-1BM}^Vv56wtn#>JhvHi=Nu*~)D{
z%#;3YzE5~@<ND>*cz5{YoxH{H;bHI(VRvqQ;1=R6k8dGtGZK=rq}?X(L5six|ABD;
zLg(2r4AJL!y4M$!;|<@RyXO9E@7?~(&G`qVd)Q>moXK>7?xCOk at i4!-J29kM)Lm&^
z{1NH()=nWLL9Y{zl$c~V-+WfBHIvb|lSeDF6IVnZ^Vj@=_>KYp{&~N~K0EEJ32Fx3
zocupLeFI~p;j;9^ww;Y_I~&`!ootegHny#eZQJI?wrzWYFX!HKzn?JA+taA7uG)rS
zd>ekuGtP36e!e}fKK1)r)9A at FG?86PyKk4}oJ3u+ESzq!oNFJhNQ4o5k?|cc==@@h
z4CM_8^^F$HE)m3?5(JJD-5-hdfMmM0gVkTLL!{~>_&zJW>_5BBXX*39wqn1K?s#(Z
zluAVQUV|}WFIoI&&UdO at 0$&d5gyAwBxvMB^Yx6|h+P-bRzrOYMDsmnA&XBf)w^b64
zL<Nmk at 20(Mo|3t7wFk|a*1L+qI-k;(ICOqNp!-n@id29CFkDPlh;2uN2#uLcHe7d@
z*^c#LWwDbgYB}f?PFLD-w;C}KFNUm>PQxP9Br0-elBYfX&e;++7@`yO-aK<l%=B8)
ztDpCkC3bbv-wvFlaY^_%2kHL9?!fKd=db0}eZtrvhd*l!*-uGXw(U^rn<d#SBQ1hJ
z^z6HXtoOz3jsDQjy7^$QgG4+pmS(gZ$Y?CfQB47W6-s1XoTY3gz8JXmrJ$R9Y=LDw
zSudHPRz;X#34%blv9`(H-UVuX875I^O@r1GP7Dqbj{|Mby|cxAL{1mv&F00kH~#0o
z$r6a)gJhGzny<yNH>7s0N8D4bO8!}Sh`3MOG=<<(nU2R%#b?0czsj!LjTLr!!J8_#
znzHV7A+?<V=Z`0o=}?*KfbDmgm%yID@7te(Z5Tc*ca|I9tD*6W{a*;f{o#!QZ_g4E
z1C2@}@!5ll=Uv4EsQ74)Er)?0P*>dKMU#O_!;1C>G&J&zB-q<~jVWb{fiGjpBpI`q
z`}u2yq5y-HPVKsfsA5@@uvzKnHq^B+j?C&YJPBEJ*<P}E1dcWMC6c<?N-}F+CgoBz
z7?`b2$Qwlnw)lE?QjM6lk~9V^4K*)|?SSkMSEJw~n>B>s#s+Xi+QV&r_?On5_sRFY
z>8z249<yhDP@<2uI`6^Ao_jW*7vS~4k(|VlU7vdOpnA1Xii7Yyx>MvStg%YZDQqKQ
zwIz1|>f#<5&6AOO4y{XS$XZgeOA@I|8*AjvAbuiK$urI>rJ=ciTrGII$G?`WG2Lms
zkAZXW7x_~UnQtu1Vrh5#U1#BF-{iD3=+K2u*!kSQyXAAb!u{;o*Ami;?O(<j?KVWu
z>%jTCE>SfD7nToj at z+qt4lrBnc<s0e@XmT8@;qnusMag-wqv51^FJi%I^E?Yq?D8^
zZa`Y)S#7?E(UD3xD5e+IwiOdXcXG{3OT`JN2W+eLWUZ@|^}p0y=i;Vcq%1B0>L6 at J
zM+Y6-+APdGw;gH0FCcf2aCwtFDBaZA9VoMq+_)?1 at HRyp@zhJC^ZXo>Gjkv)aKC=+
zwNX~XNoBX|-_bVC$F?FHoL#54aqK`X`^8%L%rp2rBwN%2584p4Vng{&X=}d9z5!#;
z&Ra at DPmIRYcy$4o at tlxko4DkR+C^R=jei^vdP8>!f$^~NPH_+=lG$+!Akr++ia+mb
z$a9v8qKnJ0Jh}I-LtS(tDhcU4#(2R2kFgT_6E at u?o`iz+^6(!+uUGqE<Da-q15sR2
zFvGguUF}76UtTDb+|d(Yga)@E(|2eNUA9L8gntBIPOf_$-kCCe?&7<AHZ3?iAJuLc
zdmykjpW_^QAWDP?sH?jNw>{@;1-_waK-_*AO@$l(1D at MO1_(1$$RWRD#XLNl<yBB)
zhyq99NL5SzBb7lWZn=6H1EEu@wKT7t=AwE`H~1s0)5>D|Xjc1v%~@Bbv5!G>AIa}v
zb=Gu~vmFy+!QRaBtP1h=Ht}9VN3AiGVrAt*Z)bsC&5-7cg$&j8y}J&VlGXM`Ct2+9
zn?BzR2qKc3`Y$h@?WanWeq)dQ|Ev<;4`Q<>zgO}cFBchH^#7hnE~9Jz;55H$nVvR`
z-XV;d{;T>^qQcgat0GJJw^>tP%r>H!`UL!UfH at RpDFm0JQM+}=t)YN>Fhdw)8`B}#
zc>qPl)DX*9n1jzxsM;R)^*1o&Hkp~Oh?SpN=xJq8N(sHgh6t!ur#0>aYMu8E4(V+<
z%Uz=x=b at WlTU{aidmuNrEqw}|H*pSK;4OulCloq+*PW*SjnG^5#cR*;6whu_ul39M
z&yp7SaZgY%WctKNS=yrsOa!bS&{y72sw9wpblv+k&?+tnL#jW$Y~m<qXV502U87r`
z?7YEN(9^q@vNWBAeuFb88Ru#-t3fH5Q_adsAH(YW{;`A!FiOr>Q*N~gm@|PboPDr@
zR3nv%@ay~wC<7x3r=D?X!P|al*Sfi#yB3HZ5p)Hj at G{D;F&{P6@I+p&bJ&9>leG=^
zYEPtO`4oB9J^lH8sC=+PX>{t$)D_RR8hd~tTLL2eA(~wFC6FRz{8!FfIX_@!;rpZq
z-k6rWlH)m^NX63RR{eY!Ea=w%2gl+2efvG|>Eqm)%Q=*a7b(k!49pa_SL;vKZ;&;W
zlEl*_BCq|X|GZ=t2-o!|&I==Bu#)p{-4Stw_r38QJwXIG=TNrQo-Tj6=E0Ai|NoLN
z_#e`*2bHW?SGNTEo}1EN^D?320?amR^WXHm7HO-(!g)7r%c}}se(qJhu+Dq+M=3uW
z!gj-fYU+C#xiK-U9|u3xNEX)V3ok$)Sd>;y(9hGOb3d`!4h|vEO<f4JJ#?F#(&mD4
z;{Mo2q_92C-CJ`qNmE$DP(@jVS<9xNx13JiENDz?j|c$MIy~N&uekP(N2DmDU-L9J
zEH;1MA=+&;*?0z4AGHUP4|apUid)tME{?}9%G4gx8XaPqIzb(%k<q54dei(o=Y3h?
zk(^bFq7Dg+i>?}`^a<1Hc;rzzUWK@nR)K0osfB^tm-=}1hWc*0)k{Lp<B_~|q#FN5
zMQo;LNQCuB7X9mmt?@Xw>-_L_`DWTtyzJBr+{Y*jU%Bz&e16LLWOn`Gz8OY%OLT|=
z68*PJ*jRJ}D at j&haNps7J~G%Zd at M5xSD3J#khGkk%NJf+{bYI;EiLj;)`f~EOPI`R
zQv!R$=PDHOiv(?p|CPitp=*iA6rH8PT9Js7!}INDCAF9-p1hGgo^<ATn9|8yB*`G@
z7I(N%nGbW?$hh09YGs46Va{O9_y=!@QdR{lo{iM-%i%hB+~FkV`UlchKWmTGa+hn&
z#&vgw`=_(QW-U<RsAZT%O9NjvC~RGL2$jao?@DZqk+?#mcMi+&)cGJeBaTnZc+Rl=
zue_hyf;zDU-AIrr*tlOMx$68Gde9#M?0*aFG=N6S&KY%ep29Zo@i+YGxv}*9hO}Gb
zPE3(~Bb=sLc+HgBM&LYBU&dD>-uO4N)Z-ZlML;<D_!sKc(LQ^#0*JD+dj4LLjrYu3
zIsKpg?m=sL;tilcu(X3#2bb{v#4`nC&U}Avn&GkM!8fExKzKX|Uklbc+b~;p1|LxX
zT8=?3N*udhtv6wj at yDXFhB6y(z~7}`BHs#b^h2gXqbLB)3mX+D at 339L43<W%m6J)E
z3dgmjj5lzzv57z!wai0OGm-*~C^h8#ppfB~c;Gxyp0l8|IF=@sAbL3bg@HfO%jDGx
zhl9QQX{18OxNR({()J4irQ;Wnq55m>Sq=(WoC|}I`3j~$SXJ-Y2n~wl4;V)mVw!FU
zy+Meq{ZDlVv0|W<2dtKqwWL0X`i~m>7hI{#k^U9EYRNeKIIhjIvK_Q>Hc;cVNWtx_
z9p0Ae>AH=^7NEP$YK?N49~Dj*4-=X?^7@>oJiesCqnLZ&c?S at O{ieqUh0txc&e6(q
zBiN^N(l+!StM`wGViwr@>3{2r$p<$!2(KR$2qUNf$VQBUp!K&@o4k?ZZuadD0he14
zb#-&s<S%b`SosNMW?Y%<zIbpkl-nS`ZvBCZK1q3kZ%>e|+Sci6mGGqIc8Q_w8)j+E
z3GJqn%gA;e7g*(b7BNZLL^uz#0hP+GSG53fbAI!<*KN0U)%?le1d2rl4U9@VYu2jO
z2I`0y3Us!sVl(ZDuKZbAgffGW?T6!rg^KH!W|fup!>w3rX{nd&YXLj3W#7r=U(6mV
z%2 at 398TB?|-&6t2I$oh`Aq_#eiqyU{wUs;e!o>`J6Va0Fjn+Q2xI2<E#h+_4Ttj5w
zE;jo9g;^A^?4NHUo12++@(fbTZc)_o4E1@Y?2JRPb!15G*xg?|HqJ+QK9;U`FT>ZN
zl>8Sf?cMyRMmILwZlkGRjs$PnkS`@h-v4u&B;mQ5+Gb`5djY}FH!qFUmc;+O+VT1}
zvh7Ux0`+C&@HJ1qGrUX9Bdj1Bxx;@yEcwT3)J_(hB at Zn|sQxE2_4YYueDKJ2Se(h7
zl5VXmZ(m1B;XR3D&9hY=xg)LGd7BIY3^FJRJxV%ajvjQ}XffN;i^&g&(p)g3qB0vE
zxk%$usTpTw#>!c at H;n0OCRW7Ce!S0bWwHAyy`6KymXA_yji*eW9_DCIL>k2_Ctg_M
zc at i3|d!jh}>Dltgr7AI7q7z}!XVOaqrY>9rPI`3*lB%ow%})e6DQ9Ro{t~@k`hHT+
zn6&)Nt!Z`jEW69wtKL;P_TCC-tjoWN1a~sokKZPW1A?<0=gmIDZi>HPI3I*2;CfJe
zPPj*o*snr!&f7!vv!r4<9@UmA{8>XDzhy?gi9gGay->D$7W!_8)9!El+k_qOW8?zf
zr%`jaSbjf}Z@{bPEK|pVL=YL0FkuLJVMwwIoZqxaCzd2NG;RkU^t%D5DskD}0}A}7
ztI5inwPRXoc7cJ=O$vQyYb;oKHdy9Z9)zDC_#>-_9_Vpu>7DlJBAoQ$#p}Ol4QA!9
z at 2-%h2$x#~OrE>syLd>*c?#tG4*CM~AgtjNzSS7Sa%jTj2yy{T!jFL3s1sr3Zj|Dj
z(EpT<3eG2d)ac_4l4)|an^~<5@zG+loGr4KNw@2aG<WX-k>z7|0S~d~+rX(y|E_ at A
zs#6YPO;Ekx2pR!8Pq>1&%~#I~>kvJU<t9LM;3bhiKd(jigH7*M&E1vjJZmt{e~Lr*
z8!m#(uj^%Zx`}B@%p)|)Yh35GZ0;!@Xa7+B#^6NPN(ExgsbSu2m(kk&=a5A~|2~Ng
zRDo~BbOa*XiAUl+QV{s)Q$J3c^6H#lsrn}9ZwN}xoF&}3)ZAFBtf;65!`M~_KcbQ-
zgk(7^B@g`A%q#}yP&C28?V<{UeK1_hq-rY*(b4N>+T-xF(P0|NekV08q)>--Xor)f
zzxa at fq0Jel{OcAi?f3Q2aFeviY3dcjvgh`n5=CljybBVo?^L}H<eHx7$y;g-wyo at r
zuS<9|f at O&*Q-#BarymtJrV{x_h46D7OlEc3bX@3(seg&mi>T*7rt at jJop~T|%AZou
z%RA<n=uh}rY<I7JZLo>XT#!e-WhaM5?LsSW22Rae^eXTzTBE;ta^z{X$s4ZoF!`o)
zdD`oB+5hW7ZDTVd^uJ-&^gqYX3k35yUyGAoyK6YiN9+DNp%&+ZRpJD)e_;wN6$ilw
zs>0EchFIz7{ty)Ybs5ecve#%ZkQ*ds_lr1Y5e;N8Qdl?TyP&JIrpJL<mJOp`8WfWn
z>PZcb#-DS^f1P{4%-8^+?Tt{W-^oOjR2MLzxy>YKVu|qi)rF(mvnRAgs>@f``Qx8o
z{H~(457N0li8(D(5U|=LvRKC@`dIe%dPf7cy}^xNtfxxBG&>MEZgEHQy~VG)uZZbz
z at EzRDG`Zy-Q%b+`P2o^Kb-K at AOsi^QgPX~3%n=h8<WOVg*u>m>dJHI4{#CF)qa6?`
z?EAYkLIKIS+1anqeJcHV!)U?SCHTCD_-iw<eeX|e{c*nQu6LOSpK3%=+v`sTBR+a#
z(r)+lB*9mq=Z>#i=9|nKgYD#W+1(mJP~ZFMoABuYmzLf>vz1P0i!4y2FWi at ukv>);
zsC}0U`D~!5`&+>-KT(yzoBYm*Uq*L8$0}H-;eT6hMYjflhuyCCOQ8L=uN8#*;rCL%
zTL1lS8sEFOIldYuDF$ddn^8Dps(F|7c2dj#mr)E+5}Kc-pDK`|BF~$I+6h_rIxeYJ
z at 3!!<P{8q@c~syJgHjzDaaiQ~yyQZ8VO^yCMBH$8W|A_3b5wMgyf#TWM>ip3L`lGW
z5SuW!%oSk>BonnwxbOA!XC80ntH*9U(spw-((QaI;SPcCZ_<`6S4ko8mJOD}6rJMt
z@sTIT;nRDsX}6qVk7GK*_+?Rq9J&H_gsb%F114vYpgW4gBsMr`V>UL#utns$bR*Km
zGFg*4PE9c55Ik+*mmXL`T66#B2U>NPPq^>fi~iQ#cFp0v1`%wC{s-SnGv#;nevf5W
z?RHi;*WU`({`ceWR^qhp6O#FKtiemR%hq2{q<4cJ!3sv|rfXuaH=3TV`>tO(n}i3?
zIoa(#zF)@%Ec1q7 at Ax+nH3tkKk8P35_dKRKC)+gxE{9Z;hB)5`vy{4B#~&@XSArcL
zm#IA<nuO}dgA8g=cybB3dRh=zQZkacqJf8cGO5Od9iO)y>0X?^=npths7D^eP0Y?R
zYAB at a0X#S`Fz~gQHY+HKlxeiLA0TAGg~D=DeP9j9lR8;Gf8EW){xYUmm5L0O5Rfo1
zqyj9^n!a+n?qd=Q%eOwCH_ozKd3iH5Icn*&gvdyVOR1z}4b{<wg?w^}!)m_mmuZLt
zP^9wx638XQ6#v!w9kh1X8ak)*={<M*Zg^JMKTg#PX-rT2%$hE7>#%9BaLDRbbIJCc
z@*sq>hEK^?TQ$^z$=%(+o4>ti^~Q^ieqGGke3~ZLby|I2J{aeA_T)arV&!^|le*~K
z-(l~i-S-T)O^lx&^Z%ht-R2K9uJ1hDDjU|ymchb+WlV>hH2VCq;70PVk#_6GqUV#E
z>+$OjM*@G~wNLlY^^+n)`1}u;<Ic&u)rRSShO2JW<ITA4<AIL;=8OZ@>T1H5{(rw7
zdklaU=8Qp%*~Y9OSU&6Jk;~TW4v<6}IQFfatG~f-*ms(4*f>E$F+Qm)Yw>G7g5kC@
zo9heu9lp3ciEnNpcDnmT0*&iA;HOh9A3A6dFf5?-S>nM6;tOIQt&ho~SL6SILK89J
z?sFBC^BJ+_(jnA1Mk&>ipiumNZ&X7VdlWLt{>jz+(Z++4^K0^sL-T%ee{B}xbVUUQ
zZ^RrTKiT98b_kC^Cq*TrhAY^G`DdlkEUacd3xJs0T=3I#nuVd84NgEiV`sv|@W^2I
zRd8MHTS%QaX7}R$=<ei;2l83mbS~84v!#qx3xdx>D8Uakd8%o2Qr8T;%-wOq$aP+g
z!>{YvEd`Rj=2q_y)CBa}d$*@#c~Jrg5#fesx=llZ4$)Zm^*YoMYjL)~%C*k7iG*IS
zR4;>O-e#5Gb?argo+IUj8|cH+A!{~B%=t&nZGk63y)RF#tqvZ at Wbbe<XK0@97N{)F
z5Hl8_uy)zB%R4>8L1&^x-pe0~P at 5b1rM2{CF4v$^e|(@U6$QjB_qGNryTe=0#G!?y
z9N+N9-!f`HjH6kWh66X+P?tLyM!i7Iw&6!z9S*`bb$qZnVwj^SRJgF<x#<ljCY!_6
zPpl#cQT1Do{rr93J<dot$S#)?gLcgv0!!ubSv6_X^pD}7r4DRT)DnTgPle1q>cIdk
z<MqJ%6}Z!`N>$XYW-S?p5q39yM&EWS86L;?62s4?Uk9Odp3{xt{Vf8dbR7aZV at B}r
zyPe#0T5ARt+v9$-ElxC>YtP=;b>1615M(fBj9T>Zs*mddNh`_Y2*JrRGXkI-+3?rf
zh~0kxx(|BphcvB6WGmDo5o1^SFIR1=*FMi2S6*<XZeq4DI&<gXVGs8O_w(W(^u>Ks
z++`j_t~48uCo~zph!>E$fC<nyKb)1}<2oVnti36TOP{-1y=_E?jP%vtb2jfM3Xrpc
zp++u!Qvm(J6xkj?CTydU8YVmZJ1M(B$iRnNYt%EnnHbDcMsFhr-<L7xvtVn0=ar7U
z#j>B#x`e+CoI at 2qEiJ$IBZi{No?pP1xrVi=U&PB|_-{$vx<mTvn2iRm)f5Ar^26s6
z{P7q|CgYjmr@+!1Pd=Bb6$;mI-MDM%)F`P1)-$&&=+auZUR8+tYHBfCy3hy=Z7XCE
z)66m602WxKVgJS?Vc8CB-uZPs)DA|{ccAa-tzEMfTr|RKCCtZZzQ=>cocGt8&99Zv
z#1%eaT#}zEV3}WXn!W at tWjfg>S4;1&2^w5awC9U%!y{mH!D%b5{#;8;I*61pa$_9%
zp$LoV=p$qcLsPr)CT?TiTN})s4ETbr0CUL8{t_a%B4usFv_^Mwa;xF;hK#@2*|4z!
zIShG3oelyf?Jpdy2Tv2l3_G+8r5s at 3&U at yA+`ZAgU%I`MLoMqRr(n<J-nvlNaNBPt
zcTRY=A-jvx2|63Vv&$T_-jv=A_Dp6AFiu04fsjC7SlWx|A>v at TB>|o0&Kyr7%_$6D
zgWgk%$vs*F-;_j!tbdnobOg{|d~mY#y(8LCqJ_>w(q&)Eg&-~9PNVVXhciaof!F)L
zNCL%qFZmNw+R5C-J1ATf_$%x>jdTNRL)q5GV{D}U#?V00{E6essw_>k<_s%9g-pV0
zc*-0SmKQ%qXCk*9sOwkN)za~^l%*OCqh&{JWvFU7vdcI~{BVEpCEx>k;WA!ykm9!!
zNe&4lkok|B4h@@Eb$cS)_E@#&ND!XytR8oqaRTx0HR<Zdsz$Me8}05|s5qtoQH6}A
zeq<34vGTrPD#4#yUalYfzqE;sx!Vz9R<=K<;%N~Y=hcg}IUu8AP{3mOa%MyJdiiaL
z=EoSgKA$W0$SQZLVF@dAw6f)riLbwaV80KLA(3WUyB=``>K}<;E!NrnVy(Zv-Pqq%
zG>sqt9u=CvQWjpj?O{(>8;fVRru*#8wKNuwCOyjx&{z;&jBLCmKT;2$F=|TAZ0{p0
zykym{kjHoBk*G*)k-~<+*?@xH$G&_=98e9PBD;HsAv1v2q>pW`X(^3>n{WZ*;((mf
z>#cw3>=;ZtHHk?B$)mmKvo;}Do^UipOkY at i6_KVoBZe-0bY!RrLAjd^d^|5^@N7JW
zDVzEvKZljNSjY6kGoCqk#S)&Z&Dh~z`&M$9g8LFQ+p<i?0i|lnA#=+MhkOFVcc4P~
zlgs_y+d7qm%Kvczj08*m)NFhWztW`TT(u~veTa3JY1?F_n49%N!IYvW($D^BSnX2i
zxA4i_blu0{0HPFS%VQ!h05HfjK55Nh)?LwbvNb9`-e@#y*?{c52{bz(HTrvZs2nDs
zy|gkHJ~mC^CPo?2tQi7zA+cUg$nVbR&G46xD>7HkB9}S+u(W_towHDt{uf7ti$-s}
zoYz5cpSKSL?#qMd*A<CjR@VudWS7g8;rkqw1tvrr;A73SZTbr8we26w&vLti(VWG{
zaaod&kYRH|<zFNzOACH62zAWZ1)w{|AX0^Sd-?qPcvV9w-$xt_H>*gARqZz)7|APS
zu&0ARWo0kM24uS|DwJX#$H*$qvxhP4!hk{}#xkS7*9Id|lg9ETX!(wnC927)jFr7H
z at P6~&7#oVIIT@|JHO+5Nc^0Kw<jAB7_W-plZ7>@n6o<>FM*g{bgZZS3VRPalei^p+
zj1XQM-X?thQRpkTYZg^V15iUbi$4e%hREhXYbU^OWGvcy1D-xZ%#`k)1_r8La#_k8
zqUX!%Rs|BRE4a3Gopjz_y<IE4bw4n;Xz`%kT7j{hus51nS#r5zj!Vg|UrlRUtNZU8
zxLZDkSs$#^1jl%FyF34V*UjN*`uljKnEi!Bj-%Q at N*4PI8k)0h@M=b%XCt$J2(NE8
z)%N&eBU9rB-Orx1Sp0Ro;&x1yfyip?RFt{LenJ!{tQ>%4%_^&&pLQ&D!IS7 at L=~Dr
zCO9=@Kz?cD at VQ*<l6pcoaS0dxE3PHP)7B7YL5{2d6eZ1JV)}nHT}bZUB8|!QOxXEk
ziORyZu97li)rYmw%>DgBUcV;(qLOOc2rdDMwBtQKl0T|QI+k#&>~0u%2sl at goetkz
zlKiiUk|3ZLffII9IMXR9=CnVN6ZlZgD};DO=Z+~RcG3(9ZOQ~A*N`>w2c&%ck$h-%
zoSaW2b_NFq;1j-t-0h2<6~Sq|Ykz6Ad(;qE6K%^qSJk)s@@wTspP^Qs*%&QKN|_(L
z7yTLs;|5<@-Omgo|HK|0>*aBIn#S_j_rm*cgi0Fq#g+$cx>_9{5ZR4FJrSztk#-UN
z(z{(pV!UyDTukL;_+#}pMQhLv9PEB=>2B~Gx+s?3&{#f^B2xpzqE$f%XEdtP3_l5L
z62RdNzOm4m*#5Fl8p0y8J~RCr8s!(x<``ZGw#J1b5~$V|v;R3E_7AE+e8lAoCQ5U3
zXK^jj<XN>H(e`ANBaPDKp_+a;C8BLQ+%X}d%-1f-A at D1xTNBTmURI*+iU*+$f08t|
z_ at T|y9?Fg$QBqAeMGA_o5>rEKiM0iv0dmPIG;1s6%K43y_I%G{T_+J%12>1>d0m;w
zn59VT^iekN_l&zedI*=DE|ULf#<!pr_?8EHrh7L%2z=kj>NbVZS3Uf1j-%%;J at L_}
zffHL|x`dC-?NYs`nu&4Plv8Wsow{~9$wwqtUXYKAqOVHtDBkKnnfn^|OE4}^3RpL>
zxNh7@|LJZ){m`4s*^@AGK3~AQZ=1>*8%wQ`oiN0>muhQms at ppqhazJyI=zN3w_{Vj
z_OlR*d#JDUC5uYBwc%+_#a#zg))eb(p0IPbsdFp9*;-qFgd-9}s$Gb|sYGo097 at -1
zjJaL}=oP?YT!I-AJOr%>338-suA6Jo6Rs>wH!i=-<jRe{n4xx|5p at Np!4ol^17xlC
z1HC$C&$PgS@Y0>4JBLE~7FoAVU~$=mlTlh${8M#A_adnWZt`AwUBnE-O4RE;IX7t!
z4vd`(as~#Ul>i!7epU*)Mduv_4`hpg;rm7j(Y7dzgou$+LzGqI9;>mMcF)~<Uc=`C
zquBkOU5f_auO(qjFVWphb*^36tUiOS?Waz(Y^1;Goax|I?CK!6U@iQASK0Uh7&f5a
zB`bG!<<1CT?^*h^RU1!VyIVL>9Ibx8gm8Y5lUSBz=SB7LKNXAG_Obc!sLJa)$f_}V
zBFWtgo%UUIW#%tn!+rlzj`o<Z+j)6oy+^SA`ZFs7?@u}ts5fmGP<_b-VC9ln-`A`u
zPD=zulU2>Pt`C9*&(q|vPvz;&Dr%}+n=h$R*EQA_W=Ml9rN$W6e03w-W6;+OFYy>l
z(gY??A<qhKJl7qq=-h9Avw5O~tI@W<R3}C(e$Ez&mdIqXs*jyvl-@$NdH8}47?ok|
zVD%qC%=j}anGA|zrwjH+`^_|=o^Jm^#;}Ec{$r3C$1t(vSPG!q{ttV6DY)5NECG-N
zP7hIOxAw%ka`+LIn-?LMkfohr>jAZK51#1(fq%n~-P2>o_I16#`kXBDYh3HsoDu_V
zp|BN{C_FKZ5gMARI`2 at I)o|x;U!7xQV*z$nojC};>E1sQ*6c#2E|l*E?}-pHyQf-B
zu}x?0%LbF{#fz(gSjTL3A!CBU80vtye*H~~s`XJA1B0BDqX~si6~oAWUJ)<>z-cCM
zA_;@>{Uhk88|Z3JGbBe5;$x?nj3|4(_htZq4=d<blOpJbRlm}+l0^lask&%KCL=kP
z`K|b)VN}*ej6<v5<a=i$j5lCN(QF?Jn)D9x81dr5!--vbEvCk^jT?Ox*V`mh$Yb|)
z&g5EP>bQKthLfK2+U-|ygJ>=Ooo$j~>EbKlgkZazSu51_mCiI3{yp=x>*@IJkT1zf
zYDa4L5cYe!A<+An_iOMmpioFu78a1Gk1>6F5%l=JQTB;2AC+#`8f$uUq$qHYOz4U7
z=>_Kn#BV+7S*37xknn{~`5fSYqwHd4D2)BUps?Iv;gRplsuLQ*cBcjq>&RAkzat5z
z^5f^;s{uyNghqupSp9NkeHlW7+b(XaV;p}C at VrTwjL+ZI=G`e61$P<I20@=2LJ{3A
zod5Af7j7%Gv{P%0rmLHJfuvBdH{D0bSpB_^DP82H?oX*;eQ+Z};dpdy9-2`D#Zmm3
zKOd~N3em$`;doVG;lL)Iz0#VeYQ2z*y$SX45wq89BkZjd#}&;<6c<7AlT@72<*6I2
zpt9GHDIdAu+tl+fxL?>Zydy{)00SQ3iGU+x2RjedNDv>P+U5$A+0rCA9U~wdA-S}B
zwm?eDT at O+m)sc6*)TV(o_qQ#pKpmQUq!&7hPP?9+twNNPzm60g911oKXg+DwAQc!R
z6hASk#KM-Jz;!Y at nU^u=`f>rX^zh0=3SMOL(l0HF0=+b}6CYtQ3aym4LC at XH^UM3T
z`#UJ&cH_8Fe+06;P4;lbBAYCZ+|5jp%;KnU;(Bs>fxHyUz?X|Kc?kOD^kf+S&21y1
zuWQzuA(i^H*jYQKeHv_L66o8Hfe(8nwIICL9-uOZ^6n(1Md7ucL)O~JR}U5|<1r*$
z7MPhpKSbK{T$B&mjc_e-mAZ8?^=fs<qKliYlEl|W+`hM4>3=$32QQHFUwtz=_#z55
z=C=v3jFT6;-B2387TMumhj1ER&TgljJ`IkTE$jtAdYg4(54t*9LNho3Pt-oaeUZ%X
zUtP}j*>lx7T-9xr6cXZab$R&^RauDQ+x6{G+dhk{96slTCBn3G%A{s$GanIcj&dj8
za7hp4-3QX1TB!<h!LP@+D|H-=Uu)O`5pyX#i?Nfbi-Rr<eJsM%2`~^~YCDvPY(G6W
z(U}vdm!;qH=P9fLi>RJ1RHOo%nxj7>17JJ&uxnH3q<GC;JvwBt4W+u@epqF<nAsWo
zlR*}3ZYTXq5(zfbjKo~_k650^j=bbi7T+j1dzPHSCV1g+{e%}b)gCgD<<VGPQg1<^
z>=X2XA at bH}w>yP>F;(QM7|;a;p>iCl);%o at SBBO9&0}E!!NZp5G}GeFOk40Q%~a2x
zY={6ZT7F6KMK-a~sg%JMa|YZI;%JKbY-2vAW<~$sD%h!2RU+ZM?3;4iMbtAol-m8%
z*Y^^RB8Sf~>kMPrnF at CfYVp%)N-Ns?-eIe>C at nh7#l%1i?OAxkB8-;9a?#P-QwUz3
zTB{Q?tdJZRlFfCId(Lz$548(^u0A!wqyZuWlqtqvBJ%QZCQJqL7I^akH3ktyomGX9
z;3X*8HMAo)ht5C&$My49LJY5+O9~k%nU3;N`W-nQ5=HNr3-mleC3WKwKq!SlPPm`q
zoT6(LhBWPO<LQ<%EnXCKo#anySzDrF(2Odq3s0?&6F|8qTe(z4QliGKH*q(K3~G at _
zqLm at iGi|+VBr-?RZUUN7hfv<<5^#6e*TO118U`iHIUh1fGvbow%RRS^t#weAPy^_0
zVV2lDKANJfW+AAm247!HH!AY^Z{qcT((<~-ee<l#!}LRD$++T6No_wYfF(+9=|)jA
z<`QK^yr#=<zHU#hZxY=ec&seX?~K{i)#M+yv=rw3jGNfDq*$v9zoZL@L#elnc=%S_
zmS$_4W1KVaCzR_&HhaW76Zk7>YZhrEidmP2h!*%0g*NM5FY+H`lyHcss4i1sqThPN
z at T#paei-4Jp=MZ^tz#l;)Qdjy@=grbj`A^p1pqHz-&e~>f8XZ`%G6n!Uq#uFhE%4!
zyR=KwohP{JPm40ARNUNCR`w+0D4`*(#aBJaxtx(3Ds~ePH|7^Zh9I7$X?!7+!xG`L
zHs|f;x)h7ZZPr%5ujbh7AR_Yzfvp=$ikB%_n1RAhb7W2;gA)Wp-I-MPj^7g29ai9x
z|Kwc3R|DqF_}y!8-WHEw?{csVrN4fMfwj2msg6NA+hdhL*IK;<<W9Su`129J$LRKM
zZG?xzv$H_`zWIsg%|d=k#f<8IhhMG8Nkh-yymbgxEnwS#wOW_d<zNS&r#Abk*ZGa~
zo(J!1961$}qvJ2-TNU_h7dpL#g~iFFZbGYz3Ty+?{q!I`^}MMy1^rl1A+bH_a<5)%
zC5ct2xiJp-_1q2G{PSGL6&6g73Tz##YSKjIwG@ouiVPdt7>h;-fO=0ayJ$y%tAd4&
z!hBk>69#xY#Xs{fC~Wy3dX<KrET0z^P}L;2T`=8b;wC5XEW|~nPx}{V(n#i}aH1G8
zphC7iteA|5R;-ZO=)H*Bgau9}HDN}kLfmVsYD56kL<oBrV%Q)QsCE-_iL+iw=%)m4
z;H&9`wr|(UZ~hm@U%^*b!8sq?7pd_Rju9fpgqpZjpoT{dyeW>f;5<!h36<t%!Hb+Z
zw2=1VzU(rpGARdf_|-gHvo at f_E;rM2nI- at J8=H3&5ERn at B9LZ?1exVPq?&_W+@Zeo
z3{uw>d(+m_(f-3gW6+u9WsxG#<cJ?J!Xq3jk05Evx#^UPZp6aWkuhCMp<L;@P>5cU
zp-5v*2zZI8<a4OirsM=vI3saIcH$zU!aW-Nq0*u>(kJPPY}5rQNX%x))r!M5UhZZ$
zWTh at yT?wC?(wMkOCf#$`=e*mbdqJ?#D8}1pfwXQUdZ#tj at DWbL>7}Z3S>j{$?&N)~
zV6K<|>40;u6w%<m9=HuW(1---p0ee#I6tVvw01HeVNRBcxME$Qtz91;`9h*2xfczH
zmP5?hT#YwAM_NMnXJ6aQ>|w{W+!7MvLcu1eP;OfR+KmOv>(CK?Ba`PFWE3;HymILo
zN<95^fJVvwrFZhR$L7)lPiza~=jpgd1bo>yj8zFBc98c3Ut!t!HHi>uy>&Xp+oV?W
zfL?*`0!jGkq2QLPrx05g;r$}}^B-gnf}LWy?-H-!*&t(oB%I=qSdr9qsMFZ7yt8nU
zMIUGq!l(%<Ou#|laGe3QUFl$mrtPc598^ACbo?C%nfipH2E3ygvJXzy;_FNTg}!mY
zY&y7XQ7$>vvr_jf-(}vd(AasTCDbTQvy5-D+AALmv129#v35cVBCmNWLU=R=!2`Uq
zc0f1QcB8E<C^Ue^g$k;%SE5%m3?)*c30^V-FU88=PF;a2Ut`tb@&0|J`U(4`ZtAmk
zefFk7=8ifLrb;(pK6cC=*vDO_Fj%=3=Kz@>BEM2k_UzYCQ$I$c?SeE~!Jb#auFIL&
z^?cMDe)ESF*X2fGOQYq-<99cO0XUenX@Cg=vzR*DJzQ-H543BSf;+qzv*~-}mt0z(
zCx;|cmk;K#nqA7x-QXeI)H5K60|&UbtGEeEp2)fYqD;Rf!N^va6HHm98KCd_3N8BQ
zFqS9tgpCtVxHTbM9sM23A9u=r$?-v7%t%*;gxX{iX>#*)^k;&*iL(fMlIUyF=W9YZ
zo#|nqL+#A5%5V>xsM;p<SPh1wN}J2p8UK1<Z3GE#FtyNDx4L@HK=ZS-#iV&9AX`9^
za<PP5$D|MKAPT+C1jF+|oNDFU{_wTLS|Qhr;MrH!tnW8v+Zi%F{>wtF1bgGSTKKp9
ztM|uA*hT?59}>|b at nMtVJ*N79&^l_{xQmIKArpn)ON|X7^~MF!=>u}>=nU0B1RSB?
zMS`aulDNIpc}>M_-k^3S%Oa0cHRpzG%`U<wsZ(rL|KjK)QJ1~0PEG9;>Em at SpAW_S
zmjYy<iK{ycwjX7wFtm8K%KuWrV3V7L-K~Z?Nhub+4HLi&F;I6g5sF$FjOB-W`%VE;
zCkh+M<<n{_eO2D{E6Ap4gk4Z?j^m8N0_Y;HN0_14sFysyfU@e3x_}?9zKW1<0RZ+`
z_(?w@>fDb-<I0zU!b20Q{kHip=;Jue5IVC}SeAt@W7Xb54mL{Qe_%|v+OOw3>hRmA
zd69;ip2rRvOnnpeEE9jf0v32^fjevy&F1BW6-9jn=rTysniLF}nv8#2c+Qrw=RR2z
zPaeR~cbAorh5sFBI9psmG+wY6Cr_$9LeFcK(Yw7oclY{0NW8nc0{S7F<u9s at ja6l6
zO^WTsNH^IeBF}iB_XDgkBrxI2WZA4UD$(-#RW(3W%c*xkU0}E at _LE%y&2|RFuheUk
z^B~f|(3vDFms=CTj_9w{e$JY(FILN2r<f+w7EYrVT5mLuks0;RHUE_rO$f0k5_uIM
zVihv^O-L@EXK3Yc;bqq;ZID}|RA=}P4e?}0oS2X)?*tK6RNAa;;5~8TIYM5h*voZF
zg)GAlhSsd7o>&VmJVX-q4${!4eEGc%YVWK6ZhiNNwcZ;Su>AS0nYfiHG)lPM4{Vk(
z$nm77(==8e$3D(@1B*p&lc3m{Xmi-%zus`ybyhL)VDBw>pfN0L=jLDi5Zb;MzkCFZ
zxOxZD++EdM;!A&_t80P?ZN0nt``(Scuhk%{P*}k7!!^zGfW(v^qmE#NvxP-4QyGIS
zE=-hC^P<egUS%O9lRxsmem`rB60Ry;TE$OO+qiEZA*L|Pq}gVV&6=l<?_&!Xys*?L
z`o4%Lr;0h@#5%NO)_9v4`LmTvPh+Xzk25%dOe%v?!Z0jV*|I=ygV1mnR0NG@4$2EH
zODHzkkZg^#2d4_T<}&u`1w!(c#zLUMYI2Gpd49Y!`F;!<AU!44%8q3apr?1*t)r9A
z^Ri|7X04n{JP2b}t9n{nm`=a7O*2X-HcDe?s%T#byQXcFleL>RzH==&{rRy3wNqhn
z^z1EIwnxYJq~YTt#L^9#is1Y+Z>(@Ag*oI2Mc6NEAi_;j&GV(ib>sK-CI{Z~T&7<f
zYKl|$8?&O8x(iMU@&i>2juud}BF4=nN_G6~km&BZ4IlQu5Bl>-(@AVp7~ghdMYh`2
zZVptd!X^Mn%dv)~LK1<%#x~31qx0JrtK5Pk+6<euUUivS6%+vu+}M#$N*p;{S-rfr
zZ4qLHBQSnxM*_M$01frGaFdgnWPTzGEh98Ti0Hd~q!>PjA(AJ(>ZS{R6lTeQJ*r_G
zcr^v`jkC%WS3D;gl<=>7jJ+)ff>b}&n#o)-D6ItBL<={COGz710BQ<D%l@;;4V^i&
zmL9_G1W26;tFtL6?7%zm!Ket8W3CF<Z~*fD!Y)7X@Au^wGMXO(i>$nM$)Q%aL-@^$
z>Eea at hmh@#iht|{;(c{!bIODF at g}ryJ9p0YhMCNY!|}u8wtXl!oC at r9P&QYy<ltcL
zP|Cg)Gd5a5)EFR+CgS_1LlDNDbxr$C!ux*w+6O3bz2)^&##v?Gx>o`x0|wfE^o;Fi
z!p7VR{tGvzMXcLvIzV#kv+vB|&?+&s_kaKLEpg;7+}>SHQ1q7t(vQ0FI7w}^HdyF&
z7aHOnhJqCKw#97bGKJ`@M(DOYRcQn*RCOO5k3~Oj{hN?hL_^KgsS&EdCwpi##S{v`
zNb^V_t8ztYBFs+(H#?Fb7~?Ue2_H&TT?mL18u$7k-<Xw;#kELz!tMJ}F%8a4@HeZM
zdE#reHj^#O%J0fn@)8uO^&miheFAg>ayXIldY+yhbbah&Aoyug$Rd+bq<@pU2owk<
zfyx>O#$YIP;p<|r-9rs%&s~T)!A8Q0{<vgY_;*c;L)2dO*F3-ck7#*D-MK5F)C!RF
z-`9CeFmQUh`?+<yw==Vqyu5)}A}htNAIol9%#qwKC9F3YndZE4wom#s6Q4$)q&iW+
z_pQz2%uXd^B=gsa{rbi87Cl8%GaDy_U%@OtE+l}=NJ?EZA{jlqN-*!KPMzSoezDWe
zs_Q+lXnA_RnF#d%qBsTl;!ufGz)95Htig`{P6QQ&owF)<UehK?yl^2bYBN)lR$Dp}
zo3}a#WwMLyJgu?XtEk&Qv7%37c=J$?NSv%Mq8<gF#!RXFglvVidi)2e-;uf@Kdlnz
zZ(U*>lhUvPe>ux&+g@}eMF+ETRK1E)gPuG;<`v%|kcbGUeWkFKRtah;Ru%!z0+rz(
zNKB24SZD#2itJ4_@*sXxQOr?rQ_aZ)-_T~A$(-%crb1efoNSVm^tjh$kMwU1-6i5D
zB&lJ~X|&Vs3YH at 7fVfJ+;5nX2vNYT4&=(&(W*F0d$kA%AdL4ee`CFop6-v6x{lzN5
z&fQt|+FLLqpA<RQo33atFCFvC%i9QylXAzcQ*1qw7;qV4Zs$-Sw;T9=vmyS!XD7cr
zvQwN=*KD=tR~+!`#}SFvOvb56wRO@7PN0P)6M@?n!hF!*V&W(}U_RS;vX$PI&J7?>
zG8G={m49BLRv3 at Vxc+a94yLmjq&=R&*0$HQDG^FAwYSx!jrp<u?dz4Hgxy4qq0%=<
zP^mdL60nLiKf63s@9wS65PQZ;48=8Q0E3<s<pdhcF~cf9C`+Bp;SUc0eJ{5m@&|Q6
z#g=ZLyRx1oHBn4pxyNP>Pj8j4C#KQTlNWMB>_Yufpwg29-;m6VyH8cvs7_sFkNSi6
z5<bc<0V&|+48zUNwk_GBUm8^KxQE*09)cK+vY0yA=Bkc|VHleXGYOLnap8(xiaX_6
zrKLwHU99y^@U)v!ZbA@`k_V!>E+e!~GQR|M_#wfT)7}TW5Vf?V=4Y%emD$7P8MKfW
zrSIeG&am$Zlu?G<T#w!-qx;UOS2s{1)Kqw7w<N*zf`#*suY9QVZST=}$+d@v@a6t0
z4Y5<tsUV}to;+^;mF4_n#xRlZC<Cvr`?Q-Z9=Guzv>Oo|QFI^a1;XuxCb^+O&$Ziu
z5VoMF(b3_VPdw%MA<<4Cx4a?-Xq@oF|F)g<rczlJGR~JE)@^LRA7#{vRBGH9C|ah9
zo0!1n3{KH-m~qGU!`@Q!WEr#mfaz;7rD+^Zn3-*Z@{BCBk;t!iv`gZ$4gDqa%mYuN
z4ZlSmqe+89T{WgpWOH2Mq$0ipY4fDALv^_wr7l=UrIW&ob<tik-4j9+lSul`7_pTG
zD$eZ#Qv%B%d(w45%BZC<j;R00^8>@%o5#-v^-m_rq)%Ow^^0(F4f8$QjZA{VP3D;C
zwX{2&R{ntG4ZfSz=8wlP$9VTdPx7eg`lXkyceqB at P8(ZM(w$2_>xrqyE9}_+KH`lQ
zK^o?!fuotbV?G3jZqlqhV;4;Dp!=bdLKyeNbqpr;VDnCzh^*Al-ZScRpyNAnT+#9u
zGRM>R?JWnXuYt9pR|H~*v%ry*iC#0_*Gc^QTi7R7>X=XKh-$gbYMw=MXw`W1YY291
zGU(VhZ at K5L@@wM*tX#i<7m}k%MH`O-+>R}qg->+?@%&p at -w+7a_qTB4Q*llY7CHRy
z#&6X1UO_yzx{HA~W-^XIQVsI>5fzFesqZ|>K{LZg at V3vd(Oy)+7pZ+tZlfg%wzkrN
z#rdda`XcpBtKL*8OW`xuT)zY*GEDLA6>hegzqgsfW?NRju0{+(3%0H;sBo7rHzQgN
z*6EFTuzRH66eJ#7v1m{ZJKPGk{QGBGUwguiBVttp8tdCp{FIVa!)D!bTkmLkW-fDp
zJId?YIigy8Fi!zHt6_EQuZV+y%Ju9RtKI%JkkQ7+43^x_-Q)R4uQ{sg!5>3PBodN8
z!4R62R<T=w|9%T9eM>fR9LD+v-q9Q$gQa|~!a75CPJ#>~G$_$<7u7pUQBO~q*9XKs
z_7m4h)w59<Xj>)_raTVAL3tB<e-X^@ZpR+pZwhi@=kLh-j8bb6d1A6%hbl%|SkKVj
zoWM23n%zG(L@)VvoN5hLlCco5CAAm8?2lbKtQ#Ki*x8XvfCB~t<IbWaxd9|O3f0dA
zyLQ|`mue%t&g>2uN(x^9s3SIr9wyQMVtT<B?q8;3g=-q*z_%@Iz&{hUx^lPu$2(Ut
z`oCz)dNu&b1e($lN!5Axy;fOY1Bg8aGSoLeME;028P1)eG}1FZ?2d$MxGE8Lt8MVi
z6#Lemwj9}HRURlZP;#jr at k-gd&+m=S2jdejX)66J2$yits(<5yG)umAR@Qe`XD*m0
z5Maln^eLH#k3u7RC{l6lz>{;KtH?4BZf2L|xh+r=YspbVh8mIxD)>JxKo<$(j4VOw
zm3d!(H~v&f*dti(4G>RiY-sL&Nf}(FFB~mBmu=)(4cbC4>&mSFA^n@!S60lJSD(f?
z9d_ixkI&C4pDMP_tR5w<vDr*#NM at vpT##T#vLFbyC!EbZxMpZ<U~b_b@AT~r6f@;>
z6zV&6+`*X*4|Sc<-F+?PP6ti+%`}&d63cciUyGU*7lu3tZky36XiS2>=rVbGOM=TD
z8O#d15<Qh)vYM|7^|8Gt;Mo4X1`fr?2W^F*kF=2a>C!XZ)m)S1URZ#qpP8}R$m4!%
z%>M!AMH$K^3qlDW at 4J-ZY5$)wu~Iw((stLtw%t(%5kQ7E^VqpGJ=Bz1$;$G*mijyo
zZ-QnKek at g}Ifl3i8$hz5%c%aRRMw_s3f|=?>aY>5tgcgl`aFx4s at 3YW`Ih}IozM-B
zBGnt#N<K#gprHY!hCpwt?$fe~cI8JyJ%L>Nh-2s(QCH)KVQa#mL-$Y6xQx-e5pPcO
zG_8HviWjLFY)4b>{WI_&guyd=$|SXesZSBD-?U8p)Fgyh8y1s^6jTd0Y?$B!l_WeA
zA|;F at NtiAGSnni-sA^FNHIp9~iKLa9BhH`6w^dY-p2jm-96n~`+`v-xa_E>G<&hIw
z4yq1NdtD*BCxgJU&(x;+L6xd=*Gux6h0Z~Gcv=KS-FCiu;6<$i+u8tzy$LBn5ZB#p
z!n5%zDPY2NOH2ioIxiyc%D|jZzY)&$#{{Z9UKVo-yHzk$`b(jU(|c>PqHVv=Bk4r^
zB)77?z-8UkR747hN{7U!4GKVg3QF>SZtDTLIelIf7zXBOo6YwxcDnfRf9!wr_t>wT
zrhhyrRHsPjDw&~t!x)9Nx}d9(i48OXRW0S-!CtQsQ7NP8?gFTda|UJJ<UFRAAX^_i
z0_`?0#`lxjOX)<ntu;PvR`<;i*S6~8Jt)bz6sIAsr^^K=XECKG*o9F`={^K1r#087
z+{LpqrF6h#%rLT|^M{94V|1h7lv%5S`mo$2*s%!sI&ich@JVtS`bd;`vXf<b9nz{a
zB+V#%S3IIxv8t0&Js`ydDjx^j+na9CRT9uEM`q2IND(yyU1$}ql+14u&W3D_hGBdk
zY<>l*D2Cg{_SYMOp1RS{*jlVz$z_A6tHriyD5IJ-j({I$-Omx4SCGbDt5hf~0)K*L
z0<GtJ5?gXq6q2mb#LD!(8Bp;&V>rO2<I6|Tj;Q*yVse4ivjXT&qEB9u^vZMw5mENX
zg~DgTG<LDPAEPgo_s8h{jUOBdc`jx1aV1_3b7{S?7vQJ8XYEs+*G^V5{OCHC?+duN
zn=(rm)qHfG%&D{j>8d~+vR}{#v7Asp9)}UzMT5zuN#|pqn$Yl>H8Id1;_(6Lmk~nU
zU(ipspwEAcf1F=ZP$pNI3ZMz#0Lq$|RG$w_H(ORfj<q%GYY?qgF6ZGIsXx54;#Zed
z-X4x~gR-X!N;P0%S;q#IoJH}s`yt*iDFCnM7t)O4G~o8?%I$;OIO-)psX!fJhAAyO
z8?qfpOJz1L(a5Y?y5OQXiSW&16lecw@(;3P3}R9I{jBj4<kmmw?x&Z)&HP$&`--i!
zX)eBm6<9M8Q}QBgUF)DG0u<CAKJhx=23t9w4Cek;;!nNC(kI at 9b&g5Ur3 at mNT2%d=
zDbpZq7(g<~V(yH-WR3RCl-PV-yezjU{=%-tCRG}917)aldAuB_yqnira&6;yAQ9)5
zriiU#U2E=w_{3Omzgd49XA#g7h*{;r+Y{BS#Viu%btmBV#)@J^6e!3 at mpy+%^+4Oa
zfFR{(1Z#et0V@?!ZK`%FLJ;BJ{}<)g!^r&f=e<!Y@YZYiHfvf$<wnJOx5Q8vN%p5(
zCFl|NaY=3XM+%fRkwhE#h!>sr$Jn0Fr~4y((y8#!Ce?feu5_`MXnCK6i=ZTF^E2rW
zIDw=6RoQ7g#M*`tkJ)c3kmGmClLha7hjeob0=_H0m8hSOqxnTmRi|F)2E~47zl&%s
zv|oNY{@e_!D}^sFpXUd65NaTsDmLyw>90c4(Bu;Y&QVcAydbPOjk;%)B%90D&Ds<O
zsh`uVzU~iU)c=pEZ|oARjkPS>wr$(CZQJa!ZL7<+-DTUhZF}my>&~qCaQ;EgPM&0g
z_h-|zNbix?_))H;r*^DXVx*YO<p5<rlA638Dg+YOrpqQdR4Gm&7N!u(&?HE(-9X+@
zy5XONL6K@fgdqv7S44b~-p)(xpj4-rEji1H6o2#`N>?BVkY9<G<rb@(bs8fkKU2)^
z!)Xcze@%epMX6@|LT%Wz9z4lB5(9jdkQDKp=CJArsF^4va~Cn;Qw_;toyCq9VHpG)
zOs2nn=34f|O~(%3nrKg<U)o^*HT!L`yI#9)JO&k3_idw1-FLpv$dWw}mtUENA&xLs
zk%64cdRX$Sz7nB$A*d-$fdA4rbhFy!89N41v812!W$cIv14Umv;Hz(n|85-Jq&W`q
zNWc2CygolW_O)j}5PY?)8O*S$uo3b@#7j|b#<vciP=vT2P3O4Z;*7q@@TRE9yrgiu
z(z<t{<AGSTg)M0ope0!rU<TM{?~QT4#p^j>bDZtAQ5GT8WhATj;l1Yv_-hyU_KNX>
z{|+qh&!Sbt@%#Psx_ir$SVo#TilGUh0F?H_%`8MTcncUD=ru at 3K&5|h9dqPvIKAw+
zEJl^p($gI4Ki+cSsb8Dys41<a6cclP{Q>dJY<>U>OSOM~afZ~}bO1d(U%w&AJ=~66
zbJX9R_S!#H_~~sQ*{FqCO=n^v8wP4DN?5Y(i()b|G~-K7i|oJ+OPwLG>})K_0;02<
z1Wl}h%A6ElhzIYMu1IZv5Sg)cG_B-m-BNU^1v{1K>NY;RiLNxGZ2W6<G!xm>Vg^BA
zl%yh1bCg5J3Kt+;z5~5INuNFS#{;mfU-#{Ii$UomoZ;hGWM+A;r6-B9m%l%dHIgL@
zWOpw1q;rwfY5{D^HCEYYg?!I5YII_4v)rRil46t`{4QMD4r3p0ig(>*{LF^vYlFda
zq3sT}V+<N)FVwfw8KQ@{0G;#-2M2wl10k&efJ;j?5#!S<-ZCa<RRp_Y0S40@x&)Ex
zu)sdsR*c0U^uHb6-!|}qy>chbX~@0dw1RTV>Ax3!-46reAF8>b6??ha#<!*Ey1Sko
zqiq5fVkhl3o}uBHz3!l}q`&5pUBz3PTU%Qb&A2Q2Mo4Tdm5fSpEnl=NbzL^7vX)(T
zyj&PQfo0rBzO-x_ynY;R<*QR^Z0Iz!KBk{X&nN5waAfDA^#I~q%Q9AO!|P#pq5Z}E
zoiX#sjV4c#c3#(2TDG`)GA~c`CP8?ut?H#Q1XF3Mc{%KCW0+(cHK_XJYmbc>0so{6
zRQv374bQJL(RfXQ?ArT%SP#4tbGIgjxO*FmcpSmImRpK1Fx5nqg at mTEjUSN_8H2tS
zsfblF2}MZIfR at iab(zJknLwA=Ho_f<3ptaBkO~_UM_Zr}6(=s4K^pZmwQPU$TH@cn
z6AULB4N=9Qs{XBkqP95>8im59DrF~1f3zxsElC8ky8w}_!EE$&;(XS1vobD(T_Et8
zR(idx-5Yh at n<j^u;DSL#rmEGJqDKUTOz(skx5fELq@{H7MA)Y9uGg0s5@5J&vV6zp
zfAL1=<>g8{;C_8TrUb>}AISwK|ABossu)j%>G}$-{T6&^lwO!&XQhOD*YS}=n9b?u
z0L`r*aNrBdA9 at vuuzn|3_%*&DM_;=jILMCyt^5Ar%2Z8z>7arWz^<pdtl^>0-gxfG
zReK5i<jk#)#s(enCGz2Q=G(lBr*>2pEKwu at 6p@WV-A1g!`Z+uH9=?C;+HDl{Sh<HA
zSp2%)>$f&9e~a>b>JNzuZkie3*YfWQfc8H;zHR5->+QP7TmfY_)#KYod)J%l_+ at XO
z<LBX~2bunfR^#5XX<xQ^`Tpf at YW@0d-;XEa)cAY|NvE=Y(x7YO0@@rNYa)KY0aK&W
zVSKZBC=uVRRcF6kZ|6|s9`}p-&}b$CB3T=i<nHAjHY0uQ!ABdv7vdUzeeU?%1Cj&%
z^qGaky2TBa)U5nRUu4z+BnQZSn=}W1b#5DcC?&+T_{fomVYviAuZ2`LZ~gj4P!gl9
zhwU%0eQ*mb#(7A=5Ed02^Ctv~umw0t6NOQz&&Zeq6uUZ~pVXfn33j!*kXDfTWyUMN
zuAMceGq<v at ecwty*JtKFs(vQIo&)0XPZY2l!$?Ibd&!p at HY2tC#iCFixm{$=Zl__8
z$ypplhu2Aap!=I<^YPT|&}V!5HPa97=C5bl_H4&-X3qwloM&FIxlEN9{{EK=ik%b2
z(F8CvxIb+jaa2kn74=nP@H}&HzfsMolV3&4i3P((LyJV2%B(d5X7zrg3MLxY6m@>4
zv(K*UjPK7a=Bi=i`iRqK=^nd!=@CsXKjg8Fsi>%NHD!Cfq|l<->t5e&J at VB@?q5S@
zCT at Gh4~^-M64gaGR{3s^<%MFUA~yF`-x6$5Xts|Y?$kG`dUt!+lkXmH-%_s}|59^P
zHlG_--$#+%j=o#?mXSM|mux at qV?bs9uK;{x20d8fpT#D)NaJR2L%S<(Y+fW^cN(0}
zMjAHo at AwlSW5Z_c0HCmexV*f4K at 8T4!J-IQn`TpLuP%F*FkeTa(wrtl at -GA7XWyUn
z&Gy$DKL^pL64vZ*$<V`;x32bR!ywBk?_=c3$3~k2x@YMC^UA)FS4Y#>k8#iBi2=L!
z%+`AzzI!0{TwUFia9Y)SQikzH0m>}Sh$aMJtr5H|4qXUAqLFbFQ)wxH93Q at 1rQ!r)
zDen*Li^h at 8jf;8e+h=1Q=0p-+Cd+vHw6_hd;CjIAwx4{|cAuZ?&X$KYd9#`7Si9Hb
zx4I?8x&igQku;M&ag at Ha9u~?KnhPu<cN8^5UZ(QdLdSKgP>dwQYbni9 at 0R?16bq8z
zKu0u%rKckHmPI&QBrwiu+E+EL%K`uSRJ4^e{2Xr$H+~OO!FBOocE0Rxy*iYd9`xwt
zWMEry=^$I)))BWgpTACye8!em{#m|oA2+F6dJ)a at TK15aVYV#%2pc=UCd>F<tzX{C
zay$^^wd-<UTF@1C*fKu`jr`^S^oEthIpA`YVE6;0{LLB#jQ5ihZ<n`uKD&v?>Xs7p
z*AD}ekuVatm-6QJ-D=Sf-QY}p)4FwH>%~P%Z^f9r?J>r=ydz3fkZJnO at j2V-^nz=i
zm54a+LlM7xwvuZH7Dc)|*QsMMOqft5nsSct78fnXVN-!YGwI|Td531U1XwB1RV%1Z
z`<AcR|0v at xx*N`zH{r|S^mrTz@Rz))XK^)$cjVlfb#-wmxQx2G&1u3OilW+)riuPb
zA5go{HzE4E=DGYVKBQZ`j8n3Tb|=e+k}*2BX&y9s_vfWAzjcK3JS4evi1756Hnpku
zV-);!JOZL1B4AXRO<HT5oD3WEROC$ChBG(3Fk0>`<sv-ahEwCRh{NXxDK8~P-P=tb
z$p{F8UF`K!kF31C=h|-LvvX>=Iqu9l_xDZ`EIM&@L7xrtP)j&Px4(Mb)E7RxXd$ic
z?J?)-z7cw1%U<q7Lo4gBByVFm^D^yaE4!IA(kB_VCcs4R^{Uynw>??n?7z~HxEw_r
z!&h}Hf1P^U%lq!_%l$R^u}j?9pW at zk1;6HOy=|m12kP^M!iKXS(hsUB(%Ir4rgc?r
z&h_?2&)mNJ<)5{DTVKAK%n4wg-62V*(z~5XdvlWWp?3SLPSdC>i%X%tWI9e~G-X?B
z%h+<athH9Y>=WlvooL@{PTx^_C|kEb at m{Op)1HDK2|QwDE=Yb>?Nq&1QcAksK3J?2
z6(9<s$l`n*K at Q#d8R#x8m%PhbV4r&AfKm73aU=^D!I&!}Fo_*}W;Y04lZNr~<^TFj
zgUcN4+*!)GNPqueec^9P3 at fQM7@ovatBOVpP_!jw+suo|Zm~D+v=t-Mq7B;1inX at 6
z@R+wIp-jr;kTW+1LZcj_GL_rgWRy}Eo~~AMc*n~7r~WSJBYriK|7?)*6(NEKm7$``
z_qhW<4Dw*Gt(1<V&~V+81uOPYr>_UL^Xl{dUQ4c((7|Eg`jEUJX0R=^%20;2WpCd0
zo$T%R)BS5E<+r=uY1_-~Md<RhPIKaU(fgd$ALbqs*G-MjwKfTR4bt}ZJz3%k84RW$
zR2@YdM)jFgYYWH&s1Rwe_Eh=k00Rv@^G4)0JrZep*jlFRJWy~h`{N0VpM~E2=l)F2
zZQD}C&e#fH^%&SI?g-cmeO=JHx*ZR`(DtC&5fcWo;>bIwqx9W%pXiyF%tsz&Bh(#n
zphbCM=H<}>&)0;M`)Zc$a?7y%k8!e^+(m!Qwe{b!LM9nZ@@RWz8W+eh?VtMKEqB}$
zMA)jOanqqrH at yEo)_-KuK%<xN`gcVj!v;o#^TX#p6dUkH;o15!LQcEVkt#O8mO&T%
z_wOu0DvW!Ujl!sp$;)fh9a#VzkjUcLd|lu==K_;EKfrNa0wt86G3yEVAq#Y}*k175
zuzcTmUUVh<v2rX65XkGWx$DAhmvA4g*f$}SKd|7JIk|CI<G1C!m&OcN<J{_yHS`|9
zeNWWA`T;X&zi;Wplvyd855woR^0t(2)T&cJ59oE_1@&8()cXe*J?sThenHIT#}O_l
zbF@mrHRwpm2|aHBTbPJmB8~ACi25#~#B;m61uQ?*PJ(IIidcNpvw*Izhv{PLIAH}#
z_y*;ZSRaFmYW>&`iT8vxXHSnuKl=n{>0(oj`nyTBR7zQEXbPg_Y-}#MAwt}&%(jLq
ze?ZPTc*Yv^fyEED(ghE^14*!XzLZ1TbrZdhhrLHC$mQJQqS)<Ch at B6i_l`zvx_=?j
zO#kjYw8_8!oF}Z!_Y}?qrs!I~plHuQj(mEiOpSE+ZQ*LalDl63B%;nyU(;L{{`c~f
zwZzS4^y at xMIiIQ}Kg%U~!vE3-@9Od#jVo`JhX-FlBN*iF4*-)l#0J#5ka?3CTBQkd
z3`j51AcmN?K`U-vV(?}0e)Bmy$@OiCI?>nQzWyA>D4<fke(bMAB=)u#v1xo{U7?3k
zD-YZ5@Y?5k9SV$*_!xeui`i5}19q&kHL)kT)7DyUvI^>;-+Q>OOy_#>HxMNsI<rmB
zt8&OANo72PVE`kG35o+Rx=`P=%t*bj8{mUb2Cko|{f2s{Uiayd^0E{`P?W*g8jXXK
zT?0L#3nX4~qHHCe(I~Fn|3S3S>XOs;H?^es{YSp$_}lO4PR|Pe(>pwyHAvaK{%ZOg
zy+z5=U(qz}R$13vza{14j<>;6;ols$ynf<i^8xUd05h~xT0Ajo4uv<ce6B1lWy=EX
z)H{%uT=0t`@{2)-qeEQDDB;%GKX}vh+6`WV7z+^?2L+RwoQ{N3YgXlQhZ}B}zUF7T
zSQ^7RzdOBGaYka;>8E{i>-{5G>%q-qMaRt}68&}muIQxFly5?b;JNk&9W}y#dt`gf
zChaIBK_Nu~lMDw7g;*kU#lB5!VCqj at GuP5c2xE5pDb#5!z at O;mMsjEw%J4gcAUIBv
zXQnfdRZn*xy1hQBTAwtZR#ETO{*2mW3SXVCmLet-qkoSLA;Gno;yO$}4f!+y5QKDj
z1Pa-5{Pef;yt$Yyy at Kv8uC!NbuBs9M*nN%63sl)!Tt0KBqVeA{)UOUP)n5_H0Z5K1
z&WZ6cs2E9Gf1aSI;4r7E$zcx)lq0UM2QMdNjwPXjgZ1mqbj?oTy2IY=Y-7}7z_ZOO
zm%|a(z=+$J_oh8h)}-tEJ^^uYQ3?CPNT)tKKU_&W?bP-o!IE?%gfmi*pN1={#QTp)
zX%k3m)tqFN4S_E}Qb?Q}7|h<D8}Rl6TM;W2$KyQ*gG@bul|+ZZUm^KlaPMYlzD3{U
z`4}9Gon0LGLU;L)AtF36D-Qy-D`~bprLB=AANYa)c$!>wplvboZUo=hu(Q)zbxmGr
zy^^bYp=liJe_kdw_cT at iS0tgditkfvjqM-ZFjscyb;yR~r`G>=jFg+)+D+`}Up9M;
zMq_Q?3#mOk+-?*)+eQO9s5={yM#~5=l0~|(j?(Kk&zs?rD`Sx9qG1Q?373VOF*CIZ
zBT*8VJ|CsmZaNPe-v05Fny<bO5Lgh~p>CsXVkdzWCTN_mQG}+7?IqI}DVG-#A8$gR
zz<N+F52a0)_VE8OV&Ezum0k&`{G}*f)>9^iIhM3~ik>!OA7rc{)r3&YNG$8f{v2kT
zDz(u|1QarwXME$X!6-im4`_^??w+QGR*KvW0|%dL4BgSY8ZosT at g|$^G3<(f)p^}g
z5iUU*2<x#8IbR0r{BV37b-!!_{@@5mw~Ju|el^+4#i37eX!B#VuLpJgpZ#$2s at crh
zUXlLf?w&Z4Y&EI@^==HEwVqfWrqkOJ^ywwmr)bhP-;}7ImuVY798hpu9s^Lawa|-!
zaMYCN;AtKqwurP+0g~lNdU43N26Bpl3O5TY1Zi=ERA`GD$4A@a!`D~n!nF7Aof3Yh
zzz{WI7LGa^xv;U=tiC>47OOJoE&&(zB2J$FW7HUT)8!(O5c{L&yDRy(uUF0JD4yAl
zQm208AkenB&|Z-{<@E!i*4`mjlXV$J3tse{!7>AeKkrh25(ZA!Ijku$eq>y(uIQsb
zuQB?3t@!mjH$Gq<m~Vq?%Sh|{o#>oiKJCt!(3=oZs2csa$L;;_adE9}uL0w80ABl9
z{m~D)_L`4vWbUMM1dDgiUqtP#h59)(Q%6p2$@T*NyzAJ{(fZY_EOT9)&FT1T3HdtA
zOHX>Xw_<tQfc?{$xDF_?@>pva7l^rXZI!Oos1tK+?gzv4#|Sqr!<Z<)n5akS6QLt;
zK4L<$2(&oLng^}U@0qCxj>Cj49wmtVD^9t$a1#a(end5qrvCf*WA^wS+DmJshZY&m
zLy>H3rZ5(TRD}$&ZBf$@C=h8oZBv!5$NOV(+ZathbG?^1aXvbTx#59;4XnjLGzf$W
zNSqmo;X;zvAoy=MP)(LA?$Qm1dATCyEQs+&n4zFq&XXoF71g$)B?E>6aF1PI`lbBI
ze|*vYQml4&B+O*wV?r93fPz4T4!R(T=x@@Gz3wkW+DhrqL3-hUr)@Fv)bgi&FT~bX
zc%RtpzH<2-t<(qlg!nnN5dqvlv*UOSuW#rp|3~X`T3*9+{+fz<9d^$>$-F>EG)G2`
zsxu0tKfYBxK?+COe(8m>Yx9`P!#$yGrN^UFsZx6S(OxG)R}d#F-iv7>_ at nBOPcv>N
zjFNX1>8`m!_85ur-b6 at +Nmf;8X<09$u}h(z0=xWkZ@X%o_2`vGTk9}x$=tq|I;66{
zH-M)~2U(n0P*0L9{k$rgR|MiRw7dn4u~Js!A7R_S_LByS_T#XPQ^McjG&{_DlcMK)
zSE>2<v^0~Zhdqp8ELb6l3Lew&0A#CBFIes5839VGMF6JkSgZg<#s-NM;qv7r@VO}y
zieGAKx+lAQk%-|ab+-Nzm|lcqH6Yoavr+ufb;|a~(T>lU$Ka*P=|%nrhMMc&4(f0|
zoN%-we=NpS#)!;rZ`Ztxggd?W at rYV;ClY+zLlx41`*gs}w+Sj(@k0PHa8nxhGe|4|
z9mQu-6fdkd;lF2}tCiab{NAcJl>dZOp;=E)mUtdEq&;5;Hr>xtCvE%ZAucXePDdY|
z!1xbNI at N#V+xG4&(VaeUpXkxs4{C}(pY9Du{8a!D&{f3t(`$`_6!TJOixufcBj-fm
z97rB3*HbAY0@{F#Hw-sL1lHEyDU_0l?s&wLQFWdQX&@qu+deBmy>G<n?|X%*L;vCc
z8a#qbojQiLFow3wWtJd<sj5i|Q~=6|&<J5l0<H0G(|KR`U)F!U!#B2H<v#KE98X>y
zp_ at +{9gTB|%R54G(V)2oaJzM at 3@Sf`M$2ke=>1?iyyI&jnG{Bo6hXMMW-ry<xvMf0
zfYu6Hj=60AYTW<Wz(?)13ZjuLJB$y#1r+6~JSk+mAm$MTi}^9sobii|1WE);4BE$L
z_Xl{zjCnsFM(t*c_Y=>+UvWO)Hr5>=wm7zrPmesKE_#7s?9L(tSBZXe+F%64fw+ee
zfb3Ru8Z^@PGMXQWE9$P!YUc-cqiLC|PgbRQ{c#k7m*-m=Yn*YN)7QLWHQ~Fp%)`6q
zV-EQ8$4;Ui**R`>P~`vBo#6gTu8i-cY}#Ju)!PoHO+jBVO3*O#k=C4$0h7rPv!bHO
z#B2;S8lp9ZS7H47pMAq2q*#*3s53K#!6>f^7Fmv|(?WWF1|25tt9mnA)sJ89Hu$Fv
ze|MLiSL at Sm+HnS7<+ANmQ9Wwb*!pf?P{fSIkdLmD#l~Y!9clvhLxgm{G!#?;%-V0b
zuq)6l#=job+-A1e{rZ3BrUG&^d&3dm^t*4m{5Vg3O!ah`@hutP2Ej-Th>{c-3U&13
zHTYK(dAZ?@Xl!jDJ9P&GqZ9A at y3{k#M+V7)fJIWWd)Tm=jq9f5$N-5bFH+<HB282l
zu6BM8(Ko)}n@{OJK6|uk3Jzbc*7(Q1+ym3vy<Kv0YSFY^4fI5_j)8e1FgYB82)++b
z<u>ht&^vF&>*-8ioY<Rq&HR6FH7hNdG}z4ZVJrOnY^6GJRvmjar`wq%2o9xtjX_vi
z23Gk;fXv|zw8unOm2M`!LbrWir<R`U2h7~)ZW@VgS|M53P+qqGn-z!AW}EVr7zgX~
zk+3~IS+cVke+Oq=T*jz0HI1gWIMJy0j29{VD72TJ)UEDd+3M}#3-b<7UbiG*j<k2!
z*3Ir<^4#mgyqW3=GVJEVd(t1Tf}kEfzTEbQP}#<M6ao_f0HV-UR)_;uu+1&b;RZu}
z=vS`)%LTBMuRecbNQR$>`Kq7Y20I|LNR|RtMGRrYQna*;VgyqS+`$9K_dxglCei-h
zwH=#>TG_4(x3<?9ENcmeEn#K0wL(T-u{C)-MJn8oZekHno)BuMaRsDMT!bn1wa`G{
z`Ug5Sg^bXSUg(v8I*T7=-P_XFgrOaKgxwIgy%Ctm9B4NA>k`su9Or&N20YxjQFE1C
zus+gdV3>QsiusSJmLY at C(UV;&qn>5>Sojj>4zLkI3#8f=Y0=vDFB*hM>L6xz_~p{u
zyKOY+4Bt8{QgG)!kcT)njL5iUuL_Kqrb_if9lkM44?kMVXQKX}0A;!WesA8~yYEMZ
z)rUV!dEg+()+bdMmH77lz8A8^2vj((0^A$j)gfQ<e`57UqS36iOZ}c*)n0Ea!FxAK
zmS=Y4r|Sey-`E9rDq8#T4Cr@rb~|`92taI<-+_Ct1Qr;cW<G#^V9Yy#()Yi2I6nu1
zW>!by=$mNl?RNlL))Cm!e=|s}1GZP$Fc!cHwes^pOkd*n<#=tXUMc5aPp1r|H!Frg
zdnbZEw{oEb!&_VJ=f*#FxHGG_`SxAGrF_0J|8vdIcc-mhrpJUk5nKHrTzwAPZhen%
zSwoyf)?OJbiWV5xK%+6`flhTQa7M${z7rDlt6K9$HXM+(eQ4K5L}x53I|pZgN|r+@
z{h+@6u-^SR**F>K+xJ=#9QvB=!1NpxE8`&2b0F4 at LYu3XI6Z5Y(O5=){?k~@jh4Lm
z7`~VOptj}b<rTsEf-zNdgEN#qceKLWjc)GpaMPLQ_$zW#eTk}nX>quCe19`LOUY?j
z7Cp`>P<vA%qh2rb3E~SxyaFhb$`OayXM)AbQoH39Pr!(Vn8L5vA??0dR#_Ra-nK|G
z9Z0OejsZUfgYFf!;xMIQ@K|Bw8dF)Eh<(HOyc}gJ2wA01s+?1qBq3T5tYS$AD^0)l
zt|aR4f)&qZORK!b(V%hukllOm>g(q2Gh+qY817wY+%5Uo-QTcPGjvVEZ#`Y!qoW~n
zXvaMC at _}v{JX`o(3#J)J*L1A(Yfmiq%KO8k*E|1S-~gC-Y{*hOuGx0^4DJx(%)NH?
zd&AH9n_9$dx;3G*>^A#<7jIR}-2uPivtco8R~PpY7gtL(`ZM$2{f}Pe+7z<9+x!x*
z!TqpxI?wOH$FRl3wMaI_I;rLoyYy=>AQYUWdt1j^d!p9Z0-MmL9yS`!mL at 1!su`7J
zp02J*u_8~AFRQ?&%23+PCSuHky?5uEk%LB}lG*1+B_65d$u at o1G2Ci+vNPhlxbakj
zu1do!PMbWy5=+GZ1#umUnaXflXn?RMAOjlwyQW+jYt86EtwhGo<bF_WT|C9YN{NMy
z%JYLoS2r^S7gf)<JuS`b`F2n_ds3glLF}$H7aeXJxdcat|Ae-^pNYZ4QHluZnUt8s
zpBZu=m*Ngqn20PxJ)`~TSnv`c9K+&M;>-7-TN_lDHFYv%pOvmXl|?16W|G_-tA)=7
z0bmpn)?erXN(_aFxIA4Ff?BZzpVl-UN{CZ2hdx56k}0ldcIGFWD@|Nq!$*d at 8`sSb
z+@?8zmVU#6Nd^bFdTMqZB*t_DV{6SA-x<9R+WG3B9({Kwu5VwRJirTv1MCmV#63pm
zh(ZtoK8HSl4R`RjM|cyDjcu!%0r;)}`1N|^YC8Y{D8$&A-m#i}M}XWeYSsNKjsaV0
zmlat{tubZ*+6Y5~nGNhEqU-w4SZ`dA!4Axv2O<!{5gzGFXBX*J>H$i&&+JC6t$kQ!
z54yV2;e<4e0YsrokVvFdkJ;8(|2wvza^tK at Xju^@=P@<v8rfkys&q6mC(2Qi_$56O
z*gbTrrs~;G7X=UV#O<K;Gg<dP<W$#1_`K7w9Xn8JDcjNTrwCQx1iHS at jWg|UrmgJ$
zd(u$7k&)WE<RPLKGwpUKW@0oeN~7oi>zgp-A28mpw>XcJsog62fuj1F+&+wD?jpWj
zV!+gz%gG>^TF3&G-sB at z{-$~Ykt`AQp%<lai305XwV~cr(1QH4!Z&>J8(K<-CgW7V
z5MpKmlF!ap=fOak7)e0P+e4Yv<J<RuIAu6@tH<FK14&>pt at 1iL(=BO~wZwlK?~22D
z5eyZWMKB^1mI5UEcj%rRcblM_PCNH~{|+}n|6ZdNc>4RkVAv6WR9!F6)bS<-nXUlt
zfaUB?Sx@zn*px4m{knO1YV>E1!PPajiR%?fi*D+0G}IZ|9r*t^qxWiI3#M|;IuhFJ
z at YL&_$gu)YUUf{++1_mCIj)SsF2v=s<XdMc#uS6iZ6#-AQ5K$Q&PnICG;e)jd3xqG
zN^8^?1V at asRPcEgxR#eCP|Qizg<Q8%C#+Z0uQA2?{;E*GF=T~R3{{*bPZ6Pzt<kCw
zI`-MT at Y&X@orEGVf|jT#pfOC<9a4Z$*HjNf!O~aFFw57)AY`Y02`ggasJ8YuKB)Pf
z8+8T19o(o}^(Fi*0S38n`?UC^Sbc+lrsee`W-O;r(ODoDa>1!$+O3u2LdKd3u&KWW
z33lFe9BHFzb at 9nYl2XASHSQu21j)S|=h`g$vC7^6XVM-r3gnmF;!)b(FJVN2Z}H$b
zNFZ6ok_3f}N at 7|o11vG3(V^W?G~H2uh9+Fx2O@`NS4dMkR7ohcnOiD3ub^*Ls%sdz
zmmOx9`!QE6 at v<~OOuh$e91g*Qr^vLWHb()2CZS{<T4(ELS8Pu&86VxL-#b_-@=b$h
zH*G9zm{?j~eZdo%xE$wq^@3-qQ>3|g|K0!(1L|m|7Da2e_)$y+{>c|-Or6*4#Fyrd
z2WsJ=PDIJWKn_G5nJ)qI&I`;*D&mm?$}<7FCCq3?m<IRz3#=<pQMmiZ|3&Qp^QLwQ
z(44xjkcsJTxTt&ix^Z7>!)V2u*b$T%)?!JjN2aKcMl at q6H6J>L5!Ky}Rd7+NNDLVp
zRLRXoQ^?$XkRQ)8<e?^Og7#&}G~t$U*X;G@vdiP2ji&0!o38bZkDSQn$MEFK{Sg49
z2~&C*C>2$K*?h9X)kwi2lC;9$Z`7>Qx!n~KdE~c-?|QlRMEN*fWibwdgNVgYLen5%
zeEy&eNd|M04B>;Udt|utv)<RpIyup`5Bu06P=-;Dy!W+_JD0IY)s9wA0Dt8TXeX+-
z3_bxweVo&RBk*tdgwAfRPn#EB8`*=oBkVZcMYEnYK!aZH;mhh$?}7hJU%4_ou-w+j
z%uc{Bc>(5=kx#8BDULUD(-5Uf1OEy(&hzzdrju>wb=CUjvzwakqBes?bTQhDhwM<O
zhut_egb&*%^i5`UosG_h+Bph@HZP5F!Po+$N`kw|MPc9r2<-T#R;y)f89C5lZTN2?
zu^)HG3(%#L3*xtW6)_wS`d!nh!oVGZ;E=?AQwbSL4G$Q(d~X6|G#TCNg4RYl<kseD
zhG$N%&3VDdbVaiT8aSuv+L9ixj~Vcn1jX7Y<~r=&E2Hru7lb7;3+-S++kzy6P+)p;
zxFAEOhH_)2oXEvg0ctpfQg%uzOZ8HX%V6qI0Yv__1!oy2XWo<m_*bBEuhUj)2H}}i
zcqsv15HWlxLx3H4)-|E|PxSY`?&R_K^jiORtWpCl)r1}lBk8W+0(}bYW<FSUc%(H%
ziF4Z(UE2}dpD$a7jV*^6Q4X*0oX=M>9Ur6`URe28ls}ikAz?WIZ0~?{Qnr)^=P#mP
zZR>0FxH9I$F5t(`rfg3_ek_c`*t603864p_IaD<#<$lBzT9huJ;PDle(+bqN@B#wx
z!2ZA6255x5W7X2|+yO#!((6u7Ru}nkpkt7`of-dB{{)}hb5b-EAz1$8lrxpBW5Zrc
z0HXZyJoQ{)=xBxO9`;Uv)*}E}`=bx5C0A+nfH--L$htVN_GJC?AjSfBk$w=1Qx4&#
z&Uhz!EGtlbVCM1_MOWlUCK)7&#}5&p0$QpQ#O*O%^BDI{!p(QOgIYV+fJbn8kn1iA
zoz1DR&0N?tTztp3JILJkI?gzs*Df7*(ss;{PTw<lyk~CukDwl}ix6n^nFE=C>~{{B
z;7Mu-N@{{493URP%o}Pb9Zl|+Tp({S2VvW7-RZr at f`>mjE4;1^cVs-=2W)>C6_-gz
zJbnIEHA63Z`V^(9Dma4IsK1Hus{wQ#*|y5^Um5DZZZ~o_a%Ub-Q}0V!4nwtPA!+49
z1~jRso4N~0Q3XTTQvKb at XylEv;FA^^wfU2#uFJd^UP at DGgcuzB$gB3Q6~8p-h*;Iu
z8ADMfI+!feN at HZL&tT!IKhL#1mnmhNf^=xQLDX2d+Tfs$r~(@yRdp>Qnr0_A1X5%m
zYPDw)1tbL(4yDWJb{v|6?zXfl8INU%62rly1Y93dqSUB#0D8 at Ws)QhfLXv47YVm}I
zL|EaGr+aG~6%eu>kXj6(W2KrFcJ02l1KH{$Fh~`im`TKIfr&$bA`ODHj8iR|EqE4x
z=2ib4<U9GKLoHUmVmKPaKxu-=LJvJo3V_hl-Hgm1;V{sAYq^4@|MZr^#cDwcx7hMg
zA`(@{*&16Nd79F%x9K4>&UDt<GE<GVq~yw%+}C9-88n}{m;dw^Moq+sFMA?r%MPPg
zeCq``34}f#9J>6d9is$8?eiPkzYoCyGK2|(AeoD|;>D!o)uYxpn?QIOV&Y__n=)eK
z1n%YBiJ$saV-vsS at 8POK)5;C(Lb6o5R#(rpb$@-HTQxu|VU;&y;=rf<7*iC<qVjB(
zyd9cy!IGZGmx+WaJEiXwOMr>{vs8CbLLX1R`>=V~M%fji6V4t5Zw@)p<UhAmamS_d
z7l)}cUOVq90sCY)v&I7rPY$0CicAjjaU7D}hwj}+I%E~%xo?E~&VKLI86A)FSo+M9
zFqfY9kFO0kH@BPG1TGvaKL8Vy?>n4&ywSn^>GwZV9V!~N at -3*#r3PKg7XwUyb1C8g
z{gXzm9*-4XBc|W+2yS%PtyoI8&o(j$NeFj1Ad3(M!2q%-SWrIjoY+)|AO$HMs)7#N
zi52R&L~=<GshF)|S)a6S+k*O7GW`Y1V<<qFq{JmP)n)c$ilJu#@db=EN#P|S7}m1}
zSC1cuKxVv$dShm)aeGN9sO9hvE{|FOR>g?4OdD2dYf?+Ue!$4*(s?(!7qe3#XEh94
zAzi$qUj5fK3oFN+47pGb<+D@KYn$n=V!0uIL)tlY&2ze>SbAl)=v*cEaTEsk`^Ot9
z5{4{y_#x|${M4YuOrndFHFyG}<%unU?{U_=_*=fXiY~@9DV$HuXJ>|>O~5jf=$KSs
zo}8=U4pWn9&^*zTDx7=CQI#rHQ&O^AO!?7CF#-(4=9avyKo3uS$;l%TCj&$ngJ>qr
zg{Bo6g5oejRt3U^WE%dpVla_^-h`$&hh5hapl4w#4NUxAwkFC)8Q?GnPXY^C2$pCm
z^i2T-2HwiRAhj&r15)ZI2yGpgxbm_54K(lEs?i12g2h_^WIsyHoJLU`o~(^%V2wEe
zJj1k`d}+?LbuB8?o`+&E7hkM~!d5HHq++BbaoEtmwwJ(+Bj<s|5wep^z?=BogSb%Z
zzOU=}`)lM44}$%HS%?dx5$VK>0JRL#jN(5+`E=q~vRE1p03y%L)XVcl!y=|x)3-q{
zPt7*uYj{|*|DClQxNp6=YcB}v#a#gcL37`}cj^6aL%n!%1Q&wi0|P*s$>AkOFYy%I
zzx(CbwzCCqB^8PZ!5jnHC`y!{V~IeVx1&))F$yRVr*gLM05c24YrU?J*P=AR44DI-
zK_;$QBs(4)et48Vvi#PEorn;D$B-iSwiJXEf at n}dMH$ELszkp9Npw;?QE*!k`;k&3
znx|pT*Qsims6;kY84+M^?4q3ugtV={YHU<QyzCi5VukyysCBF6Y1B!$i{|NZ9XGQX
z^XW5A{N)wo0<Lj)rHp%w9k^NN?2N84V>YBN{UN6du1m_hn$%S+dU+B8=44P>NZBR5
zvWQxD+s#Gf8N?&VC?ZC-i1^581;frj%Qj4-^QjJH*W3$3uHf}1B+LVmmdUIqMTr(U
zFl(J+(K%(R7Kmc0%~*g_1;GTFM;9X~VOj2{;6HwcB at s0$GtEe<A}*(;=zFOBXgV(|
zpB-+9zTj01LMYq7SqM#A%?)@iZ0$@0loYK$cx4Ec&g%{`dhvLF&NGPebD$p{l2y|{
znL3zY8JcJej{ro#&he;`L;D0L9MD^o0Na=Lb3EhVmEmYz_f;w|ffgUiCq67tO<?kh
z*Ke<>qg+wX)P&ON at o^@`9Y+}ytNelc2A4ic;C8FN|G~ag(oiM{J9X*<!+*d)NkE$z
ztrAi|_w~@^?9>cEeUpHjQ7DUG^Gj3NB~(M<0CL7!imVOEjJ}6+eWkxOfeN3ZugJkB
z$8H1lV+#EX8suRy%-MD<^|`%j4Xa-J=SSdD2w(iA5fuNVRm%#XS^M<f21YRPZU-rV
z0&zmG6Ys3N#>DG1gGdW+=i){bJ4+U+oB_n5I)iWvDT4fO)}Clk%mPTGReah at uPr#V
zC{iMS(XCF3EF#}XMl0X;-#~67!-!}BqXn%%6tF)6#JOliq=145u0KQ$3!fZ=U00sW
z*o*vKpaVj(d-lReF`5RIG-Kx?4SaQKM}ceqo)u&-)sxU^l#&p^pg-N>L?8FYxg2jn
zA2~gcTJ+x#x{o6BWynU($>-oMOHlGoh7H7DEZSf;^J3Tt at K~yRWX``Z;6ry(k2=G1
zqOFlGj!qFgvWYVEM}Hv;2c>_mDh@~LH`U;PDooPg5uyma>VjYMpk|^!%utLBDqPbU
zb*@yQqsJ3PO%YHOw*nL$;!o9rfZuYo|FDwXX+f=+X(0c1`WY2SRr2(_xSQ>?#Fe5X
z5`;d-`b3{jhw at J$X<d|Zt+w4&j_{INoqkY42Cj&-+`JtJM36}Csn0%I;aMJf{Cuz|
z6s}?n>e%@_D^HbGFX$fZHs5y!hFp-ERi+YeFf3FqnyK9XbQgJ};z45yMU!U at 9O|%p
zEW}_a$`1JxEAtY$3SPkTHX at a42<zJ^A;_%@7$B9 at f)e<)To$5n=n0rqDzEIFI-+c$
zXb@j(CJnZ?GB8)cQdNu6<NIqH^xRQsp0-CXXsDj!R)8>4#WQc|VxF)8d>yIC%1{Jx
zY?^)HARNaPR-GXbO~eyCGxLI%>d7@<Veu?!h^#DIWWmc)*b?tM{%tIZJ4?HDi;(-_
z1B@_CRv7MM9V@tM#j_f4)U$eJ<hQ)C{UK^<p#(O!xA#6-Y+jrmFU62+ELXYlwC9RK
zGYiZt?vs}(R26W`T+j+7>4xPnigN{5I(19I0wE-!D?noc5TawmFq;GN5<K8gF!Kom
zC<w*C!LSe@Eo>kvQof6W34WCh6 at vuP*oK=><sp&~5)4wP#Zr!p_cV<(-B#J!6$YwQ
zTT+9#m0;vK`Bm7xVThxD=C+FbgM)`96vT~*0xSNow~b4R5_Khu&gnuO5*->H63KYw
zUj(mho|^UBoGT}+p_FjLi9EL$c3i}*<uK&-+fYrK!y$CE11EQ5cYMWrmFCcvkgL_%
zNQ_ZH?NP9l&OI~D0E{V{oK!RLUX+-kZXQmHe)>c-Bje&2SPGCLu at qnl5*757iW0$L
zga)b67gY-1A$c!K2GN|#A`Z^(ic&G=CB|dapKc&J8W16&doxuI71tM)XSCbpJ$|1y
z1hK&=Ikh$<2V>YG@>x|TbH89=zduRODdIMjRfD{&N$uJDB6E(0!*K}##6Tb>gj?$P
zQ&eOGs#Yi`gdA>_i$vuI=`hV9>B_yUsiTEkz+zRsQ!7eoJmY=xh~=s%mLjr!R_!oL
zZ;6AFfHw$DssW5i6?`yQ-rZQDj)2z*BnUtv!XiS>%|wCpkgEeBidF at 3RhIf%&gNN_
zsm-<9#`lN#bPz67yi}N!FP*f&dovL^$1B3dPC|##jD|-eZizH0j6P|>)q?R-VK(ZN
z5-F9cbjhPsld`y<&xx_|AHAO)p|{H0Y`KARKX|BL1DmY+$O!!Zko5<gU~>e;L=_&%
z-R<RYGso`5?eNoVu at Y;88x0w2L&}muuW@jgQc97q0s$zxz*;O5ER%!+cYbDUxsWiA
z5z*LTUCn>W(S#><5Mzup(KUED6 at iG5OelP?3?u}BJzQ}X1)`h~jNV%`L@Xpm4TF8W
zEF?MdM&oEDZGQng>F_eCpXflixJBJmvxs7U|0a`+f=~so8$CfRZ%|}`j6_7p3X&3u
zG!LmRk59B5REs`D!O9SeYOF{}sS3 at uxNVeYh0cf3P)|^V-TiCG`x-gnx3IRDpWUb^
z*3itnhFx0a6wLa)D_or2X)lfgYM9>*JrhAEcoRWk#Rb{_W$|=@yM1FFe|IT)_cP7R
z&ZKMxsNEK0CB!4Nz6%LOiP4k!R24~^Q+xurN?bPf)jTUv?-TZ6-Pu}L#3SJPhk^+m
zY at P24m~yfvh?eR~Yr4!v0rI-6m5LRcB?eOrmJON=9=;Qm8%U at Z^>pl8>Ik9UrvZY&
zAZHhw4HYw9<K$K7-B}5d7!u|)=C2d1zxtGDmBOI10A at 1x2`vRL7Cr8vs6rp^Pv(Q_
z%BVN<!UWz6R$Y4{FP%!^LP8^mfKFE=1Y~i at Xpz)07-3u%s)ODPj9Qk@8I=EM<PlZt
zL&Fh~5<Ge5K|;b>^amOtc~cEIK_H)#P%b8zmaX*KGYXOdk3blfo-=!|BZdwO+9uLO
z_oz)1KZct`##Z>afFd4~uax^OezYupHGq=Fp0ARssWox(nvwf>X7QDYWB=CJ-qsO%
zi=2Je!*m04*35*DKiomLv%sP7zmnQt09(QG|HUz%UlX;Ug?OJp7lO+xS<ar)4Id6S
zU*c2Mgg3<^3!4zK0JM-(0Fq*=ZMTwWc|j};Qo`o(wvZx%<6j0EWj*S8@@jf?x(rg1
zn+Rb7DWW)RxupapqOx%K{*Vuf(E^e&$#99BMBooUr7g;^aj|VQf?yHNrM~nX4+1qG
zpoY^}*El4`93oi${6Co{sG=}9yRxeViBvF4?aY#5OR-=wL}enY{=|iNms=F9Q_*G$
zypH-7rCy~}Op^9kFtB=ewiWNg{r5z^PHx5P<ZfrH6>q!Am%OY#n~KSo<Tp9PZfLL0
zahsJ>Hy(InuHwku5T>2N$(^{%F6cE6Y$hM}L(Ju%OeH86XNs=G6FLV5$Y!sdynIpP
zs3JxzVk{&yqiik9u6nf~$?-jtq>7~305#J5z*w}1Zd}M}U_95yi~Ymiev7fH4o#0e
zUD%;fibt^(NFR8YW5Wc*OcnA!<wl`^gH-~Lh82p|O61^c{q#`f{U54RK}&W$j3_U#
zSYjGB5L`sofe5@_ri`GDO;*t4H4SyaiTg<aBIqM*ZK9k*Q{=codx2`UqXO#p8=E)!
zbEg0VWRYy)Eqq@}Lo^(+72A!534{%k*_!{Hs?s;AwUBPGXKC8B`52k+oC)(uEualS
zC}{yADwG$&KFq*6Pj`pWD~gp!(o`f-ji(U{rXdokmloFSOhGrLhFW2gP|E$4kA2fZ
z=jJs8bxp1b+H)>FOKF=ph at v9mE`|lFYTr={S1kjtk@`h>nW(bZd3f}F?LI21-M2V*
zGNw-6`22^%fC%xSqW^1@|66A=LGd32hM>>ZLi^h;<8S3Q%v{cVgr%LDXvOwILc#}b
znN)Uu8T-2&st at c$!30g!449x~2O`XoO|k@51VgE2Ec>eoh~lv^n7Fo(SF0iUnc=d+
z7D!WnWERAXq>AQ71tk~a*F)p6lp=$72~7V2*#>Fv4xbaLf<hE?gjCQ=XQH~^8lG>y
z5?;nhU1(s~l`9QK87G`VPC5oR5wFjsb6_pB5DQ`CkDX}*Jubif*!57Q;1!v!$>Kl4
znYCQ{UN}+hlgclRF8WNTU?okBvH?_5iA at XXM|ZP#P<31%4||hMmgbo7?F6mi9qQ)i
zLMB2da;IY+!qEo8*ePn(;hcKq&j8k+a>CRT4kKcTOK|tiL&zGFH1T0ouE&IEt4^n!
z^i&mwW^M!o69iO9N0gC)W7d-nGUjIpU?C>TkBVeLfd#ogTg!zm0d=o7e87i3NnOWu
zm&x}}ZW<6k$+FTwB%s>;+-Ee at 9qKyfVX@E*%=}LHJ9-4WEW~r+AoOjt at 0<-BVgnF!
zEm(Amr8?P8DC0&I#7j&Vi0FOlA6tSa3~dRTPd&P)wrJOyz}3`mCWIoh=ZMv`M6_7v
zB4Ua1H?!vk-0{5{+woCnDVM;BdaY6Ni@!;@4-$hY3&EkM3zZx~{Sf;YmSnzofw|Dt
zy{JzSVWlHk3p*94FZ*xU-dRv4){yfAhURaP!@jvd=vnH-{#@Be)z6EQ-c^;67BvJy
z71GNLe;ZMyPm3=yRiIBp1av3+h!Mvfi`t_ovhlXk?fLe#xbH%><9439JLxXBXFv`K
zC^#Y3R#d9~-@N~-LGQiScvzB!H!#KCW112=1W3>z|F^r9{b*Bet;^l_)90qWv(pRd
z at xJJ*1dN4MuCw6%CG2#_Z#L5 at eNps6)_^5eh7F5MoGd!7C7K-D#x9oA(<vy%*jOwJ
zIdd-DtwC at jT2fXxoVFY{K}<HADOy7IOKTxsNmwER14uGN at n9j2t(`-!N#Pu&kiI4)
zUX=?hs6O$;3C0loy2?})AE{y^DL1hIb`UIqkqc`fn!IT$eKi)+R$5|gs3k~XN$N^Q
z{brkRU=zwPrKxA%N@bjh!>&H}SSpwaMZfuqA4RITN`;Q>$x9*9eb^b(LBNI4cgZbY
zeX<x1#kN?ft_tFT?TnQ4|8fC<IKgSi!42yLGZ6`663k>QhJ!gmhb=V<`iADLrgzW>
z=moxh6h`3+DXQ&63sU-z7OCekWQkd1y~h)WC2aD~gVFl at FtTZBmGb|*;N=D;?;|6i
z-*m!>2F8Qk{#_Iton5WPg2=6^LR+WC=mr8aK3hLB=(kkGLJAJegDgPb%p|kGA$HUu
z=W at K`COTHZgQ@?=z!#6IPL*J2r&c?+yBm7Zh$e5Pc{hu-{*8r85Sl<9yz-SNXC~s^
zQN(&X)2dr4<+ at oA^|4Z+ at vkApDpqO^aCYSZaT8be_hmtgG#o!1PbTqbT`@Nk61<Da
z at wAFsxi~5m-+-`GDb*Z`(ZEM!CO-S8Z);d(Gg}7S at n?5gZRoaP at qvbn7=y at mE9cFJ
z&tFhej@h;iZl0FH-Y#B8mFsvxy&h(nzzt>p<ClPCsJ{J7_tm>$pLVtOZ{~#&kP at 8F
zX?4;8R%qF}YZ<`gcf)mHwB@p346^%cNqT=O&L4c&W@>CKBBki&Rw8^=fa5T>zOm8R
z$^XaA(~jOw{_54u_(+5w74 at A&l4aPGoB at n9mVkt?B2O}c5 at 93MZGKixi!CmCje}`#
zGy;|_RvyDvPNI;}l7%dGB$`coI0^AUQrZfMv1O2<K$5l`Gf9j%Q}H6X6a|th7{OAh
z91DebSSbn)-huf+9ijY<R4t^ZqFJM!Fwddx4=fCc3%w4Ny)H76_#p>TG+8uRR#OtJ
z(nX$R&_X{NkH<?@@nXLd!cpe9(yn!jlHlk(Y9!%LpCx-f8hbNMH4#*`?i!Rx{E&zt
zMY0X4>iPk2SebQgcjhpl1_WL-Man_<s63_IRQ+Ya5t4QhCZT0u6LQm<Ko;bDbVR)%
z>k<)K5lX`nqHN4OTO}rJhe7 at BwFPQhaJWPe8?jI(fn#9Hgl#axY$%v+@XwY4OcmAj
z1!sd4;CNSJqY-9qXgWe7Qj#(d?nBjKL{%^B%FK;CbF1KhksL5|g|t9%WQanaDA6Ed
zQG~gCk!(0zNodVazZwR=yc&~6dG_Pbl3qD0ZuGj)D-Vbz7lY>D5X>wIObryQMI#U&
z4nR2F%Mh5gsqxvZNR4c014uasg{I1MP^x)=$9Z>%#*E~x?MMP}9*f`sSRxya4%}kL
zxgDuVASP7~;BOwPT*cF^fbAln07^qPQD~IJD4deXA3DookoRfSK1%Zek3}U)2hb!9
zL5ZF^{MnE#*Jd#NdZE+`O)V%BjlBX>g#nJenT<z4u at IN7r?<iOhmn?@CttVD?inH@
zBC84|q1l3pU<8_C1KA{u7_6+B4`I-Ad9U@D`=-*ZL0NWQF}v<J+6(sfUo?!H)gsUL
z+pqm-!2J~2dFCJYoQu-4`5$Zy#l|yg-Mq(po1F0u{<_-Pp61?p`*vD06_;Ll^4T%p
z+RBF2il?N8(?oA=8SwM6|Ff~SWsDvd_MpDwBJA<`r0#AmmrH`fPi7+%DK8S4FDN;t
z>lz6Pg&09Q9~<Aa7qSXf45m7n{2Lmn(@6i%Sa%bM4ZEFPiVh=02Wok$9)a=;FUC}e
z3gk)<sU6Kh5NOuJM|}f>QHk>=hpJlDM%yVH45hVkX}_g5M1qXq4?6pJ_-w4Dn6aJr
z^vxCbOzqc<{2kq&X^m@2(n3z-Vz4vV5EVxEBCSnJkK(p+wJJ6eUGAx2su@}a7boGX
zc~3(WH7KDUA8i1r@&ycJ`NWwg`_#-ox}jB|cRb07)DThogz=1t!bB2*9HAUUO~@p&
zZTn-j+wO4JzE4RPi>2hLIf>kn%l%r+W{4y!1>Nh7V0|P=B!s{19Bm%Lmdqm4;XLA_
z)p5o;=W?NV({MdM-#Jf3P{MSxE({@PmU_~dggjn{`}O=}kQF@?mOUJ$>DTxHwoz&5
z`Un8F6m7CAcwIE@{4kk8$3jmiDi{%qJekGp!SN%`_{3G-u`biAVcPnns}h-e$a5u7
zV)jcA+m%b1%3XetE at Rc-kW<k}z;O$%-gOso1Wp8EDW$4I;0X`cJ~d%Jp8~XaktUbO
z)Dn#$?@+1Su!BhmS|!Q9;sg>A8d8!N+`v)jb at 6K^+i8Mdlu984?_H!mkYS*p%@<lh
zQC=7y1TVF6*apakR?I`xWN*H>IT)iiN1hG((DM^z7Be2eRVy1y&B}kAh at 5Z5i``&3
zVCZN?v91KjCV<J^dgtC?a2kos54~pLd(!<=o?D;5Y25eVxY2%Rdz+Fd86mJdvb>_)
z3Q|y-vUm_9GF&5CYJnscCqrXFgxB at _)kjw1KYX=@75G+!HuHZ0T;cQILEYu;{S7$s
zx_FYTo6g>7kpFoMOA+V07yS2BeM9NK{nqDw(}n)=e*mCBU%&CV?e_K-ASAAQ)C(6b
z=!FXx^5({PD~A(#-t9d8-V4*?S6`ktPn|@M9T(aLT65Q_m;!0!j#g--#1?JFXfx)@
zC;iTc?O6WwXP!u)BZiI;8Y~v1<f>E2AWcmZ&*a*@9)#akmO*FL?8a$YMbHwkVkij~
z_NfUi4Y6%W&FGSSNu!BRH_{w(#<CaQPVG^Q9?4GaP|Yjd(ts5xmK{8JT}6y_x*-GA
zMzP=`+Q3pYJanbK1~ht%MAZk#!otWk64^+hhQFDIunl?_*Q8J<L;=OKPPB={Ji=m&
zG!5toZ6`=Gx%5S(9U<0J${bBo3IXW`Rk0UqVy=}j^+H=UKuDC(psA(A5lw8JcGYZL
zx{cVPxhLn=J(l~K)3-|RmaakQF;7sh!8MYV5UM68;&#HJEVMsn#S_uZi&xAD*;b|s
zK9ORe+$_d8mGUDl(now+rqSt6s%@n^O%8cyYmqWXV}g<v;e0w|Xaui+%f3n3>Qu`q
zPz&%O)gfy!mhkY$8hGNGl<19s^w|9XVD`o@@@a?lpmR(UVjYxBsFXUF!j#3|UKI5z
z3s7P~P#Y#@kr3P-PgB*OL<b?4ys5=8W<4fTG=`<1ySN_7g9aU0s>FJ4d-h6Tn_?#j
zvPY at mki(R78QQtBv`|c!Q!mMwRFCEwnprF(T2M)TzAHd=7cs?3U)}5sAyr4T-YH>K
z%x+dN$&epGXm`;x4cA{eJ at ai}z5RrD-*w``>)tw>i%5wvl$2r)L32tm14UH|U?)#D
zwy`lXGqdBzH|_N4<N3^)lXCanXYH0--Xk~M@DO|93!fz~deMvRW4J!~hpu%^vR-Qd
z@^P>p415mom-q8?pL-wRW4%7X*TE^sY}VPv#>gJ?nCtRn(ukSKz4u<!(WuesbiOJ|
zU!`Tq_RgOC&F%3W=k|_nok*N{(hcRa9=6+`K7OIolPBQVanIzyKzayGAdC}D)1axL
z#P-8_T%#ruC6Q912^~g2N<*>E-Ic^@C)dlz%7*eny9`2Jf$StDDYy--8BI|-3q)xs
zmMEGCxClOuE-j*BGjh;TChmMyyr>aXwC}u#(c;2YtLf at Ru{r_Knu<N>8;Vi$Pox%-
zN~}~RQzcenyoezST1+7p?_w+FMUZ7wD=kcvEJjl~ET!g~PyvXGb%SeYBzi!cCMYc>
zj0tH1%?O$nX)Zknq49I2B~VI4El at 0=Ql~nV;w7rJP*YEzj>+A%(g;n1ZsPD_Rbxvj
z9nyP&Yr(f;Ayx4^NHRk4Vz?xs&x#f3hx{4^jRlK_Xdzg}p`v?O6)EI_$}?0$l|m;q
zP(nnJ;8Ow at F~_C7Y#c%D_ESasmsD5UV45(gSign?iiiVf14W(6R)io+;9+J9y+$}N
z{*daLC1J=UQPAX6sL*2C9&%2{U_FHyQasb9s2^jgKx<WuueH{cu*`HpLfxiTE9IJ2
zS}BZ#28k^tT)KS;2`dpP0kSTFK&iSasvbov at Q@1DiU=Z8a(@+~XZ?9lsff$Ob~#WR
z7sQ5m_~LXd(Uk=FjHuM?5(joFnL==Cob`)qWn!2)@D<AxjZiXX$?p{dY=hE23TgkE
zG!NnQ72C%@{dzg`?z@g&*x8$x7(;2AH~^6nf?7(k#25^)&CRhjO|ny`j+M(UJ8H98
z$C)!Hx%=+3<zp0ttk-(20mvuWdfEd3AYZvYP3tvGLE1K1-)DRDqaRwjF6Ysx>F>Pr
z9$5h)asY$?u(h?t-)?Pn8<X)C&53SSy2o9ywS8=7cfPT`SM<b*z|mtMji5cyDVhS3
zB2C+TSdU}#sE4j4RiZ|6X|P^U8ZW3ai{xUFYFTPR>8ra=5ppf6O7HGJmc8!ivs-0Z
ziS*K-r6tjlVj_lkNJHBJh?PvvJ+WpJlrCbSBj+BH(}YUyDoDvSp}J5?W+iyqa}Xq;
z(XC81_+$9oYcNl!_b$GnxnN-s!uqy^9<hRHuEC4hX-F1P6)Xf#-45;sWVk4p5J`O?
zheS_<hA}0K(RS=~nnS?kB492>q<70#CD+`98u1q@g-rdUsoVH^hu($C+D<BE=kRS5
zRZ<M}Ibb0;0I6<9CJ;>h+G->SB-Fd(eU&A&hNJ?qAi*%^1oLx+6{Pa`9W}|as2 at _i
zg9qqI3^WqSb=w*pR1n5!7`sbYaQ(v}Reybi1yC>*N-q^0Qb%+{TKO_5ebA%~nH0lR
zM61Yt$U;Fq(39W*$p(OQ2mmN0A(pUMK|rNNDpX(IWf<Wg3Lo~tr$1Jway7xeYEOu*
zHy&!1%c0xX#_f7TaDCHK(Y{oR4*;x+>lc|Z6$F}GfyDFvcWfm!eN{;#`1E2h#xA}8
zdCLwU&HO%+Sb<4FX>p2OblRJ^FuzE3c(bmWg{3;t^f9XtYCxw!xf04YHhM27OgEnQ
z^!{^9Pj-L!SNXQC at 5^Y^l%|QfX;MxpmeD9>5h+cR@?_HHjg3(`dUV5Pv$@3>EXE)w
zP8^YQ=eBGOLe^`&)&S(AwPrvId<F3BAL8ev{><v{tk-%9Vmmw2e8Uab%52u<QcT|e
z{(I(an`AcYg#Bai)mCEJ+1<0hd2f8z`RVbklWjTmgzHED<jS4y=oMT2<g!zumtPjx
zJfUoex{jhmR4#owZ@uk1D79!O_gLvDxvw0lN>#FIwOS_&C1*-M$NG7->JO+jhy^Tm
zRpU|6p=B(g7HE}&<&99XL0Sm~#Dv^svKf*gmOyWcl|<;hxC}AX@U{alRH>!3-bqh2
zn<0lp?q-zS5&E8DJ=XVV?!9p7Tq|NWM+vo?T7~^8HM~x}ppS{59_kn>5OE5XYgw?2
zWH9SImmp_Ko_jH8JyHTfA&63f>mN!@qL!3=(vcFPN(qTjA~{B+BvhJe-RkZ|+$T6l
zWDO1|ngo_WGZwvDU(D0&(FjB&s0R*8KtqGYwmM%q0MU3 at u^b5 at KnTR(0IHCx7{65g
zkzx`tQ=%%pDs2k%ox8P#7DCgLnjT5 at +*t3$Z|=Q#wY<oUackD0plqB5lp?BuqN!$V
zL~yU_YD>I<#Iaj9AJX-A+Ln@s6!bwnFF<w|tfJK-S`JJ-Sf->e-zbHwgEg-$0uGl2
zd`&<<<leOqp#&(3s$$VIZ75pR?E{<7DT0gC@j*K@<c(+~i(3$zCI_i;(4SNg64N2?
zPJ`(~eQ_BOPBn%Q=Tuf;GF*q?Hp40e>Bx2!8ha1Rv<etmv3WCG-=g((#d^;Iu~M^6
zT)Zz@!D6Ma6>&PE6|IT%?$DJ>s5C4kluA>h08I_;)aqMSeag8W(J5(sK0NeFPJh!^
z_fME?USWTEYxj1e<k6_fZJSC;v7{99FcoRrWRuCr`aWAq$-1s%XJ={~8zTkExpP||
z%b;UTqgt;u0Qm%7zX$wtTm$l<XjqR2uBo5D8hGmZ)O~WlK-M>|vavDJ*{sWteeCtT
z=}qrodwWkVT-aF+E?hlF`#kHnwzl%ywzg)Qn;RECxO3$E6&rfl=Ra!n>DTO)&E2U@
zPIac;DdAY_T>pHCsa*)pJs0K_>nLT0lpabCmMNuLb6QzsAE<QhV$<ZRA`ca(RIAv*
zEvUNk44qK3!RphioPdjrt*-}E3~eFgLdizXh8Cst(F+Sn#8?a9g9T-3h_x_Opw~d(
zO^LZB_YSHo_mtd|J>r}k{G;`XSSCvZGNEc22$7JQ#Y1Bv#F`eb5v$SNp=OOp>9OJ<
z&bm38Bc<;Vo4atfWK4}1yqm8>8eeQFO at oAlHZ`rfBp?t<LP$^p<SdTe)#wm#puxdX
zDT)<!p>9q~7l4|4t)yzdS_ApiQ_n@)I$iN?$e{p4-Ek}g2S_BOcUqfoC6FYNC7~7}
z2AVF=&lK(4 at hU}#ZHJ~F)edZql{q0tOy-#Ns3?-HW?O`%MQ|;mqc)U~Do6^|?$##^
z{&V#>!pMK;V9`J5NUHs<R`yb+CV*!lSFo%LE8eBy04sLQRO1E3H4MYE*6oe8>Qvk&
z*gNzGuUmjzxoMS>Sf4Rfgztwa20<65#m*%35r!KjNK-RMs^C40vFf at -97FId7rX15
z0iRZp=g^&Zhq$0fu0SKKyz=NktMYSfL`rC@Mk7Gzk?tf&kA=NOc;j-2J0OsPk<rq-
ze#qt&n|rgO=AgJR-&5Ls`jr-RK}@jXfJG(OX`2H+F+(a~fq+VjNpgxM5iB72QIOtB
zOAgmwZC8BVQ|FK0$)_*gdCy)q8l}><O>Wzin<nNEw4{_uDJ26X1TB4^7hq&(XPVnK
z39z1mtk-(20mw&Xy{rNd_|P=0Rr=M-*8pTa1-a#x_s9T30BPG)9{I=z^*cLzY;W%|
z9=Ec$H@l>6V(>rpG9?3fXJ<FRV`q1E&#@!tFXj{HuR39u-T27x=<Ploxu)p2FX%Ca
zNxBs885uMav_oWylo?WHPG_RHaJ$;biY@I)ix?^%d||<P^n*dGQE4sUs^b-b_27WT
zV(Ot)jGk+Fp;7uwpEH_`+zYW&v?N0G91=N%f)!Hh<xUN3iy_hHhMaq>?|f>LJEvcD
z9sPWY&S!++K*T~vv`j$|Da7Qwd2L*rotl=|I0(_$EYhRHVlL&5K)#JRmgbcC6bUoP
z>aIVbCtzq)BngCsq+0YR=jdB(9VkdcEP-r^K)|%YLWAnaM+k=jkf=y at YEmiD-NWMG
z?>eM|yWWG~1_dH6LYJCXAvHfkhTy?V0BfYgfR#wFAyr)JEvY`88Upq#LEoTVKpUl>
zd)P`yLP#AF+(k=mhV at gVpCf$)=8j53sbQ625iBU7b#N3?&9N8~y{lz&h*+f>N$}~1
z9RffGa{yTwU#pAdtB%D6N|h|LYW&xvh7p!(JRrkNkD=}^bx>fzW6f28<eC);dicJm
zK$b;#-=Ig*;`n|@Lzj?;Q|%Nwq)y|aQ>bL*8kjJGIKhHvpwzLGJB8KfBy=Fz4GD6c
zE>!B<kUnBVuwm7)WJYe1pkqpC{Q65oBNz`s)BBgYrb<KehJ!h^&N8L+Xqi!L24z+$
zi^H_kn+^W4bybi$nDz;Zi`2Drkc|=yHLcpI<WpXWm^M{W)FM`2!R#brkA(I;G&zP-
zSCnIqdRRGK;>q(GB#%aIZrhYY(A at Vqm*QN?Qp{AfK(<m!>HA#THm&s_>$P5M0P;~?
zui*Y^SO at 7>uUMb9H3(S+A!p8<EVEh1(W4WtxZ*^<aA8Nzp53~y$;T=HDL^km2KwE-
zz5d;I_Vb<j$%}n+;=+Tro0DJAHlH$!?Pd;)JM5C`r&QZoDILZP)frNzn0e8z)kYR8
zLxz|aqT)7~QVVf+`&rUVhR)@p6DncZ2(2zq1NW*9S=@HDxE>?)ncREML_dXC+|5U;
zwdf^<aZHP(Y6*c78$#~MxpO*H$&}s!Na^M-%1=}J`5xLuayP?DcG89lF(sdRv|~bQ
zNzH`VBtmMd9;E6Hh8zZS{fXrc>*thyN)CzAC9DrvKS!)bC}^WdRHSig%%HspsU?S%
zqPi^g6{5-Y4K=kMy_8Bb=nXuKZ{$u!B&Wn^@NI?RZ^SCZ_To(jK(Y`_AHEF~2Lu|h
zm at xIp4+f^8f}6G`d^gZXw2v at XwDlV}XeOjg2tA?>cvTY;r<AN{4p{E0<CRoU6wx?B
z!vu>Xh%G^f1o-G_;=?pY!*c(FAM2$xzbA4#c&f#Aaq3<Tf^jQYvBl8B3);NE3r<z4
zdM1`Nv<9#!o>LM9iNZ2M=F%pBgISj0d#W|-gsQPQ<^px5Af0cs{v921a~9XrDOjaW
zK!_7csGo-xB)Q(mJQPq6*N`X`0M&%dTmeor#GKN^0_cn}bxUYrRPU1l`4kp1Xy<yJ
zK|GIxF{9M!>YPH0<SAy!(>aYw`K;O`X+g(zQss0$r*0Y2cYdy7_NIsh7obzGxl}7=
zNe*Tzl~hZn*wt>)o6d1m;^vn;v47mg8#epf&yH at 3QF1BP*QrPD`<x+Uky1*r9D)`z
zN(iBJUANYQtk-(20mw&nU1UEE>$8E^9r&3i09V(~f4~0D16@}Ep9MSycqH&J;7Z^m
zFj&-V0k;Eh#_3(Z3GA*f4fwkcUsb15j|EQEBK~&ZHNa2R^Y#x}j{u$t{4?C$>^SfN
z+-mtZfnNmv?ty at iyYD_*&YU^PY}WDM2VcSMw||fjb`Am$I{-X}&->w{i1aaPKb=jx
zyY9I#mFDz?*WG#Y{Db=T#AC+IqjKAB0{gsG=h+CQKwq%F_bxO&5<8-LQLS}rHl*vR
zdT3Y;F&o6Krd8xRaPo<~?yqj+`+xi|`O90T^cf!c;K(<8<-_^fuf7S)m`>;X=uf_y
zU;Bf*c;5#KO at vQ-Xu~&u%?&*1rW?q8A!3AHE5#-qO2G;-Qh*QKbq~M%vOnPu|KfJ;
zKG$(!&)96?@?(+DzTpJ_;-5Z>M_hlJ7!zG`x=x9^^f6I#hazYYBqd at Rk=hY)G$E#z
z*tGoF8{WmMUh at v#`i?E$e=f5(hZNw7<H}>MJHnTK(RF<O=Uj*NJ}t@fh;;$$XHYss
zir2--Cn?fYyW3_=NiA=??H*q8TetGNuRY5hALu!|1(zKa9&#q~B~QGDuYSgjTy^zT
z)w}pWAsd7e+;9LQ#t1jvRZM()78?HcwtIN#D{kTU|NJa>ez51<He7Z at xc17#mpt)m
zp81R$Idjcb4rmSoIjU7l(0UbaHHluU@VQPa{^Ygq<mIn?2Y>n2E#CKcnVlIl0j at f!
zJnn`~p7GS{x#<h8Lv4zrhTKQA1jtjQ>&d}wXor0#j?pmjk8#AU at 4SbXz2a70eaUe|
zp87vr!!w_8BUfI1l>?JQh7QB at qiAujw#KtcO1;;mdeM3ExKxwoYA&k~>O at cFK$xP)
zV57C4NU0vwcS#dKYDP`)$%o~H=*jB#)OawTbwI{!56az6kpu?|S}9mTeF_jpNE~50
zUW5>$H4$BE3cOIA*=oq&$_dHToSebME>!n1O?8qo#=-`oo1kq43ju;4JcN0^gO|Sa
z^}Ou2-^-hBo$<l5{`VeqM!4y7j_~|vKbpsU+8GZZ%)$F|rCM5J3rl4rf{s93i0(kQ
zcdbh9vFz6(ixH at n<6(qqwW}6?9$+9PgL=+Pv4<i_NSgJ^Q|a`RKDYnuKYG)V3m-T)
zotKhx*I8E89HWB}Gs$4try!J4`jS#&(1WyXk`pJ6 at G-6j`Eag(%(|ojzNFSzkFB-T
zvHHEe`ks3S at HfC;0e@WIgV*a5V68<=``2N?dCvs?Oa1?k9x?^_ao}6(=g+D?`#=Nu
z{vj`D_W&=d#kKtdkLmu_j{)C$;A=ZLwd{}nJB~v>jMwF#057dCkoUDR at Lj+U{XJh0
zUsSL2hXUy5fae0gdf5KG at P*G>9P2H&yhi}eoH?npS*P!Q_ucyDH{TXM_`wUo+j`Vi
z9&LS$fl>W9R at DjExNXy9JZ>kOo8!^(<D28lFF!UqefmUu_0^|0u6@uI$4;Ldo%pJ+
z{lPC>-I3e>{96#+BeILIgXTT7%#l1t$!N&l0XD1D^Q!NV0dzR$T;qt1$G&{uLH_E$
z|6HE_zx)MVzVzgL+taV+dtUJ6eDS~fkG$^I`QbO&w?B%ff5qpqw_DiS5sF1pn at CN|
z!=Lzn at B7*Jz2X1h7yk1r_<{fQ26pBj`UZRI<B#*5&wnCKG_0G_&!*)0j8b}p>`qs)
zA+;mIXiQ8aZoTaTyznRfj9c&Q at An3I-1RL#`huG{b814K?^0%alx`2ooG3!u7?VjN
zOj_E_3GHOUJS*Sx!#DF2FF!kkiXXa;PT>Fg&d=a$pZ!#tYyR!N at 9n+)d04lLb-Pez
zOA`Tc?*85kzW0aznE&wW4`3TFsN1-D|2Af~JrC=5k at +^o=AK#!)dse~Ld#$O&D}iz
zg|FoeZ at d3<b>m}N{-6KzCa%6>g7v#tzXy2_$#ZuP6D5R(92&IQK*E^mO!=N4x|yH(
zjr%{2AN%gl;F(|dFGyFvaNqalfBP(Cex5u#hxX at Tb^*(~SlL5tUW?sQsZIlpO{xQx
zEsOtspvJ0RAy(_%F%mbSIST1Gr8y4iDB+>MxF3ML_v?_{W4$}4S(zclrv(l;=GB3B
zM#fx2VfTP-VazJ<8$lXD*z`v{ieC4J5A4PBj<3P;dC2D|-FYN$LD_{mg)$AERIU>&
z9znuUEN&34{oVa9rgwi6Z+YW3U-du#5^sNRcc0r+g at 5<IUB$oomd}H-2W1Z{{X%T+
zW5^bC6TS9j`_I+8pAKb;lwHVfEFmUfldAWbxc=v1|7rg*zWaam#M6Q9r8`)27teg&
z&HU1<_SeOaeeCr=|7BnHg|E#yUo53;<y^MAF7K35cFb%KnEmX}zVb=i+k3xs;Lv{Y
zX-~WHSvTD95E~jz9|QHtKgM=G5_Jg`bo><Xpbul+`Uc=LSN{L~!1w+=|NaYrA6WU)
zFaSRQ03ZNKL_t*ln}E+)m&YIerR!60zw5WWg##?9R;y2h;cN5yvmfboIq(y;_>Lce
z`{8E~0UsBDC*KG7_-L$81^(oIzz4Y0@&|#hd4PX6;ToRrd;sV61g;VK;`^F{44)5g
zSa;ujwzO?3$B%E6wrz&#Mpy5h8J?29SHa#6unla9a1mrnL at tJ)7eWXZQ;HX3j9V$i
zZ4tXLoloz+IJNg4+>i5n?e6wgC>PHME?$W2P80Kz=)|)(vNdk6t1YAkX%nGsh;1N*
zK!}a&FAi~K`o`}$9DD%$*h}u at +5h_I?-P6geBV#MjcIQ*;|Y^VOKK8LN`!c6NBb9k
z{<rz=pZ?I`V|eHMtv^4{H+<JC=}I7tHVBgq(qw~Xyh)lIrP<h|-8 at 2?9HAL)^2$HB
zg|GhZKY2jl1K{=VnDOP`_Ited&Mo3-lQ=m-9B-1^O=3GHwwusw5Yr}_HrbvB{`uFx
ziXVUJhc2iAF7CqDf8QJVh5z!ZL#GoOqEpq<2#sTRwQ4q)_K`1p?r-zczxn{T@x5>4
z7hinHHbha>#opqff0`y}vw_A9e(jZS<qN*%<_82m0B(Nsj2oZvd%WxREke6VY&Qw*
z5wtymjE)dSNBms1n}oE<Y@YbiZ+sO$^=l98IG+98Z{(ML;kOT&7WuPZL#0L~L4py~
z2rAy}uP(hBK%)op>5%zRgKb2Xk0L(d7${8=1q((|e~2!vboaliJRH(>NV*Er2_zna
zFs4*Wo5cwwHI%f0#tG6Mf%ZCR9trWd>q^w=Q~n4w+5G`llj0K|ci38vY$S+lW2&_;
zp;GihTDn!OtXpn*FE>8z#UB!UPzNtB_~G~S3orX`SeSrLDrG9To=itb*tie-<Z-p>
zZ9G4OO7#o|AuJ|6hm1&9E~Zd83gr|({UbMV-8K8K$(!Evj(>IAZFgK1f=)za42(n2
zk*c&IXnXU`Z+X!6_TEn(*upz6zx>!Ytu~Zan at sEV_pVExkJHs3^kLqQ|9Ig4&-n+`
zNzXp;|DRi5-ZcREXsv;U1xp&%us$CjSAx^8F8p_F<7L1%;%-}~Ye#&9k0iesr~IsT
z7M=$D$cOPb1Mp(t8xDN^Uf at Z<pM4BnlV1jo;-lDS;|^qPeKC7}-RITyBlTR~-}?9L
zHxMx3{{_APA3tx@$;%H_;2`z7aDO0VSe1 at dMx&-&bIqwzLC63^4uX(vU|U4CM7XG`
z7efdaWAsPc#*1y6F1BsDm{Q!{-QB(9{=0Mg*qhIH$L~Eq-`L&W8<z_gTF#vxv9&v4
zYd&Fa8+1CRlQEeQCS!`a8xx}up=}9mwTC^hx(u)UxhHeswioc~7ypl3c69&uU-4hJ
z*cib}e(Vc5d+T@d$1nL(P9K+j1?2Dj!COe9#CW4&bCQTD5f7o%yy$0Mzi3K-`R8BG
zOMdXlyz$qb&6|GfIlT0TpTbw(czR#M`mMKje8&&`E@`~MXuQE_a)f5GNg8jG#>Z$z
z{`nvN>D&44|8UDbAoaM1kNC;&d^~Ub&FAor*L*Ag^(D{XMbG_I&aCYFJzK_ezW0xq
z^?}%W0UgJiXuE-qHjs7`+D#-)c<%rHYF_i^C31=ZzU^yH^Sa-73K!n`T<(3#b9n8q
zJelYH%To(i(|`SMUw=qv**W?Wora@nj5ZTOGvOP){Z;(Qfo**ASDofBUj7u$zUAw=
z=S|PyPhaw6zVXX1Uu@&~_qC0fASR?4RSMY{NfUnOHMjD$-}N`lR_f0ueb$Iy`O(Mo
z&euGLyI=pU{MD~NgCF^pM{~{P%X4+tS>s<m|Bsk<2}v7-v_Wh)2+hRzzuiFFO{5v~
z_5bE~xcR_weCsn#^B2GV6wdwib2$5!=kVH>Kbhx!#qv0w_kC|T1V}kp2r8%=Q7ga*
zVHxmOO{-QxhKPd^RS(cJ^;G%lyWpA_%~%cKln{}41kz=Y9*m{y4|!$Xq=cpx__6Ms
zTOQ}&dIk;SI_U^lsFbI81Z{4>;<cDIl;NKg3jG6qu^cRewFdkxvR4-37llxDHNiC&
zhZXrx|Hl81tsUbbSGN4z4}KoEzv<~r?|44%d*jpjsqcRjCy(v_`S195Z)ZAFER3))
zuDYZE!5yqP3`FT*WnA@TqKk88Ko&VvyJVt^AW1|}$&gQQ<j4tr`KLdZ13iuLul&j%
zeO=#|%^1T*2s&1kk%)}CE|1^%#@l|fHkcMKb>ngSwa<L!7ww)naYR1JYM+lpUGiw0
zIkLL`6sJ=^44?eR3TmEE8-j0mfcyLsoE|o;EBX7G0^JC#K8dHb-dL~ypS|ynm#nI?
zUVEP#s_LZ<bkhw@klX|bW`qwB5CftpB8Z9!!{~^kqoaN^!vq~?#!){V#jJp0KnGNG
zaFihGU_g>cYBDr-?tY=_Rn@)s?EU?*&#hNguexcVN&3$3SI||jZryv&O?&OV_F9j?
zm_zWh6R3mcr<;cL9{}DP{{5c--Vy%&dH`oX!0+^rUjz6AfD1zw{DH;`LzShxa|?h2
z0NnHt_NhPf|4jfd@B4fWfTIEYVH?lq!~GqE8`4o2+;j6}09S>ZW#{<`;9FZ*$6=wW
zQf{M%RkyykneQJ8;1bMmVmG^=Wu~mmoB_a{cdp`zi3Z<(`~4KaU-=5%mIx$#BysFg
zRa9!VN at aAkRvjH3sxDeIR$07wUUl)}`PIdX=T|C~q~aV`{`#*!`+ at Ftf9Xr_KYwg=
zc%&NZ*a$Z6N!dh|Q1Fn;DyhpkPCU|75vPPG at rWWI3KFs<Rf*#i<SIyZJF90W|L^I$
z;_uIVL&po?-~a7v_`6T7=nX<%zYG5PpWYM{u@s;9*f;ROPu|k``<q_682|B+*Ftlk
zC;$-xQG~@$`N*tEjTrd+-#rIMKIh4hqA=eQ($Js4_}?pU!s-8TIkGM=@v$=w#&O3U
zYz^vKnE4wsT$Et_hB}UY(|1ts5+nPYSMP;)yyFC;=b+p*^J18otmC9Nei47Tcji)k
z^NW_?gMW1_G;e`42UL(GgrpiHPAmBDORvW%@4tQ~@=1Z8p8H%J`mE&uEeOrf)17AA
zOD??%FFySe<OAZ%;-2?HeH)O>q;1uL$RGUhYMl74YkJo4<F6crL!Y(W)W=X}^G!_P
z(o3$xi{JY5f$PZcc^BZ at K-d?kfY at R6+9~XR%=s9v&wTge@7o*ic*jfObAitlJ_p2`
z>}|bO#|f|fBCfi1X0G1<x+VCh4;%|<%Vb(5_)mn!`0xMt2AufL-nsgpvya4~&)U~i
z$WTf}nfv%pFTEBoK7H_h_&be)rTHdku?d__0Yx2<W~bKxkeQ&h6q63eTS-9L)p*Wi
zjoGLH(I}8Efbs%pvIrC}1fnreJO*$Ly!bDAw`J`ofT9la4XAHGeH|>O5M}-&-UJ#*
z%r6BJwx at JHk3c#N^6LR^K|3_8u at Kk~0j?T^31aZVf9tJCta>d_OaR3upcn^a%H{#)
z=>sx48Qd@^ng?}bKr|1$^t at T~`jq`5T>AaDV03slfK~%MjnYr`hTq?bryhGz&+$0#
zQ~TnS6Aw1ZpyXk{oKebn2)sitl}c8=3FMnlKMfR3Knv at UK@G|Y5RX9Je7K!H*0<dI
zO>s*Ks5em!Py{#ul1=#NCw`8<`RIK;%Pd{G;HPhU+e^PIB2z`-Cq<<GsZU*SO1<8E
zOAmf@?r-1mj+cJC*=+kXjb-)fjRMS6wjV_*)}uwidZgo$F9LW|*ZZ#ncr6~7y7hDb
z{{-vH+|oD;z}vds{{+CXTe<J&hIp?V(7b9cG@h$~JeH$W!zvMeId^5ip5vj>ubv4j
zS!P at L{r^U9iID-E`Y`vc5`yf0 at UarW|9KeT<B=R~0I$U68~%SEDi_`3fo?z_>bs$z
zxdrfnP!W31)@*F~fZBK8UA25@?Y7%e*>T71I!adqDk1Gq32741G!YukaXpURlvO>F
z$)Ta at M75euFw;a)_=%$Mvnn9d(~XHWYuBw=y`gd6x?=I~*67Z^S(R=7`%QlS#&JJ?
zy5Z+ZqdkVHdKLBh5T>Vx(8{aGQGw?Qgj0wn5X_c3ea>O~z%hf#d=L(O#%xC15r;1~
zH6kJ~GoJpmJ$wGX;_fL#NsOq%NNbGBkV9G<{9JwSse9q*BcBZ9ZD_k0`Y&3Lb{mrC
zc=n;o@vf8i>RINq- at XA+rHZIpLtGt3QVmqBN)7*h)+IgQ<FsRUz&p?AVp*zMV5kOk
z#^#OU^B+4Im97Nr*MGVi(=9=iS|y^)?7O52j#7N&^SzhPC*Hpg4t?f6fF@8>EYOlR
zNX+2yn4_PCe|h(TgR at 2PB5=9{l<ojdmw_rv;nJn}@L4zaeD7oLKM2o0>|hW at W~!$-
z2pOPFkhXF3F$dva-nGZzb+8MvxaPXfku^O3!@pnB13upSx*hS(GhS{z(hh-sq#&3S
z at 7U-F&i%~EsC6aMKXd+SOf|)5Mo|q&j6%k74KAwT!=JvfXIno0{=IS7vzJ at XhPJGq
zK&L_41ZfM;JNh7e<lTe!qxAhyg7qFSncS^|sfRg*1n&<bYe**tlQoVLP_zJ4+YzYk
z2 at F34I&v6j^eABLNMQ7EP~~87bq{c|1QZPcoP<h)40y-}XYrCkSJH)C@N413tWaD~
zlVg)h=FV>dh!(;pPlD1AO2%e656~8%LE0F8Ky at Hsnb3$%iXfMbPSvMlei%T{ASziB
z1K<A22^bw?0BeC_9^gG7EkJV|aNuru!-)%emifu$D~(bW<a0q4lbr69p$0|SLBqRa
z@W|#%<VpiX-E7Xs0Cxs!=+8_u+1K#bfAt(3^Q_*g&Z<=#kGlNwYxZ}JYtC`);){Rt
z)Ox*ndT%9-E`Q5gjyp?4T$;w*Zs)vY$pY?9DE$diu^#ET<f#5fB(|<^<hNS^K7iRY
ztYboD<$=cNfH>$YbK&nJH|A8Zwr)&dwi;FiR^CI%gl~G3w&j}u-rkqFf2d<90H^*N
z!kyu>yC0{=<NUCVTN>Ykm5$4C;1<5SM*v&hm7kAq#ddrVRvzAYYd}c(peog|7B8Mx
zDqnGk9JDL_*^%TWA`g&{V^^eUQq*c`J~Wi(wOX3hYH8-ZWcIMoSr3eNzVkm%e<%}t
z at 6S&|Qguiw38FNHquIHNou0H5U@ff$ux#h;XMJbaU6+O+&)zTFd2w$Lu)Yl!1*IPi
z+2;Xyk?rRZ-ud>Uz`lt>+VH-GA`^HC9vGpA|BbJG4!-(>+psPO*4)0j!1ces3x^!C
zmq`P|WM((4o5YWPGjqw#A0qti2Tuvr4hgQ=0ul|*-R9x2+wME#`OjF0 at BPwPe$yH7
z-~V$RPC4n>AaNEv#U{gh-3 at o+_jk<%ggY-Lyz#W>0Fp!9BFl&uO~ajRa-$%@U%vGv
z`1qG^!m15 at TzgIcjZ9`#EwH`zx)r!~MRR5yOH!Qv##e$#K$-zO1X6{f2mzf at SpM?u
zr{d#he;BLQ_m&UXjfC}-8F*m*hDn at r(Z-o$v4C;r- at hT4)-^#QU?zx@;5T7j7rX4X
zGhT7bLY(tMo2#j5;D<l{Jx)FOS#ats0EPlC!nN1kg=<&LY|GBu6W;W?=K|6OYgzU2
zA)q#AbtS<&-g-1X_T at XUYC~`QGUMGrfb+1{4zhDANdX-)$`hqf9s-;-z=KSJmRt=W
zQ~xR@rtK$8np#bx*L-%gFlD)pcwJvW?HH<VCZI+P<svj^WM*LL60mq^B(}}ow18PT
ztT{LJC)x$@_X662iVKbM4$v5o(*I*nmeF-gLKQS4JkgVLp#azhC)Z#3qEYO&+foBO
zm;{MJWF9E`V+VM><b`|V^WXZ_OeW~&hJ_jA&5a$_XQWixiuMCwwc;aLiyWbVB0})8
zH{e8rRL|_Tsp>)SR_P4ayA~A?=Q!uA7vi9!F2vfIQ<;DEv+G{F-+sG(B+q?%?X|bR
zzb`4f{^?KO=iNyXI{?ydXR<kI-pA-U_)ynNk8xbGtndAO+jv{94^^CJcJ1$*!?Suz
z;}ih3uJ?BXxD<0^t^)En7~K*;ufS~c!AEP{*dOCP#NQc($>;Thk6S}9e)r?}SZs~g
zN`K{MOU-UC>ANXk5ULLkGzwUmdaK5u#&q<0e{@UlcAC?j;}$bD<2Y(oDoLYOOB*92
zwW*Pj+Eh{a$)YGG^1PVHb3d`ICU|l>m8r=HQxm{+9cZ^^KeHChpBDlG1+!vde-j9R
zMT_PKT`d8rVE(*bqWH#10Wk*$ZU#q;0X85w{yE!WXjqX}+Ne~fQK?R&TCJm6X`qrc
zkVb8!Q5!>5!t<WCuxHuJuDA(Nnj%iCh$~e@af*vB{w<2GSn(x??}*{i;h7knLKc=S
z-&*=H0Kl<F?9=o6zxdsK;5Y$A=BOS8pN}73eoN2yPB>~iIPy at QXD;T&CXh7DCqvAi
z1(G9)2`3!0Y(S7jGfl{0&MyAx)ji*N*)h9=neDhhgSwdqsX3&BY5<KOsVu|^&s#ow
zqLZDV at vcDfBxw93Al@C{`_bJ!w3^dSd@5@5_69{egOgoBQ4P!*jvs>eh5@!09^E at v
zm;Le{P%zD-D1yc*lw(|cN$*^}{Fv=bCR*DNX+nGh;_DD!hw3y$t#XvazzIh$nEhaj
z7lPBJpvo at L%D&Lr!NAaAz}V5yv136Cjs?v-20C^mXzWn%$RVKGe$d*kpsH0hB#MFq
zxmaKvas;X#paLKZb`fN5we;NR8v+6`n;!@fgso?R2oPru>B<U?I5?d<Xv9X#b1rzf
z0MIs+62L7n*=)2yz6JOuR9be+&|+Y`sU(JXSfNg=A{4w%Jka?!5q197KaP9;?tq4M
zN()MN1Kxx3(Lk}vu>XF&=k2|#eW+TvaQSFBH{8G~ix~=r3zG_)bJ74X?0Tfxc@`)N
zsD#Rg&w>{TY+if;%4=A%WDMtg{OP^RDaOA1<%?f^&N=^cI;`iQ^QUFY7JcBb!w#5m
zj$;vVaU4gg>Kcs}1()>Bm}^LXP;p8BNqYDrus!`%kk`X#&0898?0bLq!vJ}6V-A39
z^Po5D0w6E%x|qKIC~il8kU9S${KkTS?4RBD`R at bxxc_l}EVjnmqrVY-YzyCgTHpHz
zqxSW)2eaY-_>bpkHzjK`Af)I9B2nZr=eS*|B+cRBYIAgSs4+59Yluj_D12Q+r#45y
zdZ=T~M6_w$WYpL=6*s5qP8yT5ZxxlH8bk!*0r7%Lb#~+G at NjkJCPP4Ns8<W1(XwV?
z3N$XuFwcILKlj-?!?_$$)J7aPk*3o~0}!bVwNR@~qgu;Qt>ifJu-<~y&3A1;T1k<l
z36dm1k|y}|HN8o<=RNlTYtjw<Bt#C*1u6<tP$9C{K?nEJyl%OtZpMO91TJYcF2*%C
zuJ3)yK659_R`WcNOaZ=Wo)}U(MrYQ00mX9;+iO5}xHK4y!@m>!?)p_d-#Oyhdl{`p
zCG=Tjq35CnkqjzLK-&Nc9C`Qv5xL;^L6me9kuJaT_MWdi|M}0ho`a|cxG_Y at PDZ72
z!DFTCfFE>lFXis~74=}uH{+;IF2PkdZ0wz at L-({w1P=o|4B{~$+71-&2*kU9l087l
zo<O=Mj(qOXv-hLAKTtgY7&;I%v_CMkKXiCcptdWhwgV{L4q6!lRcb&SLtO-M9$<yQ
zL*YX$t}I6S5Cn%R8b_h^fr9(ID?8c;07uLC3lr3FXk0Iy>lw<<=vFR#hsZoPTrfCv
zWL_c;fXe_^gHi?L3y3zM+71<w_CNrl1ejNNS5>G3XiNH4FewbjjRqvi4?1wC5d61;
z40IhtcR_pw<P!in7A_d-eOT2)m=U`El_>Ppm<03ejV%n^b=?@r#EI<&q8`Mvt4yS7
zKv4seRhl5*Ff&AHn*483!?DkQGT#0A-YRUf+1|g^$`0!OY-p(R?Nd%U>KXuvs>V^|
z;wWMlMUJc0)cu)Iu^y?o<c<M>{tK{eD>L5)Fy8fkF at TqC;rsjd#Q}oZH14^vjmI1X
z>%m=MKY^L%?9%o5r2sZQ%-<dY at FD=ug*8y`5<o(_6&GdoL9S~tj52mW-{)7s`Xn|z
z0glD$t@uuV1!GIuk0<xNzv)42%PkLO2f8R(Iuo9oQfAjN7XTW^kq~(q8mjnt^M?Jx
zg`-8Kk`w?65zW1qOjVO8n$6k$=YM{~8;B?+qSQG`nK>n*gqc%jikUefLd?u at QTSLy
zV#iT>*F<fI$;U&f)|M5t+enQo=rcJKaVR|CxBw9$ie^u7nnvah9(dhJ(tFEk=UwJ*
zP`J(HM3ygK3Puj4987J1+u)>ts#q2}GQ&h91r9uLNzbx(t)518$Qg-4%mw at Q`=@%o
zbI4QnfpZ2h6bz_B0ws!xQ4($dVEZN8^`4BI3NV>e5)ncW&bam7-cxX&y_P_u?alwf
zPl3?3jIEM!)w|-?<@-EoK$f>OnbTlmN4V*Z-sk?_d+!?PW0sv4gywAm2sx;nUj_Ev
zXO{s0Bm$@mR;?%D_qVL=eNsPppU_JXRHC#7j<*NPN;B>&xN{0`zx|@#jQARb#yeW$
zGm;SfGP?8`Y(EY>2B_`=l?<dl(Bf>nh=P(5rvO#4&w)O~8(qUi5Q>BGW&}kBlE7_L
z!}c0<en}-XV_VlbkwPOfBRmF_6bcH`w>BpVX90AOuSKYCfCtfv;!vHiW^HgBL<GwB
z07NY856g=H9v-es1VN!-@xcJG2I!QjTA>9Xg=#+I4bzwA2iP_(s7XP!Lx-}!p2JsZ
zvk#o5+m9JQ7VF7T$)RY0DTNd}fO$QtL%sKaq6pWv8n7ZQuc9by`|N6sfs?j*_5kqO
z0+WMMVn3xkpmJjO7}d-Gwzfl$OA1mBfTRX>F+TFoFT>@({xYt;d9a)?Gv9Ig>BoJ|
zIj#gmBt;<tXmCj{G>V+`Q?b7DohwRC+oP2=f20A=BNdli7y|xs><H^4Sp{Qd{4&HN
zH)2pz)7Fh9tfBm!U7x*W_Kjk*)sIU6+&dTc&H<3e(>Ol>knZtt=vNh(>CL-fl&DAJ
z7;er#<1d~d-~%v;+HE-&_Pt;AAeLSGP*)l%A=H!Xo9X{3A23?2rkv-6jE>f1;lfd=
zR#UI4z9^&!z at Z?b%zK&jM9uSJ!axTS?>Ti&D$a2tB8h!2iK?dFODrOZs>VRpZnj#}
zaU4b2P&L(fbSiCYgx)?GG#jLOrj*14mjKT3fZ)pl3W5pKM19{e8ajmxX4w4!S>&aQ
zN8!{%ksIAYbHtikZj>FA3$QDo&SQri=k+W*+4P92&VnGdl<?Y#-sjrBM}MLx>slUx
zt%)S+Ep#&D0Zjo+7_awcYIj(+H;6}pe06B5E}&YNw?yE%Lp<PsCEE{3AaWTf1};An
zHcqyC=V|G7R)O$V&CpKPzVv%wlx(ua+b`VA9&zV%BoJ1vuJ`<P$zE^mI(|BH(r(3M
zP1FSx?+As2%7EFCZ=C2ob(b#N32>>M3eqy5Niwq%%`CM~j3tYPX0J#Dkj#Q|-?l12
zs4|IIqcXFzY<%eNnYk3HBb96K97+{2Q?2Tjh)n>FgQtfB(IAP~vbj70YYY(&QWq*k
z1eH7hteJC;ONm_XJ2WKm8Ju%aUj#T@*ma|Epo00q at fwS@XoQA#0-4^P=*%6*mEcY{
z8(R(yC4fvrwFruDd2o?m1z;HB7lYhpa&cYY!&b3*lNSacTDHPTn16GnHyD-=jKmeC
zf|vnJCbr`*0W?Yi6jj8P4Bz_VOK`|B-$i3K(YAH`@rQnHWTYB<FBK6gMAQTDst{Eb
z=bYwwu8l@ZhlVPA>#g at m=;!-W8IN>a@(GyI)UN%vc>u2qFTkADuL_CZvjP0^L2kq6
z`vAz10QLf~qVIbNW_yLrHJ{G`kjLF9X;`HsP=PHgC2eUe3TXe}M|mIi-onNDENs2<
z#bY_P_07JYo>hMk%T8^hec5a^q*6)X9P5GwqdGiX6;-2ZsluzOS4F{$xG4NA{zXyv
z31&&H(xIs;wL~;!ri4gR5lQphCq>~C10YD4DUPBju2wa6j<a!$H)(+L+4yua9&?r^
zv8HJXmm~u?-9D)7uv%qcK$J>lX0{Aw2gE<aBNc#}Q1W0WQ1wt>SRBPU93>$3013uM
zdy{Vy4On%fL#mMg8oIXgVVqH3VOe?vDu`OpI at K5442|sqk_m{kK<a@`Gq4%WsX7a`
z2pAn19uUNF7f!Vxd9vPn$ZNwj3(&~g`6)D#lLjCXq;(aFk<p<6$AWt<E+N8HBkzmt
z^&wx3-iKa_kkKdgP*P0Rdv7~KRW`S7ZFgL|MT?;1#DFH9rtgvAWI)hgSS5o5VD0!{
zsKg-0AW#4`q2fRRXoSGn&c)ErQGOP}V+9A3yaejZl#m^Ts>ompmYw90EypHBt7=sp
z4giH9P!TXGR0^mnge5qmD;%j+9i$D&{ZQ8gsAkKR$97=Cm_pU8%Vbe#rW(?nP7el*
zI^d{s+5e(GoJU1xNv4$$9R>MCTe#6_AGM1HVC+y8A_BqaaKx!O&=a7d7|><|f*|08
zaBX>r`VO$961Zp$@Kx-&_mgnehYrDM at 42Qo5wY(s-#g at xy(UGZX7^PsRHcX_=S3tW
ze!NDJ6Ys^XT)EEI>&;S7g!&RmPsH(P#3h?xy{G>L;GivhuLkqwI0B|h`JwRI+PS?6
zz%S6-WAYZvR<ArBz5PEMA4Xg^H|7AyBR0BeSO9Q2X7?Iw&0ts=vi~CgEld;p*D#f*
zNdWny5P$=~Auxlzcg-E<2UXhMR%P(bRzr5&aXVeNZk(4aS)j~WT68)903ZNKL_t)f
zd7i7P6C(B^BF?c_MWF*ygGJ$|n7PGlphJX`@bA=nN!sl^&9Wl(-Y4EmN<?uKxin2B
zjv|heB#w*1$21_dd-MIcu9hZ4OBc9hX}dj=L>i&5^lm)w0`S4aZ40wSw1pX+iMc!9
zE14LMU_mAYA*sGa9hc%jW*_%RjKpPO8_CT4hz(qH#e<{`D763*2nWWGlv(LeEh-sO
zG~g1~nJj!cCCvS?PH8m9Rv;i}8$kvpsO(edp2+@e{R{!C>p$D>mP1+ucpaLyNi7KP
z*${7vMpASFYv)3PatKa4=NI#U{cwT$l-mB6w(4v&G*#2+)c`O^U8o>fpFt_zYa8l1
z&E*OKtMv$#0X at O=eTjJ>0MXFjq{M-SWG7^K93{AuGnG^;u^?It1f^gD89EL1>p;2@
zKmpQ9r?Fchn?0sfx}bN26v}Eu=ml{GRZC!EczD2^1|=$^4f^nZH7cGfK)e#F%OCh|
zsRq=Q{AO>246BTp7(^S&4ocM^#j6A6xb$(cTc^T<z#tS5jl#ADwJfOuAb1@(SCu$+
zLwT-+b6lueQ;GN9Gm}>(0la!IzFu$Y_;^E`&9<&xJKhgIo`@ji(Tq#(1n^Xt`QRG^
zNZ3+5n!r3jmcrN?TRT422S82(@IlPjDgd+TSLgNpeQwMFkjKq<@izF4lhE4$?qS9`
zU)+jihquvwToBg#imuPjfN>vx_-6<#7x&Ha*7o%bZ^P{vSPd!VdebzfD013v=MqJZ
z^E_wE#3=(3Imfe}=ptHI^)bMi2*u2lcrQs5xiri2q}gnz?RK7cFG+~jk|c@JICilC
z5^NTLtX;oheH_OV_13&`$5Aqr=n(oE`r9p!C=PwxI`|Rgn1X84=J8x(x`p|}K>>;!
z)HyhBN;<+3m`WZ#qtWOsZ;TC7mv?|syoRg5WFYb_TSU0$5C3EtT`2<3y?{v3mF>04
zhL-fC(n~?i^h`7hge3+X;Nl9#h8@;!nmHu(#v05U0a!QL^5nv#kTqo!%r60i$*Ji<
zk-O1ux@2L;Mq;ep(C(V2CgzVOP-c^5<pQdqUx7lSG)Ew2OifI0CPw6t0k>l at T#GPS
zw|HaO(jnZt;%nhJN|+x7NoMLp*%}m$l_<O+L>GxUohLg0 at vv>X<Us|>g`k!(Hkx4V
z`k9i^bTh};XbhqlLK)zqKv5D9RiIotcE^~i&n{Rp$3}6Z7|IcV2&@W$QJu(2Pr=C2
zSqV%+m57{~0zz%R)L8(mp>n}isj_n+3g4#=03CQ?m*9gq$PWim1LaU*nem)~2ox at W
zkOtIG0kRH|btb_~5sW2c&FV at ePL$wnGN=M#6&oR|-Z*xFrso4KF at UE4;6(>CdIw6B
zN=c0}P#iRl0nPv#%wFx#%M at FbzA+^+4xr5eh;0?HJ`V%a(ZD+=5us#qGDi@}4Qw$(
z$(vVAkQ%<}hLw27-(EfIXKuXl?iXEs^@@8AK6sDYRkd)Aa|0n(0VxXanb{Xb=JUKz
z=UB6>kag?E88Z^<Pt@^f$0a@l`{#w_p8>NtI2<P9J2GIIw}r~d*2?4l7tD3NtZ*z0
zG0)e-`(*&0*SE}<=fd1a5An{8M}PG54L`n>7kPOBJ>2p2aI-lbz+HWRI~&#%_UAPE
z!N$@DvFwsZV0*Ox--{Q|)77gtN~6(|G>s*SocCS|07ahXg{o%WYkT&CUmL1uc&~Nu
zecgMRQpHr36%#}>!A#>sGyz~jRVSEf!Z|n2%oB0!#`D}yWLYtp=fy13$D;7{R;xX=
zZvEN~Yu0U8cmMjvtmvaYMKWCn+HFPQF}VIfI#UI}z&>8AUOjFcdyb4t&oRiw;olL+
zIe;QCIjmXR+nBvzlmkU7ywqda;u#*trn=7jjf&8$oxvf4L)%`|hT}FOZX)6~BG*C`
zwGqWFL`fTIoFhpxB$W(FlEcLw3&wi6B5POO4#-9bO+&E}pbQGv1q=*8k&Cf*-S~is
zawz>AO1QRQte1YYcI_r8g at D<asU4gtTCuZ0oY;P6&6-UEV^s^vwL_U%wsa=87 at uf|
zAg)Z!D}ch@lLt{X^vSo(;k{@>^C>_Yp(n$K;67A1!nzjD>!r=DTDuW&F@(*fo46K~
zzp6G*uycXHSUq5_Ol>JBas~A=frfL)Sz|e=RiV6?nO?}qQyIh)LDWGtH_6*zra7aG
zW<DHBvc>Y9W#Y at flvSt@z_S=7P3-?91xO}={Ev|QW+1x(RNMmS8VmHJ!~j)rkQZUQ
zCdfQM7=tPoY at m|Vt`S6b-XVZea-C&~c*}PsHI+I7LNzMvR{)}*>A~PYyWZ#)!t~H9
z12TZ=VXAN77)%T%#&n}S_`HP%N?j09D3cOlu9O(cKy$jlE8h4`Ot%JZL43glKR>lz
zZ;m<VYRp`7j;qX6A)+*jT<RRhaU8|YxkyCajyrDWvaIM957|;JcP=g&Jn8{dd<5pK
zz9_^ff7lEN+1k+#F-`aA_6K`iUmSc5%tvHy%mI);+40oA_g{Jt%RXFg=H~#;Krz2z
zWk??~|EHk0oVqY%B>tSvjo<gZ-}gZ*yU!!EO`XSdw}bkoO;bHUq}|S?8;A at 5Ag!YC
z)86|=QJ8G6_kK!Mr@WWRTCFlUGE$uw8mdeT4_C))waWO=kiA4OUKB-m&6fBrilSZ=
zzMkhry(oO6*=)`NDVwI_jhiMh-I#<lrxfkh;Or<-NORKQ$mF)$)_^$zTpT<kQXr}T
zQN{l468jrRxb^m4k+l8y9164_Yn+7^*nf|i{)a{rxc}b!05z`?ds(9`X%2<?JgRoT
z45SccV9Eg30&&|YKAZ#8!2Wyof`eODtTqW<s#t{rbs%!ksA}%eE(yUk;ig+xVzZH4
zSA*^Wd-rngZ(gx71YI#GN`T1LM=mkh+bGEEvcoMaRu0aVmjH(ZN`n3OnK78GPZzjv
z<;v1`dS+Y58r_8>a5M@=W>pc%0N()ol=UvaL%aC;M#B;8x4akguUK)P1)*%mTZ1I9
za%2tr>>y+`she-Uci>$0$j%1(*-WnlK*&PBOcAOYkpUIr87~YfKpcT7>G7?g&_6<f
zJ{DX+HWOL<K#?lv$(v@As)<%f3+l&#{2m~?707P`$*o{)u=P6!bt!-tq^TW8PNBqL
z7h9E}qs-+7Kjz5=kP-(4vec?W8k>nB*|JvX8!W>s<(#VT(8tOf)fOXdYmN$+cJQVt
z<&66l%yR`J0f*|Aa}@*8lys_D8#iv;LMUTCCQ8octpwxDAWi{}@wRuLjhpXkZFX}-
zbh}S~`g<obQve@aW2Pz*RhTISkP=Z`t)@|$#x9N>kBtrSzWeU-L<b>{Wn3}{ID7}d
zQvh7l_qS&~$lv-x--UTtc*YaVA7rljF$X~Ytj2bI at 9%yP%O3kM*Zo%XCZc}>;BWiB
za|D3D`!hNozwLW})Pq>|$VYhFdVE9rfd~NK2SoZurmF3t at GVtsscJLN{d7_IhKSbl
zyqI#1r>fO-a%iYBF*H<}h$1&p6n?^cKkmIu6onrz3O_5&oacU`D2hq%rCt=pR8ja@
zT$r2h!_~L1Nv_*4oo?7P#nbi4*+mdh?XX`;Z-xGG`LFH`z at q|+sz5YkZq?C{c~ZD4
z$fY2P@bh2Y)3fZ;4qRl4J(2-F1EhuL9NKG`cIl;8hd{CGMIl>X(y$OzhRB10%q<66
zh*eN>Q(1xmm!}@sYmj%vukY&w(&VZ at 6aiGX-Vaxq0a4E3XTMl6Fpx!Qf~U3}haA-F
zule&UZw1H&*X-1Sw<rNP1#ucwn<6MDxa=1<Z6=c(sAQpy{fNVRdHt7N`fGGGC(N`S
zI8$$;XcR7v;V3i&i-#5y=68Y|Oaic&#Bq?;ed at uzvcp&W?@a(jo#5XB=M)?&IYz;9
zAd2v_pASe_hN?%W?hrg?pawVyMflAbf0r^?Eh``#oYSorgu4K9P^OXqrr;68)ix^y
zrYhD5uL4K`F2<q7YM{6S$Zmtm3aH)(aSdqXL9S-N)K%d*1ygG03`gePPN`Lcr~+^j
zB#C1?2(#uQ0#O1`0zv{%6`&O4Dj==_2+Nixm*Ke23Kn!min=rg6oh_`@c%&oOgo@f
zK&o9}&11OM``wAjCX^k}Ie)A6q6&yo01kh+X%KKOOeUF}QS&H*BDUY*1Vky68DBm3
zGMxK^-UP*KPgsE0yrfrkZfa`!ps#)Hr-wSnHD;<X&s0I2<0OuwxKc@?(b1Z#R8p6w
z31?YB`|i67KLINrkB7Kqb0fp-zSKnz@;7e7Y;Ui(hG+L~U7xi8d}A&=odY0$>Z4z2
zYTi~Zw*a%tq}yVA6xLkdJ^l`Tva5f>qu*Km1Z<tZN(|tokH!Y}yQpsth|EeOwew6B
zxpSO}NUJD(i<z1tI<2bHB|S?-rt;iRc`uV9GFciMmf&L$0P)_wlV!ztQOIPT`&ku`
z)$7);y?<?E<;^Sgcekx}*KKUXvqT#TF$%r{P)`GkAQxV`9(h5Q#dH-5zT#nUR09PN
zLM}lej0-R6UBz+FKL8pG$skR@w{gPpPes%ft9|<18%r)p7neT-PQg5_hk{cYs*wi3
zVxYh>`#Dq#9CvJQ;C{hR*2617U1A{04S}2k(G-YU!35DE%L-ihlRGy9Kr(YS4^*<_
zU)bxRdBMfEzzc#ztU0oii=nOpaVgX#P)?BN9v5DG%b-X(Wa#rwMd)QG90})UVyaJn
z at sdt&I(2FxA&8G+AQ}cGW8lbHGqb{s7qt!bx%pWD9hw&)IPQhd=-rPWUJow{Acjz6
za{~^PHOr7QIkYp63x9aSz<}Q<WHYK(20nt%3nVcABm}LYNr@AbGQ?&O$iZ8q^am|W
zZ4ClN29^RWIaqURm><-eD|N7+gcSFK@_T^dPN=^Vs`o=^0vZ+OSK&rMJObiH5FQ11
z80=~w)T{xUYf!3zX$0zq>^)bZR0UHSg7(?{5y}yiVgMBbA6x}o4WJ4XDafV4V<rls
z06be10Oh$J>O6+FtXn9kL(68uZt at F4--`xAL<4P5#SV*mLy((pS!qCnD}bv)xndwI
zszO}_<Wl_Tr?(GSNo+kV90wj}62Mv20Gf+%(=GSo9cTWoXR+l^N^#aF--@$7^+qh;
zwHLhIeDgiWUw!q8T>}-X8bz+wO~p#nIF92ej^ij|hO5=mCps1D at fMeqW7RCQ`QS&t
zGx}=)yrb{4|3a^M;oO)5Ab*nMw!Zhz-^%4agKgXNJd>mXUJGDN*Jln!#aj4hay+i+
zdcPRJySHMwH^Z9P9+lDUqP_(n(ieznL4-WZiad^^oSEBsUbM?<NJ-DibKh}R&+}r^
zfQU|JSy5I)W>K)RtOO?|O{*9{)ACb|>BhvGbsN^KTswX5jrU1^wF%8BAj^P4EI{!C
zG;!}=r}*5LF0m|rR0SnNpr{6ohJdJQ*<6?6%V%GX`_|4Z|EvRIEZ=KKkTgMl8Yreg
zzKJD^hjGgDXVjN}cT<i}ed>Y`D{zoxb)77H*?WT0?}3dkFI|DV1b{%21Davq<vZYM
z`_BY~_pDNU<(w-*A44TnZiav;1-TrcI)G_>=5yc0s&xa at u(hO+Wx?IKiRJt5jHf?&
zrqXiH{nPmBIX|+XlO2>}C at 0n@Q)bC2#%Dfz0amST4u~<W%0il3Jfa!4Up$6ay==dk
zxw?K0KKZGyb-<big{KaGKT1K#5^$1&A`Y}Efc!-0R~9H~Xc8^}EwJx?yW?pG?=Z6;
z_f6s}XMZnv`>_Sb90w{{9NsfN{n_)eYE5H6A*bxI2=3X^f~tW;LLS0k-!-qMI;Gm`
z at Pb53XK{sS+x$AD4HPXvGO%V)ZJWcqZvwsnDh9+a{$8lu59me+HK7g$ETS=xn-B1O
zP&7Zdy$?gnztISkhQRSK#0^2*5XcQfToug2fExyQ2;eG&twKPY448|cFToXnYXH|k
zZrIK}u0oK8szGe${$@>GD0s2hBSSirGwU+hTm=L&1d`!Ee^Z;&aGveIXK$Y8M?bzb
zoV!U#Dpa9yEo^&=HESpFwePPVQ1A-sSENClAOc)!=OR}z-70X>n=eAMJ+pn)l<=Le
zoQhhthN0mU-}&kZsHVLMrVB6p#cS&I>3Pm^m58d{R4nH>tyYsbNusD)t++}h;Z`eq
zB2%#*Z*fUEp7{XVxi#Z^eeun_kZ9~4bM&h at 0P<%s{=4t}haVu2jbTa-CqIJQv?gQ)
zx}PA+@aJR5^LKsw{*Mn(-8d9hIeOH`mVikANYhxF&9+z7q9}aPZfCiwW+IxQkDf(D
z&9Z4-#G2Msb*d=*RG!ZUAm00Nqha}pJogiMK8U7OOnNU<MNv#mH>W4ouHQJzxN*}2
z8dKvU(~}<UOyOm)RPKBK<2GFO^BX{}Vwq7_3$zrYUtM|S&3N~}-P*IvnP(hqJ`zO(
zC>kJNhxj_wH}Ihk9*L1I3dno@?KXV=i~nuS#~gxb4xD)obSAbyt=aN8 at 7q`5&=+42
z0y7PPy9MtgZ9p>o!@CdY*`B}p=UecbU)>xiQB|Xnl|dmBF1hr7 at qvH6Zt#JZaX{*!
zp?ezeR?#{0eZ4Hecm4g3 at vC25XSa7MGuu(eb^NkRe}(sd_$Ql5R~MZMj-qV=xn}tA
znWtc6ct!~AJ%9HDeBq1d8$~VjLTKsd!VwV91Eq_=NrG0pz<J-k8qa*;XCc~xiU&y<
z$eJl2X$$}Of#ZAU>iyrvmA|^$em79A6fu;{Pvf#nevJ?O!$q6TsSpX&x1p3nNGwyY
zR<UyG1AvfVU{_X23W&BL@NkMiwaUQ01(s>3p8)c4P`(Oi-vw>m3Tj^uw5|iP>!HQ1
zgM(vckV`<W0_GaT4TE_U>_&iS1m2B+qIrOuXY at iI0=W?okHYg1n1?`AgHR1bLjVs!
zxCV7KJO3%QxzT9A`r{co9#^3}Q&FL)5_(D!D59Qr`2i<jM*#~^uv$L{shWXirzfaC
z%2)@I1%RXgLZ!&mZE^JBy&4{8owpiytoS38tWpQAfXKi{mMLEI=5J$ifJ>8V5md_}
zz=hrz7pPpE;xFFwecXI!FR1_YKRpfm?z at v2Rptej@4qwt^UVEv_gHk%XFl`&lL8g1
z%FNXOMpEZEan8k2<f3Xdam?&SM{69aAWuXp)}s}dTnXS+Fe$eO8uJ1CzrN2Nib`kx
z0I|$n0Dd+Xnm)Q?PKNif8J`01cFf4kErY2q{A;+l?g_#0&ai%jGXRu)j!W_2dK4ba
z_$kZ_<Zrq@J09jH`l&zhWAY1FnYOffb}*^pb3<n24=|4C?yz$6yTc9mMgaRgRzRc^
zXrFl+83?(e=R2WUoubH5qtQ|TC?$NoXYZVI%v^{_;XND?vG?MbDN;qmOc4=9sy-S}
z-IyRkOhhrWCWEAUt$HGfbDR=s?3||k-?`;}y=LbHx_q>Xd6jk%rM1~S_G$t&GvJul
zUV*otd?Q}{ibJr^-pjxQ+;-a^@s00ZgHN8f7I~Kt at oQc*ierx22jWeEX-28X0WQX}
zr9(LTU!RN<&-gu50q=pgop}q+`R*M!{ggd%__O!KPRka7nJ_*+iM#GvgKMr|iJ$#y
zH7@>T13gN)svQF~2t(Ne3cTRx{c!RNR^VF~Tb6#h1ss0jrFhqAH{jHh4#Dnw?f?jI
z>#cX;oNr!>&wg_qya3e{X!eW!_|>)_KroVvKwQNOj$V$FkJ|y?`k@&GPd5ceyyOcw
z;|=@c)K?ycJ$By-3c at Wb?!md|{Q{r;+KmtaDk-DY?hP1Kn!yk+2di{sTbJ!PALo4L
zB)t4}=Y_day!G7|;Oz7M7jHi8FdTl^ld<DYOW+9Dv}po&-LVqaTy;HucE#1W_<!rD
zhhhu)32P>I)@*NvC<0~R`NuvDC!g>OeCxs+!+sPv;syVKGv546oO;T0u*V*|K$URI
zt#{(wuV04Ge)V?{QB*1ptyZ4`wRiw+>-7i$FKG_d45Y!hk36UoP at 7*3E39!|GyB{(
z08B%D0Djsua7JnhSgr!)QBX7wq+^3ssL14ctwqFSqs^b9q;^^5NdR!@nGxr$l14dL
z<Bl03sWp;o5HkR!;gxihum(V}@Ofg*;2avqCB(@c^=^hx*n<HT5LFMAAWz&??a<PP
zL}f4l!A2;xz{Pe@nt)OsoIeS#c-et???>)HJzPtTCUDqG{tF*^&vLxz1&3g}?Z&WS
z<0f4Gvm5cDPu_r=?({fdPlp?B>sK5vOvOyXeqx4B_to=$j<5Y-UC*~)d;B82{<TK}
ze%b^D0I0U`hBrJ1S6q1?zV^czHtE#V^ugzz`;*&W{pw>b3tmfws^+RxsH!&~CKXlH
zRx8tHGt+>qpJ?77k5*jrtniuwa4}5!{~DM#$V31pPlCzgz6ZUkoEruJlC2$I46)6i
z#QWKJVoNALAqUM(LEpW4+sx0_{Lae&oR5KBgPR?HfHh97dl1|CVD~8k at JpB`cRAYO
zhH>py{Qe_xE<V)b@?e*XVLZ^S^?J#|JYD-Zx~{g_P4qqQIcWzGVIp#>h(7U&@7&S-
z_xHW;<YzE*%uF$Wgqflbedy~y>Pew}_>F%7P~se=M4S*&^1k<du1DbD3txEedD|}-
zUc6+az1K*ZFBq+2XxTG9+Vhb3`hPqHum0<+w|d);etL?FzIr^8L;z`m3u_Lyqr;Z<
zbrq<q;@cNohu44b7PPa6IN^7`G`O2*7I&!0omx|Q70ou`#jpM$F8l4)ui%^i`4pV;
zm%aNde|$r5!8XZQ7PU$ZrD(Mn$DR6LxcoP*tzO4@pM5D#eOs^LudM%Qa3A-fQQJYv
z0Gbng>$|_e>;Lj1w6lk1=;-fy4Uj$wl%%22Jsc0RO!agt$8jfq6qo;U<<`&DmrlVc
zZ~A8MF&Y1)_4~*)Ak$Favg(oMfMh`?xD9C2s#V&Cq6MIIUpESxYHkW@B%L5#oq+&G
z3UM`~P`P<V2jqEh+kb1DUCeU-iw!VQdG4Aw2Ji5LZSwp6{^J5LvnF|UF+deCS3pb7
z>pTBm5fshpR(;cOK64zZct-2u9lz7Jj#mNF1m)WWaDJCb<5B{3RebWZzs9>ieD79m
z at 8~e_%kQ6nCm(fT-#ncTl6I(YIWPo*1UKEX3QvFWk9xrT at +ZZ(>L;&9t(ro$0E>j)
zAO)fv(^G96^1N?i#XUXecz(hOhkxSWgZI46dq3&DpDYTQnw)GjHf^d;Z`?T9oS0~|
z$H(j0h7A+>x^)vF8`0wpq7U;Py)6Ue%{`+Yjkx5Y?nfg$n=gMD`+YHHQ_B?AjDGiA
z2>j at dISSTeH!c8h41leD(w+x130nUMZ&v{;sdiItQUKq=Bg^xAJd7N`i2(i$58UXs
zIvl@#zKs0IOh#U`RnaaR*JlMsM$?+gb3ZAf6Cye}`!}pdB+LA`_kKcTcB6W;*_!y{
zy2<<QSfBjv&J9DqyMKM&{~*JOCmn&Wee@uVJ-`{r47}^q1^B_)FG8ARKrsc*>kvO>
zhHk|aP}Bn at YYJ3M;gu)shu>cKe{jSh$wQ11L&jX%fNvQ<kS5@#0pCD1@wn*gFTxqG
zSun`7yJyTF0lxXEgK+XIXX`(ZwCp#f2^0;8HbA}s$P_AR3qSn&3vtG254?_fqlEK5
zb2v^p>1hMjF%9(%sINo(G^7{@6_cQ15-28c@(EAHRX=?bj(Fyxhcs1GYyh(Rfuap)
z9V&IGOhWw>w3t98ZsMYE{{_x?^Fa^1A7e4T at r9S;l_w1lqRTe`*(zwZ64G7)G_M0S
zuK^mr02)`oH!p{_eg<m)8k+wWT3inlw*tj|K(QXsO(0BzDTgwF;7mG~99Y=E9~lja
zB!`Lz#QbEoX at -y)$_l6pFW#)#;X{i;JD&0&60mr%<^h0h<~-Lt+$uvahc{5ydCgj`
z4M-bGcSC&!$`=B@8Tw|LIOA>4#CzZPz^#UR at 5=ba1uw$>`|mp7yv at y>UE3gOK()Yh
zvw at S|@;^P`qnZNef8lwkr3x+T;Jj|2s+a(ZX&`H&IxP6kXa5f>ef=Qc|NbvuH#OB5
zE2&sTQB<-lPqQpfL^M{_D9Z|06y9yW{rr-G^+ZeZK3?OJpTT5;FMpW7^Z5avT`>nf
z9-A>o!Fp`R<pB18@gZLf)4W~;%fycZxE)3fIv0Ztc^;{8H>|<>+g+dS1>h`Lv-+R%
z$N;<_z*k{CF)skH6M!*TpUj=GD#>{;1H*nE>z|B at M(7n`=a}=n-~oSc02HZ;Q`MLV
z187>s1T!Z at ny5;J26V|5MKL8J?JUb$lWApgYGiC2eGP*3_0xFi at z25$hwXuHoc~)~
zbjd2*@y8q+CV=^)z%EN79Q*8rc-4u^vG?u^LE5%}LYfe11HKKC+-NT3K-`8(YJMM5
zVE?`5<FfC*6xUq865sj33S4>Z1a7<6eqR+x6JY)bVTVNyyDm$x@9sl5aQS>Z_29*T
zw87GbNE0l1FzMq!0Wp)gYMkQ#efYU}%W3Oy-gj at pkAJ=q_pSCAp9B`p19n>$<Amog
z#cNJ^1{N<~U_hfkj`NL>)o%kRz~Uk7KoWsCM>R?Ci4Q*)Z#iu}&il at d`0*9Cj!oq{
zc8c-R=P$)+uX;KbEnWx|_sl-#*=@$@S21_&V15V}1Cl^p4g2r29WKA<FLBMacj5f+
zU5zWR`Xg??YYOYfGpH!i)M5T;j2*VGV%MF<u>4684%*$}X$LNX`Zh at J0#O8wDo`@F
za;E9v!@;N~DL(!$FUOl-_e^}_+rP#CTy`h!T{VqOlPKrw001BWNkl<Z6FC;ni?G|y
zHN5nNyW%yc9E$C?p9f?s2E@uYK>Y@=uY+_PT1-QA+NvKYz$#tN_N6hPoAI~M(lf-&
z?@Zw-H)&o~lYCWyiU7_6UuX^R?QMGvqSU7@%@K7Q=MBBd=xQEFLI$Li2Q`zoIyAP@
zPscV=0C51d?f<jDK{NC#wIOsXDBlArqd>eN05*?*J at W{haNJ6qb at om8<y8&bzgD3N
zEM7o(%6=8R;<#OL at ++Q&IEkUYG2mX+o}pR7dU at Xd*O%btyL$6TXPvnm`|h#8z=sr2
znFeX#OHpiUYvggjz6<f6|94lM{`YrxCtMbP?sGpl<-PAc`Ae-<me=d8yxGi(b~`Vc
z&6aPsbD!shFA7m+FX*iz2%b1ptVcR7*%83g02~CPaP0<Q2Ux#H1x9rq2e1Mrk$*mb
ztGCg<T^!JJH(mJbxlr`68FLh@xiL2$-q;>i4JpSR;pY9g8)u$*TIYJd>887TuKoG*
zN2se;ga9B-V`gT`vYevGF%h$K#NG?rASa?OikwqbM`ZmXM2LteR at FFAv{LI6p_G}^
z^8ZAXGE>Dlu5^8#07&B~saBF`ev0P&ok#2Y%paEFu_0frjwn}agftO24o=oAAeNbI
ztZzeo8}Ln#Z&}c*8B~g32FK=$z=^5saN3dh1es3<-~u&>`fiwF*=`M<AJPt>pcOK`
zLB5u`^IM7v$W=_0htuHY5QV^(I}X_(>Vzk%=Efn&!BPO4LBy&nENzI|dJxp7h!dzw
zgWo}7&sR3LYXZ;sdvxzlhsW;$3H=d)j%2}RkgTN$N)>=gH}VmHD-cdVs2BwY!TgOF
zfD4 at Z@cTsznEnH(T{n=179?E&N_Piw254|CcM(jj$yAI)*hH)_4MN*8+-O<mJtUW@
z^o0*TEsO%HO`vFkv<;PUz?%Y=`UcpW4~URhzeSMb1po>reku%N33E)K?qFO?2k|6O
z`D!3H1mPj58v*e!h${eBpcIZn01W1xLDtAk{mdMDk>=qXE3C0va)2`HF$%pLif*^?
z@?5g>m6U at EICYLOX#f-wylk|9N at id}0^N>ss49dBk;XH>9VCfomT5u#w4LiE0D%K>
z1xghtSA$7n6u?K2E)Lg+N(K}ofb0syYe3w9l-EU&5 at rNHkFF3!x{i3qC{x2VA3(nK
z`4mtk5II|hjG}0sHf-B09*_bmZLqYUATT6|3Ri5mV-G4)<Q&PGO_jBmUAyqgdsnyb
zX}7b9X0tstJ>8m^m}pE*O*JR$_2$&XM7=&aIXzvkH=9#a)9om7*~CO6#|#Zi(CYy|
z*KhFHj2EL<c7F=MQW(8!Zp>9c=EmH3LXCbW^qU{A8(KE4&or#hfRRm`rWAnApFdK9
z4~inEB^W6i*Yn)|Euu^W77>1c=Ji;W+eDP8Qrmk;qR6EpS^|)kh*p at TqKb<5J~f4|
zMh2keTr|FVW4x)#jrn^mY%E_iBBS$0eL6Z1lnw!DtZ)!0ynztTgA}e+Js>TR&!DhM
zhXpPS<s8HrRC04u*9`C#Q_k_`xK2UHMuXplhUR4w51_D~5;0>#)i%gyfx4o>%r65Z
zF=uqm0ki=rn}wZ8`zk_E*_92_nfQ at 4C<bW`mJFgTh?F!K=>-0e#EcfXW!!p>KtAdK
zlrraP`w~3)sLPeQ;}oBDdLS&*9l}4Z1h0j}xc=k-su}1(P*4iNo^lGIwBvlOT7b9;
zkyW6)1)(-brvMs(MrlwTi at -hyaRK-OD$ZQVl|X(26b;)BDvXANVEhL$kN^!1-9 at 0o
zwIJHG0N$G`JCO&tfWVuAlW<Ql!Bntfb4FJMA+icbCm0qGM-Z<d(%_md)+gfI2A;HO
z%WyGc3`iV+Spb$qQ1w=Qn{g_!26z-<pYqU1p8+Bu6t=(O3|NZmG9D~}f&sZ%c|}#g
zYiM-0Mse00qB&S{GtTth=1>R<7fk)S0f?!AX_#9(Py9@^s5D_z+jb&XcDh4-X8TdJ
z?f7s5<Q=HJ10<RP%M{cVP|iXHB@Vqu0IN~NxG!S2ZMEyZ<I^G%fM^M}130H?sF3ZG
z0MI5Nc~D}@ZC->yjzHQ3Bo5|^86shxUu(|ab$)A)+wUHoT)$x=Yqhdsdb*uA8qK_3
zw^y^-&YR74Q54>bs7y>W`Vr<6ts(tSb-cOn{kP`8#~c8e8*}4{I-cA2{>sPu26qDy
zz+`;;fCvVGk#;+mC~^cqf{GSZDhcPgFQSN?s&Y|C5yz1eQOB0bj6^g7B=Mf2C~|3*
z6|GSDNJJ=Q)^?s3tt=}l-usG(R#dg3s+lS>5ot2JiTl^aQ;X8cCHrnaz1vQUFmHIo
z^U!>tHY7+`0wpO2q5^~rioi(^3P_>?7BiTGFFJk%iUP!KfLnk>fo|kN_MZY6;2Eh=
z_~7|rTzM7)9uk5wB83(~ZHo&)qW~DnjCGKd4bIaY#UY~5z)qcHsf28}Qy+dm?|Nxq
z51E3KavN|F2x%wyGW8=027c06g{aBHmNtUW;0~^tRgubudM{xe?V!4q0y=E~gQozA
zOfr>HDAmyMP~qU+ps+xXhOC;Q4RBrnE`#!&0QLgd!@)y^pi~&8iOn345rt~Nv^9fw
zd!=;>M!vKmhoS&WI|R&4KwIYD(Fy1gDnil~2O<RW3UJeoSNJA5*A*wS1@FwZtqL&O
z1|Yc-)+ZpBL4DE*;EA~71`beX?xDdQoP3~sDTusP*dXTjq6L&Z*w9CC{0km6=>9)}
z)CKxqi91XlS+uON`Hlm*DT5h}ic4RPPN3ffTsxt^&h&T$(?wMYNY+6iU=-neZwG1{
zOkpa3TMg at E2!!s0dIj3sLDIVo^l}2C2p$Ya4oZN)`fX+*^AcE<;6nxKC0sh?_w4#D
z_rC-w1P4d~Q3Z<uc at nkb&Jo~S5OqMT;G9s2T(akq;hnCEv-|Iu^o_~MsiM`&@@BK0
z*Xzxq)yndzsp-7k&Wm<C_o_i-c&75feWk8B at bTD;JpjD0 at 3Sw?P0M39<|tTmV{Sb3
zF&ru$%eo#g%K_Z_MB9;WdR7TWy5IMK5o$DA6h)4lV=4;I%mzlh7ZwrMP0{MAip0)w
ztct`rPGHJeX{(i|?RJ)CSy9RJq9URd5lL0GA|e&<r6QuKh at _Py9bP;vOAcPLVZR;b
z7b8m+NOf#Jcw~W~R`rNrsy51*IZVTYa_dciSb!p8L8x*t8blP7je_A|2 at XmM6KTi!
z*#evyBQ^7l$PN62rd<2J+HZAxakwZ@LPB;q*ol`!B6KPfU2#^BHZ`9E3mgS(nf5Xh
z40KErl_L;b*SdS{2(;^{cG?M4EF)iL-qjo3riV4cUE9q@`Jxf~zYx@=fW}~F)ew_&
zHMea80|c~Jfu?SN&jmyoI3noCQ-HV@*zzTv%yoKCgcw{*0=g!EqAb|nbv?nldJ&Y=
z`hP@%he?^`{{QT~*{?L)bszRyYghGj&iUry4&)^%DViu!5=ls61Us@~zv;n-o!PPE
zhXC=LU-AzG4g$nM-jV=8f;f_+*n*S+Mu1F;6iTuz%9==uq9lsE{O<kkH{Ub#SXFzk
zm4~%<Rdt^}=R2e+lf0}2G|t>zUA4Q<`t9`_s$RqD&1g;ycin at JoX|x$_%-p1p;7=E
zjFLskk7EK*0b$GGATHg}O8}khod5nu??b5u2@IrU{Q|7HXUf-I+}&0jXfQNnYh4$o
zXTYS~>Niw+^fA at mwe&S55kLY<Hf%x*wCw!*`pHwW<hl<^5Q*Rnc9a|h72R5I0Z0xW
zj5gg-*PQs;=ky_n90275D3Pz93<&elP!B6=i`NBeTAobD67>4|Olb_h&;b<%Yh$l9
zA-4?n=^2p$zkL0m&@zD{K^cfRkU#x1di<aN(w$HJ(VsqiSXIrus_L`Nras+l>iK3<
zpEgZeR8_MeqE%ftYa4l@b}-ThB)~w$`bN}$1K>aCef_&Iealb-02ykiZ;JX&0RIJm
z{{@#jVU+;>A%K6g_r3oez)yXvpMa}?kzKt=Q3NW>g8O=rqTrB{u&M at TF8cJW5O@@0
z8m(5<sIHq)RW*~UYQ`z0anr<!DkdT_iP0t^20~<<l8ncr@$BZ&^yanV^wy7m;Pm_6
zxGjgT-j(U?`^wjDM2trXoT(XQ0v8I60we(mL77Zwi{M&~qUF{z7e?Q3@S!_X2_g$)
zvt4WFpsP`sgghew>iP$Az|osVP+=CND7{&R(`GtFg8_qX3Su3XKMq`*fCTp5%XGgs
zv7!7JMBUCfvF(go{|Zq82csY<lBY-mDt_KzfJD`4Z7q7qw4c)4nP>`N1aN at R6r={=
zRPFo`S>T;AL6g&-&i)XzdJGkXh6tX%igfV(;2>sU=ErP}FFRGK0^|iqS2hJAHJTmu
zp_~6V6BASu5>$MugVa&U$ibFo01ym-Z2e2r?)d`k<S6Su42<SRzqH8%hjzNfC~VR}
zcK?}nWsm1mjQ&PAH4Z|I(nUFMgR}!zIh>Q!!Ew$|>1bqjT-52+yZKhTF75Y{(eT82
zVkOhiuqqM-kdle*w at jRjdMKLgH4qb+^E&5Fo04 at +Y7-1<vq6#rM9W@LRWJf15GZ~C
zz!((XLJEwa!OtIj^3zQRTay3>#rAsi7eb;IY_!*s3xBOA%Ro_u#02IHI at KtII<nU?
ziG_rcKmr>GPYNB4 at Xo{W*?;t3kN)4^`TV;NW0ZMaH}j^6XECO;x{jw!6XzDX>ftda
zSgLy<#81RI@y}3y{`G?Z{yDZ;KYts80DS-;Lk;y!RQVsma{#{x3rYGNn9!VIZXG`X
z;O}BPfbbN+55p2w-!t{KfRXXI<UAD#A%rYk2T+t{5s0W*E;nUW)x~C0kCw~LsA=M8
zv#CcZ$)v91L{-Nzrio8MralFkh{)JJ>S!_<&+c5C+`Kh9x%pSVXZd{}xTA+}ykDkw
zUr|0diWrq*JESbY$T|B_!OFHn&cQZ=!60UvgtUz!0Zz3c&eH-xQZr<=KkRmsZRJFF
zOWF}N!y48MYTDg?<iKQUF^*6x;qH+)4D={F=s>sYYgVvMHOY;8zHizS#!S4ms}D_1
zu~OHBq?YMo8W8TL0y?sD$N_|@i+e|Q&X_?ovF8B-Fan`O<T02>*7!*RH*?VZcOX at S
zy1AAfd>lHt4Qllr41~P%&VVdHa)P9%VBOe6fEuVWfMh%8Qg|~Tp>8LeAP6~hFz=M-
z9erv5b$S%#9$&zmoA|7M$Q51K%mx+!2$xW95VU|~+EV_gISkL%2rK#8=+nN`?khMQ
zt4)Sau4Rb6|DP#l$?w0DWVdS-ojVqZ`eW@}dg>ViXr3ORHx<et1`b@Q_dPYRr^%>J
z5MR35t~H~4nb at 0@d`<UXBic@>7z7c3!3IL)6^H;KyzuD<`P$xoA{l^?Pf)tN#JJtc
zYj=JO0Q&P!FddNqiUuU=z<&gy5=y1%!U#4!DiWw>=y--FPe;rD_`j=v`~Up3e)(*^
zI!h^?HBFkQB&RW^QxTaH(OHaX;Q(aiQ;=$yf_%g34uHQ53opFi`~I5%z6V>J&Y=bX
zGSpDt90262sX2hZ4oi}M&(>vN<RXezo{G$7laP{dRW)HgUll1ySg)&Mx!ja>-4s>T
zjG88nnkJ58Oe0l{Q%aK<Wg?Pq+J1D6$V3(6>0~^;d%e7QZ+d$3Z+xuz{*Qcz+`j)B
z_{JT at be2#!C{Q;gA^|iJII)Ye*%}$zZtBQCc0HMz at f77L2exTSD!yxrwgIHv`Se2f
zNc}z;=({kTZy38qHTnK>5_QKfX&WnsO?5~ZDbu?4iIMvc#diOsHW9IhN)9;4^aql_
zG=XXZb&Fi<<YqqQ7=bWG;^6F<tZN}Kji6c}g(--}ZeJ^)m_VC9fh-<^grS9iX0HPW
zA2Iy^;MxN}epWy#P&$RC$536{uD4HW2qhHB^(7?~8`n|fiIoB<Ob0@~`%h$3k5<f1
zy?=;hClc?uVp&RfckL~g&;X41V*rIu*kE)%r*&ztsRwB?$2NgqFYPW0HU7AE?G&|N
zW2Z6o-<GJ;3~4*(pk8xMZL`kmItst=Lh7tLZFMO9&G<Y;v2*43tmN7f7Z0)jU7pJ1
z*GaGGZ;wOz6G7dY#E1aFCxZe7bP5tcLT&5XAAcK&IN%ZO(FymwWv8rpa*(1neG-x0
zF{p(Qwl5AK(G=V|;BCyEEh?y-p{hmx;0u#yfA_zf{^n=C@bIyS%u|xNWgy8J5uK$Z
zr~dz70buR7i>4q00QtuJACJC?_#4A%`o`8ELLX|Vf3f-$fWHIa^Y8U1n#JoGj9eyO
z?*S1lia;?Yt?PzPP8PD+)M>S<Les>!Uf0n9NNk$e#F&~GQ<;)9DM=$DwcWH9(b|OR
z`G#6mC+l@pKYt;cHz(uMI^C##YWeJ=AAF)mA9_DcUwOaqwHv^wByerWfLtFeNY*g+
zH>P_aM6ul_Xzu;kznSt5cmIdo|2@`BOD8bHcD31 at ic|qg)Pe=2+#vSuQsE7h8H7R=
zfw}<*2uOw?Y*M4`ti=z*ry^O)kcT!Pqm^*Jo6u!IAX@VV22)|*rUO5|5}=v4oMzFR
zd^%*m=Xwj2W`#>r6e&WufUtXtF+oS~2aldZH*0Vr=;k44{2H{l2B8KdrZFKR-<&U?
zm_g~ttX#G6o%RTY<zpr&NG;z(NPyOX3pQEV2?$h2h)OVOShkHNYH39RZqKQ(xS*b)
z%+8`>KnTo|+xw1Ihh$((Y)W9Di5%1k)IlhT`cOt)0|KAyz#X1^hu(pcB2xm5LPsP$
zT9P;Y3W%tk>y|;KTcDsF#<Uc_JQ0&_vOwgMg5LUp*s0`gjg0icNCrnOc<O1D9K4AQ
z%^;e<A_l`~0Sydp>1YN#xYc|ZkZOUJPY6|e{icu|8%LuU_8pWn`0#HE8)b`ql4f9Q
z17PgtbmC5OB~&6ttbF^Zo)Ku$G;wV2PudU}z(`5l3T+E;cw%D?ocWf at 19>mj0>IA<
z;A5D83^mj@V|@U?Ux1~q{(ygd55Ua-k-Q7wE3hD@{}rYg`L?aAOhu}y;niwG>vc`@
z`HGt+(Q>&CO%u7UW2oz<NJ)YNk3vMslw_=`BW51i#6u>k82jX7s)|g{ny6x8|M+!0
zo6Tmg-8sDV%H;XYfBQ$8kNnVg(d~P$65qN<7+*^$eIP*rNToIV6w!?=z}eaL!o0U_
zQMzo67y1CAPlL&gE%j(o)~wR@{nGg<NS<_PZznwKL`({O1jWkSg<6LvGTIMQM-fA(
z0SO=o<tHd0D!YwC^@g~x`%t>>Ze78%K7!NA0?0>7u6XHf(u+?PCO|lJ+7>}Yz{;T2
zn~>$7nS)mlV0IUJ at Ph!WYdZi%iI%aV5fGb#kSv|k-?ZmC!6zG;hJ?alNph-DVE}=1
zW=Ot%Jr}IjZrAB}nhYFx&R&oJflW4)$tXOO=~`mvMa80K5IQ;@QzvqFXp=`#EqG|%
z2a?~9iO~rHk+c&><64rovv#0EX?p_ax`_@{<>3WwP1pKku|AkFDjK!Gni8PY(FNOw
z-}>6_gL)GSy9;ffqV@(qwkFx9LF9peJpiBeQ9S^qz5B}7r++La#=l@&T({Xz*#MwF
zg%p%Nv?QP|pydHbPeFQ!FFr_%fA2pT|JHAR_Ss{Yed|J1PXV04Xt?>7rywirpMngz
zAb-B4JD}q&m`3xz!h4J+{jFTX1Z1e8w(Bc?`-j7+czIpX(l<SQdP2{hop4=8ZJJ1R
z9aTiAX`-YgNkoH)BoQrCHTtdbDMtgKR at E__Q*EF_Cjh4Yy@@I&XJ?E0^mM*?Fq at o2
zI;`i_$q#<lb3J<FeKLFPjlkD#CXB}b(!}g@M*@`2M^8p8k=z7pum3{#xeYsd(+_W3
zx~8f7QNQ`yYWNr++1>zE<8<vbOnsN$9_O9OKimY6JXFt{+q@%8=ux!@%E9vx6iF3?
z2*RXC*-0J-7eUIt+ds8tUJED{U{!N_%5Gj7tyvTDd<qltDoNK!YYoy#`y2=gj9&%n
zN6^g*B0y0+2a0#0)4S%FqzrKC&KWZl2SB<3(8h8xlw0~#P?)KJ+p>ypIy1Ty^S(ek
zH at 9}mOGlw5!Vv~o6G$0J3Oi;2gffjk_*BYANNUq0L1Ss|84$rl&xiraFbb9j<Z(XV
zxf9oZ6Kuz#Za&a8$UPBuUK6aji*EnE1tA%5^cG|W&RH|EwKnr)1#rWG)H+W=01ed2
zMe=K7ca3*|yf>B6-YX<C9Q}1d8SIjRRZaiY(jo184r8`Kxr0Zel691`4p&h}v1`F;
zUkBr-B!_-xxl!LSR|`ma4UD+~Ac{x=sB%!%kuR!|p={*oN4{;mzjB}CR`A6G*cdj~
zhZ+FLP(uy%bp|56H~)QKr>+G#7s{2n(b3<Ra<^BaqcY@O#Qx_sI-zIn%|NqUZR+29
zv#6gf?w#JB9pC<UJ{dpy(WTzG_bT|-E5Ok;L12Qe85j#tcth3n+=FNvc#v*4R9i>`
zeF1OR;7Ds5x^p at N=Q#TpF*3SP>)!N(0HIr+t1xf>->TZ~JbPozxvvBulH49O_<f2u
zq1$l<q_cLCLh9mq4R!&EKsjAq6`+yjIk=NlZVHup4o?~YZ7jsl8*Sw&X#57W`2s>D
zn at rSy1{&Qo-aRMp?fkgJzNT;kNDE8vMz#+QFflp|96-Qm01ZaR%67RPSjjHlZ*?;2
zMg*z=7rhp=Xd7a~iiKZx(@&^d#bzxw^+smw*PIYqcP at J#0t9b#i5)OyfKix^NNX?%
z<j=(pX5<qWpWu+VnL;N%?;h9IBKJ1e+o>Gu_8Q(=XnmbY-<sGnRs>)K6QXlB`RFEe
z+ZbkVNe`avXgKW6!LBuju74EQIoTHmR{B7q``DYraHmnBm-M1!BP*Nk0S>H7C`vF+
zK~h0+9d#Y$!IM$Fssj0YROyR!<e<Y<X6^UO9S{<+*Nb@oBtw0BRv1pfP(uy%FKHL5
z&->V=A7m~_|MUJWhZSUdp!Bj^UDxsX$#VT{Q7)e at 4i-n{`Y^4Tv_cUIp<*NmLEC_B
zDhU*<O{H^Os0(hO9{q&ch7{sK+v;1Md#F`JeJV`vE`-|1@&q&SB5b!VN;d#qgL)yp
z=H%7N1KPU+Sp=O0 at BxIe(~_vSb6z0Z(wg|bG+Gvw$acaGt4ydJoJyu*VSQPP0&bn8
z6vnwHVt@nKZH<LYysvx!l4EGB4Cr734Tr$!x@!icb?pMd#lc4ZA~7psqZkD!)a_Uu
z257LUiL%qnax=>AqUAg6%<hJjEaSr+#E6WBqfV`Ym~)d7fdaWjumdh4-{N+CPcZ6Q
z3rI-X1z?l4?uHCdoW4g|xWiQL?mJ*$kivRcmdUp5Gs81Ndg5{7t)|>SiFdpnQrKHi
zdtR+%rVH&4O3(O+?kd&OFe&Uj_VaAG_k!OYv}BVuH$cdG4p27#<rdN835&@)XbXh*
zi at Em=p$=U1b8y-TlGzt$eYz#4A3|y3lfDRGY02%FfFOADolW)kezy41@BYzz-oz+7
zn<lZhQL=mMzjw)=_rIZr8UV;pLk%_5Hvow2f)afR5Ro0Qu?tAH080~NJYI*zpFY3-
z^m7lY7q_NzG^%JOLc|lG3}id5d4DoHsRHMLNdHM_uZQ=BuiZ_B3$A-uMV(hpnWMh%
zuKSOt*2sDQciW2tYzfY^;~<%Lq8%nc)If;>z!3-mjLI5Uf=?}shQmB_;jjWc_NLU+
zxl#Bug+OXM?>T6$%ZtbtRz1%nIUP$a01jly({9<Ccldz`w0_*46QT`J-fJzAq3ZU<
z-nlZvEPkEZ#Q{(TXK!4%*Aj7?vBL1&3q+7c)5WyT0%ZphEYYSt$Id%)TVl=v8lyFB
zfsU?!&xW-GMN)Qmu5+k$&&wh2zN>>kUt0)m%DZ>gzV^&@jmRcm=Bt$LX1RwUwD<V-
zGjZBd|MzgtB6$0SYU@?JAxAG4B at 5QId(Gs(;~wQL-x+TYK8(poE;=WKR-fWyJL;0?
zyCdVy8haPNtN(yHpw$N=8924CSrlM80uZ1<0oj0L4MJ^{K9tZ at W4Wy5_y1(H{P|y*
zJbUzXUZI=l=3BD^Kz4=b`vAyg?~y|dH2{#Ih8k+9ZvYTM@1M2w{^83W0J874^*eRl
zq!*{F_0z>@{$xH~9*wJ`xC$g|Es7CQQ7VElc|e~1p at r}M>OSzHJ^NN`xdg2=qXPoE
z{bak)Ja;Hk+lBAK>UPRSC1xGl>)hO8^uiO}I(qqu)C8s)$=~#qGKbzp((VLAC{5FV
z03uIEr<^8jlM-#|OIdpmeS{=-@0yGTrO_;L^P^JXVQ`^)KH<=EKH|c<Q>iVDy1WAl
zVnLCuaKM%XV}uTBbk at Cgzv@$t!omnCo4+zh3v-dpd?8UVkx{9XT)3{SZ8EiBq?=Tc
z=iLS5Nsbu-<Vgsef<$h{1b4aei(mnQ4mk3C8!^r&FG#+4iZ-JKL?!@7c5NaEi_xLn
zF@Y!>9O(A6fgMCkHwqzb^S{r(97VU`KX)nQTN)%k|B3*n40QI;6dgC_>_ysI+SCqT
z5&=b at mnB{JXM$a)7I27mC?~K}r3^6kG1WHmrw$2`PsMZu<#CG_ST+zOFtH`dOG2z7
zR!h}?{>P)mfA$O4-u~<tm&<6=kN)OIvj=$8J0N5?2V|Il3^f3d;S>xt)KK3fKxDhS
z*#;ziFtTqN(x+xcY)?hnziDDj$Ln(S$4`%*{?S|Y^E(H)Hcm7XRVqh>vh;&V-gK7T
zL?invWmN(8v9xIalTzMp__EVeaIKzJ001BWNkl<Z`*Z(evWM<i{r&ud%$B+kcXayJ
z&OIxO)jI-}`mS>4GUOq1lt6BA+og<KGPX6pQ-6}?=W77U60QjhQPYelS&BMCp&DI~
zZd5l>MhG*cR_-g7nBF`ErF at BNP<gjU`*NC3@`;M3Zf9Hts+9o|E?gWgMinBL9I0nQ
zXo*g5!2plE^^Z_W-Vg_$Kom|DGCSUu-9rTSut#c}a68|;#|~Gsb|hmc=9ZS0|DM5Z
z<KJ2$vv$ICh1tp~x96V0o@J7o_|o+e-MXSyDX!g!Mmi`=%v-=@%c|E`1w>omp?iV2
z52Zx6=~mqPyuW0*JDffc;hpJ_4OM(x!XuDK>!4+teDZ*G&oc=(L3{)1*9|CoQ#Jwx
z|2|nRji`XQ2B!+-Yg7>sbOfm*QY~1mp%0$T>fihF&E?<!$J2NI>1WR7>-8q?Y=-Pk
zJ*u5s{#pP1XrN#XHPiq=h8k+9ZxSFvJHP|jPsiE^LS8lj+4{V0n)vS7di8WsE}xu@
zmp7*Ih-(gMt$|CTa@?_qNC;F|1Ds&H$t^ub(Yo=pu30^*%@!EZZZnp(hpt>lz|wt>
zdahSnr$_t9WS^PNHu&&<dCNsBgAM8(m~C>WR^wp at ko<W@r&UF3)HMN`K%}ne$l~+h
zG1JNaHuGy5bIL*ji&3UbDN;aejsVaMq%{yvVU(~6R8FDAb+B5}xi#$6(y$1fb!*<w
zH+Lj|4qTYSmq8=TasY$LlheKBwf?;6?c4{LcG$rtnZ_jFv$TS8ZPU2(I^Z4OX7Vsg
z4GI#=Rv{7yf`PK!=4;lK<V#CEm9_z`OeJCmC9UPK>r2k(ZS-DJf;Mo|o}&VRS}W(>
zHP?6AA~Nb6?SPKf)5))M#y4h->)^mCiCfE9_r36G?|LSNCCuvtMD-SRD%(D at ItWQC
z)8FuQ0HpyAQr96Rhz7%!?p2{FIl%FCl@!`2>Ly{mF7(UKZ`Qy6#k<SD_YdUZFZ>E#
zeC|v0)q1^2z4xC!^(q@<Y#elKdY{)l05VKKh8k)BAVUo`)VB~20nUpz<$_zf0GRCl
zjy5r+ch}|eOV5v<KYX`dULVmxsB}U~6iPxUU`|<4O&3z+uE?6kOvP!l*Wk9O*rsOn
zlchN~vEF26PI~{za^A4sC%DamgErmS at 38-Iw+Y@7yLXe3#A=*-HA+_2TaZQw8WXA$
zSudr at X-XTgR!(W!ctD<u&0*OUOzNT)1+WI|rVaPA=6?)?!Ue?ysvA&o9U7llQaS)=
z1upLaTzDX$2jn@3vS`KtVggeE(}lE%!nG?Vo)Hu#oJW9YgWwc4bIX$MI#Dv(6%{5(
zXAfkAAVE#g?$eNND&V;vTU|E0J_1l;um;n#5Q97|z7_my>1(P$7l!BSgS(JG*5r*k
zwN|%g+q^RpJ2xG(MaHeDyO$i<cJg#?ypictJ&e+QuIFE{&L-@1I63>H!$9ZgSK52s
z2z8n6{mC6cU^#z1xY8Gzn5mmRwlp at u;|QcBpp~u3MCQhp4 at 82|)sjM!ps5rw7C5V~
z>z5wgsekuR?yUaPpKTug!mm{Ce&)}XtH;mhwbQQlfscHvcECp;fb>Dg06>NsY5*WZ
z4K>ua2oSkwDuPQuNV)`&v;d}Qn)vK=vwG)jcKYBspWQve^{MJCR-jN2f@?!GdOuhO
zus4R};G;j?$Xb9-u0dNCR+RCBWG%+|lc0gNtwZT0XUrdic7As^gQVXi6FCRJJxp>M
zk%i5X21q;IC;_d_fk~4&C~*R*X+KCKRF@$C9hK<xt&Lg7BKbKo;9yj)qW$+nfq^hK
z2os-sI(-G=0;#-(fCQo5<cYFAg}^ASuO<f31la-AXk)hfO*C$;#K?gQF!obbKr!+N
zJQv)f^eIbelpbOL1p=k52?KRXacpZByekGf-7U1>tBZm#-HBwqNxl!(ocm{=cLEGg
zbmy&Hi>-#8dKSCd0~dhXqRIJ1(qa_a0v}tzq7O85TX28Q<*F|Ya?q1?P|Tf%L_2M{
zPX%|x?>%QZ$#zv+Q?6}b&IBN+UB_fuEk<Xv2O=fQz=;BF0BHm<Ddw9a{qocM^;aIh
z)_mqqZm$0R&#xc;(x)~rKJ&$s^^+I#I>vO-drJlsbq{Q;{qr?0o`R$SfDAPh{M~n`
zp at tgjo1^+|%<ku1dfN5`g!eQEySA8po_0S|qyf;VYV+>Ny!pLmR#SO9%{R|K@!h9-
zZ81*=_g at F!ya&t<g6Tpw2^ax7Du9?Q6&uuw)wP`jbX`(*BFZ1R_w(K0!c6hm>P(m{
zF}$CCoh!$!i$5y$6Q^5Fj|Tz<w@~fqE;)oPTbSBTwTYX}p*VIqAuecE%6%6>lek8P
zTti|)b3p;t5~Ph=`HDTZ&aEjF0r-YZ83 at qSfXY{a@)3~c=CHeY2rBL%jSdkYNW|^V
zIcWi94<qEM9kVtdW~hz;nt&t$+PGF?4bcsl#zy<n28oZrYSSIl3LMyyU<)Tqo{X;Q
z*1}S_pk6w#(O<d@Y(;#7LGENG#OLxcSQ&z7AN?G%7IuEM0TM%<3us||q4ge96$d*`
zj}kK8phnXhiT1Mzdy^9FQS$nOkKXsS8??2J{zWg?{EGC)YUMc&9kvqDdtjK8PvE2z
zxhG--6{kCD>qKnfnyxu=A;0FY`=BMclT~nxkZhf4^tGJ?N(CYv;jF$cZ#^70Z$2zG
z|Ls3{`sCreo4V1lJb34MvqQD&Z*s&7-dlEW`=+lK8Ep(T)Br$+8fvJazKMVcT>wgY
zoV9&rS6p4QZFgghrg3*CNFca2?(R;I;O^eI2M7|}-3bufgN5Mk5<+m7;D_g)@yhuD
zcYoh|FR8U^j#;y+(p{6Q)&d{D++F6v(T@IRdVc;Q?$_1gdH>^RP2lB({@P3=!O5{f
zt?N2t^9=Sb2WOIBECxOqD1(_Hc<wV%w*81BrvG!&bNI&;x#%}%Ne8!-0XHh`cZZxj
zHP64=j#*6|huY|QOHQ2A2JBo%lKMV?Ja7-hUdn<hpvh3q;Jg!w(@2kAnl_e7sJp$A
z@!j7{&z^zrbTpiBAmU9E5Z!6S;6w<O=nP`V9aZu(t`(nsIls)jId+vUkLe15Tv%eQ
zMjYKBiVAWGd}8S4{+<|Uny3mLDs6(IVhG0=>;y^yhb9IZ$6e4&xe>ryVOdV5>u1p9
zLL+nijq?vu6{htn>SLbTZ51 at 2pS|#8-Pn1=t?jhxmUl}+GzCK^;g_Rl^{uA&rHVwR
z7H`!K_B8Pkz-o^CQ%J;}qVl&w`?a?<_S)Pw<ozJ$#wQ`=TKt2+sJ!W5=MzPX*(A;t
z_^Y*rw7!8qpbA6G<gZF3GJ*qAH6Jv`u8!%Gd;+wFwby0mUjB~KD|cToJFNS-%~$cv
z2|NEixuWj=a@DU=xjwXZ`^E6!&ucrwf4emRxL4_R7KyYGPL5#B&D>a6rUQ^*=P#T)
zktvcfvGC^OOj4x&n6a(W>k&jX at U@>JSq+5qyDTvgWQ3*w;s6a;6hYtJ#)BI(#nNPW
zd8#_-ThpI(M;u!8gi%K>$vP;1Wr at _=ZoGvz-LOBQ&aR%lafmSLd`oj1cYHGOUciNb
zWR}?0nL8G_LUieviO*hM)CP2zoJzqhpzDn3p+x${3$0LIarq}WSWNmBcFqnV7Y(Bv
zLshYYZAauAEH@%@Tgz=z1{FztQRC`UA`mw>ADZBst^>L*>5<>IeTbZ?ZGl8)1yAc9
zhFZv%dPH!9$+=`?(|%5}RC7~O&mO>z5-YzlJL1|nFm;kn#v#a9W#Z-JmZb3PRJ%SC
zZ8u8o`858AFJzUZ0}225kX2_61A29V&UO%f8-%_Lq;B76kX1HvSi4U``!T6nos2tc
ze6$<C$~tAYH>rf)`m!jb+_o23SwEK#j)#mM>hQeJ`YF9X@=LXW&%*zTdH&^zja<ar
zEx0W@?Dd#QHZ9rRDAIe3vEHB368at42s0Tl3o7$EGIqu5@z4Hmct1b<o(`Vs!AjSk
zsqF}m;=g)4iWRd`@}X64Xv6pY_tHz^(pu8&)u-E+>AeV%Y0ldU?a<RzBn%8xS1Ud4
zO=nmtwUtfJ2qz$Yxu|AJMQx*KJjkjIUAUvyd;{Uz>FvJYiivpgx4_*ioTO6t!hCZf
zV4@=2Hz;^~?Y5OpeO$e(Owsq2)YHCdsqs_$+7^9tqo$_{7A7iar%!xGNw6#d(3P%E
zggzT90;o2EW&B{>*+s)y2PqmMoTK$g*`v@@i>Fqjc`&6+4M(E79)loWcK6sw(h}5>
zQgv`Nw$X5r7%(T)*$&iVMEe5YXcZ+4kHy+TXpwaD4|Pl?Asx0x?z)@)MB2W}Tu03K
zCK-S%u at hLXW=RIXR5!HzmMDI3GY24~3?`ZVn4u{k<aGO14wj+G;Tkd9+;j0sU(+&t
zt~k7IcQwf#3Uo{AL`!(6EQyG>Z%gcr`jY|kO!UN{o8>lxH=$scNm8F&UC%(3AjwOl
z{;5sv|L~#gi)BJX14FK_dg{y2X@}RX*Fb%$7 at 448jW156f1Y^##)n#wr{T8vrVXut
z!;nNY2 at iV8S31(B>>uAZt8z+7 at zquYAqzj>m>ZK1NdYfL^6}Sz>E*nepI&jn^L{S)
zm2 at OHwZ}u>@HcewdT*kJ1I<>j6eJT5fgQBjf3mY&z>xKBCmfAC#GC6F8pU5mBq$Ox
zlvb%D*kbgePUp#vQfq&xs#@7c`PyXBiO#CGJTJK+B9brK&F-H48Y+=yk&G0K2vx`%
zM*{+V&^|RqA^!b%cwaPt#`y%G2sB+zCz_mMw{k=68D?=8QmD7s!8Kum;xH?GLVwiB
zGv)5U#ji`EAH^3|1Xrh2s{yyg8RB4Wh|#AYYoH2x%3h6b`0TPQ-mD8v;~8N1(fe%I
zA1%+yuxZw?C00+`L9z-)gDuy*pbuclW2XCyM4V^SD=XZ&1ZwrwEvxvQqEn`b3b_NJ
z7za)}3)>7XFjN+o-NGbMDJB(#e@@DK#$wDe_*Y<vmBBIDZ{|AyaluQY^w*za!E)4*
zN)Yzm3gPcd){~xO^Vc@{7dzhSFCoUl0T+9rHt6a<wHdoE|9X>}&Ax?U3<S(X`|FZt
zlKs`Wfy&_J-NJ!A%XJp{KK+NY@&!aXothapK6AYLs;$wcr+xm0Ec9<fw@2FZJ-t%k
zj_(FfTYc6-gD-ic--GZ6ZjK5JN1I_Qv{<Rh67Ctw?QiuqlAWCn%D&5(E=mdjAC1&Y
zbkm0>J+s=*2l{+_$9`s|)8;soqQ14L(5k>W`^2+(<b}(EyAw-88gfc^^xxw(o(o^Y
z at v?MUwg_d`LknP0J;<?O#?#=@(n%W(OyI)XO=v7XEhx0lm0K)RxW;ZPBovSW?*x#w
zDW&?x&+OTO{&zGt37So0!B7Jqy#mS58UEk{-&gTOTCkY`IT1r at LR8%v*X|05pN68R
z9N%ifEe at PKeaKc5%L6f?;}FBK6qPguwMSZHBb&5g;afHT<RJeB8}7T&vzNP-+2L%-
zqA#dmiAeO}<Felk_nB^0dE<0Hv3P{=?ac0?$SXHGA%akh5IFrDAWvF!Y@PY02%`42
z=&~o0Lp%vXmCNksgbsP<+H9qFvQG8cm7T`RQEg35hpU)73$^#*)IkB`kYuYE^2+R(
zfAD3%*E>ysj7Vf%E|4P>g7Gi(;pj}^k~pp9v_9C(2Hy#eH7LW>Wz{}^Z at lHz(be>K
zGA>E`C61gtkW<dJIRkaWH`m1Dm<S~+h=+K%1wL*FY6oMOFN+RA$@>#IH&s!lJbcPt
z>=Ab04 at jV=vHuvXLhrbzsC;i~G{csLnz)brnq8`Iqr;QFuMFjA`q>KYd|0bjb60vf
zaRpc$hbLtwL-z?LkpRN*+fm3T{b2rQNJ0R)4r60Q4-SRk$tQWjU?K%-hA7pxM|LpC
z`7F^|XN_HAp)T~3Pxy4Ha!ra=?gBi4KRHFM=!^h`H=<%G+3>IlQ|v_vvVs}IM?@(v
z(6)d|h8K^}A*-njM4}K&74Ul>0Z7%Pi#9_bgRa4|%N(vL|8Vf5CXuRXw&h#t1co6W
zjmlDQgxd^m4;_)YI^yq~%9KTC-Nx9(We$DLI!NeK8#e%{a3V^;-g_Bchd<tCgpveB
zIX&KkiK+?k1Bwl&L3IF@E!CNTOTCmL7s>xvKdVvu$IFN0AopSJU_^kvtToM=rRWVA
zYvr|%f8xq)P39cySOpu$2G4b*(7XBx7tc93s`S)3{Nhrf_)bT4i?aV!e7th{EFiHC
zi@<$O^IWs}QNZv#>z-d%WNt1Sw<9?j2|1hf9nT9@z*U6Asb(ers{aNF&nYB25mt#v
zM8MBFrpD#-QL>hCVq{)|bST at y{08e=rsui~`Hy^;?Hc780p}kn=JyLH$fJFx7G<}h
zIqZvJ`q)d!z;=(W_8?yY+VoL2eb`Wdxkh%!i{c(21_Hdm`56K0!uX9DN<6v8Ke>vy
z6ULruvP3e8`*n*w|12b4=p81%t@#1hA<GLxBRbpTZ6m4+`z>n_>V!Rg?q4E?RggLQ
zu&WinsLTX&Q#KKe?4}9vP7$pJk<M$v93u$~TeQ6KS6-hOdI))h%*xUG_`K~~QF&BW
z^L8?^ZM^aAJ3O>Jc6n1Q-*F;?^f<ia-7qs)j6dH4(Uo(=Zm4MZRF at 2kP}b)lkj|!Q
z_zg{on&*PWL#ta7@0Klvp@$T*O~V_x`HdvNM<xTPb+{f_lS|z2OBw##tZX{(`zi-+
z+s~G+HUaxQ*GsuV*4$BpL>4q}*7?fk590ts+Sx7!srZfY4o&jyKa%3t>UytpRxF4T
zM7 at On1wFdZVUb6E&tI*FC1FLK*(|B&Z`Ly;AMf3D{kE^9yI!u(ug5C*%e1~X8v!v&
zY?iR7CS{R{-mA1DIJiKz<JxTGW6z(P<%7&R^M)4eCGsmKtGF1EsQ{8;c*3p2ADptv
z#g<E~J$uBSx)jJ0>AA-1ml1^p=9F|~?9TdTr*miff8Ea{_Jy&2E at iQ~B9V0r`W$>F
zJcN$SK=*Nr=x2(YYya2|HhdasHJv=EbX~R^&AT5re>r-rO8M^6(%UIUpsBP#gvBeo
zjIj0N0-}(9;>qo&gvL5L0T#@^1XOP!sgQKy at kq8KA1=T<>spp`_<}H79uf&Tdof3<
zH@*rVJ<(>O!N?#fdvHFLXqM{$jnW6~?)Bmo%J-ZSLm}xOG~8xc7&L+f0(whjy!RW7
z9rcN2acO{A6G(;GITlXkXh@;zR<S2XB^3B8*w|3)@0?+gdDbYi#DgEvnU#pWZyu|3
z9d)>`WnQjE%%8fSJf0r!vNFqx1^rwM*ziUT^>CeX<{KaQ7f1n<r8>vh>8BZLSG_}$
z6y~=ciP(5IuzzU${}=Y;n)QW50`S`{4B??hC=#ion)gTgl*0P!y#B|VJ0~0WBj at zO
zB)>Xsa{k^tATQLs6*HME0jAJ4l8AdJJt#I?72Ch|g}5V?v>p23S$gRiW1t)q4xzDG
zp>R0}{q;ElsDK#k1M71Gt?(x^bB$+QRrd~Ipe)ytCc0vi<Vnw9jgF0CeE5h-r}Bi-
z=!1wsEn@@K<EzUM>kG2hDzo%nwJ{-}2~$L7(7Ayh?r#}k)Y_i-vVyp>>M9Ty$#K;4
z9eepTUPGho`WbZ-o528XB(W7)9I7W;j5v)_Wm{I$qX##;*wj0n(;}5n<A=}|SBHWV
zmv7;|jE7*{ie_cDAklfO?MgzO5GKw9$ObfeY<~XYIR!#Mb;iN}li7f)T1T7RPpU5z
z&#S?S|4u6nRVR=NDLfC}3M~;7i8^XH1(rF+&LyP6jjV?@U{x_uu<95K8kaWA&}k`7
z^DCa6UDe%7cN+=$`vqr2N7ZnDUibFX)7I=%ZtRTLntORHkc~L%D7gj3ujNgntbA*K
z+PPfQ7kOjud7m%vT39Oo&A(avQ&EbqY$7x~jG-}2l=$bp6UC$xe=d1*Cn_UmMr5x8
zaj!S-k)L<oIJY&IXH5D5TAW=&T}Xl|5TgOHbn~%v=Xsp`NP^$aC3h#)c?JLpi<~5M
zT{nUdE!V*V+6wxUV08VwgmD3bYvqMjvqkifVZ|3odg03apmETm=;s at kxA$W19w-SF
zFy0_ at AWhoal$JeT58@uM0<o1GObePO+6c&Z7Ud1<ABGY(z`aq{!*8(VBB-c-4$)iD
zvn^|=#f{91I%<J~gl2PVW+Z)iIn?-y?oo_YRNU$xmPv}Db^S}8OpB4iUQk8l=)t_e
zTe8s)A6_6nIZNux+-BF+DlcFp5J|FhCDHwXAmIlHuij0XqtIdL{U>2`n at 4Z>)65lb
z5}Y_?ZsrMi&ag8elo~2;g;OV?oaPANhxQRPz01f@(T at I@@=iql{%AzD(}*6Ek$pqq
z_l)BwWs&PvFaC{KYFu at V#A*FE6B%P4lWy$Du7E?5Nk6+1I$ntII#%x-zBn{JID3NB
zeswT(zVM8VKSaFBiT>rL{2ySD&EGSSH8?4caw31C0kSVuijPPAx{s|JEvzx|+0T2o
zUE at 6SbGs&&%NeH~QfW%SXyjygenKEMz};RQ($u*N_4UC#3H|<rVwxQgN|luvy<^!A
z#-W(C3;KM*>?XV1PIbL@<q@f0;xe>5^0RzxS+4fPA7_Npt5?bPL-e0y`%p<zr)wYq
zu?Z8H-+vAe#iYS)!URa3pKb4C at zu+2HNg$oyYZX+2vmE+psI|t4UF1B!8En{a7FJS
z6xk!J&8pZ=jUpL*(TFa}$r28`_#1)4^c(Nlp0tcpR5gu4(3UZcS(41|TL(fLW0<bo
zQfHaZw4Ys*AouSmnAW5lXqpxl7v(3jEUh&mR-b&|VOL-*g7^+@k0^}}lF`#gRVwuX
z&YQ^(omNy4J;Mv8!)2w#HUGBv!kkgr*e+v?PFBIJL+9r!WSIT?4`g6e&@7+*)!^=T
zf7Bw&Xjrnfh(OX_J7u`C>VMP9hDv2$1BPY at LCx@;j at H9*uKsnaUE8Bcux5sLpur4q
z%)LH+zHUX at ieXD#P%_TUUVYgQ^uKVH9ec8&^*co$+{%Z^b5*W8BQp(6YJ?Pc(TRPz
z?{GisBnj&n%@*H_uKwu%kk0<IMvIh_08AKE28<G8X!@i_NK@yLTCoC+jHN6-gYw&y
z>#~%_Uay|-{!%;me*Ep%2B{?^-2Lxev{mMC%@1gGUcWYUOIU`fVIhT!^C#5g9TiOV
zjR7tM!=9;mBE3yz7%d@`89S7a$<)*}ehh+Sr4oK$kNG}<=%p(NFCRW$)KkFZWE|h3
zLMz8b_mgz<5rG`_mlmW_EylFrD|&cTmn&C`O`71yd}I@?QD+>k(yB(_J|RUZAX{`A
zF&MB7Hg&E4nlJl1LMKffpHy at oAc3Tk4irQvY&09)`c$E!CSmb?3{i6}uLA4fj#0}}
z-v6<&eBn@zBG}zE&)6rR<(a<QP%x0YG$RH%<NL+tR=NH!veQh5J%rkkwf!B7)K=|m
zx1;Im1606p*Tk*0ga;49Jyhlv7XRU%{olYK4hnWU=QKBd-&l#+YNg%uw3l2pwlXtf
zeI5Aadg9UcYJ_~!i_Ia!=@z{&ZUvBnvOL>U2A`r1w(n8oIQM+xSEim^WUntkD#U)=
z$mTG_w35u)1DXnJu%p&19Nj5jK^xbqWSu=x=GMy&L%A{-G<$YgP}TSbP5fvxnJS?5
zCeOUt*kd_K<h9jNLJp44-?da>R!o_<2~rI4qLB$?02Nk1D4q_XFEej~%v!ggg|fKi
zgD*#-r$bBc?16=bfOD6kWSOP!(S$tn%=as543FS;OI3hasHv$P|HusO=%x(oG(AnJ
z&Gk5GmT4(y8w8;kK-YO|#f3D&2t}pH*0J%epxivknEcMgP1~3T@&or#MwY0Mz}!9p
zLV|<j$xEY{OtGhCZ8bDQTJ-Xb#_EN$4-1DZuS+T<u&77Sl;>ye|Gacx?M$6FZkvKa
z>sfgeef~`88fwmU?MnqFcKoFCByX~59_f~ush^mtX@!^I{IbgW6TIvy_>j{N5dIIR
z#|K&BL0=j}2i{mB&>VUGTrM^*p6J4zemNuN*{SundoJ8~;5Rm|KI|VO{?Tj<q%%XT
zKuji@^g<++L}iUt`e5pAYp{XoC>o_KE72^uB~TAq9+6r$X?;GmerrCDXJ at Bcqu27y
z7~fQcW2^aqyE~@LGq=Y64HaG4`n~S~AM8~Wyi(GQH+g-E7-tm1U20ODe@@A{3i^O1
z3K;&%3#A<{C8KM(je<{7rsKH&0e>JiZIQ>IE9Z at u6XW5=*-YKw7E|XRocwba at 1wrF
z?m_`d9(=@Wl>;A4Yg$quJSAcb8+GoZPEV^CZIByW5tj^pUL))PD^}e~FJlnS3WziX
z)>uV6C-}i5ng(SD?SW(AW@;fzr$~tMz$q}MXcdBUgH#j0Xs4i5LwOx9-~1o8)UlFj
zoI(oIV9S`0`#*uzUKe{URb^?gm?-Y3tKOB<Hd@xMjQv528n@u5q)(%0RMTV$b*QXV
zthuHgXm&>q!ovtXX4+1|u=synRa`Jg9+EJtyy}L1T20 at 3Wx%#+t3vJ*$`Jl&|BUv>
zq1%@mV<wRt(+=ZmmX@>4ywE}9gx$&g*<e(01p7&s)IEd#ji4Z5BP-9H73<JLqOTSe
zpLv#o19~WA1k03rAu?xcuL^f*o3O)zKaCV^mQYh(>bs4*#uD6;N_~u5l3o?DN<_gn
z1ir_#shDk&WxtVd+CpEcbSjQ)nKK16O*k?V10*UsJbEYtY_5a^3(VI;h58#ksG_*$
z{cS;IlLP=jpeHLKs-YFt_O^P_8r7;g9{FfNlwY+a1YfGrK!Uc8KDZ&HQGaf=hPRc#
zkht*6KGtU?=vVj=A|^{1D-gh_>}CaGaun<5N*IT_p_fdhL9KT97*Xi3KVhe{G?Y<j
zp_^*v*Jwo^A{-1LXUq|5#bEp2FwY-Wd@hTXK;qRU=YF{?y<7T{TjVZLo}Xrwt+Nr}
zrB}^kjJ>#M8SksPP%(PpQ^Ro_X-qx2_|)S2+TWGzfs>h_XXsTg26&Zxh7+Oi)*`hY
zaGEbL+Im_xDv!to3g&7%D$<v#4qk6O#>~-+6r3A%Ds9d2V106^5e4Rr5pgn63L>VY
z>_^_(h%G`TMb0Ml$sf3ywKU`R4<~$=UF0>#MiyA3=p1t%=o#osZ$Su`x4>oBjYT4h
zG=?^3CzIX?L at y3S8Fah6eIZ2gOmHaj&ThBOt*%fIcP>&RV!Q~N7&0)#dRB=yd3B3P
zSuj$uImpPRL;0Of>_Kq=6C5+c8)g%($8>s56oiJCt`}f4Y9WuRTur>HFNQ3(4(=p)
zY7qX<SI{(81#WOn-ac9pF%2JL`MyUeaYDPIs`m!yX%CP`4ZwzqAGXXP&R53lNkR&#
zN>CK%^2*02e@;NOEv>X%nek5#lKvdFEz`)NfTd)%0Bl;GhcEjJTJhwh@?#%f^=y%1
z_h(bOzn6#?FMV2M7%+~S2j@^>gOcil{)D6tRj#!l;Vz=Odf(C7OT!2jf8?|OUikwt
z$TSjp<BY^n!(r#qx7x(0%4@pU{_>PzfgW#J0{>nObp_5C)K>1EJtKuWu2aU!hiRb?
zSNo(O=nc7^Xxlqc>Nbp!S=L|ME`6L|@uj+kwHv-&W9{YV+0zxM*RK*tievtEawuY;
z{ecf#IB^RsX+5smJ2NM1;ES~i`nH59sG83Sta(Csw+3An1Zd|1t$@E*RQN*~(&>U(
zkk^>amxi<?-v}d;_g>{TPc{BrOM_yt=4Jn`tN6xvVGn&xsMNgutY$rAF7eLRs61aS
z$Q(TpmqI at GW0qLs>uRT^E9_L~1O9?HA1J!QLkS~GrM`S-><Oi~Yn2tK4gzPCh}sbq
zwTX7><r%$}r<j<kQmQw~*^Bwrrdv}W6Dmc;K)Stj|Jnw%TR7nHuZGRpYl>xZKiD0|
z`)t0$sCJ><<QLUbxDlq^kqvK6!S5E7vlg(5fn;rcd|Q)%{gS2FImaYB;6K;RtTwuY
zM=7N@mP@+K6UW0u^@?e|LiY>pr-|K#aU%i2)|VL(S#s^_(;>aPdH+7IDicL1Vj^WI
zHpmnqIvfROMUZ|yLtzh3vQlw%z3JxKvRsbtS!)eM;!hfW)krA^z$O%uo#Gd_rzX0c
zaH$3+w#%!+6(4Q9RblL5b^so^z02KG!C at c=MC1bg@|#~HI6XzE*u|FMo{0D1NFeaW
z=0{NkiS9)Gc^dZU5kvNTGqcvTj4XBGTDDE)1(b)W#D|rddvxms6(KevzRIG at i4qVf
z=vAr(->Do4zE*Pl2yFqLxigT1IDu0*q2)jc7Kni#`6PahG$&>xJEa!!_iGa82C=4$
z!W?qyn)rI%@#{O;Djwn#8YmVt1}>{Ae*5Lp+vohQInx3+#ED%CgPIfbV)Ho39}2f9
zGS^}?W(?1L1H2e at BVl{*@z-Y^i#5loNS+(_3Trb6==ERmPBIE}a*CxdgB@(~CdT4(
z>*KqZZrr)rZ$2i?@GBnV-pM}g3~{biYGXNckEfBM$Z5(LWYQH8h|2*@;i8?EaeeS)
zg}Khm4{xH1a?*s9sfYI at zRft2KWz3hdo>961Cb2Wr|2RxHCgCK=N3zGRg)<gSH-k?
z7QOm-sAZ7HM12%wl#m+UGbfxA=bcBym1qPKl60GF!U6WcYOD2GC``ZvMaVY_sV~N2
z65bAg!W!LWFX8}j5KOe7CQQ{TI<GP475u>!;Y#4`D$&X-lhr0R0%sOKQIh~aps{Sg
zE^s7}=<cO}+tXykVQ?hjyS8PB0XAT@6bO$kXC{hstC%Kfq3$^5f@{$=<H4B0A9+Q~
zx8F;Gq7jSU^)}3n-IKq(_U}l-uEvyeB6v&eFP9_ezn+zqGq}#x#xx0F#fvf4>^|p^
zn;V4=EucVelqlE$#M<dj!}8-Z{}r25F~*003>5PMrf4LL=IvOtGp~G&kr^MCvm2l5
zlgJ;s6#YAmO8YZwLuxnB2;#9DYoJk3Ng&Hm0!7{|0KG>+1|Ggtit+l`hqR2r!_L3i
zOD3mk9lHpQ#W0F_YaFYN)_pP at 84`9yn)}$b<WBH2Hq@Eej=sRe)M>(9Ze$!@z$9-Q
zLJ&v}Ie{BPwenf8QlNm~0=N>+5P1#Y`i2MIN=gG~j@)P+vNKn#5Ez1Kbxrc-A=SNV
zaLa(NKsO6-<}#tJPSE*q$Z~1kyYOjXvLl=uU=oKCwJZDHLhN>PzH5gJ1d`lhRmW8W
z9r%Q_WEARV6&PiwL;Sp>b+Yqv*sk`G588qv)AkH76TG4|+cE?Gh<e}bv)L)_5=R at v
z_I{{RRP#SPmcCw|?(fFS%g2YIZ at Tc$jrI)I$Y+ at ZGHj0aNcYVlY(Ml2vKHHr(;giH
z`4Kl?VY{*TloQH7O0;}df5)Q;6Z5z9!Sx?6s*lzN12O?=_d`qL$D7MjQ&SHoWb3|9
z_wBbY<I3klB7U`9A{n$@0rBqyG-Bn3L=+Of0 at y<&Da$<`76MLPg?m@k`dm@?>~;U#
z?CUPocoOF&sHXWOeP%T-^d$-BT0OwfzyfE at P9|C*86=c)bqb(F$P5r~P9dT9a1Oz;
z0CiPwV3ZfDWty+`c#q<#MEI0BZgW&)sVsU5KyDZ^aC^({q~-EBmK>@)@j>sLP1wUH
zXW>uu(t1c!sl{w`fBl62;Nk55ZP6kUzzDi75v$U&;<n|CQRl2ww@bB@xiqW#QhIT<
zR#E;I{9V8tkvBFWnlPvK&7tw*_1v$aQnesC2!7r>wQUe+K553=@BT{nYR75QG;VMd
zhFB+ZRQrbC=wpm8=3)z)m$5``8(QemjEw=m#rK5>HFwMb8vxmVw6uZcr->^b8l;dd
zGBBeLh50NTC1K>x$6um|lz<YXhLNWDK+C({m$TaKBy!)7lc`;11qZkVM+AjZ+8+P_
zv29jAnBk*JxgEW6fi=I6*tsy2w-j#QQ%Mg0Sug~vem3?~&2J2?Z=)Lv#b<XaVkc{!
z<H%cB3 at 4!9NECi6&o#n`hbYlRli<+7QvBk5W;f(e-`561$tFz805K~#F_*f{{OAv8
z=(G|;;4N?;HDnNg3;oe|)widefz}96I{s?*v(H0R3`Z&!d0IjvlXkjI)F9i0D-gfF
zMwLzJdf at WcM|NYm=*b<=QuA$JCdbVY7p<ph5q*&W7bY%eWRzm8FLe{Bvx=W<1-;r|
z9ooZQ0RBGuvt-bqq=r~$UV3-MCo@NtKl0FFi<#J%tnwSug_ELPsygQ>@AcbY0_cB0
z+yU{u at DdVDJG5wT?ViHi4;h>eOe1~8uMdAc$^6c0pBE2?gda(h4r`TCBMPU&-#9Xs
zG}rtx;g{@1g=mFi^v!ylrsrApw1pQ9`aG|@6=f?yT8XtH^4qLs=>wOLWE8R-a7wFt
zpeIt)$-{942A+Lryo$2>00o}>ExI0_pK at AE6geOlls-g%d3`Y;IyFQJ5RdjQw2uy#
zb?2M)@GwdF<i3#%wgi<7d~!iHagoPCp+=(#wJP!yEDdA|e^3#`jb1SZvhI}VG at _{f
zqmx5+IP=HSy{Sf`VCA-rJ@uU#X6d<hH^k_1Yo)DB9pVIRXkdA*gdPSuRAhOx?xW-Q
z?L8-}{BYOL5BnC|XNHsK9C_z+0F2%_I;=0M#jKfj1{M|0=>fl(@LJh2UC{FWO<uhw
zYom*G)g)IfoGP5Ik>;+xGzXYooRdF}Z$Dp~4*WI`*}n!g9P&6hd0`j2pig5bR2?()
zp)r(Duo_ZS1Gpy_0eT at Wm(|%?<_lbJ;bN3%jv2Qp9&$bbVwVLW`N$x_F+rSaMf*b%
zN!lK>vIHP<p6jRSVnzNmgBBr#7Wi|nhRxr$D#<WBZZIaW%;|?Z{0L$sF at TG64qRkU
z)xrSe6q^Rju@`_wfKoPC88%@p4l1?y3D-o<o!@Po3zRnuXWfgj{EZEteyCwOb?}u1
zZZ+?m|5DdLWV(PigGZq?Rr9{u(RFok$sn0MhQq@zHtj|;0X#Gz<4;Ag&e$G-&^wDp
z;ul4Z6W+q&DwU+B5#rqmCtJWy2Jn4Oz{US#X!<8YmlG+UuR|OaME<^}oj+5P`*n6a
zFTWk=%?`=1Od|TF+jF&RuTZ<z>t#@YhFX^sY!0*vb^=TVNj~GgX9$K1Ud?5XWRg)!
z6L470S3@}M`2M+zHchg|GLV4?i5 at 6{OYuv~3!N5{0>RjH0?aW+4mmj5mWH*!OhKAq
zU<CzM%+E|vBBzGnA4CNy)Iob<z5-2R)YzUgl&0p9?+(IMG;xdMWHM>D+eE9hWioLO
zt{L%0-TAX^)umlu=DtHA-D<R-4h!$`Mb-p;{Gy2rf_*oG#e>=~y)S$FYs1Lgr~b6(
zi95M7rEFi2zKp)2dBx|h+~eS2e`90KFV32I=Ny(5{+t|}zZ)wmL7#wb{{?(#*LhwH
z7<8qjBNo;@Pw%r=3LAVy&Pij)y8_kUIILyh)NcIVj|<75$L_WAfL+`xD!g(0AedvS
zA>pJ$O`%LQ51;~<c&lK+e&+um`C4#D*@7F5x=4?LkXAC^8^)d{r2=25aX!1RObsc4
zgde^~fnyGkqp8WKnry7^h;0%5jH2RNBKI}uGcQ*~XhA3i)IC}Xwdi9g9bJ*sq#aYy
z7?CxXw5GIGgJ=`~4E<2KgH2?~F;vRgtV$;0qI6;~#`w<fa@$-oQG6;mrmEYDD3Pbz
z;|bx+1^CyZc@!`>%ItIt#At;#FrXtlRpw^JPBl(pz2-Pv@%M at Q681cTJO19uon;8X
z`){sA<rEom;a+GCOd}&BBk4R}&K4+Bvg8?^i+e4odEZ~VTGFq5s!ZQpORZ3fUP3*v
zXM#qi%$`naD%cwCA}G#4$1n*05jz%J-*KoYl?DUKr6Y`hP_|qomXbe>yhO_djfN;r
z;t2V%Q4SDA+A@?Qw=#-y=^l8lEW|+pR0s?x637V}&?2Y}*uBuIf~a0@@h6Xui&k+%
zgS$dzQ%Q0u4QsR|3=|>;BvN+znlsmZrGF@`tW-?J3SffTspGjOG67A6GHa*%J;}J(
z2S>|zjbolcUpR-JYHK;hyq3((j6(u2_gYXU6W#(MDxcRiUAb#A+MNl1qZuP?{-2{G
z^hDMc|G5cOtV>UBzUt*EWa(<t|F(9cjjN{SW$!TNw9R*Nl{Z7R#aScPVVyO`Ryt_#
z7vir(6Ag}N%zOqEoB^;PQ*S=JD*!}Ip~FiKq<WRx;i2Z&)j`9o;Hh<KI_fOcWrB)M
zAhf|W@R(5Z&`5w{Fh6^Xs)nLi6PCA6hxL4>)TBfa4p6q_cvz_o&_m6cRy@&p`O at s^
z+39TH4v2WM{MhkL{H=io1tu8Tc>-ahGdD<HrPenQgwM%2iMPDiF7V#qsD^`dY&3nz
zJ$U3&=IzR%dou5|SAekNTyx;#_Vdb%V3DD!mZRA=0p8S|SNj?lTleGP?8v(K2X?nh
z{;Ss29)gt*)~xS#F>VAbx4ayn%u!LTk_Tp at oOoL5r~{?jjz=$APA~xQuSsp;m#oio
z{=PoXyZ86^H$2 at w0onuo$M!z14-fd)F&k_CFP9ZowKbKIm6=rjkE)u_M-C0%9<C`B
zhjiT9j5Rft45Nlc1+OaaLK%07DJfkeQYn!Pj)Rie5@8aG7DuWKLu_}$A&++3?mN%+
zmo4GB2g8~9Yt{pPsyTN~MN&mqgYN<S!*$CNMJrzZ#_NGMe<HfO?`xJy3StX7q8Wbt
zbvDqzlq9q#K0XW#Xm~lO)NWt*#!n=~Rj<|Muwe51PQ}Aif)~;Jert++ZFsGoiJo&j
zE~e>_D<k$LB=UUVAs7xG3~+8`)LnykbK_B#)|OWs+z(tD`?=koAKU9YR{A`Mt8%Z5
zIf~c^+(#In=DrlII;b^9Wc$u+F~lC6HOuY)ZDy*VQp1^QoI9VdjxCT;#mVg7-_<1C
zI30b;HF9{lz8mG)=v?By{vbTNrJ5zh@Z;cb0B*Tptj_9&$gJ`6Z^zPOOV?o2BSg17
zE_I#?d1X*;OkCE!Djz$$o04SqxrbGTX2UzFa6H(bBi=dl=ZDg+2(uR?%)3Hj+Z-f#
za1WBJV(0hdDu+nHL&1f(gqa0H(w7dVVh#U`k+tg><AD1rX0@gH_SxBo0_z(_NxA*H
zP6xU2$mD38@<@%M{*~nIy5qTel}{7LHxD;+m4QcH&-d3|))~c=n1noOe24E{CS0xF
zlZ$uf=c2~eds%UixAw9(_XzSpQ$wYcOnxhfWX8lrc1*?9{~168LjZI&m4B2*+KvZg
zc%TmawHt1xyH}Q}=N|f-1^8kE!yE7a{OQY>9Ogr!rspilvE9CCm#;>TyS+}+k5`=t
z9bDCDh_s+4<~wKP-GtM)!vh#-th7dnbOyFr%fs=QJ!SUhV;A0H)*lLf8yZrS5d0}2
z!z0lK#L1?Rt$)N<Q+K^#<C0{u#4#Jgsn8)Lv6W(UkrH<iX?D|Fn4TP7JGrSh75~S+
zH)Fw3N`6J_iuy#Y`D7Ul8|Vp7?1E(c@h1#2N}*TM;%(=NT93r8W~O^hd;*l{ig$dL
zZe|YO&Gu!)$0Nl_z1xlA{A=Rwn&|mZf4P$J0U5agK+u^82~{~hS!rT|>E>V~Ih8my
z#TuYBp1c-`4`G;YUFn#=nukyEfxlXEUwPmlKDa1-j{qg6ej{gs1(eJ0<-o)`U-iqY
z%371J5bq00WY+1NSy=cY;B}j^qY?sMbL2laox%@~ogeQKP(C5-uYuF`u&2q9qX@{+
z(*?i|V~S4WdjqqIchmMxZ1v-2W67oEf!g1%GGfY`STOJOS9Ze(7hO%^AQS*)W-+RZ
z67%cQ`ztu}g{b($^_4LRm_{~WKOTltZ$~u$d0$PvG-P5xk{KKq`Is2)I<cq2 at tM6@
zi`Fxlik at Lt32gk{U(OByg5QjakQq;|dXDoF5mTx^pY-k~CSQ{dWRdYy9A4B*$cGTF
z@O#=2%^Jiqw|YC0?H`V3lW}p;+KlW;jAx`r-nqUXC!9+2jr-quetMnfRjE08T=-G^
z!tsph)w7kfh+qx>`4l;j5H(@d-fO5t?Y9!W9>+Z<Hl=gaHI@1lC%%g7OyRE5ossXm
zjn(DYrkT=E#IwCDIMCU1ZSPZJ#B)03n$sSl<O_46%?>;FJ^MG>)5(d5R=AfE5Y0A6
zyWa1b{4_nw&+RFv(>-Y`HoT at wIAvJ_8?E^i|7>f|raLeCcc|w=#aDc4GgY-up+hQu
z2Bw%k<24HGuKl^~4(6=9R2TDFJKw)&?5nb0+?SvJZVjU3_~+dv%xUz*XVY_sgsg%B
zqR1qwk_n)0JEFOR{Mstq@$S4Fvk;D>?7OOLGWYTx9c+Z-^jxIZ4Kk0A5y6X&l76iW
zH+e^{ZY!cTh<?)A&Rd;5KC2`F9sd))O||WE$Oe!2YRz6>7k<}6qKstRq`AYtEwPNp
z#+PTF)3USUBHNa5{f?EZ()D%T@3CULBKl`Yg~quNpbvYhv7xd=e|b&)ro4Z&$mR&(
z3Yk7LM`y8^eR1FtaHq~C#))V5p?vp``6YEIy{X3B?>3J0W6dTcPb9?Q%TExHWB2^E
zo^y9z3=%g0fFZCqbP}dC+@?FN<xO<*j)SgJSgBGy?a?SfKnf^8$9XL$Ix+IR+I`~5
zyUt^IsvR6%9GKbzc%7^Pg;aRXgrQs4Rf!Ni_qwJE81<iV`nKeVgdKL20nXr1VK0}5
v4`v20E1r+;um1uFpB;9k0senH1h>YYXa=Xt5uc>~`Mj*8l0=P|N$~#wzq=tV

diff --git a/docs/images/menuconfig.png b/docs/images/menuconfig.png
index 8b88ccba53e75d6423d53b32487f2984e8dda81b..dffddfa4692713a67f0ae5f0b2c881dd44335923 100644
GIT binary patch
literal 8604
zcmV;NA!FW&P)<h;3K|Lk000e1NJLTq00C40007(w0{{R37}%+X00001b5ch_0Itp)
z=>Px#U{Fj{MF9f<0s=4#0FwX)^c at t_02=c=I5$*PQchlSQB?P7Xl6-j`UI6`0FU?D
zWn_JO@r{g$h?lB1x%HQx^{lF;0POw0!sp%BC2ICy)6mPt>c9H$0OI7(>*L(y=HvDD
z@;0qLZU6uv>PbXFRCwC$ed~7PxXx_mqeV*4RtvIVP0%N(djGdPKPcI9E}dj1=}X2~
zoz)IakyHgFK at gX_EI0aKy1NtJ=!2=;34K~=2}DF-{khTegm7CaV*BK~Px(%0!%EYN
zCHSP78|{d0^@Dk=pWL~9GUhv>ZJatq1S9A<BFG3bNRl@kugRSiTo0q0Io-onWG(WY
z&=G+E!aYK!2a&ttCJHNJrHIIK!|@TQ7fxllySoebFzTJ$*$S!w?(Pov2+O(EJF~ld
zH|d?po!&{#HyodUO0J-aQ`{{qnD2zXg6b=oM?B=a$?x3n)LieVcYbGb1N9N87WwWj
z)7*_kEmu(WF5h`P18QzHTh1<7Oz+|b>I<N%s)o5+n5u?bSeS<T#;NCx$|KyP!fR&h
zFYenKa-%b->zeB4JwI&6#XC^d-6PKb!o$6O_8aZ!BB#1Pl~dQ<|HgVBOZo10_Wy9o
zcQ^VB`s@F0^r7_E-QC?^=~-&}CZ+zl^6gXKq`v;rr%$7<PpRwDOJhvGA^iZ<Q{SZK
z*gPrkPur(s-}I*@rPQ3RtM$X>^Dqoea~zsxI3AkeSW)PXLvuV1!}C3FwQ6roO3zjt
zhLpPF?+ at x>7 at B4n(l88NcNz|dVMwVThVB~Fp>KvXbp6m(IEUes`e8UUL!X*qNd4(F
zq?A%Kq at hXaG#vY37>52hoKl7V)E)cNuyNbk-Y^VJN+}Jerb+#9Xog{Ej;A5 at LzkLi
z7`h=1P3>rC`qQcJhCZc!=$h@(-w at R1)HmtWABWR0oYJXFsXL|S)UB`IcPpreQ-4aQ
zp*aodaB9+U>Q3o+Y?@Pd?2r9$Y=+9<&9ON)sXwMucRU`4{?wg@)1h+qY3PSzpZY%a
zr@lKJo8#fs9fy=sIu0rIr|#6Bnp4-Gn$#SRX*l+$;gn9zaB7-nI31hgv1x`=>eiaW
z?+9wsq~?@TIyJ-b*mtLNI;7N`Qgcf6UAJ-fr*!I1={Th03hFVP(s8IYPlw@@hT}Gm
zhtwTYI(5Tw7 at AXR`cu;!QaUxqA*JDzPRDfUhf^AkLpr77u|8G5>QCv^_otN7 at tBUs
zW(D<_(y2cl)A5*6f7*ugdxCoEQyPv#(;ttA4b)~h4b3oI54bxG$L2VkhW>Qy({VU7
z$Dsm09FI+ZJa%cD+K1C2osL7-9gof7c<fVu>?<Q4kIgU~yLI{>)8W*mQ?ss}$DwbI
z$Kh~Fr>;Mx)E|%i;W(VS<4{384#y$&r@lL$hGsYp%_$xG-*=;GQfjV#ZPH;lJ=%Pm
ztzz?}`qNLTdG2$wFMqNeHji3JsY%1}cqweoqiddd{5RhH&%0OmTa3Cpq(6n;0P2ly
zpx!|J;-C&U`VhJTwYkxU&~5tP*3=uQH&C}<=H*8Jkj585T^`~m+8Y93kili-JTHuR
zn70uGgF#{)PXKFC5c5pdiowm+iwqLr!#vk7f<Nz7BI03w8C2pYQa_F}0brSdek8zg
zBw|;kTL1vdIL})V#}UB1?5eFFqn`uw9J`{QLnQc{fExWg&-1*D%Q)g;oEh`n&r3hg
zn8yY4IAiR_C4d-b#xjq~GS1`D_cP{k;WCc%Jfp`rj>|I7%iQ(LJkG>CE=xa;KkZH2
z?1!NKyqS;a=W!Y5rQ_0p<NOfaGR{l4#5gbg+ at o92Em3RoVI0@Oc_i4+5B)s%^N0 at p
zjF{(ce&}a%9Ba*PefB533r+KnLH&uG+AZ at q&Px|d2aY3GP{E4dashQ55w$S7WgLm9
zppNsnbm- at YrCYlBp`YUdYIIBdwCOLu3#fJ4j`O&T<BVmTInU#~i~#0wiFuss2LLh8
zOU&c4j2JP`#5|76GLQW-&LifTG0x-6d0ggkoVS|G&s$i_Zv$$zGmfa+N^AuHV*kaq
z@5EXo*4miInNc6w+S>j6)V-=ajK2w}|CW}k{r8tr;k+4AyawtEBX!@4GjT1~Y*ijJ
z<)z8T-<=utS!M>wb0_gkivR$#$3>5ab=7NpJgB;v`}`2pptT5+APF!4fPtWD6~;mE
z!X#wW9}sk}Uyz{rr52S`<>e1n+ul9;cn?4kQIdq6Ywqf;k6U&CjQXu|ZFmzR0gA7W
zf)VE?_#BJ#^FRglFNEnt(}^zbP8a~H`9fC at qrp|Z%4+Ja>S19}1wtoxRah?0&;<cN
zveHBsx;g@Y>Etx6j~ngL>xEfyhw0>!6=4dRPEfC}?y5#pr#RrcAXK-S1_0rzFu1EI
zTy>(W!*qhdJyeZnAX!<%?ESF58B|xDm{nO?4bfI7JhT9)WrF9@hM1s;)xSV%EmhhO
z6ZdRX6`_{ai+Yrj9RMsFt+h5v$pFAo@?<$r)>`X@#rJd6Rn4;$%_fr-r<L5Yv<g!(
zASlIPIkyx?l#-!pZpEnC8~`FuhC($JnJkw!a%qvRcnP(w7Tg?e4w%7J_0vFo$fc#!
znd61xQu0KA`qxCuX4E{<RhG)W6c@`hnLu@lySiwmI6YhC!4OiF<y;^trebbNaiLtT
zw=QBXBn#Cbq>35E30E;9;3~^j=-Dg^NEg;A1|UoYLN#?)6IIV<E)*B4hRQ?$Fm<{b
zT at 7v`p9Ly)azOzoju2^~r9}W#(<ww1o)?;yinNA!(F`vWEsL8J at uHbpoVqR&QG}{d
zLMk^<M9f9qlqHI0zhYLpSynNjT4be*8pW|q|1d3+iyBotR23@fQIxLI5&%?Nh-8ye
z788*WH7^ub$>w$N>yp220;cO9=2NCW=x_iIAndY(I>HfV(5X(GsNXr<Jm7$vIkil5
zbA;8}b&0cDb1QInr<-Gay!N)=G|bGsHo8vJy8Oj9ZR-#Wwaq$_;cNS_bp-BCcdtFy
z5v(0Pvr)z4VSE^<*8&XVk*q^P*FAnGF~#~F0X4*K19-HxUiHKu?7Mun=9PfD at 1&{;
z*Z=FzvkrcHgR@u=A1B|w8PwN>Ii62K&pkoLQwj7*)p)bmNXAPiv$cu%kyP|X*)%>E
z)OA8v(M3ovO3;h}(3C-Uu3YO%09v<r1e}0hjgXJuw#vP-3BbNJ@)9uT34Qr;6M`SX
z;s}4t%U;$+G5}l#jvdzm2zv2NAg8|_?l*5##VO`>lrHWxVO>_;Vd8-3dBqh1L9q&^
z7QnIx+<|aMY|C-|d|o;!?)A@C3@%*1h_&h-#Uk2Pw03Q7!@0o7a9OOaCjr!&aL^0m
zTwUbcjPK7|0ns`fcSKRZu{Q4hBUIlEs)%MQ$`HxO(!zwWY;-B&Sz624Xwv$FR6d{>
zLrZHVD<msi%0$T$BH{pOQYMxnp`~4+D$7GDljZ^!ov5XSxK38Yt`<`PGfL5rGKENO
z)3Q;EOd*n2epdC;!etdVL<A<SyAWO<)pg*-*G|GkS_A;i#a+teQYOpAQ7GoQn9C|B
z{991f3tVZ!;)UX-bgEJ9L0nj<Mr0{2?klLy$Wq`+KuF6X6pIkGRh$=L@$jr=h00Vd
zS_<fQEh9^D6M>2PehFYHWkNw%RtZsqh=FR<Da3?pdu0N3B3!Zq2vK8}QpMaX>O!6e
zZn6p`s(F<ool-<YB~zVVsOG|uBFdLfTJM_vt^yaUpn3ry3KOeup#sX}RMmC*D?%oR
z6^9q6i95vzx9mhvCM_&Zmpb8CLe*3!77H&rQOpr}qMNk)RhGpGl&FuoX1L`EqEv&p
zSVbjFm8vw^&Ptjg(|I^>G3PpPxRsUwJ^Ko(7*!qCTBazXcy<?3)g6x({eJ?gIn6|r
zCM}fap-K}mYH8i52r;^dhfYQy;No-<gepS?VWKn#RHn+QG8xr@?bM=h3l+e`-9q6a
z{vZoY)MNh^<^U9ci9%$8$^;W}bJQ`eJD9I3oVo;xOmGpWZNm|Ti_ulwL_Gk6P8#b=
zBUCJOQo1-zCU+x3#i-N21r-DcGH5cb`{AmwQd#P#H&Ks|WxvZ0R|%3kt<p|fWEE?#
zv|iMSaTYiq?e}Y&^=f)+cN^m~n>8N~XVrA=q}r?TT{>9BU0w=b-mBg&{O{i91tIxL
z&B at C!<B<URV;MU@;%8he$4k;ty(-}4+jw4t=D+3CIL|pZn)-Do@kA1LqpH`Mk7-xv
z_V|?op+>w*bNw7TFaKFyEv%pI)!QG_58za)F#v}bT_?=SmEO{n>!nhisC6 at NQSR3d
z0IY at evkSN7?p)7gU0wj1)tYghc>CdGna-N#^E}>q%d&QJdGgu9+R6Ghv8{9Q-1&np
zt#9*)Ui{Ia`<<ZDjWiKiyeOzfxK1lOxLTfE%uw}jq**ag469-v2o?Bb6HSDsgu*PO
z6`IuBrMi28ma~P)5+al3Y*d(0WunQ|jVRS9lgUJ1Hz}7@nhn>g&KB{|Vy+IZg}yJ`
zI;2Z|n=n~IO(6m=S@$|JHAZpMdI0m1l~yLYi2oB%11^i{G+9e4RkAB3S0!dqH`Pf)
zMOkYKOt=S?nsZCZ?&3~WqJ*ldisw?bawgeV^&BmimL?gh!4js-=AKKtUuLL93(91k
zOGaspQtYgGMHaErR+$JUV%LRLQ|PtBpqNZV)Sfj at KyjGFl{OcYiLr?)R^Y`8tabl~
zB9-Pmsi6=;sxiu0^iwnStfp$Q)}#w5zFk2DMct__s<f?)0yQ-kE57Phtr$@i30B;_
zc!nt{P-P)&P2UYk-K##@9d2a_t6JtzRTGkK#l=WhRo@rtTDZ1D6sQuQiaRZPP(YL2
z&7`V26=7PhX6Ql}7MSv%uBi_qP=lakrDvmwY}y7lrO2w6z=Md_xsjcoH<?w;Tb-yy
z;Mu5B%uCS_(e(s*0X0-KL<&4BwG^cQp`t*!Ug9Z^P!XuKZnCQG8D_Z@)pbp91D`Jh
z0-lXl!~=m4(GV3#E{LKyi=%`a&0*_>7+e at yrn;N_(~T-{)`DRB*=vxvmr>4Yl9dk;
zzFIV_kDh-&t1tY~t#&wK{r}wPOEzKtXhdL*SGH<^Hs#kA#jI*pxNmpsB-{fLXWdC$
z$tQkR&0GpTLZ8alv|n$RV_vBp&)yctn}p9*y5!z8B`#vd8;8R^ue at Dse&2~|$9YdA
z_Pq+zuf@bGh4LzK`r}skWb6UNo)z4I*xO&kbF6!9#_?3H_t&pR&Q<&+bC8!Gc^9bW
zFegK^BOa;U3B>t&Jm|$@e?9S_VrLVH%>qImD|rl8S0E8ppL{t9uqXiwc-4MiI^sn|
zzO at mX#$tbWLtxdeZ^vF5HZfN(618mid{rI^hUnH&z^*%5g;tNt>GpkEDmT<S;r$gE
z!<{z4&I`DJZV0z3dCFvZzJ7C?5T+1&bYv;0mvv#2bGz0HYmI(ZVIwRXwySHG;&4Nl
zIixro?r>Y^cCr77^#B*HhA^*Jqh^4sd6w-ivfY8|Ja2`oZmV7<nmIJvb`3Hy){D-y
zBYUqtwMaH8ZIxlP-CJ3xN4*oS)+wd9i%gWF0e~tBD|rejEu~1PD9U!pegQS0B~K<I
zQA+DsTZm@cUaj6n-%Wc^%}Z&a(z+C*xCygplzM#*%T6upu(Dc6S+(mWPcCYf#Y0L9
zmAnIWGgOi7`Y794t2NC=F)z%bAyvDMsvdtos0NXuN^!cJ|Cpd>bw0F2XwhxPs<B+^
zxV0i`)tJKQg=9Tf?MO%#RTqB{%c?FEFZ<~)POnF`m32*NSv6EQiPn?_w7goCP@Sf_
ztg7e9vudp=>Z;_*A{u2koF|~trPfld`c&}{3h0-PjIO$#_}(@Bbyewl))w5<BH`*f
z5xP!=suh;$JT_HpO$=5ls3EE-QT4~?9<r&a8cbAN%)PMq6HbL=2ddD;+_Po(Y!nq?
z3HY|QSXQ`|i9o=#4N-#^qlvi}HHsia4XXK>>A!($g)U~1En5|`rLZ_+>&UaX+iJ1#
zuG>_DsWH@%&FOMcQo2 at EL~O>DVS3pSz3QthY%;h9LUmpLe6PD&t;@7b)!+t((CJ*O
zZdAawQLXZ&>bhDQLnnvT9=A4qTj^ZY5vuFLy;=3BGgNCw&ummz9l>?-ZQXy;k#DpA
zeOfAz3^3dnuSlC$^1<2Uaj%?y#!RB>U{$M5^~yB!Wl8&5?fgjTy=t)Q47%2tZwl&N
z6Hhwwmph6l9i2 at Z-l?RHx7utzZ!+<!_#E*gGl?Jewl`mYyFU7#D8l38g#R0TxP{6s
ztHj&9!QKO^>y2I`dnc$Yas%yEy6kmt16BMsyWcSV-wWz(_j!wX=f4Ft9{5ltwTIt@
z_@{#!%Q%kn{r&y at JpL{;|LLG|PAT>OI~@M^4`S{eQc9`$@L+unzXYglN*7S|@4wrp
zZ#u3aEDt-!Vs<H|alS50<8#qD=kZb8#Q6t*t1k#@`ulro`u>pmeoWmsHcj89o=Zh_
z<{@?c*rahhEc4iOW0wvy$JF#)YWlJ3v2<P6jH&O(bXda(H)v8?+ib?JZ_?7e7^SlL
zlAvm8#$`#IyAB=uW#-r{^I;7gG^S<gnq@pR80Y0MFRAHyXfU%|#zS*h=EE{KOq{#J
zGPA49mr@#MB+OmMaqbfOebmwV({xSh=ds7v1a+B5BzCD|LeKutq&1pQv&?f^#?-J$
ziA}$xaY?CT>ew9)JfxJCIW1$ugf4aL4mFH5Qkv(UY3b7e{n%fDx-g}gP3qXE)Ghd;
zpw9D*#4a6{k=;D^hcwsuI?fH!GN&}p<AL3{bPLARU~J~GZ{~UI(!6xzGBcr1%`)~Y
zgLi3OMkb7 at LqB)T@<K@5dF~GJ1wlPDDK$-#nv_yE#vvV=<~l_37MijCcc_KiW2tG*
zkEg>{ySud6q#xu>_!=8k)1?0XfB(Bb>>@DMpQdS=uJ4))Sl4kH&+!_YW{qQgu6eG!
zf9k4*AH>T%ykMOB(?WfG%rW)q7{e>=^72xT?|aL5ca8O$VRsE5_ at h9*QsytqvQ*RA
z>Kz(2D8>0kbu(olgb_3+oafr-ntK!AaD?+*ZfDE*h;zFW*L#fBD9F at NFRj$zM7=-z
zhkvnO0_vWYZd|G#^JXjNz~(GZ`)hOVbCmVY&+ at ru^}BPR`qynnYqC7FS8diGua5$&
zmz3k|nP;NYA}Xe>nHERrOTm+z@!Ny?FwPGu?Sfo1L`q0$E$7YQOR969h*pQe>}NN?
z5K$}H>cxGoetaurI+>J-xhP5 at L|SAildMM0)xttrSS~KPophoYsjaAb$+kBfTCei9
zKf#q^`8NfX<4n_RQP#*5S>^mj4_R6krwQqWQg8ExT<s=EGeY8Q4I$N9O2i+uC<}rR
zhHCaTGR4IfNHxQRp(09^V$>Gdb#mnusPtmhm`Vg(-2i`YQ2UwLilUGvCe;$XS_jZt
zD=1DEt1g}>iYP`CcNa67fMTL7L0eq_ at sL}VNt7i3&G78mtA}XyBcm?WL(ha15rvz0
zY29Vf){EmsCo&iF-=0%rUg%P-3_?pwlj;Tt1kGvH{6I8}=DPab!9?k at ISj5w3bvY8
z(<Zu31_N9~X{v5Cr)r!xD$@yWs9`Ha+(pGg6rswOHmU&rfHifqo(uv|S+0x}E^($-
zGYLL2Yq++C*u<fDT)2xNby+3(*rb8y*j5BQUiZNIeL?+^)k3_%9O5-&j31jtye9Ge
zIdbY--zLr_zS+{)*~%WPEQMFy?7sRP)l-`Lab{dQ{Z?-}0JKcYA||;?t`F)FQYLtI
z&mxoNf`=Ccb^b>|edy;0l?f1;D6P^~m%S>d=0(M2Vp;ucgw%<}AM)hIwPkTomq(t`
zTl7Bl|0byHXS!sI*4)&KXUW)Nx`pUuS&E0O5~Gk}6jyCMOP(sIJDJkN>0*Q^!ld|r
z71Uy4D6A3G^6D{J1<oRqQ6F=vSdlUbZROOROnHg8=QZM9{1-tTXQ~u~1VW@xMK+H=
z>hz#fF0$;`RF^W at M4fUe%hNS=7rD#r!-dK}XZMfQgNj;KMaNS=v(2{Luge_%((WJ6
z1QhrWfqFsd`Cu52quJq4!0MMy|Fe?%rKk{b&8$CHgZziesq?&CojI|0#9I%JwCZQK
zi<113y*6*40!u%_%mA~6tJ|KJQk_u4s>h#aacGUiNjIyGcuz!A5U at WE)=yGWo8%?3
zn2VGsrS&3fObwCAvQA#at0SI>i^$}852~Fbqt>Ve at t<E)$C;|dqK2*z&!#)aG8dbe
zDNazpLQ{2@P~F9l5(QL16^Cn4{^vpMXBI7n5-`ycVn(aMGApOHI#I=8S)n2>=7KG<
zF@P%-pz9wu|35>dS{ArY4hN{ErLXRF>zc|M<6IqTicq5i?k`^y@lO*CJ_FR)>5f(X
z+LMliJ0q}nx7);mn at IJx_BWTpeXxu-gzLD0`gry)*mS5;<Cp67p{YiJ`nt$|0;t`*
zCh2nkb$=>;26Ow>_XY7{yNtMjx`HZDvus3hoP!u!5onP`b8(cy(9%L`3}1V8ga7#3
z<3AMC=;m=2uAvc1@EpXrKqsACD7D9$CB#*&>~{Xu&H>fVL9^YCsQ|iV9>qneil{-6
z^ZK+*I@!eH0WXN+;w4mRWhbLPw#bPasK7kVi%IKNiqT4q7FT(2q7-pjag-vkGEre>
zA}<(^`5!50ea49@He-raBeIJ^%o-naXFE~FtM>&~`;W`1<a4R%;_InUKmSB^F_}1@
zJ+A`0#TOR*KW$AN=S}ro<Lr}OHv6ZV=kHH8mG~u~MnBgm#H#fP7e&#DsuN6nORM%&
zA$3mDcLVh~eX5u&syeaMY!8vGxJx#O*2I73>S};$jip|b^xZ&xL7z%BaTgX;qiLbI
zm?%xD%3ZoVHNbTHxq<pJs9FS8%0v}}h_3nbih0hix(j}Mt&hG<{~yujK@!{92wSSC
z&0ppD(R>NH;IlwI%k;#S%OI|T7=LA{>N9r#D|KDGbSBvI>tpMRUFhU at +irhNP?vdG
zCDAp!|CX-jtQ>VUfV6B}r##o(d4_AZhAm$47VDbMHT3&d%lRm&C8HKTk9_>0pmy^(
zubE4s8otI9-ZJ6^O-wzuG!<TRoO(9EJP@|a<fp~2lCxSin)sTr6*ViP+nORUR)b4>
z$uG+Nr-Uv16xH82niPK!aZ_C&(uPWQD|sP6E9N1kr7B at 1FApN7SsaoPDlN*IJI^I+
zh_tjUjsPSJElay)19ZvCnlrFSh-7GK&u)M_Rbsts_(`h7PXM(a=fyOe7- at IY=A9>A
zHU+<%Oj(7hWEOEXl0tw|-2i3HnL(GT<KA)yQApG3MOcR~gsYTuYV0iHkbSDRopT>P
z+_~@Paq0t$6*DoY>f+h5i{&jneYkp!z-;0*cb=G2G+^07YVLAfQ|QpeTAY&v6{9Lk
zoRjqxr?xdkV2EX3Gxt4jGi+k`GdXo$0N2TDz-OPrCWTAuq4oJtnW}T28biftV)S}U
zfXhTXr at J-O6oK18%LHyP_^S9`LmnH=0b4uai)puh&PC#9oT&Eaq&3(wT&7Dpu&2&_
zSGn^Tyk at g_ER3BSkE@)4wsrE0qv(FN$KPWs>Fp#?Gl0KtWc}K=@k)x2uc-Nd`i3D!
zH|lj$Z;2Uk<sI-_AILt-<L|NrJofk#1RP$Bdt0E@?ZSC&inT2Z=ZpqVQ~dpg`h!pP
z_$yC5{%ASdB|YFdaqPnsDylg<T_&isYxan;;GE;H8fL&nrcl|Xh`ZRqBev8HUr_Z|
zJ^uXc at ppDkqbj2&{$u2lUBqaUESAkFhPAM!;4yLWHfpN3n!MO1YomCcc0*CAet{--
zNxk<4mDGEWzq0fAqbfJo$;jpiD-&}IxU`ftXP}5wP&Ha_*Zg@k7mK&1Ebv__oa;z6
zA083qx4BMv!Q-#4j_1UGCIS^%C=*>|qOCatRjWCBNSQp#M9)gCx!>KC0=Y_ve39?N
zoL_NGz217tM8tE_(-tqmL2K94Xz@%=;+oGs9 at z@`YcKSbMXJr?kFQ-5{NUT)R&V-K
zPgL<FFo%DI`@CN&r(&6Rncbu6qxH-9^ZhC%^%7=)sk^Du)vwc|aj!V?uZQbr=u^9y
zTJnS}rbXK*t3LX&O4>Oz0)Gb)=uZH39+6cY&v^W8!n&V>c!Y_3wX4<7xlWl?&AkLw
zQ9|_W@%QYp@;3cnrv<TuslzujikhhO_f>%W0iec3Yl^)h`6g1`vi#gYy at 7fI^#<y%
z0QGFBpydYnjZ<%+-ax&9`T?Mxz0o2NH&8z+&ByokzX#k<eK)9251SE)xWBLWQ1|yY
zK7B8!<*Dj3?!SM(kNf+Ghws4m`|meKeP`NaE&4b~aNOVD-{bx}zTe+}2kyVeEpam5
z1L|{;Bjfx1{r9-P$HV>ocRbuUbw_Ul_1Qh@{vPM)e}8}5r#=EyJUj#*?yF$+{rgR(
z`Vdez8DRI{jXng_8{I&?f%?aatFM51qxX|ZzH#bDllyJ at -`3O{s4vR4Z$3odKz;M>
zI3M=Z9G=qhhO at -G$HuP=>chBZj!!A2)Q`_3mtUUhZ_c~GYSX^A(T*RV`62?<hV!d~
zI{d9|N+~tVyhC$bYR^w$s=g=w?b|nFAgZmao|!OSP;UmmIlnmr)y+MA2H*Y~P@BI0
z`|osU#(7NhoKiQBO*7AZw{Yyn!*iT!>InEZcXzYJ&ETq)`=0go3s)tA- at f@bcQcw2
zX669+xj6%W38>>d9uD9C9(&A8^PC#a7?-hfYSYj2@|fu?t0PuU4OP(e!m06GLJ$!{
zAo%Uuw{NDVFeTJYi9nc?uLkPUH-{wuZ^R*`WljzIlrW~0Mx>^D3M$-ccnkkV@(HNV
zrLKu;|6ZrRsRv9M6;yn(f8Z~g{$oFW|9eRDJU87krhcBg!#t1au#DaO-1KL7o&Mjx
znVT&&)J&bscs2nb>5f>})Vf+2bbaD;!~guk-Tw!)@I{FzuDk=|lIh|H`~Q~9Euj80
z;w}6VIkkI at mN&n0y!zcQNF?|xPE@>|sBUxv^$!4*T5j}y`XQ({ru&Dx#tqaPsDC`D
zH+23P`42#?)TIBryU{<T7eGxnP;a2#K)r!_qZ_C<P;a2#=--2S_`e(dQ+g598~r=F
zfqDb=2I>ve8{I&?f%=~W^>CvPrN3 at xpiiMJSCk+9exujvF=lsnkHRI0-Q3OI?Vk1s
ivvQY9zR}0h-Tw!S1h_?q)VzBD0000<MNUMnLSTab#wW-C

literal 9087
zcmZvCcT`hdvv-iDAfSSPM2aF!=|~_{LFv6ql>mZ53cXhq1ZmO)3{84BNN=GDkq#mu
z^xiu`dikQy^WJ;Eb?+ZpS$k&hIkV5qp5M&u6Q- at HL`A_w0RRA~RFt3T0svP)000r<
zDlvfqCvwUm{1Lh6D#-&%`|hp+0K@=ob$tZ at 5rCA496&;TorIW{gp`c@7Rgn%YZO2>
zax${(0(U4$Zc`DH(a7*qk^!mjUAw7t^M(X911W%P at 7`?+SsF4%lI?p;H>jBmsF_T!
z-L<>LDhy_%qPr(}lbZ^_VGg*vPs8CZ at _>=?5m=Lr3iwdYhKZ8>q2Pl at QUVM+eE`56
zeoc99CfSETEg?F25pH_XL>_S!NiMVp7qtx^tvc)84bcM~AsdLG9zgntP7e88f=gS5
zQ&UC={7mb;2tAjwA3*uwv5GaTS}c at r=ablNC7Jpcih}8qz(~0}w&E)Q!y|T+w_X}-
zoTjBPU8z_-HaVN*FS5I_#ykMWqZhVt3CGw(wS7~wOHs#)Vzc}4R!?4;U%Y@^N(D-R
zJu={~0vUGlwsxnl+(N|t8v!4V)qK!_?)FMS`N?k5&jUXPdO1r4o|*)dhro_L+Fv at m
zo<;gN)VT=+1o~S?ytel}aC@5&^~NbbP`=pj`7@*+AnVloqb}^-e&IU>zN91PL^))r
zm*J;Ybg)FmhqnRI75NcXXwUukaT%~gOw$LGx_4jQ6PxZ8pOn10L`PaZ&Fcw at Jpj}m
z!_#ZN$7<?ipJYTGho&{!=l#e@{gm*P|9x(qe_nrkif3AONpJMQyPQ)%&qY;cWO-&%
zSng(NZhCtGETL#ExO}L$NXNSVti9MXwl)#ggau5TRicVoat=S$bz{DT_g3q5RAd3x
z&U<PSZd?MU3U>hK#(?cJz)@Cu+s4Ru3v8QXM%SpzuM5E8B at e!){d at Dz`h&WTp|5>q
zPqx|(&jG(WDn>iQaF~3+<z?HrRQ%|w*BM~4FSDonpy}sS-(bJr>Tu2IY}c>pv7g-~
zd(2Zq-^YJ$E%zNx4fpj<^v{lcn;xr~8*9RjPt1+}{4u>yvpBsla at f1iI=JpQwG_QL
ziTyP at H#5_ at GL2iD{W-H#F*&z5GdDdmyFNcRie0!^o?BR-8?WBFTv(dlTAJQmUfNkc
zTwPx|KPTN?Ut2u5JUP3(xIFWv7&G~EFs#&+o&iEhnUx8HYmUmsE&u at Ktv^4apOgM)
z1R}YsiiQIDC^7IlCD0g~tqK6J9;rN&)At<POr=VpZ}-D2i%01ZsiZq=a2F^&%@+_=
zjd-x2q4j`XS({d!g)jSBjN-M2&IalQ6&z$5OvSqMYU=!f0+A{+-&Og)to(jxBC5q}
z#fDahs^{b(-`{y6cFXzD)ow|)UIf2U-oNG2?{e61=I@(kH=3H5I(aT5Qhr*W{POyn
zJ#D5pa|H?3c%Q2uID&gkLmVwKCU9q49(+c3?2noC6-?mVU1UMMh=B3Ekve|FF&}|c
zYV@Ex3#yGXgF6yK3n_t(Z@)?XnFK`OB7Xtv7=4HfZTQ3(KYWvexMUwHBeriIwz>W2
z$i1Ccm04D1^eMck?<F*Y=~>%S3419uj|!CEs%Wa_tvPR;hlOWrXhFRVe9qx}`neA5
ze8jP@=qfOvjrcB-nB2tIhI(_-Cw~zz($e``R%)vP%QZQcTj at q$?;+}QIz=482X`|z
zZTMWKCEKdl=m>b|lZ+c68x(<zg@}bRq2(a+t=|p}4)Iq;EW&z&m@#EKd|EZx6)fU{
zv0Q~-v0oe5&_{Wn-amO69og6_y8-YkpduG1qI+stj(8EipiuBKeISbVB4cZ+ at zm_e
z!6vZNWI`g(ptR<N`PTBs=RsZO-C@_{+MO#~+Bn%lT9<+WPzf&9%VyksJy_`Upx26Z
zx?Aiaw1Gzd3(f}qk(CBn%Flr0s#&Se317co4Rj%wtX{`gM!30I2#!ULwLiLZoFk(>
z>QLLF9Z$sq(prhdxk`_n$d8DWXw{@+v89Pe)oRx+T?;NNt{_#LJ1jbD<t*`QMb*A-
z1AJfQ4Ia>b;09hr`k*aWSW>zQTRRA14wa$)kP02GvnzSGDB_xz7;ez1T|xS=ai{I%
z{klOSr~Ud7k(>|-G~>Rt2tw^)d*YttGj|enn(DEsi>;v42VdW?Te2U2w&t=AC;b2d
z{TvRiUy(PPs48{xXvoa6R*>go8gYl3&thVLdOWGU+P%ipWo{Nzm}LbbQ1BUyRH=s+
zXrxiV7p71EcF_(0Wu<37RuPY(f<^e>MCz^sf%H_FTlppyt!2g)Drayb=ww}Pi?ou%
z5hBjNdp{g*mTrRFT-YT+G8Mq~K64#U*6>s+k`=G+9L#Jgf90=&sy+b067IlNpenVq
zro-|JsNwKc#J;GXpAzN-{E$I{OdzP($eERu`R&6}U{!%ig5GWHkDSkC#xW;8hbElZ
z+|QqN9VTgi{z_Wg39z!Nl at ZP3kp#i(G^TjOm<lwc)Jb?>CuJQxp~M?CylZ14#A4<*
zEgE~md+qcV<13Yk*Vk|KCQmP at n|^WD!C30k-;C<VgfNU4yv;B`WEYziG9sh&-<oN=
z#q8YF<|<-;X=an97b84$2j}XUEPCX?Y^z?N7^Rpslh@hja+3SYyL^z=flAHHq=45!
z4{6x5>#UM<#ia8pCQ<mqcm<k0CsBl(6UD<13cHJYP*rT+9WaU)7d2$(*eeI}Z02gX
zTGE$jl^E3~F(fb*JjeYY8M@WX2>{xclqf!&sVMB=%#K-8P8Bwn>@?NOV~mW)s(VJp
z*Cod=7nd-H(}{i?KRvX+2jbPKJpwN8jw#y1^yD8i2{Yg`brZ!~cMGhwagY1%=`)D{
z3korcZeb&?uAzNt{w4*oN#$z3s#a6jDA8Xo3qnZG%ctwN!t<SJ>|>sPQ|K-iY8Qx7
zg--<5n^yDgg|ANrB8&%T+`=YhHcr6){2dB8z?}(<66OiSrRs;Mv8I8r2*X6+^1$P!
z<a}j=lU*uG(4Iwwv%xAx3|dJ=0%g03d(upH1#|-y6i7v~7_33@Mm~6qOrD*T2>6%v
zhCqg9Ksq{t*f=bSiI5YjoX772PS=muFqALXR=lp;BARWLg;e at p)b*krbx=a`RRXC^
zJN}X#XA6D#g4%SJdNP&W-JPVPF`*&72MccXFPdC#xGClA=o;X7v#UBC(iRT8)t0CE
ziMLYHU85#yEn7CF?PJu}G)6@`&3$KsC&2-;O%il(=NkQgp8?xh^q>B~yV{s5CF`h*
zBz9qPQ!HMVit2Xe)Hf8peylt4pc<A)ba)8&fG;|T6$Ts2^=KXJkp^?bjX$HxwF+G<
z5f)(urg339gRxM8U%l&EtZ?SHveqlD>~(9w)d=2=A(FO-1(}doJ%z|HF at fTfS+VSO
z&-B|?aL;Swk%gqdb9>vCj?N$|QQb0B%(W_JBGBS^wG+bIVz6{tw9`E+=BEkU*BISH
z6^q0pNR!vK<`7{$NnPB=gl7Im4>UVagJ(LBYf^KyjgnzPIaSxcpeme;U!dE9*Sulm
zrB(uc6!KYp{vO$x+i>!5*%zr7Xo*gdEM^^?yGa~j&yN@^^%lJ?_Wd83H|Gxg{(NC}
z69 at QXtG6ATj&;74#0eB2Xuj^ZTM}&%RKGhPGC*_H8KXp6z9DQ#(K{!VcBH&^2G-?y
z7d7Sy5xs0QS8ycO_<>{*#QgEu%gyn|_NXC;smUp?`vJD at J2h|wA~mjQ$?D+CnCwN`
zkn!}q)Rv*%^zo3%dG*;M?OIbu_v1P9Y4?=QesF&j{^1F8fQ5^Y9;A at sWAf_lx9Q<G
zmr$L{nklm|eMyR@C;etVbrhejZA^A$Ngq>c*@vx!HgNA%bBr9k5Few`t4+daI_N(T
zTlT1apE#z@!d-4d0N0*z7KylJyisHN9=)Bp(@Ka+Ur#;QfOY?%$}ZEVrw at GTymFHv
z#KjOSVg&BHhV=P;#eDE|hVdf3+TXQdp0|F&*uCIz$OUiK*&tYVH$K^5{D)bO-~pYF
zeSCFH<~s=fXQiEbqkpx1wti<1K{dZsR$1ZS-u>@0*!MD5uG#weRvT*Kaj!KX^DLX$
zJG#iux6v)!#ypTAv2XR|Q+%@PF~%R-f3PfDrkWx*3Rcs;4UUh0uf5;XThr10`pQ?w
zl*7jLSX1w_E47y;F-`0qyBiPex?HA=m%M}pBKo9W+Ctb}gxV$^eT8LnLvX*+u%(ss
z at y%m=dJ31TK8pFSuFov!q+5Q#8&j6bhCa6{rnC$YlrYGF@<+rb+yX`8LxJZ*>qj{8
z`OBd5O~wF3IHsywFlZdtzw4d9jTZ1bdQko(O5|Y5LNiq4A`#&Nh3Y3&XU(9g%G;8T
z@<6)rV-|S=6;-1JtVT=l<P(kbjmzBCQ2lrl>7cMkuZ;>tg*n`>KPE{lsRGwNc0hLX
zdzi-6(u3?eAG+T;<*hdxAE)W4c^}Z1ci8nVV(km-@Hp;nb?vt5#dNof<VYEi=Qc?9
z7wJQhpFiCB7(^oY0fep2Z|8<YFK&zvU?%t|x8!!%b#*${uIaOLxClk3V)K;?V<`A4
z6Qr^cZK_nrUAV}7iBj)l_Y{5!*RR9p&I|m02(g;U`aVh<t*tVrZ^F#GeFz-x41dkd
zNJu9Rw(nEdpk_Az-VgmLpr}XLncc5Puntf$IIeSUz<X9vh^A5y_UOJs8%lUATE;|;
zt^T_OxYs(7;DEy%)I62RzE=@FA-{Qci`A^Tj$6c~GE1CYAm3k4I;ly{rB1hr7CA%N
z2q6(@Nle8I;>90_d9b%-x~?Vvo+;eHm`ng8<d-Cl^w_p%ROyk;r$+S7SIR@mpj>IU
z=j=&LVtJ#xjXf-U?rq%@K<b$FV5%54jjllVek=|@nil#oGzE4q$8YRTwzubEdB~x>
zNE4GvTkDtaj4gzNlQCRv+_tD==$)0H;5 at -@qC|yTQw`e*%b-P(=mX2hN^;c<UZ`;J
ztAM4TPOg5MsN=<>db~$p at 1zN4YxskS?a~V>&-B3Z$F8`Q93ASwRfhM$G1c9C`0G%0
zTJV5xmAR!eMj>f2uzOM!F-0s<&BJOo&ghdtVj*F>g~$o8Tqu-eIKPI-+;jUY6P_Z!
zO}7#tIs>6~{1k$Y`FXB5BtT86hecf%DHGCIc!D2w4U+a~P>NP5=%i2NERuLzt8pB`
z+8J7~iDlsqN{li-#nVKXx!K8PaXu7So|q_c+vwoQPWq!KjwB at q(h-7nc#Cqn(qKag
zYy<TPj#P>cky5*0{7lU-oCNi-LVBw<R|J^L5A23Pk_Pd<sV*+n*fL2hPrsBv*8$BL
z@Xc(CqUf`V(mK2xBqR}vUCf0QpUtu1M}^ER7o+sd;ozCMr&A5f3Gb8lco{$!EcrJ~
zBwzt|{D2=~zq+KAnV#c%6;(SPU)n#pvw{^u%{F&b6c`jNw7s1XY*TahDfI3iL`Cx0
zW*kH7n!A`2AyvfuG7G(@7G9w|>9oL?>fIz$Z(hSinO)!cd|v6Rtu<Z8MM`U{<G+%{
zZz9ri?52gXaW>pNx%^I)k~Dh$AGxw!U9lar-#G~+H%dt~59{JxqcjAK7R6t*E+hil
zE`opD2M;=53yl at gxLGnATbqB(ed5JK1_F2UcL<}D-}mi_tAK~-TA89??@ZY{@e#N1
zqpAlM-jfD{eQG=qm$_0%d+rUaBa}VmcJ3!j(y`gJlUK_*&vBmf4UL22Codk@)D&6G
z3>w+)IG*1uNDq&hkaF*WVsrWwM9#=9Lwe=i%U}92v at k_kzB47~yHtbddtTB#3!O_$
zH9MQZ%PYl}%*FQSr)s6z$YvQv+weFr4Zf%tQ;ftPC?eKJCS8q&GuF_Zz)8opi{DD&
zc9;<1aoGdJQF>ug8tU>v`sqqlfvKm1c<fF1-HHZYI>q2Ty&LyF7{BLckX>nbcg_*B
zH=X*D%gru|#?Bl2IJ4;$F5hXYYXqbUt1FtySR=>${@^(Mk7&i02W<0hfv>lc(O+uE
zt)92VL^$Fzg5$e4r41MI*yQO5M#7M#CJI91FSqiOUq<ZCs`r2XO;?L}N_ZJ$Z(md8
ztd^d<EwnT5<2@Y#@|ALlAx#rTnV|_GkrDE_rL7$}m{9SovSN+ffC=40snj=Db>z#0
z`qcWyIKwaD)_NQKLXr3?)E(es`EiG~7m_i?8bx9zW?FFfEuQj`sMCAfdPR!%#qhP*
zN$6G;Bi8W&yHp0^DMbIM8Ld&peJjS at Ud2$e%h^JzVvLwl%MTe?eBPv+^q3AeAdV1i
zBKzI0PAO at f*ZusHS;WFp7D-pn<_X_W-FIP%<hq3{WIc1SXiDBq7EcciNa2oCmNqyc
zoYmFh*PZMprmF{)<(H}7y6RSNPjZSG(V!mEe6t?XtN$bx98tY&#oKashKdE3TV;|q
z9K0A3Z?9aZwsQ&>OcK*wWud9z>w!0K)mpmt{;J<YGx8#!JsjP}W`?L~=dDOyqxk#u
z9yKWN@>UOQlnU1w?!oH4|7NyziCA(p?a)q<d+Nq|rlsD%9Q_TT%ZjkZ^Q3#nADuDd
z-t&y8#}3&LlOpbYef3B%4S0UZ(#6HZ36TNnR<BuR-)Km6e~y-s5S0rWN>^e%OBE`W
zVgQly!R0W4$ft?PyGO`{J1AexF-EeD#B~{O6}8;ge3=6xp8Wy+QIWDZUyky;+lPu7
zO6{BhtmfaZrCdmz%pe?^edEV+1Kast!K|sxb32ntY?Y}3WrSP+uK7f#Kc!#z_P5{3
zt$dtbKYWq$*%8{)vb0n&ht;0rj?_oX)P>TDpL^}MOhekK+HwWk`FKGc121hoE4*Rz
z7miK$L)I}OmWLyxNGt{NW3CCr`Z`D~?>0>nHSeig=yq0k$-i3>1CjE;<;sNK^ZP{V
ze<YH$*f+=oqLwT7-Ah=kkyzmm_Sq at Cc#+qU@j|$X6vGK%ey<hwM9A0mQDV<(e-_O}
zAES}X_jW!u(9*z50-gz5o*SWUmS|r!!^N}QzyIp3dd-)W&+o(t`i9RTLv{;|5;ie)
zbw3IBeRuFT`t{8I@*sJDDe=<#ni>UP)#8J at HqDwmAv{1O9gNL;8QDiIcGXV}Co-+|
zKG-q16eRKzN(iEV%ZUHL;_d4|GK052ODR53`Fk4N|AUqPmK)7v1lP*XF8ksN(+yj@
zf#RV9jfoM~a|CKgz%IFDHDo`FuJn#J=enZ6oOB5kUxI={%y1+>X^9HNnvkNeItR%t
z_2erxG+z}{%D^mV;%Y;G&?3E7@#P_+xd<{4$9oM4>7AlcU#EZoiNP9}rDW5O^%L@{
z^i*X^uiYlE{a#is{hsfU at 5v`nuHNRCgGID-S{xrc8 at a96r}<^?gB9*cC(3YS@viPy
zZNB&7h?ilaN-`>i13*uW#vkvj$7)Vb2y*SRuJ%8!9XU8%#RJ>hh1bHwssmoY=Y^V*
zFW_&VCr>7^pqO}6HFaKPMN?^QZ3caotz<1Bh#XzTD`1HSQMKng&28mDy&o-y_8Uyu
zukWa}3ph2MZd#1{TgYC=;ja7IQg2Tj35haZhjN1zI-7G_qBDO9=ptXvit677g7hgr
zhd&#tyLdr_{L-8|y=mY%GKI;#S8gPn`eIdUO{m;@D1)%7<LVHQr=0f+()E)f1@5{S
z$gY1^AYnv#a^gv4Gmpi-=vFlP67w*3L^&B3N)kWeko{fJLuu%o*~@33{=2O)9Vn*$
z`>X5_Y9x58_CUa39uH6SeB%1NJ%r<ZqlMC3uaQ}Cly_kMMQH=N5YJ1i?R+N~)VDt3
zv9KxEL?qUoi89_hC36i^yKtJW$QR=$z0Go%APRD&yzWATYwjWeIsGX<3D&>;mg<qM
z@%@G4i!<koCjzKWEtN0NM_^s=%!Ho%8wH%XMBz7Tq_n-yeiq;K@XfE<YG9Fho8oDG
z<k7cd>*rDlWk+?grg)CL(rWY;ef6bmmX<>Ri6jRF#GLPG)mkA&5?oU8CI<&4EXxy4
zXN`>}dzd~F(A(CIlwT7`Srh)rzn|LmHS}IfyO{7jb(^_92PyZH1*xd>y!sUEt_fU>
z+PL4TqE+G=*Pkl>RDEJ?zmunm1`F2Pa<8}|;nVR<O6kD2uvu{!bdtTabaxR;Z98=^
zkgQp?+D~jD%W_n>(>#hkRdnAj*skoF+q8h{OMbI>Ik0YXm)Pfnv}jkmqZ48}!P$1@
zk)3#D(WN$;$fQG7pLX}|s7pIBFf3BEp!WDa!kT=ma&ut><avS*9Em1JKa}#ULa1aL
z)2k{2hoj!0gobKw-;G{9fUPm$3u<Zn=PKZN?z>y)gzc-Cj-sjkU{NC}R1EHU+-Ib~
z9>{%1Twt&RI+PB?k at T{$NQ_rQFMGZX#Ddl~Qzn&@SCfvo%2S)ao?s^ZB0XgNL@#`v
zc0BtE(^Q1Tg++o3YJcC~j at cwS$D&sIm2A`Hq+F}EM-+Fbs*LGPekxW at a^G?b>vd%T
z`2jmhoek5uIp3f+J~U=leOVy5)XF%CwY8=_yicdp!WK5gL9P)1N1sbLlI@~K(W_Ha
zyp)S7z+v|+WmjT&P8 at E>f6r)mbrbA4`)aWI%R&v2Kt*Psjs;WeJUX_S%q5<f5L^I+
zWSkIvXbTV~@JVe;THn*ubmBhNZO!wlP3lg`*|!W7BVcjc+R6PZ$dAh)Ayf=?P5tHo
zd)CI2<B830E*?$$VQS^ydBsNV;NDr%juUxQ?@Px*9(LuOt%X@y_Bgww25G#4(GC$U
zFBVQi$yK#<&dTI9J|!(KNf0A%K&>QawyH`WalNymy<0wEW@kzJMgvNof><xQ2Fre9
z{Rz2#9V(9s+YGF4IW>%?T)oxbd+WdFnN1iX`n-u{S{sRIqQZbXs{Rv+dBjl|zu^d~
zyN>^q8qh#0{YhNlWML~O4f)*~0P=`hoN#nBq2#`pRncuY!_CQHv2Ugw+7Rbw;)k`F
z2~;%ix~r<f)&lDxV(N2m%V<hc7M@$rGzbc5pT6tWN#AJM;Map@O3p|XYd({Dj<BA8
zzdJj!?K8qry>C-xFIfMG9JxYW6QW at bf-ZPZ`@J~XQPFV#CQUAeYPgc0 at s3IqD5?ev
zN%wTGDE(d;*B1s2GVd_wjhvWU-BvWWzP&UMx^r{;jI7knKzgftF>t;Eh_jK886qMF
z{nL0N0%?OSvy4dxg~=<1Lp6kxQ<_{&-RT(}i9kVGFbhq70H~Q$21Hp223GQRUgc^z
zAp?1{Cz#be^0b1$U!5km5eT+07jx`!KF!JBkpxI-BKmWRS+4<06jd?8lKli^@9f+K
zg-VJ_KZ;bOz>1*;Pe9|p78VNgPJa)oySqm63lZkUeRZ6tBD~?h at rV$U^p9~#v|Y9f
zH0nVbJB*HG>VX>kj?NSOgqkmo6!;DG8qzqZ-MC<i4ns<D)C#@Xc~IkAc8?NCk3H2J
zRzoieI(?HG?nrslZC;D}$N>Ji!_%ASTLhVV7wL`n(6(dZ_i(e)bFgHWwNI+KB&X-K
zhY=^%I|B<6;u=W7GfQgdVZq%RTn0j~(|pckl;hJum22}K31Uua{YY?4d!hY*p!OeR
z?J%6UYkc&o4)w&V->~@`0C~^3nZc}D<RWLxrDf%Ffk$v&s4l8(6C4ORZv7spp+nvv
zm2Sp(8KGs-a5|91aGeEdLXL~)0{MC}kB(0fqx(A1%dnoX(#Ot;#jdZ|hemApzqEZn
z$7)0+-kUe?X@QdzkaSF)7qd4tN<CY|GuD$h03nD+l92vqUa#8~9W-4F1V;S!W9fY|
zT}`sgT0_E+!G{qZLge*?9t_FSRO7!Ztp^jIPcNywL_ESf&zYgMfxY0tVZyV+w`*~q
zxl^&+i73dN?X2{CBUeUD?6u;?Zq$lPwQ1_1aOH|xVbx7(z1N6GQ2Ow+!m(F<VOtIX
zsnvtP$NcmV+;dV;S?AB{&I!pOHD<`x!QIN<&V1NjYsdzyAAix3#Dd5Y<*NJT#n)(F
zgz*F}Qr#>mP<-f{<Y}Aa_COfSA$X_>8C- at dP3LmsJ~nRpOo{dEfJ|I6)nNamQB#V?
zN5TKmFJTwXa*ZRA)n%KG-fzo&LWK&WHzzesA+zu>(b<p`w76%u^C7?oEXDJ09 at Ks#
z8GGQn8oZGm_%XJLDEgemv8{qXKkuqpS6)@vIm-^g8~|j}HjxprMa1#X&h$@1=^ofa
z@n|h=hlgMV$R8wX>%J~hl;{Jaom8_uX+@!5pWy$t!j9v<0CjMB8wENRhDpYa4P{~T
z9ORZyg$VrjoI4a4<n_tWIYZgc#8Jt^-9V(c#kZhHh~LouvY)l=p<F<3zh15twXNY-
zI_R8dCmAT@_vXO<a$;HJ*qE~PhcGHzLjlAej{5o?B)0nV#aWq?@CUQFP6Ik(U{A3H
zB>I$Wk)ywkF8Z+WCbGq=lU;M23^Z&!{<qys$p7MrKnl*aUz|HaqPrSwdAy68Ir%}=
z{J3k-Kn-;$iza-i!<mwNg2{u~i#&<0!W*T+zcJhcpA9sfFMZ_rSQK at K7bM2HJ<<b*
zh at 1R3sj-@WrK|_;FyRJ^7$c)iGg3=DT3nFmZv~-*$UU<V#86l0gegz|#^3SNKOsmw
zouJPD=z<dh0HHB%No+s^GM=#iYpMUm&e&^T5|bS?OuGP=5~IR0&S94YC5<?2Bqb5l
zdA%Lf_~uw+JYZHHfZXsNgCQ@*&!r|0WUU%Cd at o;&YdPL4yaO~^y#a25uhVbpnVNnL
z(RhKZSAV*gEpHX4cR7B5Pv1RIu^Q^gK?QXgwRd!QolL)2pt{AxV@azdP!;Br|3WXZ
zhRWQE0CfqsnrF!F;uhGYwut|aB%BDCzmEzkG~X}O{RO(g^dHarPqwa6bIXe&k>w9^
z>H(lf<vnwdp$W4Y>sN4o&ri*qOrY&^Y?*bmpE at xYW1cSxY`{&7lrvw`Yy3L*@hUVE
zf}blp1o>{5wzuS7O`t~c5J5l5q>H;ltB$toE`m1gd;$l?{-oJdKSR|ToZX(1K+|du
zTq%)My_2cE9tHF{wZ;gO%*KMDKD>V3HhO94(<B9QY3cMcVw71x%QB7&G&J&?wNYeu
z)EaZq3(G>M%QOl3=|i46OsfY}w|s at cWu<m@HXNZAbq5gzBimI>1!&|}-Reo&jN-#q
z(;vk6iGhal@?&pS<Uu+pKvXfUnG*p`WA*fu5g5l@Y>i+pcn13)#S;ZnmHf^FMkp4(
zHoyETFH$01BApSl28D0+O;vaPrr!&c()zu|8?3Q?k9{Q8uiWd{nthFW^pT8v54%ku
z>h%EqVA)O4HccQhy{<ASuCfXYR)v*|5F;)41Za`E{^eezk99RNW4w17sq9!zlgD`{
zd2e`$_*K2i{{DGH`FEaH*e_+$1K0`tWR0vmX3dFgyn1w?!PwCyE+5mQNa2UP?-2%^
z;NPv4bwM=Sg=-3a)%#2xeiDMUNfeKH-de4=e#>quu-<&`{1*rPjFd!D9-m2K((+!9
z#<zl>_1|manAR|UFHhoYeBo_Df3oeJ?0^0IPY3faek8o1qPh}NXyQ~B#8&9^U)+CB
zfI?dbU7E%JJSYGE<<Y;zUEy^o8 at HOl8(O0Os`dz%OMe at s{|3Dqe@|Be8;EdidP6@`
z)lSC&dm~?h?oCK|uW5_@ON5+3$&JTmP?jI}4*>eZ6mrCG_69DAJ at 18co&cQh5k3n5
Os3>SYE0wo=^Zx)+Bip|K

diff --git a/docs/index.html b/docs/index.html
index 82d5792..61a5df5 100644
--- a/docs/index.html
+++ b/docs/index.html
@@ -1 +1,33 @@
-<!--#include file="about.html" -->
+<!--#include file="header.html" -->
+
+<div class="hero-unit">
+  <div class="row-fluid">
+    <img src="images/logo.png" height="170" width="170" style="float: right;"/>
+    <div class="span8">
+      <h1>Buildroot<br/><small>Making Embedded Linux Easy</small></h1>
+      <p>Buildroot is a simple, efficient and easy-to-use tool to generate
+      embedded Linux systems through cross-compilation.</p>
+    </div>
+    <div class="button_column pull-right">
+      <div class="btn-group btn-group-justified">
+        <div class="btn-group">
+          <a class="btn btn-primary btn-large" href="/about.html">Learn more &raquo;</a>
+        </div>
+        <div class="btn-group">
+          <a class="btn btn-primary btn-large" href="/download.html">Download &raquo;</a>
+        </div>
+      </div>
+    </div>
+  </div>
+</div>
+
+<div class="row" style="line-height: 17px;">
+  <div class="span6" id="commit-activity">
+    <h2>Recent commit</h2>
+  </div>
+  <div class="span6" id="mailing-list-activity">
+    <h2>Recent discutions</h2>
+  </div>
+</div>
+
+<!--#include file="footer.html" -->
diff --git a/docs/js/bootstrap.js b/docs/js/bootstrap.js
new file mode 100644
index 0000000..6c15a58
--- /dev/null
+++ b/docs/js/bootstrap.js
@@ -0,0 +1,2159 @@
+/* ===================================================
+ * bootstrap-transition.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#transitions
+ * ===================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ========================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+  /* CSS TRANSITION SUPPORT (http://www.modernizr.com/)
+   * ======================================================= */
+
+  $(function () {
+
+    $.support.transition = (function () {
+
+      var transitionEnd = (function () {
+
+        var el = document.createElement('bootstrap')
+          , transEndEventNames = {
+               'WebkitTransition' : 'webkitTransitionEnd'
+            ,  'MozTransition'    : 'transitionend'
+            ,  'OTransition'      : 'oTransitionEnd otransitionend'
+            ,  'transition'       : 'transitionend'
+            }
+          , name
+
+        for (name in transEndEventNames){
+          if (el.style[name] !== undefined) {
+            return transEndEventNames[name]
+          }
+        }
+
+      }())
+
+      return transitionEnd && {
+        end: transitionEnd
+      }
+
+    })()
+
+  })
+
+}(window.jQuery);/* ==========================================================
+ * bootstrap-alert.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#alerts
+ * ==========================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ========================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* ALERT CLASS DEFINITION
+  * ====================== */
+
+  var dismiss = '[data-dismiss="alert"]'
+    , Alert = function (el) {
+        $(el).on('click', dismiss, this.close)
+      }
+
+  Alert.prototype.close = function (e) {
+    var $this = $(this)
+      , selector = $this.attr('data-target')
+      , $parent
+
+    if (!selector) {
+      selector = $this.attr('href')
+      selector = selector && selector.replace(/.*(?=#[^\s]*$)/, '') //strip for ie7
+    }
+
+    $parent = $(selector)
+
+    e && e.preventDefault()
+
+    $parent.length || ($parent = $this.hasClass('alert') ? $this : $this.parent())
+
+    $parent.trigger(e = $.Event('close'))
+
+    if (e.isDefaultPrevented()) return
+
+    $parent.removeClass('in')
+
+    function removeElement() {
+      $parent
+        .trigger('closed')
+        .remove()
+    }
+
+    $.support.transition && $parent.hasClass('fade') ?
+      $parent.on($.support.transition.end, removeElement) :
+      removeElement()
+  }
+
+
+ /* ALERT PLUGIN DEFINITION
+  * ======================= */
+
+  var old = $.fn.alert
+
+  $.fn.alert = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('alert')
+      if (!data) $this.data('alert', (data = new Alert(this)))
+      if (typeof option == 'string') data[option].call($this)
+    })
+  }
+
+  $.fn.alert.Constructor = Alert
+
+
+ /* ALERT NO CONFLICT
+  * ================= */
+
+  $.fn.alert.noConflict = function () {
+    $.fn.alert = old
+    return this
+  }
+
+
+ /* ALERT DATA-API
+  * ============== */
+
+  $(document).on('click.alert.data-api', dismiss, Alert.prototype.close)
+
+}(window.jQuery);/* ============================================================
+ * bootstrap-button.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#buttons
+ * ============================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ============================================================ */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* BUTTON PUBLIC CLASS DEFINITION
+  * ============================== */
+
+  var Button = function (element, options) {
+    this.$element = $(element)
+    this.options = $.extend({}, $.fn.button.defaults, options)
+  }
+
+  Button.prototype.setState = function (state) {
+    var d = 'disabled'
+      , $el = this.$element
+      , data = $el.data()
+      , val = $el.is('input') ? 'val' : 'html'
+
+    state = state + 'Text'
+    data.resetText || $el.data('resetText', $el[val]())
+
+    $el[val](data[state] || this.options[state])
+
+    // push to event loop to allow forms to submit
+    setTimeout(function () {
+      state == 'loadingText' ?
+        $el.addClass(d).attr(d, d) :
+        $el.removeClass(d).removeAttr(d)
+    }, 0)
+  }
+
+  Button.prototype.toggle = function () {
+    var $parent = this.$element.closest('[data-toggle="buttons-radio"]')
+
+    $parent && $parent
+      .find('.active')
+      .removeClass('active')
+
+    this.$element.toggleClass('active')
+  }
+
+
+ /* BUTTON PLUGIN DEFINITION
+  * ======================== */
+
+  var old = $.fn.button
+
+  $.fn.button = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('button')
+        , options = typeof option == 'object' && option
+      if (!data) $this.data('button', (data = new Button(this, options)))
+      if (option == 'toggle') data.toggle()
+      else if (option) data.setState(option)
+    })
+  }
+
+  $.fn.button.defaults = {
+    loadingText: 'loading...'
+  }
+
+  $.fn.button.Constructor = Button
+
+
+ /* BUTTON NO CONFLICT
+  * ================== */
+
+  $.fn.button.noConflict = function () {
+    $.fn.button = old
+    return this
+  }
+
+
+ /* BUTTON DATA-API
+  * =============== */
+
+  $(document).on('click.button.data-api', '[data-toggle^=button]', function (e) {
+    var $btn = $(e.target)
+    if (!$btn.hasClass('btn')) $btn = $btn.closest('.btn')
+    $btn.button('toggle')
+  })
+
+}(window.jQuery);/* ==========================================================
+ * bootstrap-carousel.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#carousel
+ * ==========================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ========================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* CAROUSEL CLASS DEFINITION
+  * ========================= */
+
+  var Carousel = function (element, options) {
+    this.$element = $(element)
+    this.options = options
+    this.options.pause == 'hover' && this.$element
+      .on('mouseenter', $.proxy(this.pause, this))
+      .on('mouseleave', $.proxy(this.cycle, this))
+  }
+
+  Carousel.prototype = {
+
+    cycle: function (e) {
+      if (!e) this.paused = false
+      this.options.interval
+        && !this.paused
+        && (this.interval = setInterval($.proxy(this.next, this), this.options.interval))
+      return this
+    }
+
+  , to: function (pos) {
+      var $active = this.$element.find('.item.active')
+        , children = $active.parent().children()
+        , activePos = children.index($active)
+        , that = this
+
+      if (pos > (children.length - 1) || pos < 0) return
+
+      if (this.sliding) {
+        return this.$element.one('slid', function () {
+          that.to(pos)
+        })
+      }
+
+      if (activePos == pos) {
+        return this.pause().cycle()
+      }
+
+      return this.slide(pos > activePos ? 'next' : 'prev', $(children[pos]))
+    }
+
+  , pause: function (e) {
+      if (!e) this.paused = true
+      if (this.$element.find('.next, .prev').length && $.support.transition.end) {
+        this.$element.trigger($.support.transition.end)
+        this.cycle()
+      }
+      clearInterval(this.interval)
+      this.interval = null
+      return this
+    }
+
+  , next: function () {
+      if (this.sliding) return
+      return this.slide('next')
+    }
+
+  , prev: function () {
+      if (this.sliding) return
+      return this.slide('prev')
+    }
+
+  , slide: function (type, next) {
+      var $active = this.$element.find('.item.active')
+        , $next = next || $active[type]()
+        , isCycling = this.interval
+        , direction = type == 'next' ? 'left' : 'right'
+        , fallback  = type == 'next' ? 'first' : 'last'
+        , that = this
+        , e
+
+      this.sliding = true
+
+      isCycling && this.pause()
+
+      $next = $next.length ? $next : this.$element.find('.item')[fallback]()
+
+      e = $.Event('slide', {
+        relatedTarget: $next[0]
+      })
+
+      if ($next.hasClass('active')) return
+
+      if ($.support.transition && this.$element.hasClass('slide')) {
+        this.$element.trigger(e)
+        if (e.isDefaultPrevented()) return
+        $next.addClass(type)
+        $next[0].offsetWidth // force reflow
+        $active.addClass(direction)
+        $next.addClass(direction)
+        this.$element.one($.support.transition.end, function () {
+          $next.removeClass([type, direction].join(' ')).addClass('active')
+          $active.removeClass(['active', direction].join(' '))
+          that.sliding = false
+          setTimeout(function () { that.$element.trigger('slid') }, 0)
+        })
+      } else {
+        this.$element.trigger(e)
+        if (e.isDefaultPrevented()) return
+        $active.removeClass('active')
+        $next.addClass('active')
+        this.sliding = false
+        this.$element.trigger('slid')
+      }
+
+      isCycling && this.cycle()
+
+      return this
+    }
+
+  }
+
+
+ /* CAROUSEL PLUGIN DEFINITION
+  * ========================== */
+
+  var old = $.fn.carousel
+
+  $.fn.carousel = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('carousel')
+        , options = $.extend({}, $.fn.carousel.defaults, typeof option == 'object' && option)
+        , action = typeof option == 'string' ? option : options.slide
+      if (!data) $this.data('carousel', (data = new Carousel(this, options)))
+      if (typeof option == 'number') data.to(option)
+      else if (action) data[action]()
+      else if (options.interval) data.cycle()
+    })
+  }
+
+  $.fn.carousel.defaults = {
+    interval: 5000
+  , pause: 'hover'
+  }
+
+  $.fn.carousel.Constructor = Carousel
+
+
+ /* CAROUSEL NO CONFLICT
+  * ==================== */
+
+  $.fn.carousel.noConflict = function () {
+    $.fn.carousel = old
+    return this
+  }
+
+ /* CAROUSEL DATA-API
+  * ================= */
+
+  $(document).on('click.carousel.data-api', '[data-slide]', function (e) {
+    var $this = $(this), href
+      , $target = $($this.attr('data-target') || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '')) //strip for ie7
+      , options = $.extend({}, $target.data(), $this.data())
+    $target.carousel(options)
+    e.preventDefault()
+  })
+
+}(window.jQuery);/* =============================================================
+ * bootstrap-collapse.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#collapse
+ * =============================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ============================================================ */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* COLLAPSE PUBLIC CLASS DEFINITION
+  * ================================ */
+
+  var Collapse = function (element, options) {
+    this.$element = $(element)
+    this.options = $.extend({}, $.fn.collapse.defaults, options)
+
+    if (this.options.parent) {
+      this.$parent = $(this.options.parent)
+    }
+
+    this.options.toggle && this.toggle()
+  }
+
+  Collapse.prototype = {
+
+    constructor: Collapse
+
+  , dimension: function () {
+      var hasWidth = this.$element.hasClass('width')
+      return hasWidth ? 'width' : 'height'
+    }
+
+  , show: function () {
+      var dimension
+        , scroll
+        , actives
+        , hasData
+
+      if (this.transitioning) return
+
+      dimension = this.dimension()
+      scroll = $.camelCase(['scroll', dimension].join('-'))
+      actives = this.$parent && this.$parent.find('> .accordion-group > .in')
+
+      if (actives && actives.length) {
+        hasData = actives.data('collapse')
+        if (hasData && hasData.transitioning) return
+        actives.collapse('hide')
+        hasData || actives.data('collapse', null)
+      }
+
+      this.$element[dimension](0)
+      this.transition('addClass', $.Event('show'), 'shown')
+      $.support.transition && this.$element[dimension](this.$element[0][scroll])
+    }
+
+  , hide: function () {
+      var dimension
+      if (this.transitioning) return
+      dimension = this.dimension()
+      this.reset(this.$element[dimension]())
+      this.transition('removeClass', $.Event('hide'), 'hidden')
+      this.$element[dimension](0)
+    }
+
+  , reset: function (size) {
+      var dimension = this.dimension()
+
+      this.$element
+        .removeClass('collapse')
+        [dimension](size || 'auto')
+        [0].offsetWidth
+
+      this.$element[size !== null ? 'addClass' : 'removeClass']('collapse')
+
+      return this
+    }
+
+  , transition: function (method, startEvent, completeEvent) {
+      var that = this
+        , complete = function () {
+            if (startEvent.type == 'show') that.reset()
+            that.transitioning = 0
+            that.$element.trigger(completeEvent)
+          }
+
+      this.$element.trigger(startEvent)
+
+      if (startEvent.isDefaultPrevented()) return
+
+      this.transitioning = 1
+
+      this.$element[method]('in')
+
+      $.support.transition && this.$element.hasClass('collapse') ?
+        this.$element.one($.support.transition.end, complete) :
+        complete()
+    }
+
+  , toggle: function () {
+      this[this.$element.hasClass('in') ? 'hide' : 'show']()
+    }
+
+  }
+
+
+ /* COLLAPSE PLUGIN DEFINITION
+  * ========================== */
+
+  var old = $.fn.collapse
+
+  $.fn.collapse = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('collapse')
+        , options = typeof option == 'object' && option
+      if (!data) $this.data('collapse', (data = new Collapse(this, options)))
+      if (typeof option == 'string') data[option]()
+    })
+  }
+
+  $.fn.collapse.defaults = {
+    toggle: true
+  }
+
+  $.fn.collapse.Constructor = Collapse
+
+
+ /* COLLAPSE NO CONFLICT
+  * ==================== */
+
+  $.fn.collapse.noConflict = function () {
+    $.fn.collapse = old
+    return this
+  }
+
+
+ /* COLLAPSE DATA-API
+  * ================= */
+
+  $(document).on('click.collapse.data-api', '[data-toggle=collapse]', function (e) {
+    var $this = $(this), href
+      , target = $this.attr('data-target')
+        || e.preventDefault()
+        || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '') //strip for ie7
+      , option = $(target).data('collapse') ? 'toggle' : $this.data()
+    $this[$(target).hasClass('in') ? 'addClass' : 'removeClass']('collapsed')
+    $(target).collapse(option)
+  })
+
+}(window.jQuery);/* ============================================================
+ * bootstrap-dropdown.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#dropdowns
+ * ============================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ============================================================ */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* DROPDOWN CLASS DEFINITION
+  * ========================= */
+
+  var toggle = '[data-toggle=dropdown]'
+    , Dropdown = function (element) {
+        var $el = $(element).on('click.dropdown.data-api', this.toggle)
+        $('html').on('click.dropdown.data-api', function () {
+          $el.parent().removeClass('open')
+        })
+      }
+
+  Dropdown.prototype = {
+
+    constructor: Dropdown
+
+  , toggle: function (e) {
+      var $this = $(this)
+        , $parent
+        , isActive
+
+      if ($this.is('.disabled, :disabled')) return
+
+      $parent = getParent($this)
+
+      isActive = $parent.hasClass('open')
+
+      clearMenus()
+
+      if (!isActive) {
+        $parent.toggleClass('open')
+      }
+
+      $this.focus()
+
+      return false
+    }
+
+  , keydown: function (e) {
+      var $this
+        , $items
+        , $active
+        , $parent
+        , isActive
+        , index
+
+      if (!/(38|40|27)/.test(e.keyCode)) return
+
+      $this = $(this)
+
+      e.preventDefault()
+      e.stopPropagation()
+
+      if ($this.is('.disabled, :disabled')) return
+
+      $parent = getParent($this)
+
+      isActive = $parent.hasClass('open')
+
+      if (!isActive || (isActive && e.keyCode == 27)) return $this.click()
+
+      $items = $('[role=menu] li:not(.divider):visible a', $parent)
+
+      if (!$items.length) return
+
+      index = $items.index($items.filter(':focus'))
+
+      if (e.keyCode == 38 && index > 0) index--                                        // up
+      if (e.keyCode == 40 && index < $items.length - 1) index++                        // down
+      if (!~index) index = 0
+
+      $items
+        .eq(index)
+        .focus()
+    }
+
+  }
+
+  function clearMenus() {
+    $(toggle).each(function () {
+      getParent($(this)).removeClass('open')
+    })
+  }
+
+  function getParent($this) {
+    var selector = $this.attr('data-target')
+      , $parent
+
+    if (!selector) {
+      selector = $this.attr('href')
+      selector = selector && /#/.test(selector) && selector.replace(/.*(?=#[^\s]*$)/, '') //strip for ie7
+    }
+
+    $parent = $(selector)
+    $parent.length || ($parent = $this.parent())
+
+    return $parent
+  }
+
+
+  /* DROPDOWN PLUGIN DEFINITION
+   * ========================== */
+
+  var old = $.fn.dropdown
+
+  $.fn.dropdown = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('dropdown')
+      if (!data) $this.data('dropdown', (data = new Dropdown(this)))
+      if (typeof option == 'string') data[option].call($this)
+    })
+  }
+
+  $.fn.dropdown.Constructor = Dropdown
+
+
+ /* DROPDOWN NO CONFLICT
+  * ==================== */
+
+  $.fn.dropdown.noConflict = function () {
+    $.fn.dropdown = old
+    return this
+  }
+
+
+  /* APPLY TO STANDARD DROPDOWN ELEMENTS
+   * =================================== */
+
+  $(document)
+    .on('click.dropdown.data-api touchstart.dropdown.data-api', clearMenus)
+    .on('click.dropdown touchstart.dropdown.data-api', '.dropdown form', function (e) { e.stopPropagation() })
+    .on('touchstart.dropdown.data-api', '.dropdown-menu', function (e) { e.stopPropagation() })
+    .on('click.dropdown.data-api touchstart.dropdown.data-api'  , toggle, Dropdown.prototype.toggle)
+    .on('keydown.dropdown.data-api touchstart.dropdown.data-api', toggle + ', [role=menu]' , Dropdown.prototype.keydown)
+
+}(window.jQuery);/* =========================================================
+ * bootstrap-modal.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#modals
+ * =========================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ========================================================= */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* MODAL CLASS DEFINITION
+  * ====================== */
+
+  var Modal = function (element, options) {
+    this.options = options
+    this.$element = $(element)
+      .delegate('[data-dismiss="modal"]', 'click.dismiss.modal', $.proxy(this.hide, this))
+    this.options.remote && this.$element.find('.modal-body').load(this.options.remote)
+  }
+
+  Modal.prototype = {
+
+      constructor: Modal
+
+    , toggle: function () {
+        return this[!this.isShown ? 'show' : 'hide']()
+      }
+
+    , show: function () {
+        var that = this
+          , e = $.Event('show')
+
+        this.$element.trigger(e)
+
+        if (this.isShown || e.isDefaultPrevented()) return
+
+        this.isShown = true
+
+        this.escape()
+
+        this.backdrop(function () {
+          var transition = $.support.transition && that.$element.hasClass('fade')
+
+          if (!that.$element.parent().length) {
+            that.$element.appendTo(document.body) //don't move modals dom position
+          }
+
+          that.$element
+            .show()
+
+          if (transition) {
+            that.$element[0].offsetWidth // force reflow
+          }
+
+          that.$element
+            .addClass('in')
+            .attr('aria-hidden', false)
+
+          that.enforceFocus()
+
+          transition ?
+            that.$element.one($.support.transition.end, function () { that.$element.focus().trigger('shown') }) :
+            that.$element.focus().trigger('shown')
+
+        })
+      }
+
+    , hide: function (e) {
+        e && e.preventDefault()
+
+        var that = this
+
+        e = $.Event('hide')
+
+        this.$element.trigger(e)
+
+        if (!this.isShown || e.isDefaultPrevented()) return
+
+        this.isShown = false
+
+        this.escape()
+
+        $(document).off('focusin.modal')
+
+        this.$element
+          .removeClass('in')
+          .attr('aria-hidden', true)
+
+        $.support.transition && this.$element.hasClass('fade') ?
+          this.hideWithTransition() :
+          this.hideModal()
+      }
+
+    , enforceFocus: function () {
+        var that = this
+        $(document).on('focusin.modal', function (e) {
+          if (that.$element[0] !== e.target && !that.$element.has(e.target).length) {
+            that.$element.focus()
+          }
+        })
+      }
+
+    , escape: function () {
+        var that = this
+        if (this.isShown && this.options.keyboard) {
+          this.$element.on('keyup.dismiss.modal', function ( e ) {
+            e.which == 27 && that.hide()
+          })
+        } else if (!this.isShown) {
+          this.$element.off('keyup.dismiss.modal')
+        }
+      }
+
+    , hideWithTransition: function () {
+        var that = this
+          , timeout = setTimeout(function () {
+              that.$element.off($.support.transition.end)
+              that.hideModal()
+            }, 500)
+
+        this.$element.one($.support.transition.end, function () {
+          clearTimeout(timeout)
+          that.hideModal()
+        })
+      }
+
+    , hideModal: function (that) {
+        this.$element
+          .hide()
+          .trigger('hidden')
+
+        this.backdrop()
+      }
+
+    , removeBackdrop: function () {
+        this.$backdrop.remove()
+        this.$backdrop = null
+      }
+
+    , backdrop: function (callback) {
+        var that = this
+          , animate = this.$element.hasClass('fade') ? 'fade' : ''
+
+        if (this.isShown && this.options.backdrop) {
+          var doAnimate = $.support.transition && animate
+
+          this.$backdrop = $('<div class="modal-backdrop ' + animate + '" />')
+            .appendTo(document.body)
+
+          this.$backdrop.click(
+            this.options.backdrop == 'static' ?
+              $.proxy(this.$element[0].focus, this.$element[0])
+            : $.proxy(this.hide, this)
+          )
+
+          if (doAnimate) this.$backdrop[0].offsetWidth // force reflow
+
+          this.$backdrop.addClass('in')
+
+          doAnimate ?
+            this.$backdrop.one($.support.transition.end, callback) :
+            callback()
+
+        } else if (!this.isShown && this.$backdrop) {
+          this.$backdrop.removeClass('in')
+
+          $.support.transition && this.$element.hasClass('fade')?
+            this.$backdrop.one($.support.transition.end, $.proxy(this.removeBackdrop, this)) :
+            this.removeBackdrop()
+
+        } else if (callback) {
+          callback()
+        }
+      }
+  }
+
+
+ /* MODAL PLUGIN DEFINITION
+  * ======================= */
+
+  var old = $.fn.modal
+
+  $.fn.modal = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('modal')
+        , options = $.extend({}, $.fn.modal.defaults, $this.data(), typeof option == 'object' && option)
+      if (!data) $this.data('modal', (data = new Modal(this, options)))
+      if (typeof option == 'string') data[option]()
+      else if (options.show) data.show()
+    })
+  }
+
+  $.fn.modal.defaults = {
+      backdrop: true
+    , keyboard: true
+    , show: true
+  }
+
+  $.fn.modal.Constructor = Modal
+
+
+ /* MODAL NO CONFLICT
+  * ================= */
+
+  $.fn.modal.noConflict = function () {
+    $.fn.modal = old
+    return this
+  }
+
+
+ /* MODAL DATA-API
+  * ============== */
+
+  $(document).on('click.modal.data-api', '[data-toggle="modal"]', function (e) {
+    var $this = $(this)
+      , href = $this.attr('href')
+      , $target = $($this.attr('data-target') || (href && href.replace(/.*(?=#[^\s]+$)/, ''))) //strip for ie7
+      , option = $target.data('modal') ? 'toggle' : $.extend({ remote:!/#/.test(href) && href }, $target.data(), $this.data())
+
+    e.preventDefault()
+
+    $target
+      .modal(option)
+      .one('hide', function () {
+        $this.focus()
+      })
+  })
+
+}(window.jQuery);
+/* ===========================================================
+ * bootstrap-tooltip.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#tooltips
+ * Inspired by the original jQuery.tipsy by Jason Frame
+ * ===========================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ========================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* TOOLTIP PUBLIC CLASS DEFINITION
+  * =============================== */
+
+  var Tooltip = function (element, options) {
+    this.init('tooltip', element, options)
+  }
+
+  Tooltip.prototype = {
+
+    constructor: Tooltip
+
+  , init: function (type, element, options) {
+      var eventIn
+        , eventOut
+
+      this.type = type
+      this.$element = $(element)
+      this.options = this.getOptions(options)
+      this.enabled = true
+
+      if (this.options.trigger == 'click') {
+        this.$element.on('click.' + this.type, this.options.selector, $.proxy(this.toggle, this))
+      } else if (this.options.trigger != 'manual') {
+        eventIn = this.options.trigger == 'hover' ? 'mouseenter' : 'focus'
+        eventOut = this.options.trigger == 'hover' ? 'mouseleave' : 'blur'
+        this.$element.on(eventIn + '.' + this.type, this.options.selector, $.proxy(this.enter, this))
+        this.$element.on(eventOut + '.' + this.type, this.options.selector, $.proxy(this.leave, this))
+      }
+
+      this.options.selector ?
+        (this._options = $.extend({}, this.options, { trigger: 'manual', selector: '' })) :
+        this.fixTitle()
+    }
+
+  , getOptions: function (options) {
+      options = $.extend({}, $.fn[this.type].defaults, options, this.$element.data())
+
+      if (options.delay && typeof options.delay == 'number') {
+        options.delay = {
+          show: options.delay
+        , hide: options.delay
+        }
+      }
+
+      return options
+    }
+
+  , enter: function (e) {
+      var self = $(e.currentTarget)[this.type](this._options).data(this.type)
+
+      if (!self.options.delay || !self.options.delay.show) return self.show()
+
+      clearTimeout(this.timeout)
+      self.hoverState = 'in'
+      this.timeout = setTimeout(function() {
+        if (self.hoverState == 'in') self.show()
+      }, self.options.delay.show)
+    }
+
+  , leave: function (e) {
+      var self = $(e.currentTarget)[this.type](this._options).data(this.type)
+
+      if (this.timeout) clearTimeout(this.timeout)
+      if (!self.options.delay || !self.options.delay.hide) return self.hide()
+
+      self.hoverState = 'out'
+      this.timeout = setTimeout(function() {
+        if (self.hoverState == 'out') self.hide()
+      }, self.options.delay.hide)
+    }
+
+  , show: function () {
+      var $tip
+        , inside
+        , pos
+        , actualWidth
+        , actualHeight
+        , placement
+        , tp
+
+      if (this.hasContent() && this.enabled) {
+        $tip = this.tip()
+        this.setContent()
+
+        if (this.options.animation) {
+          $tip.addClass('fade')
+        }
+
+        placement = typeof this.options.placement == 'function' ?
+          this.options.placement.call(this, $tip[0], this.$element[0]) :
+          this.options.placement
+
+        inside = /in/.test(placement)
+
+        $tip
+          .detach()
+          .css({ top: 0, left: 0, display: 'block' })
+          .insertAfter(this.$element)
+
+        pos = this.getPosition(inside)
+
+        actualWidth = $tip[0].offsetWidth
+        actualHeight = $tip[0].offsetHeight
+
+        switch (inside ? placement.split(' ')[1] : placement) {
+          case 'bottom':
+            tp = {top: pos.top + pos.height, left: pos.left + pos.width / 2 - actualWidth / 2}
+            break
+          case 'top':
+            tp = {top: pos.top - actualHeight, left: pos.left + pos.width / 2 - actualWidth / 2}
+            break
+          case 'left':
+            tp = {top: pos.top + pos.height / 2 - actualHeight / 2, left: pos.left - actualWidth}
+            break
+          case 'right':
+            tp = {top: pos.top + pos.height / 2 - actualHeight / 2, left: pos.left + pos.width}
+            break
+        }
+
+        $tip
+          .offset(tp)
+          .addClass(placement)
+          .addClass('in')
+      }
+    }
+
+  , setContent: function () {
+      var $tip = this.tip()
+        , title = this.getTitle()
+
+      $tip.find('.tooltip-inner')[this.options.html ? 'html' : 'text'](title)
+      $tip.removeClass('fade in top bottom left right')
+    }
+
+  , hide: function () {
+      var that = this
+        , $tip = this.tip()
+
+      $tip.removeClass('in')
+
+      function removeWithAnimation() {
+        var timeout = setTimeout(function () {
+          $tip.off($.support.transition.end).detach()
+        }, 500)
+
+        $tip.one($.support.transition.end, function () {
+          clearTimeout(timeout)
+          $tip.detach()
+        })
+      }
+
+      $.support.transition && this.$tip.hasClass('fade') ?
+        removeWithAnimation() :
+        $tip.detach()
+
+      return this
+    }
+
+  , fixTitle: function () {
+      var $e = this.$element
+      if ($e.attr('title') || typeof($e.attr('data-original-title')) != 'string') {
+        $e.attr('data-original-title', $e.attr('title') || '').removeAttr('title')
+      }
+    }
+
+  , hasContent: function () {
+      return this.getTitle()
+    }
+
+  , getPosition: function (inside) {
+      return $.extend({}, (inside ? {top: 0, left: 0} : this.$element.offset()), {
+        width: this.$element[0].offsetWidth
+      , height: this.$element[0].offsetHeight
+      })
+    }
+
+  , getTitle: function () {
+      var title
+        , $e = this.$element
+        , o = this.options
+
+      title = $e.attr('data-original-title')
+        || (typeof o.title == 'function' ? o.title.call($e[0]) :  o.title)
+
+      return title
+    }
+
+  , tip: function () {
+      return this.$tip = this.$tip || $(this.options.template)
+    }
+
+  , validate: function () {
+      if (!this.$element[0].parentNode) {
+        this.hide()
+        this.$element = null
+        this.options = null
+      }
+    }
+
+  , enable: function () {
+      this.enabled = true
+    }
+
+  , disable: function () {
+      this.enabled = false
+    }
+
+  , toggleEnabled: function () {
+      this.enabled = !this.enabled
+    }
+
+  , toggle: function (e) {
+      var self = $(e.currentTarget)[this.type](this._options).data(this.type)
+      self[self.tip().hasClass('in') ? 'hide' : 'show']()
+    }
+
+  , destroy: function () {
+      this.hide().$element.off('.' + this.type).removeData(this.type)
+    }
+
+  }
+
+
+ /* TOOLTIP PLUGIN DEFINITION
+  * ========================= */
+
+  var old = $.fn.tooltip
+
+  $.fn.tooltip = function ( option ) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('tooltip')
+        , options = typeof option == 'object' && option
+      if (!data) $this.data('tooltip', (data = new Tooltip(this, options)))
+      if (typeof option == 'string') data[option]()
+    })
+  }
+
+  $.fn.tooltip.Constructor = Tooltip
+
+  $.fn.tooltip.defaults = {
+    animation: true
+  , placement: 'top'
+  , selector: false
+  , template: '<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
+  , trigger: 'hover'
+  , title: ''
+  , delay: 0
+  , html: false
+  }
+
+
+ /* TOOLTIP NO CONFLICT
+  * =================== */
+
+  $.fn.tooltip.noConflict = function () {
+    $.fn.tooltip = old
+    return this
+  }
+
+}(window.jQuery);/* ===========================================================
+ * bootstrap-popover.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#popovers
+ * ===========================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * =========================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* POPOVER PUBLIC CLASS DEFINITION
+  * =============================== */
+
+  var Popover = function (element, options) {
+    this.init('popover', element, options)
+  }
+
+
+  /* NOTE: POPOVER EXTENDS BOOTSTRAP-TOOLTIP.js
+     ========================================== */
+
+  Popover.prototype = $.extend({}, $.fn.tooltip.Constructor.prototype, {
+
+    constructor: Popover
+
+  , setContent: function () {
+      var $tip = this.tip()
+        , title = this.getTitle()
+        , content = this.getContent()
+
+      $tip.find('.popover-title')[this.options.html ? 'html' : 'text'](title)
+      $tip.find('.popover-content')[this.options.html ? 'html' : 'text'](content)
+
+      $tip.removeClass('fade top bottom left right in')
+    }
+
+  , hasContent: function () {
+      return this.getTitle() || this.getContent()
+    }
+
+  , getContent: function () {
+      var content
+        , $e = this.$element
+        , o = this.options
+
+      content = $e.attr('data-content')
+        || (typeof o.content == 'function' ? o.content.call($e[0]) :  o.content)
+
+      return content
+    }
+
+  , tip: function () {
+      if (!this.$tip) {
+        this.$tip = $(this.options.template)
+      }
+      return this.$tip
+    }
+
+  , destroy: function () {
+      this.hide().$element.off('.' + this.type).removeData(this.type)
+    }
+
+  })
+
+
+ /* POPOVER PLUGIN DEFINITION
+  * ======================= */
+
+  var old = $.fn.popover
+
+  $.fn.popover = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('popover')
+        , options = typeof option == 'object' && option
+      if (!data) $this.data('popover', (data = new Popover(this, options)))
+      if (typeof option == 'string') data[option]()
+    })
+  }
+
+  $.fn.popover.Constructor = Popover
+
+  $.fn.popover.defaults = $.extend({} , $.fn.tooltip.defaults, {
+    placement: 'right'
+  , trigger: 'click'
+  , content: ''
+  , template: '<div class="popover"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"></div></div></div>'
+  })
+
+
+ /* POPOVER NO CONFLICT
+  * =================== */
+
+  $.fn.popover.noConflict = function () {
+    $.fn.popover = old
+    return this
+  }
+
+}(window.jQuery);/* =============================================================
+ * bootstrap-scrollspy.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#scrollspy
+ * =============================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ============================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* SCROLLSPY CLASS DEFINITION
+  * ========================== */
+
+  function ScrollSpy(element, options) {
+    var process = $.proxy(this.process, this)
+      , $element = $(element).is('body') ? $(window) : $(element)
+      , href
+    this.options = $.extend({}, $.fn.scrollspy.defaults, options)
+    this.$scrollElement = $element.on('scroll.scroll-spy.data-api', process)
+    this.selector = (this.options.target
+      || ((href = $(element).attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '')) //strip for ie7
+      || '') + ' .nav li > a'
+    this.$body = $('body')
+    this.refresh()
+    this.process()
+  }
+
+  ScrollSpy.prototype = {
+
+      constructor: ScrollSpy
+
+    , refresh: function () {
+        var self = this
+          , $targets
+
+        this.offsets = $([])
+        this.targets = $([])
+
+        $targets = this.$body
+          .find(this.selector)
+          .map(function () {
+            var $el = $(this)
+              , href = $el.data('target') || $el.attr('href')
+              , $href = /^#\w/.test(href) && $(href)
+            return ( $href
+              && $href.length
+              && [[ $href.position().top + self.$scrollElement.scrollTop(), href ]] ) || null
+          })
+          .sort(function (a, b) { return a[0] - b[0] })
+          .each(function () {
+            self.offsets.push(this[0])
+            self.targets.push(this[1])
+          })
+      }
+
+    , process: function () {
+        var scrollTop = this.$scrollElement.scrollTop() + this.options.offset
+          , scrollHeight = this.$scrollElement[0].scrollHeight || this.$body[0].scrollHeight
+          , maxScroll = scrollHeight - this.$scrollElement.height()
+          , offsets = this.offsets
+          , targets = this.targets
+          , activeTarget = this.activeTarget
+          , i
+
+        if (scrollTop >= maxScroll) {
+          return activeTarget != (i = targets.last()[0])
+            && this.activate ( i )
+        }
+
+        for (i = offsets.length; i--;) {
+          activeTarget != targets[i]
+            && scrollTop >= offsets[i]
+            && (!offsets[i + 1] || scrollTop <= offsets[i + 1])
+            && this.activate( targets[i] )
+        }
+      }
+
+    , activate: function (target) {
+        var active
+          , selector
+
+        this.activeTarget = target
+
+        $(this.selector)
+          .parent('.active')
+          .removeClass('active')
+
+        selector = this.selector
+          + '[data-target="' + target + '"],'
+          + this.selector + '[href="' + target + '"]'
+
+        active = $(selector)
+          .parent('li')
+          .addClass('active')
+
+        if (active.parent('.dropdown-menu').length)  {
+          active = active.closest('li.dropdown').addClass('active')
+        }
+
+        active.trigger('activate')
+      }
+
+  }
+
+
+ /* SCROLLSPY PLUGIN DEFINITION
+  * =========================== */
+
+  var old = $.fn.scrollspy
+
+  $.fn.scrollspy = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('scrollspy')
+        , options = typeof option == 'object' && option
+      if (!data) $this.data('scrollspy', (data = new ScrollSpy(this, options)))
+      if (typeof option == 'string') data[option]()
+    })
+  }
+
+  $.fn.scrollspy.Constructor = ScrollSpy
+
+  $.fn.scrollspy.defaults = {
+    offset: 10
+  }
+
+
+ /* SCROLLSPY NO CONFLICT
+  * ===================== */
+
+  $.fn.scrollspy.noConflict = function () {
+    $.fn.scrollspy = old
+    return this
+  }
+
+
+ /* SCROLLSPY DATA-API
+  * ================== */
+
+  $(window).on('load', function () {
+    $('[data-spy="scroll"]').each(function () {
+      var $spy = $(this)
+      $spy.scrollspy($spy.data())
+    })
+  })
+
+}(window.jQuery);/* ========================================================
+ * bootstrap-tab.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#tabs
+ * ========================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ======================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* TAB CLASS DEFINITION
+  * ==================== */
+
+  var Tab = function (element) {
+    this.element = $(element)
+  }
+
+  Tab.prototype = {
+
+    constructor: Tab
+
+  , show: function () {
+      var $this = this.element
+        , $ul = $this.closest('ul:not(.dropdown-menu)')
+        , selector = $this.attr('data-target')
+        , previous
+        , $target
+        , e
+
+      if (!selector) {
+        selector = $this.attr('href')
+        selector = selector && selector.replace(/.*(?=#[^\s]*$)/, '') //strip for ie7
+      }
+
+      if ( $this.parent('li').hasClass('active') ) return
+
+      previous = $ul.find('.active:last a')[0]
+
+      e = $.Event('show', {
+        relatedTarget: previous
+      })
+
+      $this.trigger(e)
+
+      if (e.isDefaultPrevented()) return
+
+      $target = $(selector)
+
+      this.activate($this.parent('li'), $ul)
+      this.activate($target, $target.parent(), function () {
+        $this.trigger({
+          type: 'shown'
+        , relatedTarget: previous
+        })
+      })
+    }
+
+  , activate: function ( element, container, callback) {
+      var $active = container.find('> .active')
+        , transition = callback
+            && $.support.transition
+            && $active.hasClass('fade')
+
+      function next() {
+        $active
+          .removeClass('active')
+          .find('> .dropdown-menu > .active')
+          .removeClass('active')
+
+        element.addClass('active')
+
+        if (transition) {
+          element[0].offsetWidth // reflow for transition
+          element.addClass('in')
+        } else {
+          element.removeClass('fade')
+        }
+
+        if ( element.parent('.dropdown-menu') ) {
+          element.closest('li.dropdown').addClass('active')
+        }
+
+        callback && callback()
+      }
+
+      transition ?
+        $active.one($.support.transition.end, next) :
+        next()
+
+      $active.removeClass('in')
+    }
+  }
+
+
+ /* TAB PLUGIN DEFINITION
+  * ===================== */
+
+  var old = $.fn.tab
+
+  $.fn.tab = function ( option ) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('tab')
+      if (!data) $this.data('tab', (data = new Tab(this)))
+      if (typeof option == 'string') data[option]()
+    })
+  }
+
+  $.fn.tab.Constructor = Tab
+
+
+ /* TAB NO CONFLICT
+  * =============== */
+
+  $.fn.tab.noConflict = function () {
+    $.fn.tab = old
+    return this
+  }
+
+
+ /* TAB DATA-API
+  * ============ */
+
+  $(document).on('click.tab.data-api', '[data-toggle="tab"], [data-toggle="pill"]', function (e) {
+    e.preventDefault()
+    $(this).tab('show')
+  })
+
+}(window.jQuery);/* =============================================================
+ * bootstrap-typeahead.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#typeahead
+ * =============================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ============================================================ */
+
+
+!function($){
+
+  "use strict"; // jshint ;_;
+
+
+ /* TYPEAHEAD PUBLIC CLASS DEFINITION
+  * ================================= */
+
+  var Typeahead = function (element, options) {
+    this.$element = $(element)
+    this.options = $.extend({}, $.fn.typeahead.defaults, options)
+    this.matcher = this.options.matcher || this.matcher
+    this.sorter = this.options.sorter || this.sorter
+    this.highlighter = this.options.highlighter || this.highlighter
+    this.updater = this.options.updater || this.updater
+    this.source = this.options.source
+    this.$menu = $(this.options.menu)
+    this.shown = false
+    this.listen()
+  }
+
+  Typeahead.prototype = {
+
+    constructor: Typeahead
+
+  , select: function () {
+      var val = this.$menu.find('.active').attr('data-value')
+      this.$element
+        .val(this.updater(val))
+        .change()
+      return this.hide()
+    }
+
+  , updater: function (item) {
+      return item
+    }
+
+  , show: function () {
+      var pos = $.extend({}, this.$element.position(), {
+        height: this.$element[0].offsetHeight
+      })
+
+      this.$menu
+        .insertAfter(this.$element)
+        .css({
+          top: pos.top + pos.height
+        , left: pos.left
+        })
+        .show()
+
+      this.shown = true
+      return this
+    }
+
+  , hide: function () {
+      this.$menu.hide()
+      this.shown = false
+      return this
+    }
+
+  , lookup: function (event) {
+      var items
+
+      this.query = this.$element.val()
+
+      if (!this.query || this.query.length < this.options.minLength) {
+        return this.shown ? this.hide() : this
+      }
+
+      items = $.isFunction(this.source) ? this.source(this.query, $.proxy(this.process, this)) : this.source
+
+      return items ? this.process(items) : this
+    }
+
+  , process: function (items) {
+      var that = this
+
+      items = $.grep(items, function (item) {
+        return that.matcher(item)
+      })
+
+      items = this.sorter(items)
+
+      if (!items.length) {
+        return this.shown ? this.hide() : this
+      }
+
+      return this.render(items.slice(0, this.options.items)).show()
+    }
+
+  , matcher: function (item) {
+      return ~item.toLowerCase().indexOf(this.query.toLowerCase())
+    }
+
+  , sorter: function (items) {
+      var beginswith = []
+        , caseSensitive = []
+        , caseInsensitive = []
+        , item
+
+      while (item = items.shift()) {
+        if (!item.toLowerCase().indexOf(this.query.toLowerCase())) beginswith.push(item)
+        else if (~item.indexOf(this.query)) caseSensitive.push(item)
+        else caseInsensitive.push(item)
+      }
+
+      return beginswith.concat(caseSensitive, caseInsensitive)
+    }
+
+  , highlighter: function (item) {
+      var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&')
+      return item.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
+        return '<strong>' + match + '</strong>'
+      })
+    }
+
+  , render: function (items) {
+      var that = this
+
+      items = $(items).map(function (i, item) {
+        i = $(that.options.item).attr('data-value', item)
+        i.find('a').html(that.highlighter(item))
+        return i[0]
+      })
+
+      items.first().addClass('active')
+      this.$menu.html(items)
+      return this
+    }
+
+  , next: function (event) {
+      var active = this.$menu.find('.active').removeClass('active')
+        , next = active.next()
+
+      if (!next.length) {
+        next = $(this.$menu.find('li')[0])
+      }
+
+      next.addClass('active')
+    }
+
+  , prev: function (event) {
+      var active = this.$menu.find('.active').removeClass('active')
+        , prev = active.prev()
+
+      if (!prev.length) {
+        prev = this.$menu.find('li').last()
+      }
+
+      prev.addClass('active')
+    }
+
+  , listen: function () {
+      this.$element
+        .on('blur',     $.proxy(this.blur, this))
+        .on('keypress', $.proxy(this.keypress, this))
+        .on('keyup',    $.proxy(this.keyup, this))
+
+      if (this.eventSupported('keydown')) {
+        this.$element.on('keydown', $.proxy(this.keydown, this))
+      }
+
+      this.$menu
+        .on('click', $.proxy(this.click, this))
+        .on('mouseenter', 'li', $.proxy(this.mouseenter, this))
+    }
+
+  , eventSupported: function(eventName) {
+      var isSupported = eventName in this.$element
+      if (!isSupported) {
+        this.$element.setAttribute(eventName, 'return;')
+        isSupported = typeof this.$element[eventName] === 'function'
+      }
+      return isSupported
+    }
+
+  , move: function (e) {
+      if (!this.shown) return
+
+      switch(e.keyCode) {
+        case 9: // tab
+        case 13: // enter
+        case 27: // escape
+          e.preventDefault()
+          break
+
+        case 38: // up arrow
+          e.preventDefault()
+          this.prev()
+          break
+
+        case 40: // down arrow
+          e.preventDefault()
+          this.next()
+          break
+      }
+
+      e.stopPropagation()
+    }
+
+  , keydown: function (e) {
+      this.suppressKeyPressRepeat = ~$.inArray(e.keyCode, [40,38,9,13,27])
+      this.move(e)
+    }
+
+  , keypress: function (e) {
+      if (this.suppressKeyPressRepeat) return
+      this.move(e)
+    }
+
+  , keyup: function (e) {
+      switch(e.keyCode) {
+        case 40: // down arrow
+        case 38: // up arrow
+        case 16: // shift
+        case 17: // ctrl
+        case 18: // alt
+          break
+
+        case 9: // tab
+        case 13: // enter
+          if (!this.shown) return
+          this.select()
+          break
+
+        case 27: // escape
+          if (!this.shown) return
+          this.hide()
+          break
+
+        default:
+          this.lookup()
+      }
+
+      e.stopPropagation()
+      e.preventDefault()
+  }
+
+  , blur: function (e) {
+      var that = this
+      setTimeout(function () { that.hide() }, 150)
+    }
+
+  , click: function (e) {
+      e.stopPropagation()
+      e.preventDefault()
+      this.select()
+    }
+
+  , mouseenter: function (e) {
+      this.$menu.find('.active').removeClass('active')
+      $(e.currentTarget).addClass('active')
+    }
+
+  }
+
+
+  /* TYPEAHEAD PLUGIN DEFINITION
+   * =========================== */
+
+  var old = $.fn.typeahead
+
+  $.fn.typeahead = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('typeahead')
+        , options = typeof option == 'object' && option
+      if (!data) $this.data('typeahead', (data = new Typeahead(this, options)))
+      if (typeof option == 'string') data[option]()
+    })
+  }
+
+  $.fn.typeahead.defaults = {
+    source: []
+  , items: 8
+  , menu: '<ul class="typeahead dropdown-menu"></ul>'
+  , item: '<li><a href="#"></a></li>'
+  , minLength: 1
+  }
+
+  $.fn.typeahead.Constructor = Typeahead
+
+
+ /* TYPEAHEAD NO CONFLICT
+  * =================== */
+
+  $.fn.typeahead.noConflict = function () {
+    $.fn.typeahead = old
+    return this
+  }
+
+
+ /* TYPEAHEAD DATA-API
+  * ================== */
+
+  $(document).on('focus.typeahead.data-api', '[data-provide="typeahead"]', function (e) {
+    var $this = $(this)
+    if ($this.data('typeahead')) return
+    e.preventDefault()
+    $this.typeahead($this.data())
+  })
+
+}(window.jQuery);
+/* ==========================================================
+ * bootstrap-affix.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#affix
+ * ==========================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ========================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* AFFIX CLASS DEFINITION
+  * ====================== */
+
+  var Affix = function (element, options) {
+    this.options = $.extend({}, $.fn.affix.defaults, options)
+    this.$window = $(window)
+      .on('scroll.affix.data-api', $.proxy(this.checkPosition, this))
+      .on('click.affix.data-api',  $.proxy(function () { setTimeout($.proxy(this.checkPosition, this), 1) }, this))
+    this.$element = $(element)
+    this.checkPosition()
+  }
+
+  Affix.prototype.checkPosition = function () {
+    if (!this.$element.is(':visible')) return
+
+    var scrollHeight = $(document).height()
+      , scrollTop = this.$window.scrollTop()
+      , position = this.$element.offset()
+      , offset = this.options.offset
+      , offsetBottom = offset.bottom
+      , offsetTop = offset.top
+      , reset = 'affix affix-top affix-bottom'
+      , affix
+
+    if (typeof offset != 'object') offsetBottom = offsetTop = offset
+    if (typeof offsetTop == 'function') offsetTop = offset.top()
+    if (typeof offsetBottom == 'function') offsetBottom = offset.bottom()
+
+    affix = this.unpin != null && (scrollTop + this.unpin <= position.top) ?
+      false    : offsetBottom != null && (position.top + this.$element.height() >= scrollHeight - offsetBottom) ?
+      'bottom' : offsetTop != null && scrollTop <= offsetTop ?
+      'top'    : false
+
+    if (this.affixed === affix) return
+
+    this.affixed = affix
+    this.unpin = affix == 'bottom' ? position.top - scrollTop : null
+
+    this.$element.removeClass(reset).addClass('affix' + (affix ? '-' + affix : ''))
+  }
+
+
+ /* AFFIX PLUGIN DEFINITION
+  * ======================= */
+
+  var old = $.fn.affix
+
+  $.fn.affix = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('affix')
+        , options = typeof option == 'object' && option
+      if (!data) $this.data('affix', (data = new Affix(this, options)))
+      if (typeof option == 'string') data[option]()
+    })
+  }
+
+  $.fn.affix.Constructor = Affix
+
+  $.fn.affix.defaults = {
+    offset: 0
+  }
+
+
+ /* AFFIX NO CONFLICT
+  * ================= */
+
+  $.fn.affix.noConflict = function () {
+    $.fn.affix = old
+    return this
+  }
+
+
+ /* AFFIX DATA-API
+  * ============== */
+
+  $(window).on('load', function () {
+    $('[data-spy="affix"]').each(function () {
+      var $spy = $(this)
+        , data = $spy.data()
+
+      data.offset = data.offset || {}
+
+      data.offsetBottom && (data.offset.bottom = data.offsetBottom)
+      data.offsetTop && (data.offset.top = data.offsetTop)
+
+      $spy.affix(data)
+    })
+  })
+
+
+}(window.jQuery);
\ No newline@end of file
diff --git a/docs/js/bootstrap.min.js b/docs/js/bootstrap.min.js
new file mode 100644
index 0000000..6eeb15c
--- /dev/null
+++ b/docs/js/bootstrap.min.js
@@ -0,0 +1,6 @@
+/*!
+* Bootstrap.js by @fat & @mdo
+* Copyright 2012 Twitter, Inc.
+* http://www.apache.org/licenses/LICENSE-2.0.txt
+*/
+!function($){"use strict";$(function(){$.support.transition=function(){var transitionEnd=function(){var name,el=document.createElement("bootstrap"),transEndEventNames={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(name in transEndEventNames)if(void 0!==el.style[name])return transEndEventNames[name]}();return transitionEnd&&{end:transitionEnd}}()})}(window.jQuery),!function($){"use strict";var dismiss='[data-dismiss="alert"]',Alert=function(el){$(el).on("click",dismiss,this.close)};Alert.prototype.close=function(e){function removeElement(){$parent.trigger("closed").remove()}var $parent,$this=$(this),selector=$this.attr("data-target");selector||(selector=$this.attr("href"),selector=selector&&selector.replace(/.*(?=#[^\s]*$)/,"")),$parent=$(selector),e&&e.preventDefault(),$parent.length||($parent=$this.hasClass("alert")?$this:$this.parent()),$parent.trigger(e=$.Event("close")),e.i
 sDefaultPrevented()||($parent.removeClass("in"),$.support.transition&&$parent.hasClass("fade")?$parent.on($.support.transition.end,removeElement):removeElement())};var old=$.fn.alert;$.fn.alert=function(option){return this.each(function(){var $this=$(this),data=$this.data("alert");data||$this.data("alert",data=new Alert(this)),"string"==typeof option&&data[option].call($this)})},$.fn.alert.Constructor=Alert,$.fn.alert.noConflict=function(){return $.fn.alert=old,this},$(document).on("click.alert.data-api",dismiss,Alert.prototype.close)}(window.jQuery),!function($){"use strict";var Button=function(element,options){this.$element=$(element),this.options=$.extend({},$.fn.button.defaults,options)};Button.prototype.setState=function(state){var d="disabled",$el=this.$element,data=$el.data(),val=$el.is("input")?"val":"html";state+="Text",data.resetText||$el.data("resetText",$el[val]()),$el[val](data[state]||this.options[state]),setTimeout(function(){"loadingText"==state?$el.addClass(
 d).attr(d,d):$el.removeClass(d).removeAttr(d)},0)},Button.prototype.toggle=function(){var $parent=this.$element.closest('[data-toggle="buttons-radio"]');$parent&&$parent.find(".active").removeClass("active"),this.$element.toggleClass("active")};var old=$.fn.button;$.fn.button=function(option){return this.each(function(){var $this=$(this),data=$this.data("button"),options="object"==typeof option&&option;data||$this.data("button",data=new Button(this,options)),"toggle"==option?data.toggle():option&&data.setState(option)})},$.fn.button.defaults={loadingText:"loading..."},$.fn.button.Constructor=Button,$.fn.button.noConflict=function(){return $.fn.button=old,this},$(document).on("click.button.data-api","[data-toggle^=button]",function(e){var $btn=$(e.target);$btn.hasClass("btn")||($btn=$btn.closest(".btn")),$btn.button("toggle")})}(window.jQuery),!function($){"use strict";var Carousel=function(element,options){this.$element=$(element),this.options=options,"hover"==this.options.p
 ause&&this.$element.on("mouseenter",$.proxy(this.pause,this)).on("mouseleave",$.proxy(this.cycle,this))};Carousel.prototype={cycle:function(e){return e||(this.paused=!1),this.options.interval&&!this.paused&&(this.interval=setInterval($.proxy(this.next,this),this.options.interval)),this},to:function(pos){var $active=this.$element.find(".item.active"),children=$active.parent().children(),activePos=children.index($active),that=this;if(!(pos>children.length-1||0>pos))return this.sliding?this.$element.one("slid",function(){that.to(pos)}):activePos==pos?this.pause().cycle():this.slide(pos>activePos?"next":"prev",$(children[pos]))},pause:function(e){return e||(this.paused=!0),this.$element.find(".next, .prev").length&&$.support.transition.end&&(this.$element.trigger($.support.transition.end),this.cycle()),clearInterval(this.interval),this.interval=null,this},next:function(){return this.sliding?void 0:this.slide("next")},prev:function(){return this.sliding?void 0:this.slide("prev")}
 ,slide:function(type,next){var e,$active=this.$element.find(".item.active"),$next=next||$active[type](),isCycling=this.interval,direction="next"==type?"left":"right",fallback="next"==type?"first":"last",that=this;if(this.sliding=!0,isCycling&&this.pause(),$next=$next.length?$next:this.$element.find(".item")[fallback](),e=$.Event("slide",{relatedTarget:$next[0]}),!$next.hasClass("active")){if($.support.transition&&this.$element.hasClass("slide")){if(this.$element.trigger(e),e.isDefaultPrevented())return;$next.addClass(type),$next[0].offsetWidth,$active.addClass(direction),$next.addClass(direction),this.$element.one($.support.transition.end,function(){$next.removeClass([type,direction].join(" ")).addClass("active"),$active.removeClass(["active",direction].join(" ")),that.sliding=!1,setTimeout(function(){that.$element.trigger("slid")},0)})}else{if(this.$element.trigger(e),e.isDefaultPrevented())return;$active.removeClass("active"),$next.addClass("active"),this.sliding=!1,this.$
 element.trigger("slid")}return isCycling&&this.cycle(),this}}};var old=$.fn.carousel;$.fn.carousel=function(option){return this.each(function(){var $this=$(this),data=$this.data("carousel"),options=$.extend({},$.fn.carousel.defaults,"object"==typeof option&&option),action="string"==typeof option?option:options.slide;data||$this.data("carousel",data=new Carousel(this,options)),"number"==typeof option?data.to(option):action?data[action]():options.interval&&data.cycle()})},$.fn.carousel.defaults={interval:5e3,pause:"hover"},$.fn.carousel.Constructor=Carousel,$.fn.carousel.noConflict=function(){return $.fn.carousel=old,this},$(document).on("click.carousel.data-api","[data-slide]",function(e){var href,$this=$(this),$target=$($this.attr("data-target")||(href=$this.attr("href"))&&href.replace(/.*(?=#[^\s]+$)/,"")),options=$.extend({},$target.data(),$this.data());$target.carousel(options),e.preventDefault()})}(window.jQuery),!function($){"use strict";var Collapse=function(element,op
 tions){this.$element=$(element),this.options=$.extend({},$.fn.collapse.defaults,options),this.options.parent&&(this.$parent=$(this.options.parent)),this.options.toggle&&this.toggle()};Collapse.prototype={constructor:Collapse,dimension:function(){var hasWidth=this.$element.hasClass("width");return hasWidth?"width":"height"},show:function(){var dimension,scroll,actives,hasData;if(!this.transitioning){if(dimension=this.dimension(),scroll=$.camelCase(["scroll",dimension].join("-")),actives=this.$parent&&this.$parent.find("> .accordion-group > .in"),actives&&actives.length){if(hasData=actives.data("collapse"),hasData&&hasData.transitioning)return;actives.collapse("hide"),hasData||actives.data("collapse",null)}this.$element[dimension](0),this.transition("addClass",$.Event("show"),"shown"),$.support.transition&&this.$element[dimension](this.$element[0][scroll])}},hide:function(){var dimension;this.transitioning||(dimension=this.dimension(),this.reset(this.$element[dimension]()),thi
 s.transition("removeClass",$.Event("hide"),"hidden"),this.$element[dimension](0))},reset:function(size){var dimension=this.dimension();return this.$element.removeClass("collapse")[dimension](size||"auto")[0].offsetWidth,this.$element[null!==size?"addClass":"removeClass"]("collapse"),this},transition:function(method,startEvent,completeEvent){var that=this,complete=function(){"show"==startEvent.type&&that.reset(),that.transitioning=0,that.$element.trigger(completeEvent)};this.$element.trigger(startEvent),startEvent.isDefaultPrevented()||(this.transitioning=1,this.$element[method]("in"),$.support.transition&&this.$element.hasClass("collapse")?this.$element.one($.support.transition.end,complete):complete())},toggle:function(){this[this.$element.hasClass("in")?"hide":"show"]()}};var old=$.fn.collapse;$.fn.collapse=function(option){return this.each(function(){var $this=$(this),data=$this.data("collapse"),options="object"==typeof option&&option;data||$this.data("collapse",data=new 
 Collapse(this,options)),"string"==typeof option&&data[option]()})},$.fn.collapse.defaults={toggle:!0},$.fn.collapse.Constructor=Collapse,$.fn.collapse.noConflict=function(){return $.fn.collapse=old,this},$(document).on("click.collapse.data-api","[data-toggle=collapse]",function(e){var href,$this=$(this),target=$this.attr("data-target")||e.preventDefault()||(href=$this.attr("href"))&&href.replace(/.*(?=#[^\s]+$)/,""),option=$(target).data("collapse")?"toggle":$this.data();$this[$(target).hasClass("in")?"addClass":"removeClass"]("collapsed"),$(target).collapse(option)})}(window.jQuery),!function($){"use strict";function clearMenus(){$(toggle).each(function(){getParent($(this)).removeClass("open")})}function getParent($this){var $parent,selector=$this.attr("data-target");return selector||(selector=$this.attr("href"),selector=selector&&/#/.test(selector)&&selector.replace(/.*(?=#[^\s]*$)/,"")),$parent=$(selector),$parent.length||($parent=$this.parent()),$parent}var toggle="[data
 -toggle=dropdown]",Dropdown=function(element){var $el=$(element).on("click.dropdown.data-api",this.toggle);$("html").on("click.dropdown.data-api",function(){$el.parent().removeClass("open")})};Dropdown.prototype={constructor:Dropdown,toggle:function(){var $parent,isActive,$this=$(this);if(!$this.is(".disabled, :disabled"))return $parent=getParent($this),isActive=$parent.hasClass("open"),clearMenus(),isActive||$parent.toggleClass("open"),$this.focus(),!1},keydown:function(e){var $this,$items,$parent,isActive,index;if(/(38|40|27)/.test(e.keyCode)&&($this=$(this),e.preventDefault(),e.stopPropagation(),!$this.is(".disabled, :disabled"))){if($parent=getParent($this),isActive=$parent.hasClass("open"),!isActive||isActive&&27==e.keyCode)return $this.click();$items=$("[role=menu] li:not(.divider):visible a",$parent),$items.length&&(index=$items.index($items.filter(":focus")),38==e.keyCode&&index>0&&index--,40==e.keyCode&&$items.length-1>index&&index++,~index||(index=0),$items.eq(inde
 x).focus())}}};var old=$.fn.dropdown;$.fn.dropdown=function(option){return this.each(function(){var $this=$(this),data=$this.data("dropdown");data||$this.data("dropdown",data=new Dropdown(this)),"string"==typeof option&&data[option].call($this)})},$.fn.dropdown.Constructor=Dropdown,$.fn.dropdown.noConflict=function(){return $.fn.dropdown=old,this},$(document).on("click.dropdown.data-api touchstart.dropdown.data-api",clearMenus).on("click.dropdown touchstart.dropdown.data-api",".dropdown form",function(e){e.stopPropagation()}).on("touchstart.dropdown.data-api",".dropdown-menu",function(e){e.stopPropagation()}).on("click.dropdown.data-api touchstart.dropdown.data-api",toggle,Dropdown.prototype.toggle).on("keydown.dropdown.data-api touchstart.dropdown.data-api",toggle+", [role=menu]",Dropdown.prototype.keydown)}(window.jQuery),!function($){"use strict";var Modal=function(element,options){this.options=options,this.$element=$(element).delegate('[data-dismiss="modal"]',"click.dism
 iss.modal",$.proxy(this.hide,this)),this.options.remote&&this.$element.find(".modal-body").load(this.options.remote)};Modal.prototype={constructor:Modal,toggle:function(){return this[this.isShown?"hide":"show"]()},show:function(){var that=this,e=$.Event("show");this.$element.trigger(e),this.isShown||e.isDefaultPrevented()||(this.isShown=!0,this.escape(),this.backdrop(function(){var transition=$.support.transition&&that.$element.hasClass("fade");that.$element.parent().length||that.$element.appendTo(document.body),that.$element.show(),transition&&that.$element[0].offsetWidth,that.$element.addClass("in").attr("aria-hidden",!1),that.enforceFocus(),transition?that.$element.one($.support.transition.end,function(){that.$element.focus().trigger("shown")}):that.$element.focus().trigger("shown")}))},hide:function(e){e&&e.preventDefault(),e=$.Event("hide"),this.$element.trigger(e),this.isShown&&!e.isDefaultPrevented()&&(this.isShown=!1,this.escape(),$(document).off("focusin.modal"),thi
 s.$element.removeClass("in").attr("aria-hidden",!0),$.support.transition&&this.$element.hasClass("fade")?this.hideWithTransition():this.hideModal())},enforceFocus:function(){var that=this;$(document).on("focusin.modal",function(e){that.$element[0]===e.target||that.$element.has(e.target).length||that.$element.focus()})},escape:function(){var that=this;this.isShown&&this.options.keyboard?this.$element.on("keyup.dismiss.modal",function(e){27==e.which&&that.hide()}):this.isShown||this.$element.off("keyup.dismiss.modal")},hideWithTransition:function(){var that=this,timeout=setTimeout(function(){that.$element.off($.support.transition.end),that.hideModal()},500);this.$element.one($.support.transition.end,function(){clearTimeout(timeout),that.hideModal()})},hideModal:function(){this.$element.hide().trigger("hidden"),this.backdrop()},removeBackdrop:function(){this.$backdrop.remove(),this.$backdrop=null},backdrop:function(callback){var animate=this.$element.hasClass("fade")?"fade":"";
 if(this.isShown&&this.options.backdrop){var doAnimate=$.support.transition&&animate;this.$backdrop=$('<div class="modal-backdrop '+animate+'" />').appendTo(document.body),this.$backdrop.click("static"==this.options.backdrop?$.proxy(this.$element[0].focus,this.$element[0]):$.proxy(this.hide,this)),doAnimate&&this.$backdrop[0].offsetWidth,this.$backdrop.addClass("in"),doAnimate?this.$backdrop.one($.support.transition.end,callback):callback()}else!this.isShown&&this.$backdrop?(this.$backdrop.removeClass("in"),$.support.transition&&this.$element.hasClass("fade")?this.$backdrop.one($.support.transition.end,$.proxy(this.removeBackdrop,this)):this.removeBackdrop()):callback&&callback()}};var old=$.fn.modal;$.fn.modal=function(option){return this.each(function(){var $this=$(this),data=$this.data("modal"),options=$.extend({},$.fn.modal.defaults,$this.data(),"object"==typeof option&&option);data||$this.data("modal",data=new Modal(this,options)),"string"==typeof option?data[option]():o
 ptions.show&&data.show()})},$.fn.modal.defaults={backdrop:!0,keyboard:!0,show:!0},$.fn.modal.Constructor=Modal,$.fn.modal.noConflict=function(){return $.fn.modal=old,this},$(document).on("click.modal.data-api",'[data-toggle="modal"]',function(e){var $this=$(this),href=$this.attr("href"),$target=$($this.attr("data-target")||href&&href.replace(/.*(?=#[^\s]+$)/,"")),option=$target.data("modal")?"toggle":$.extend({remote:!/#/.test(href)&&href},$target.data(),$this.data());e.preventDefault(),$target.modal(option).one("hide",function(){$this.focus()})})}(window.jQuery),!function($){"use strict";var Tooltip=function(element,options){this.init("tooltip",element,options)};Tooltip.prototype={constructor:Tooltip,init:function(type,element,options){var eventIn,eventOut;this.type=type,this.$element=$(element),this.options=this.getOptions(options),this.enabled=!0,"click"==this.options.trigger?this.$element.on("click."+this.type,this.options.selector,$.proxy(this.toggle,this)):"manual"!=th
 is.options.trigger&&(eventIn="hover"==this.options.trigger?"mouseenter":"focus",eventOut="hover"==this.options.trigger?"mouseleave":"blur",this.$element.on(eventIn+"."+this.type,this.options.selector,$.proxy(this.enter,this)),this.$element.on(eventOut+"."+this.type,this.options.selector,$.proxy(this.leave,this))),this.options.selector?this._options=$.extend({},this.options,{trigger:"manual",selector:""}):this.fixTitle()},getOptions:function(options){return options=$.extend({},$.fn[this.type].defaults,options,this.$element.data()),options.delay&&"number"==typeof options.delay&&(options.delay={show:options.delay,hide:options.delay}),options},enter:function(e){var self=$(e.currentTarget)[this.type](this._options).data(this.type);return self.options.delay&&self.options.delay.show?(clearTimeout(this.timeout),self.hoverState="in",this.timeout=setTimeout(function(){"in"==self.hoverState&&self.show()},self.options.delay.show),void 0):self.show()},leave:function(e){var self=$(e.curre
 ntTarget)[this.type](this._options).data(this.type);return this.timeout&&clearTimeout(this.timeout),self.options.delay&&self.options.delay.hide?(self.hoverState="out",this.timeout=setTimeout(function(){"out"==self.hoverState&&self.hide()},self.options.delay.hide),void 0):self.hide()},show:function(){var $tip,inside,pos,actualWidth,actualHeight,placement,tp;if(this.hasContent()&&this.enabled){switch($tip=this.tip(),this.setContent(),this.options.animation&&$tip.addClass("fade"),placement="function"==typeof this.options.placement?this.options.placement.call(this,$tip[0],this.$element[0]):this.options.placement,inside=/in/.test(placement),$tip.detach().css({top:0,left:0,display:"block"}).insertAfter(this.$element),pos=this.getPosition(inside),actualWidth=$tip[0].offsetWidth,actualHeight=$tip[0].offsetHeight,inside?placement.split(" ")[1]:placement){case"bottom":tp={top:pos.top+pos.height,left:pos.left+pos.width/2-actualWidth/2};break;case"top":tp={top:pos.top-actualHeight,left:
 pos.left+pos.width/2-actualWidth/2};break;case"left":tp={top:pos.top+pos.height/2-actualHeight/2,left:pos.left-actualWidth};break;case"right":tp={top:pos.top+pos.height/2-actualHeight/2,left:pos.left+pos.width}}$tip.offset(tp).addClass(placement).addClass("in")}},setContent:function(){var $tip=this.tip(),title=this.getTitle();$tip.find(".tooltip-inner")[this.options.html?"html":"text"](title),$tip.removeClass("fade in top bottom left right")},hide:function(){function removeWithAnimation(){var timeout=setTimeout(function(){$tip.off($.support.transition.end).detach()},500);$tip.one($.support.transition.end,function(){clearTimeout(timeout),$tip.detach()})}var $tip=this.tip();return $tip.removeClass("in"),$.support.transition&&this.$tip.hasClass("fade")?removeWithAnimation():$tip.detach(),this},fixTitle:function(){var $e=this.$element;($e.attr("title")||"string"!=typeof $e.attr("data-original-title"))&&$e.attr("data-original-title",$e.attr("title")||"").removeAttr("title")},hasC
 ontent:function(){return this.getTitle()},getPosition:function(inside){return $.extend({},inside?{top:0,left:0}:this.$element.offset(),{width:this.$element[0].offsetWidth,height:this.$element[0].offsetHeight})},getTitle:function(){var title,$e=this.$element,o=this.options;return title=$e.attr("data-original-title")||("function"==typeof o.title?o.title.call($e[0]):o.title)},tip:function(){return this.$tip=this.$tip||$(this.options.template)},validate:function(){this.$element[0].parentNode||(this.hide(),this.$element=null,this.options=null)},enable:function(){this.enabled=!0},disable:function(){this.enabled=!1},toggleEnabled:function(){this.enabled=!this.enabled},toggle:function(e){var self=$(e.currentTarget)[this.type](this._options).data(this.type);self[self.tip().hasClass("in")?"hide":"show"]()},destroy:function(){this.hide().$element.off("."+this.type).removeData(this.type)}};var old=$.fn.tooltip;$.fn.tooltip=function(option){return this.each(function(){var $this=$(this),d
 ata=$this.data("tooltip"),options="object"==typeof option&&option;data||$this.data("tooltip",data=new Tooltip(this,options)),"string"==typeof option&&data[option]()})},$.fn.tooltip.Constructor=Tooltip,$.fn.tooltip.defaults={animation:!0,placement:"top",selector:!1,template:'<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',trigger:"hover",title:"",delay:0,html:!1},$.fn.tooltip.noConflict=function(){return $.fn.tooltip=old,this}}(window.jQuery),!function($){"use strict";var Popover=function(element,options){this.init("popover",element,options)};Popover.prototype=$.extend({},$.fn.tooltip.Constructor.prototype,{constructor:Popover,setContent:function(){var $tip=this.tip(),title=this.getTitle(),content=this.getContent();$tip.find(".popover-title")[this.options.html?"html":"text"](title),$tip.find(".popover-content")[this.options.html?"html":"text"](content),$tip.removeClass("fade top bottom left right in")},hasContent:function(){retur
 n this.getTitle()||this.getContent()},getContent:function(){var content,$e=this.$element,o=this.options;return content=$e.attr("data-content")||("function"==typeof o.content?o.content.call($e[0]):o.content)},tip:function(){return this.$tip||(this.$tip=$(this.options.template)),this.$tip},destroy:function(){this.hide().$element.off("."+this.type).removeData(this.type)}});var old=$.fn.popover;$.fn.popover=function(option){return this.each(function(){var $this=$(this),data=$this.data("popover"),options="object"==typeof option&&option;data||$this.data("popover",data=new Popover(this,options)),"string"==typeof option&&data[option]()})},$.fn.popover.Constructor=Popover,$.fn.popover.defaults=$.extend({},$.fn.tooltip.defaults,{placement:"right",trigger:"click",content:"",template:'<div class="popover"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"></div></div></div>'}),$.fn.popover.noConflict=function(){return $.fn.pop
 over=old,this}}(window.jQuery),!function($){"use strict";function ScrollSpy(element,options){var href,process=$.proxy(this.process,this),$element=$(element).is("body")?$(window):$(element);this.options=$.extend({},$.fn.scrollspy.defaults,options),this.$scrollElement=$element.on("scroll.scroll-spy.data-api",process),this.selector=(this.options.target||(href=$(element).attr("href"))&&href.replace(/.*(?=#[^\s]+$)/,"")||"")+" .nav li > a",this.$body=$("body"),this.refresh(),this.process()}ScrollSpy.prototype={constructor:ScrollSpy,refresh:function(){var $targets,self=this;this.offsets=$([]),this.targets=$([]),$targets=this.$body.find(this.selector).map(function(){var $el=$(this),href=$el.data("target")||$el.attr("href"),$href=/^#\w/.test(href)&&$(href);return $href&&$href.length&&[[$href.position().top+self.$scrollElement.scrollTop(),href]]||null}).sort(function(a,b){return a[0]-b[0]}).each(function(){self.offsets.push(this[0]),self.targets.push(this[1])})},process:function(){va
 r i,scrollTop=this.$scrollElement.scrollTop()+this.options.offset,scrollHeight=this.$scrollElement[0].scrollHeight||this.$body[0].scrollHeight,maxScroll=scrollHeight-this.$scrollElement.height(),offsets=this.offsets,targets=this.targets,activeTarget=this.activeTarget;if(scrollTop>=maxScroll)return activeTarget!=(i=targets.last()[0])&&this.activate(i);for(i=offsets.length;i--;)activeTarget!=targets[i]&&scrollTop>=offsets[i]&&(!offsets[i+1]||offsets[i+1]>=scrollTop)&&this.activate(targets[i])},activate:function(target){var active,selector;this.activeTarget=target,$(this.selector).parent(".active").removeClass("active"),selector=this.selector+'[data-target="'+target+'"],'+this.selector+'[href="'+target+'"]',active=$(selector).parent("li").addClass("active"),active.parent(".dropdown-menu").length&&(active=active.closest("li.dropdown").addClass("active")),active.trigger("activate")}};var old=$.fn.scrollspy;$.fn.scrollspy=function(option){return this.each(function(){var $this=$(th
 is),data=$this.data("scrollspy"),options="object"==typeof option&&option;data||$this.data("scrollspy",data=new ScrollSpy(this,options)),"string"==typeof option&&data[option]()})},$.fn.scrollspy.Constructor=ScrollSpy,$.fn.scrollspy.defaults={offset:10},$.fn.scrollspy.noConflict=function(){return $.fn.scrollspy=old,this},$(window).on("load",function(){$('[data-spy="scroll"]').each(function(){var $spy=$(this);$spy.scrollspy($spy.data())})})}(window.jQuery),!function($){"use strict";var Tab=function(element){this.element=$(element)};Tab.prototype={constructor:Tab,show:function(){var previous,$target,e,$this=this.element,$ul=$this.closest("ul:not(.dropdown-menu)"),selector=$this.attr("data-target");selector||(selector=$this.attr("href"),selector=selector&&selector.replace(/.*(?=#[^\s]*$)/,"")),$this.parent("li").hasClass("active")||(previous=$ul.find(".active:last a")[0],e=$.Event("show",{relatedTarget:previous}),$this.trigger(e),e.isDefaultPrevented()||($target=$(selector),this.
 activate($this.parent("li"),$ul),this.activate($target,$target.parent(),function(){$this.trigger({type:"shown",relatedTarget:previous})})))},activate:function(element,container,callback){function next(){$active.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"),element.addClass("active"),transition?(element[0].offsetWidth,element.addClass("in")):element.removeClass("fade"),element.parent(".dropdown-menu")&&element.closest("li.dropdown").addClass("active"),callback&&callback()}var $active=container.find("> .active"),transition=callback&&$.support.transition&&$active.hasClass("fade");transition?$active.one($.support.transition.end,next):next(),$active.removeClass("in")}};var old=$.fn.tab;$.fn.tab=function(option){return this.each(function(){var $this=$(this),data=$this.data("tab");data||$this.data("tab",data=new Tab(this)),"string"==typeof option&&data[option]()})},$.fn.tab.Constructor=Tab,$.fn.tab.noConflict=function(){return $.fn.tab=old,this},$(d
 ocument).on("click.tab.data-api",'[data-toggle="tab"], [data-toggle="pill"]',function(e){e.preventDefault(),$(this).tab("show")})}(window.jQuery),!function($){"use strict";var Typeahead=function(element,options){this.$element=$(element),this.options=$.extend({},$.fn.typeahead.defaults,options),this.matcher=this.options.matcher||this.matcher,this.sorter=this.options.sorter||this.sorter,this.highlighter=this.options.highlighter||this.highlighter,this.updater=this.options.updater||this.updater,this.source=this.options.source,this.$menu=$(this.options.menu),this.shown=!1,this.listen()};Typeahead.prototype={constructor:Typeahead,select:function(){var val=this.$menu.find(".active").attr("data-value");return this.$element.val(this.updater(val)).change(),this.hide()},updater:function(item){return item},show:function(){var pos=$.extend({},this.$element.position(),{height:this.$element[0].offsetHeight});return this.$menu.insertAfter(this.$element).css({top:pos.top+pos.height,left:pos.
 left}).show(),this.shown=!0,this},hide:function(){return this.$menu.hide(),this.shown=!1,this},lookup:function(){var items;return this.query=this.$element.val(),!this.query||this.query.length<this.options.minLength?this.shown?this.hide():this:(items=$.isFunction(this.source)?this.source(this.query,$.proxy(this.process,this)):this.source,items?this.process(items):this)},process:function(items){var that=this;return items=$.grep(items,function(item){return that.matcher(item)}),items=this.sorter(items),items.length?this.render(items.slice(0,this.options.items)).show():this.shown?this.hide():this},matcher:function(item){return~item.toLowerCase().indexOf(this.query.toLowerCase())},sorter:function(items){for(var item,beginswith=[],caseSensitive=[],caseInsensitive=[];item=items.shift();)item.toLowerCase().indexOf(this.query.toLowerCase())?~item.indexOf(this.query)?caseSensitive.push(item):caseInsensitive.push(item):beginswith.push(item);return beginswith.concat(caseSensitive,caseIns
 ensitive)},highlighter:function(item){var query=this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g,"\\$&");return item.replace(RegExp("("+query+")","ig"),function($1,match){return"<strong>"+match+"</strong>"})},render:function(items){var that=this;return items=$(items).map(function(i,item){return i=$(that.options.item).attr("data-value",item),i.find("a").html(that.highlighter(item)),i[0]}),items.first().addClass("active"),this.$menu.html(items),this},next:function(){var active=this.$menu.find(".active").removeClass("active"),next=active.next();next.length||(next=$(this.$menu.find("li")[0])),next.addClass("active")},prev:function(){var active=this.$menu.find(".active").removeClass("active"),prev=active.prev();prev.length||(prev=this.$menu.find("li").last()),prev.addClass("active")},listen:function(){this.$element.on("blur",$.proxy(this.blur,this)).on("keypress",$.proxy(this.keypress,this)).on("keyup",$.proxy(this.keyup,this)),this.eventSupported("keydown")&&this.$element.on("ke
 ydown",$.proxy(this.keydown,this)),this.$menu.on("click",$.proxy(this.click,this)).on("mouseenter","li",$.proxy(this.mouseenter,this))},eventSupported:function(eventName){var isSupported=eventName in this.$element;return isSupported||(this.$element.setAttribute(eventName,"return;"),isSupported="function"==typeof this.$element[eventName]),isSupported},move:function(e){if(this.shown){switch(e.keyCode){case 9:case 13:case 27:e.preventDefault();break;case 38:e.preventDefault(),this.prev();break;case 40:e.preventDefault(),this.next()}e.stopPropagation()}},keydown:function(e){this.suppressKeyPressRepeat=~$.inArray(e.keyCode,[40,38,9,13,27]),this.move(e)},keypress:function(e){this.suppressKeyPressRepeat||this.move(e)},keyup:function(e){switch(e.keyCode){case 40:case 38:case 16:case 17:case 18:break;case 9:case 13:if(!this.shown)return;this.select();break;case 27:if(!this.shown)return;this.hide();break;default:this.lookup()}e.stopPropagation(),e.preventDefault()},blur:function(){var
  that=this;setTimeout(function(){that.hide()},150)},click:function(e){e.stopPropagation(),e.preventDefault(),this.select()},mouseenter:function(e){this.$menu.find(".active").removeClass("active"),$(e.currentTarget).addClass("active")}};var old=$.fn.typeahead;$.fn.typeahead=function(option){return this.each(function(){var $this=$(this),data=$this.data("typeahead"),options="object"==typeof option&&option;data||$this.data("typeahead",data=new Typeahead(this,options)),"string"==typeof option&&data[option]()})},$.fn.typeahead.defaults={source:[],items:8,menu:'<ul class="typeahead dropdown-menu"></ul>',item:'<li><a href="#"></a></li>',minLength:1},$.fn.typeahead.Constructor=Typeahead,$.fn.typeahead.noConflict=function(){return $.fn.typeahead=old,this},$(document).on("focus.typeahead.data-api",'[data-provide="typeahead"]',function(e){var $this=$(this);$this.data("typeahead")||(e.preventDefault(),$this.typeahead($this.data()))})}(window.jQuery),!function($){"use strict";var Affix=fu
 nction(element,options){this.options=$.extend({},$.fn.affix.defaults,options),this.$window=$(window).on("scroll.affix.data-api",$.proxy(this.checkPosition,this)).on("click.affix.data-api",$.proxy(function(){setTimeout($.proxy(this.checkPosition,this),1)},this)),this.$element=$(element),this.checkPosition()};Affix.prototype.checkPosition=function(){if(this.$element.is(":visible")){var affix,scrollHeight=$(document).height(),scrollTop=this.$window.scrollTop(),position=this.$element.offset(),offset=this.options.offset,offsetBottom=offset.bottom,offsetTop=offset.top,reset="affix affix-top affix-bottom";"object"!=typeof offset&&(offsetBottom=offsetTop=offset),"function"==typeof offsetTop&&(offsetTop=offset.top()),"function"==typeof offsetBottom&&(offsetBottom=offset.bottom()),affix=null!=this.unpin&&scrollTop+this.unpin<=position.top?!1:null!=offsetBottom&&position.top+this.$element.height()>=scrollHeight-offsetBottom?"bottom":null!=offsetTop&&offsetTop>=scrollTop?"top":!1,this.a
 ffixed!==affix&&(this.affixed=affix,this.unpin="bottom"==affix?position.top-scrollTop:null,this.$element.removeClass(reset).addClass("affix"+(affix?"-"+affix:"")))}};var old=$.fn.affix;$.fn.affix=function(option){return this.each(function(){var $this=$(this),data=$this.data("affix"),options="object"==typeof option&&option;data||$this.data("affix",data=new Affix(this,options)),"string"==typeof option&&data[option]()})},$.fn.affix.Constructor=Affix,$.fn.affix.defaults={offset:0},$.fn.affix.noConflict=function(){return $.fn.affix=old,this},$(window).on("load",function(){$('[data-spy="affix"]').each(function(){var $spy=$(this),data=$spy.data();data.offset=data.offset||{},data.offsetBottom&&(data.offset.bottom=data.offsetBottom),data.offsetTop&&(data.offset.top=data.offsetTop),$spy.affix(data)})})}(window.jQuery);
\ No newline at end of file
diff --git a/docs/js/buildroot.js b/docs/js/buildroot.js
new file mode 100644
index 0000000..31fb8a4
--- /dev/null
+++ b/docs/js/buildroot.js
@@ -0,0 +1,56 @@
+function load_activity(feedurl, divid) {
+    var feed = new google.feeds.Feed(feedurl);
+    feed.setNumEntries(8);
+    feed.load(function(result) {
+      if (!result.error) {
+        var container = document.getElementById(divid);
+        for (var i = 0; i < result.feed.entries.length; i++) {
+          var entry = result.feed.entries[i];
+          var div = document.createElement("p");
+          var link = document.createElement("a");
+          var d = new Date(entry.publishedDate);
+          var data = '[' + d.toLocaleDateString() + '] ' + entry.title
+          // Ensure all titles are the same length
+          if (data.length > 60) {
+            data = data.substr(0, 57)
+            data += '...'
+          }
+          var text = document.createTextNode(data);
+          link.appendChild(text);
+          link.title = entry.title;
+          link.href = entry.link
+          div.appendChild(link);
+          container.appendChild(div);
+        }
+      }
+    });
+}
+
+function initialize() {
+  load_activity("http://rss.gmane.org/topics/excerpts/gmane.comp.lib.uclibc.buildroot", "mailing-list-activity");
+  load_activity("http://git.uclibc.org/buildroot/atom/?h=master", "commit-activity");
+}
+
+function google_analytics() {
+  var _gaq = _gaq || [];
+  _gaq.push(['_setAccount', 'UA-21761074-1']);
+  _gaq.push(['_setDomainName', 'none']);
+  _gaq.push(['_setAllowLinker', true]);
+  _gaq.push(['_trackPageview']);
+
+  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
+  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
+  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
+}
+
+google.load("feeds", "1");
+google.setOnLoadCallback(initialize);
+google_analytics();
+
+jQuery(document).ready(function($){
+    var url = window.location.href;
+    // Get the basename of the URL
+    url = url.split(/[\\/]/).pop()
+    $('.nav a[href="/'+url+'"]').parent().addClass('active');
+});
+
diff --git a/docs/js/jquery-1.10.2.min.js b/docs/js/jquery-1.10.2.min.js
new file mode 100644
index 0000000..da41706
--- /dev/null
+++ b/docs/js/jquery-1.10.2.min.js
@@ -0,0 +1,6 @@
+/*! jQuery v1.10.2 | (c) 2005, 2013 jQuery Foundation, Inc. | jquery.org/license
+//@ sourceMappingURL=jquery-1.10.2.min.map
+*/
+(function(e,t){var n,r,i=typeof t,o=e.location,a=e.document,s=a.documentElement,l=e.jQuery,u=e.$,c={},p=[],f="1.10.2",d=p.concat,h=p.push,g=p.slice,m=p.indexOf,y=c.toString,v=c.hasOwnProperty,b=f.trim,x=function(e,t){return new x.fn.init(e,t,r)},w=/[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,T=/\S+/g,C=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,N=/^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/,k=/^<(\w+)\s*\/?>(?:<\/\1>|)$/,E=/^[\],:{}\s]*$/,S=/(?:^|:|,)(?:\s*\[)+/g,A=/\\(?:["\\\/bfnrt]|u[\da-fA-F]{4})/g,j=/"[^"\\\r\n]*"|true|false|null|-?(?:\d+\.|)\d+(?:[eE][+-]?\d+|)/g,D=/^-ms-/,L=/-([\da-z])/gi,H=function(e,t){return t.toUpperCase()},q=function(e){(a.addEventListener||"load"===e.type||"complete"===a.readyState)&&(_(),x.ready())},_=function(){a.addEventListener?(a.removeEventListener("DOMContentLoaded",q,!1),e.removeEventListener("load",q,!1)):(a.detachEvent("onreadystatechange",q),e.detachEvent("onload",q))};x.fn=x.prototype={jquery:f,constructor:x,init:function(e,n,r){var i,o;if(!e)retu
 rn this;if("string"==typeof e){if(i="<"===e.charAt(0)&&">"===e.charAt(e.length-1)&&e.length>=3?[null,e,null]:N.exec(e),!i||!i[1]&&n)return!n||n.jquery?(n||r).find(e):this.constructor(n).find(e);if(i[1]){if(n=n instanceof x?n[0]:n,x.merge(this,x.parseHTML(i[1],n&&n.nodeType?n.ownerDocument||n:a,!0)),k.test(i[1])&&x.isPlainObject(n))for(i in n)x.isFunction(this[i])?this[i](n[i]):this.attr(i,n[i]);return this}if(o=a.getElementById(i[2]),o&&o.parentNode){if(o.id!==i[2])return r.find(e);this.length=1,this[0]=o}return this.context=a,this.selector=e,this}return e.nodeType?(this.context=this[0]=e,this.length=1,this):x.isFunction(e)?r.ready(e):(e.selector!==t&&(this.selector=e.selector,this.context=e.context),x.makeArray(e,this))},selector:"",length:0,toArray:function(){return g.call(this)},get:function(e){return null==e?this.toArray():0>e?this[this.length+e]:this[e]},pushStack:function(e){var t=x.merge(this.constructor(),e);return t.prevObject=this,t.context=this.context,t},each:fun
 ction(e,t){return x.each(this,e,t)},ready:function(e){return x.ready.promise().done(e),this},slice:function(){return this.pushStack(g.apply(this,arguments))},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},eq:function(e){var t=this.length,n=+e+(0>e?t:0);return this.pushStack(n>=0&&t>n?[this[n]]:[])},map:function(e){return this.pushStack(x.map(this,function(t,n){return e.call(t,n,t)}))},end:function(){return this.prevObject||this.constructor(null)},push:h,sort:[].sort,splice:[].splice},x.fn.init.prototype=x.fn,x.extend=x.fn.extend=function(){var e,n,r,i,o,a,s=arguments[0]||{},l=1,u=arguments.length,c=!1;for("boolean"==typeof s&&(c=s,s=arguments[1]||{},l=2),"object"==typeof s||x.isFunction(s)||(s={}),u===l&&(s=this,--l);u>l;l++)if(null!=(o=arguments[l]))for(i in o)e=s[i],r=o[i],s!==r&&(c&&r&&(x.isPlainObject(r)||(n=x.isArray(r)))?(n?(n=!1,a=e&&x.isArray(e)?e:[]):a=e&&x.isPlainObject(e)?e:{},s[i]=x.extend(c,a,r)):r!==t&&(s[i]=r));return s},x.extend({expa
 ndo:"jQuery"+(f+Math.random()).replace(/\D/g,""),noConflict:function(t){return e.$===x&&(e.$=u),t&&e.jQuery===x&&(e.jQuery=l),x},isReady:!1,readyWait:1,holdReady:function(e){e?x.readyWait++:x.ready(!0)},ready:function(e){if(e===!0?!--x.readyWait:!x.isReady){if(!a.body)return setTimeout(x.ready);x.isReady=!0,e!==!0&&--x.readyWait>0||(n.resolveWith(a,[x]),x.fn.trigger&&x(a).trigger("ready").off("ready"))}},isFunction:function(e){return"function"===x.type(e)},isArray:Array.isArray||function(e){return"array"===x.type(e)},isWindow:function(e){return null!=e&&e==e.window},isNumeric:function(e){return!isNaN(parseFloat(e))&&isFinite(e)},type:function(e){return null==e?e+"":"object"==typeof e||"function"==typeof e?c[y.call(e)]||"object":typeof e},isPlainObject:function(e){var n;if(!e||"object"!==x.type(e)||e.nodeType||x.isWindow(e))return!1;try{if(e.constructor&&!v.call(e,"constructor")&&!v.call(e.constructor.prototype,"isPrototypeOf"))return!1}catch(r){return!1}if(x.support.ownLast)
 for(n in e)return v.call(e,n);for(n in e);return n===t||v.call(e,n)},isEmptyObject:function(e){var t;for(t in e)return!1;return!0},error:function(e){throw Error(e)},parseHTML:function(e,t,n){if(!e||"string"!=typeof e)return null;"boolean"==typeof t&&(n=t,t=!1),t=t||a;var r=k.exec(e),i=!n&&[];return r?[t.createElement(r[1])]:(r=x.buildFragment([e],t,i),i&&x(i).remove(),x.merge([],r.childNodes))},parseJSON:function(n){return e.JSON&&e.JSON.parse?e.JSON.parse(n):null===n?n:"string"==typeof n&&(n=x.trim(n),n&&E.test(n.replace(A,"@").replace(j,"]").replace(S,"")))?Function("return "+n)():(x.error("Invalid JSON: "+n),t)},parseXML:function(n){var r,i;if(!n||"string"!=typeof n)return null;try{e.DOMParser?(i=new DOMParser,r=i.parseFromString(n,"text/xml")):(r=new ActiveXObject("Microsoft.XMLDOM"),r.async="false",r.loadXML(n))}catch(o){r=t}return r&&r.documentElement&&!r.getElementsByTagName("parsererror").length||x.error("Invalid XML: "+n),r},noop:function(){},globalEval:function(t){
 t&&x.trim(t)&&(e.execScript||function(t){e.eval.call(e,t)})(t)},camelCase:function(e){return e.replace(D,"ms-").replace(L,H)},nodeName:function(e,t){return e.nodeName&&e.nodeName.toLowerCase()===t.toLowerCase()},each:function(e,t,n){var r,i=0,o=e.length,a=M(e);if(n){if(a){for(;o>i;i++)if(r=t.apply(e[i],n),r===!1)break}else for(i in e)if(r=t.apply(e[i],n),r===!1)break}else if(a){for(;o>i;i++)if(r=t.call(e[i],i,e[i]),r===!1)break}else for(i in e)if(r=t.call(e[i],i,e[i]),r===!1)break;return e},trim:b&&!b.call("\ufeff\u00a0")?function(e){return null==e?"":b.call(e)}:function(e){return null==e?"":(e+"").replace(C,"")},makeArray:function(e,t){var n=t||[];return null!=e&&(M(Object(e))?x.merge(n,"string"==typeof e?[e]:e):h.call(n,e)),n},inArray:function(e,t,n){var r;if(t){if(m)return m.call(t,e,n);for(r=t.length,n=n?0>n?Math.max(0,r+n):n:0;r>n;n++)if(n in t&&t[n]===e)return n}return-1},merge:function(e,n){var r=n.length,i=e.length,o=0;if("number"==typeof r)for(;r>o;o++)e[i++]=n[o];e
 lse while(n[o]!==t)e[i++]=n[o++];return e.length=i,e},grep:function(e,t,n){var r,i=[],o=0,a=e.length;for(n=!!n;a>o;o++)r=!!t(e[o],o),n!==r&&i.push(e[o]);return i},map:function(e,t,n){var r,i=0,o=e.length,a=M(e),s=[];if(a)for(;o>i;i++)r=t(e[i],i,n),null!=r&&(s[s.length]=r);else for(i in e)r=t(e[i],i,n),null!=r&&(s[s.length]=r);return d.apply([],s)},guid:1,proxy:function(e,n){var r,i,o;return"string"==typeof n&&(o=e[n],n=e,e=o),x.isFunction(e)?(r=g.call(arguments,2),i=function(){return e.apply(n||this,r.concat(g.call(arguments)))},i.guid=e.guid=e.guid||x.guid++,i):t},access:function(e,n,r,i,o,a,s){var l=0,u=e.length,c=null==r;if("object"===x.type(r)){o=!0;for(l in r)x.access(e,n,l,r[l],!0,a,s)}else if(i!==t&&(o=!0,x.isFunction(i)||(s=!0),c&&(s?(n.call(e,i),n=null):(c=n,n=function(e,t,n){return c.call(x(e),n)})),n))for(;u>l;l++)n(e[l],r,s?i:i.call(e[l],l,n(e[l],r)));return o?e:c?n.call(e):u?n(e[0],r):a},now:function(){return(new Date).getTime()},swap:function(e,t,n,r){var i,o,a
 ={};for(o in t)a[o]=e.style[o],e.style[o]=t[o];i=n.apply(e,r||[]);for(o in t)e.style[o]=a[o];return i}}),x.ready.promise=function(t){if(!n)if(n=x.Deferred(),"complete"===a.readyState)setTimeout(x.ready);else if(a.addEventListener)a.addEventListener("DOMContentLoaded",q,!1),e.addEventListener("load",q,!1);else{a.attachEvent("onreadystatechange",q),e.attachEvent("onload",q);var r=!1;try{r=null==e.frameElement&&a.documentElement}catch(i){}r&&r.doScroll&&function o(){if(!x.isReady){try{r.doScroll("left")}catch(e){return setTimeout(o,50)}_(),x.ready()}}()}return n.promise(t)},x.each("Boolean Number String Function Array Date RegExp Object Error".split(" "),function(e,t){c["[object "+t+"]"]=t.toLowerCase()});function M(e){var t=e.length,n=x.type(e);return x.isWindow(e)?!1:1===e.nodeType&&t?!0:"array"===n||"function"!==n&&(0===t||"number"==typeof t&&t>0&&t-1 in e)}r=x(a),function(e,t){var n,r,i,o,a,s,l,u,c,p,f,d,h,g,m,y,v,b="sizzle"+-new Date,w=e.document,T=0,C=0,N=st(),k=st(),E=st
 (),S=!1,A=function(e,t){return e===t?(S=!0,0):0},j=typeof t,D=1<<31,L={}.hasOwnProperty,H=[],q=H.pop,_=H.push,M=H.push,O=H.slice,F=H.indexOf||function(e){var t=0,n=this.length;for(;n>t;t++)if(this[t]===e)return t;return-1},B="checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",P="[\\x20\\t\\r\\n\\f]",R="(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+",W=R.replace("w","w#"),$="\\["+P+"*("+R+")"+P+"*(?:([*^$|!~]?=)"+P+"*(?:(['\"])((?:\\\\.|[^\\\\])*?)\\3|("+W+")|)|)"+P+"*\\]",I=":("+R+")(?:\\(((['\"])((?:\\\\.|[^\\\\])*?)\\3|((?:\\\\.|[^\\\\()[\\]]|"+$.replace(3,8)+")*)|.*)\\)|)",z=RegExp("^"+P+"+|((?:^|[^\\\\])(?:\\\\.)*)"+P+"+$","g"),X=RegExp("^"+P+"*,"+P+"*"),U=RegExp("^"+P+"*([>+~]|"+P+")"+P+"*"),V=RegExp(P+"*[+~]"),Y=RegExp("="+P+"*([^\\]'\"]*)"+P+"*\\]","g"),J=RegExp(I),G=RegExp("^"+W+"$"),Q={ID:RegExp("^#("+R+")"),CLASS:RegExp("^\\.("+R+")"),TAG:RegExp("^("+R.replace("w","w*")+")"),ATTR:RegExp("^"+$),PSEUDO:RegExp
 ("^"+I),CHILD:RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\("+P+"*(even|odd|(([+-]|)(\\d*)n|)"+P+"*(?:([+-]|)"+P+"*(\\d+)|))"+P+"*\\)|)","i"),bool:RegExp("^(?:"+B+")$","i"),needsContext:RegExp("^"+P+"*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\("+P+"*((?:-\\d)?\\d*)"+P+"*\\)|)(?=[^-]|$)","i")},K=/^[^{]+\{\s*\[native \w/,Z=/^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,et=/^(?:input|select|textarea|button)$/i,tt=/^h\d$/i,nt=/'|\\/g,rt=RegExp("\\\\([\\da-f]{1,6}"+P+"?|("+P+")|.)","ig"),it=function(e,t,n){var r="0x"+t-65536;return r!==r||n?t:0>r?String.fromCharCode(r+65536):String.fromCharCode(55296|r>>10,56320|1023&r)};try{M.apply(H=O.call(w.childNodes),w.childNodes),H[w.childNodes.length].nodeType}catch(ot){M={apply:H.length?function(e,t){_.apply(e,O.call(t))}:function(e,t){var n=e.length,r=0;while(e[n++]=t[r++]);e.length=n-1}}}function at(e,t,n,i){var o,a,s,l,u,c,d,m,y,x;if((t?t.ownerDocument||t:w)!==f&&p(t),t=t||f,n=n||[],!e||"string"!=typeof e)return n;if(1!==(l=t.n
 odeType)&&9!==l)return[];if(h&&!i){if(o=Z.exec(e))if(s=o[1]){if(9===l){if(a=t.getElementById(s),!a||!a.parentNode)return n;if(a.id===s)return n.push(a),n}else if(t.ownerDocument&&(a=t.ownerDocument.getElementById(s))&&v(t,a)&&a.id===s)return n.push(a),n}else{if(o[2])return M.apply(n,t.getElementsByTagName(e)),n;if((s=o[3])&&r.getElementsByClassName&&t.getElementsByClassName)return M.apply(n,t.getElementsByClassName(s)),n}if(r.qsa&&(!g||!g.test(e))){if(m=d=b,y=t,x=9===l&&e,1===l&&"object"!==t.nodeName.toLowerCase()){c=mt(e),(d=t.getAttribute("id"))?m=d.replace(nt,"\\$&"):t.setAttribute("id",m),m="[id='"+m+"'] ",u=c.length;while(u--)c[u]=m+yt(c[u]);y=V.test(e)&&t.parentNode||t,x=c.join(",")}if(x)try{return M.apply(n,y.querySelectorAll(x)),n}catch(T){}finally{d||t.removeAttribute("id")}}}return kt(e.replace(z,"$1"),t,n,i)}function st(){var e=[];function t(n,r){return e.push(n+=" ")>o.cacheLength&&delete t[e.shift()],t[n]=r}return t}function lt(e){return e[b]=!0,e}function ut(e)
 {var t=f.createElement("div");try{return!!e(t)}catch(n){return!1}finally{t.parentNode&&t.parentNode.removeChild(t),t=null}}function ct(e,t){var n=e.split("|"),r=e.length;while(r--)o.attrHandle[n[r]]=t}function pt(e,t){var n=t&&e,r=n&&1===e.nodeType&&1===t.nodeType&&(~t.sourceIndex||D)-(~e.sourceIndex||D);if(r)return r;if(n)while(n=n.nextSibling)if(n===t)return-1;return e?1:-1}function ft(e){return function(t){var n=t.nodeName.toLowerCase();return"input"===n&&t.type===e}}function dt(e){return function(t){var n=t.nodeName.toLowerCase();return("input"===n||"button"===n)&&t.type===e}}function ht(e){return lt(function(t){return t=+t,lt(function(n,r){var i,o=e([],n.length,t),a=o.length;while(a--)n[i=o[a]]&&(n[i]=!(r[i]=n[i]))})})}s=at.isXML=function(e){var t=e&&(e.ownerDocument||e).documentElement;return t?"HTML"!==t.nodeName:!1},r=at.support={},p=at.setDocument=function(e){var n=e?e.ownerDocument||e:w,i=n.defaultView;return n!==f&&9===n.nodeType&&n.documentElement?(f=n,d=n.docume
 ntElement,h=!s(n),i&&i.attachEvent&&i!==i.top&&i.attachEvent("onbeforeunload",function(){p()}),r.attributes=ut(function(e){return e.className="i",!e.getAttribute("className")}),r.getElementsByTagName=ut(function(e){return e.appendChild(n.createComment("")),!e.getElementsByTagName("*").length}),r.getElementsByClassName=ut(function(e){return e.innerHTML="<div class='a'></div><div class='a i'></div>",e.firstChild.className="i",2===e.getElementsByClassName("i").length}),r.getById=ut(function(e){return d.appendChild(e).id=b,!n.getElementsByName||!n.getElementsByName(b).length}),r.getById?(o.find.ID=function(e,t){if(typeof t.getElementById!==j&&h){var n=t.getElementById(e);return n&&n.parentNode?[n]:[]}},o.filter.ID=function(e){var t=e.replace(rt,it);return function(e){return e.getAttribute("id")===t}}):(delete o.find.ID,o.filter.ID=function(e){var t=e.replace(rt,it);return function(e){var n=typeof e.getAttributeNode!==j&&e.getAttributeNode("id");return n&&n.value===t}}),o.find.TA
 G=r.getElementsByTagName?function(e,n){return typeof n.getElementsByTagName!==j?n.getElementsByTagName(e):t}:function(e,t){var n,r=[],i=0,o=t.getElementsByTagName(e);if("*"===e){while(n=o[i++])1===n.nodeType&&r.push(n);return r}return o},o.find.CLASS=r.getElementsByClassName&&function(e,n){return typeof n.getElementsByClassName!==j&&h?n.getElementsByClassName(e):t},m=[],g=[],(r.qsa=K.test(n.querySelectorAll))&&(ut(function(e){e.innerHTML="<select><option selected=''></option></select>",e.querySelectorAll("[selected]").length||g.push("\\["+P+"*(?:value|"+B+")"),e.querySelectorAll(":checked").length||g.push(":checked")}),ut(function(e){var t=n.createElement("input");t.setAttribute("type","hidden"),e.appendChild(t).setAttribute("t",""),e.querySelectorAll("[t^='']").length&&g.push("[*^$]="+P+"*(?:''|\"\")"),e.querySelectorAll(":enabled").length||g.push(":enabled",":disabled"),e.querySelectorAll("*,:x"),g.push(",.*:")})),(r.matchesSelector=K.test(y=d.webkitMatchesSelector||d.mozM
 atchesSelector||d.oMatchesSelector||d.msMatchesSelector))&&ut(function(e){r.disconnectedMatch=y.call(e,"div"),y.call(e,"[s!='']:x"),m.push("!=",I)}),g=g.length&&RegExp(g.join("|")),m=m.length&&RegExp(m.join("|")),v=K.test(d.contains)||d.compareDocumentPosition?function(e,t){var n=9===e.nodeType?e.documentElement:e,r=t&&t.parentNode;return e===r||!(!r||1!==r.nodeType||!(n.contains?n.contains(r):e.compareDocumentPosition&&16&e.compareDocumentPosition(r)))}:function(e,t){if(t)while(t=t.parentNode)if(t===e)return!0;return!1},A=d.compareDocumentPosition?function(e,t){if(e===t)return S=!0,0;var i=t.compareDocumentPosition&&e.compareDocumentPosition&&e.compareDocumentPosition(t);return i?1&i||!r.sortDetached&&t.compareDocumentPosition(e)===i?e===n||v(w,e)?-1:t===n||v(w,t)?1:c?F.call(c,e)-F.call(c,t):0:4&i?-1:1:e.compareDocumentPosition?-1:1}:function(e,t){var r,i=0,o=e.parentNode,a=t.parentNode,s=[e],l=[t];if(e===t)return S=!0,0;if(!o||!a)return e===n?-1:t===n?1:o?-1:a?1:c?F.call(c
 ,e)-F.call(c,t):0;if(o===a)return pt(e,t);r=e;while(r=r.parentNode)s.unshift(r);r=t;while(r=r.parentNode)l.unshift(r);while(s[i]===l[i])i++;return i?pt(s[i],l[i]):s[i]===w?-1:l[i]===w?1:0},n):f},at.matches=function(e,t){return at(e,null,null,t)},at.matchesSelector=function(e,t){if((e.ownerDocument||e)!==f&&p(e),t=t.replace(Y,"='$1']"),!(!r.matchesSelector||!h||m&&m.test(t)||g&&g.test(t)))try{var n=y.call(e,t);if(n||r.disconnectedMatch||e.document&&11!==e.document.nodeType)return n}catch(i){}return at(t,f,null,[e]).length>0},at.contains=function(e,t){return(e.ownerDocument||e)!==f&&p(e),v(e,t)},at.attr=function(e,n){(e.ownerDocument||e)!==f&&p(e);var i=o.attrHandle[n.toLowerCase()],a=i&&L.call(o.attrHandle,n.toLowerCase())?i(e,n,!h):t;return a===t?r.attributes||!h?e.getAttribute(n):(a=e.getAttributeNode(n))&&a.specified?a.value:null:a},at.error=function(e){throw Error("Syntax error, unrecognized expression: "+e)},at.uniqueSort=function(e){var t,n=[],i=0,o=0;if(S=!r.detectDupl
 icates,c=!r.sortStable&&e.slice(0),e.sort(A),S){while(t=e[o++])t===e[o]&&(i=n.push(o));while(i--)e.splice(n[i],1)}return e},a=at.getText=function(e){var t,n="",r=0,i=e.nodeType;if(i){if(1===i||9===i||11===i){if("string"==typeof e.textContent)return e.textContent;for(e=e.firstChild;e;e=e.nextSibling)n+=a(e)}else if(3===i||4===i)return e.nodeValue}else for(;t=e[r];r++)n+=a(t);return n},o=at.selectors={cacheLength:50,createPseudo:lt,match:Q,attrHandle:{},find:{},relative:{">":{dir:"parentNode",first:!0}," ":{dir:"parentNode"},"+":{dir:"previousSibling",first:!0},"~":{dir:"previousSibling"}},preFilter:{ATTR:function(e){return e[1]=e[1].replace(rt,it),e[3]=(e[4]||e[5]||"").replace(rt,it),"~="===e[2]&&(e[3]=" "+e[3]+" "),e.slice(0,4)},CHILD:function(e){return e[1]=e[1].toLowerCase(),"nth"===e[1].slice(0,3)?(e[3]||at.error(e[0]),e[4]=+(e[4]?e[5]+(e[6]||1):2*("even"===e[3]||"odd"===e[3])),e[5]=+(e[7]+e[8]||"odd"===e[3])):e[3]&&at.error(e[0]),e},PSEUDO:function(e){var n,r=!e[5]&&e[2]
 ;return Q.CHILD.test(e[0])?null:(e[3]&&e[4]!==t?e[2]=e[4]:r&&J.test(r)&&(n=mt(r,!0))&&(n=r.indexOf(")",r.length-n)-r.length)&&(e[0]=e[0].slice(0,n),e[2]=r.slice(0,n)),e.slice(0,3))}},filter:{TAG:function(e){var t=e.replace(rt,it).toLowerCase();return"*"===e?function(){return!0}:function(e){return e.nodeName&&e.nodeName.toLowerCase()===t}},CLASS:function(e){var t=N[e+" "];return t||(t=RegExp("(^|"+P+")"+e+"("+P+"|$)"))&&N(e,function(e){return t.test("string"==typeof e.className&&e.className||typeof e.getAttribute!==j&&e.getAttribute("class")||"")})},ATTR:function(e,t,n){return function(r){var i=at.attr(r,e);return null==i?"!="===t:t?(i+="","="===t?i===n:"!="===t?i!==n:"^="===t?n&&0===i.indexOf(n):"*="===t?n&&i.indexOf(n)>-1:"$="===t?n&&i.slice(-n.length)===n:"~="===t?(" "+i+" ").indexOf(n)>-1:"|="===t?i===n||i.slice(0,n.length+1)===n+"-":!1):!0}},CHILD:function(e,t,n,r,i){var o="nth"!==e.slice(0,3),a="last"!==e.slice(-4),s="of-type"===t;return 1===r&&0===i?function(e){return!
 !e.parentNode}:function(t,n,l){var u,c,p,f,d,h,g=o!==a?"nextSibling":"previousSibling",m=t.parentNode,y=s&&t.nodeName.toLowerCase(),v=!l&&!s;if(m){if(o){while(g){p=t;while(p=p[g])if(s?p.nodeName.toLowerCase()===y:1===p.nodeType)return!1;h=g="only"===e&&!h&&"nextSibling"}return!0}if(h=[a?m.firstChild:m.lastChild],a&&v){c=m[b]||(m[b]={}),u=c[e]||[],d=u[0]===T&&u[1],f=u[0]===T&&u[2],p=d&&m.childNodes[d];while(p=++d&&p&&p[g]||(f=d=0)||h.pop())if(1===p.nodeType&&++f&&p===t){c[e]=[T,d,f];break}}else if(v&&(u=(t[b]||(t[b]={}))[e])&&u[0]===T)f=u[1];else while(p=++d&&p&&p[g]||(f=d=0)||h.pop())if((s?p.nodeName.toLowerCase()===y:1===p.nodeType)&&++f&&(v&&((p[b]||(p[b]={}))[e]=[T,f]),p===t))break;return f-=i,f===r||0===f%r&&f/r>=0}}},PSEUDO:function(e,t){var n,r=o.pseudos[e]||o.setFilters[e.toLowerCase()]||at.error("unsupported pseudo: "+e);return r[b]?r(t):r.length>1?(n=[e,e,"",t],o.setFilters.hasOwnProperty(e.toLowerCase())?lt(function(e,n){var i,o=r(e,t),a=o.length;while(a--)i=F.call
 (e,o[a]),e[i]=!(n[i]=o[a])}):function(e){return r(e,0,n)}):r}},pseudos:{not:lt(function(e){var t=[],n=[],r=l(e.replace(z,"$1"));return r[b]?lt(function(e,t,n,i){var o,a=r(e,null,i,[]),s=e.length;while(s--)(o=a[s])&&(e[s]=!(t[s]=o))}):function(e,i,o){return t[0]=e,r(t,null,o,n),!n.pop()}}),has:lt(function(e){return function(t){return at(e,t).length>0}}),contains:lt(function(e){return function(t){return(t.textContent||t.innerText||a(t)).indexOf(e)>-1}}),lang:lt(function(e){return G.test(e||"")||at.error("unsupported lang: "+e),e=e.replace(rt,it).toLowerCase(),function(t){var n;do if(n=h?t.lang:t.getAttribute("xml:lang")||t.getAttribute("lang"))return n=n.toLowerCase(),n===e||0===n.indexOf(e+"-");while((t=t.parentNode)&&1===t.nodeType);return!1}}),target:function(t){var n=e.location&&e.location.hash;return n&&n.slice(1)===t.id},root:function(e){return e===d},focus:function(e){return e===f.activeElement&&(!f.hasFocus||f.hasFocus())&&!!(e.type||e.href||~e.tabIndex)},enabled:funct
 ion(e){return e.disabled===!1},disabled:function(e){return e.disabled===!0},checked:function(e){var t=e.nodeName.toLowerCase();return"input"===t&&!!e.checked||"option"===t&&!!e.selected},selected:function(e){return e.parentNode&&e.parentNode.selectedIndex,e.selected===!0},empty:function(e){for(e=e.firstChild;e;e=e.nextSibling)if(e.nodeName>"@"||3===e.nodeType||4===e.nodeType)return!1;return!0},parent:function(e){return!o.pseudos.empty(e)},header:function(e){return tt.test(e.nodeName)},input:function(e){return et.test(e.nodeName)},button:function(e){var t=e.nodeName.toLowerCase();return"input"===t&&"button"===e.type||"button"===t},text:function(e){var t;return"input"===e.nodeName.toLowerCase()&&"text"===e.type&&(null==(t=e.getAttribute("type"))||t.toLowerCase()===e.type)},first:ht(function(){return[0]}),last:ht(function(e,t){return[t-1]}),eq:ht(function(e,t,n){return[0>n?n+t:n]}),even:ht(function(e,t){var n=0;for(;t>n;n+=2)e.push(n);return e}),odd:ht(function(e,t){var n=1;for
 (;t>n;n+=2)e.push(n);return e}),lt:ht(function(e,t,n){var r=0>n?n+t:n;for(;--r>=0;)e.push(r);return e}),gt:ht(function(e,t,n){var r=0>n?n+t:n;for(;t>++r;)e.push(r);return e})}},o.pseudos.nth=o.pseudos.eq;for(n in{radio:!0,checkbox:!0,file:!0,password:!0,image:!0})o.pseudos[n]=ft(n);for(n in{submit:!0,reset:!0})o.pseudos[n]=dt(n);function gt(){}gt.prototype=o.filters=o.pseudos,o.setFilters=new gt;function mt(e,t){var n,r,i,a,s,l,u,c=k[e+" "];if(c)return t?0:c.slice(0);s=e,l=[],u=o.preFilter;while(s){(!n||(r=X.exec(s)))&&(r&&(s=s.slice(r[0].length)||s),l.push(i=[])),n=!1,(r=U.exec(s))&&(n=r.shift(),i.push({value:n,type:r[0].replace(z," ")}),s=s.slice(n.length));for(a in o.filter)!(r=Q[a].exec(s))||u[a]&&!(r=u[a](r))||(n=r.shift(),i.push({value:n,type:a,matches:r}),s=s.slice(n.length));if(!n)break}return t?s.length:s?at.error(e):k(e,l).slice(0)}function yt(e){var t=0,n=e.length,r="";for(;n>t;t++)r+=e[t].value;return r}function vt(e,t,n){var r=t.dir,o=n&&"parentNode"===r,a=C++;r
 eturn t.first?function(t,n,i){while(t=t[r])if(1===t.nodeType||o)return e(t,n,i)}:function(t,n,s){var l,u,c,p=T+" "+a;if(s){while(t=t[r])if((1===t.nodeType||o)&&e(t,n,s))return!0}else while(t=t[r])if(1===t.nodeType||o)if(c=t[b]||(t[b]={}),(u=c[r])&&u[0]===p){if((l=u[1])===!0||l===i)return l===!0}else if(u=c[r]=[p],u[1]=e(t,n,s)||i,u[1]===!0)return!0}}function bt(e){return e.length>1?function(t,n,r){var i=e.length;while(i--)if(!e[i](t,n,r))return!1;return!0}:e[0]}function xt(e,t,n,r,i){var o,a=[],s=0,l=e.length,u=null!=t;for(;l>s;s++)(o=e[s])&&(!n||n(o,r,i))&&(a.push(o),u&&t.push(s));return a}function wt(e,t,n,r,i,o){return r&&!r[b]&&(r=wt(r)),i&&!i[b]&&(i=wt(i,o)),lt(function(o,a,s,l){var u,c,p,f=[],d=[],h=a.length,g=o||Nt(t||"*",s.nodeType?[s]:s,[]),m=!e||!o&&t?g:xt(g,f,e,s,l),y=n?i||(o?e:h||r)?[]:a:m;if(n&&n(m,y,s,l),r){u=xt(y,d),r(u,[],s,l),c=u.length;while(c--)(p=u[c])&&(y[d[c]]=!(m[d[c]]=p))}if(o){if(i||e){if(i){u=[],c=y.length;while(c--)(p=y[c])&&u.push(m[c]=p);i(null,y
 =[],u,l)}c=y.length;while(c--)(p=y[c])&&(u=i?F.call(o,p):f[c])>-1&&(o[u]=!(a[u]=p))}}else y=xt(y===a?y.splice(h,y.length):y),i?i(null,a,y,l):M.apply(a,y)})}function Tt(e){var t,n,r,i=e.length,a=o.relative[e[0].type],s=a||o.relative[" "],l=a?1:0,c=vt(function(e){return e===t},s,!0),p=vt(function(e){return F.call(t,e)>-1},s,!0),f=[function(e,n,r){return!a&&(r||n!==u)||((t=n).nodeType?c(e,n,r):p(e,n,r))}];for(;i>l;l++)if(n=o.relative[e[l].type])f=[vt(bt(f),n)];else{if(n=o.filter[e[l].type].apply(null,e[l].matches),n[b]){for(r=++l;i>r;r++)if(o.relative[e[r].type])break;return wt(l>1&&bt(f),l>1&&yt(e.slice(0,l-1).concat({value:" "===e[l-2].type?"*":""})).replace(z,"$1"),n,r>l&&Tt(e.slice(l,r)),i>r&&Tt(e=e.slice(r)),i>r&&yt(e))}f.push(n)}return bt(f)}function Ct(e,t){var n=0,r=t.length>0,a=e.length>0,s=function(s,l,c,p,d){var h,g,m,y=[],v=0,b="0",x=s&&[],w=null!=d,C=u,N=s||a&&o.find.TAG("*",d&&l.parentNode||l),k=T+=null==C?1:Math.random()||.1;for(w&&(u=l!==f&&l,i=n);null!=(h=N[b])
 ;b++){if(a&&h){g=0;while(m=e[g++])if(m(h,l,c)){p.push(h);break}w&&(T=k,i=++n)}r&&((h=!m&&h)&&v--,s&&x.push(h))}if(v+=b,r&&b!==v){g=0;while(m=t[g++])m(x,y,l,c);if(s){if(v>0)while(b--)x[b]||y[b]||(y[b]=q.call(p));y=xt(y)}M.apply(p,y),w&&!s&&y.length>0&&v+t.length>1&&at.uniqueSort(p)}return w&&(T=k,u=C),x};return r?lt(s):s}l=at.compile=function(e,t){var n,r=[],i=[],o=E[e+" "];if(!o){t||(t=mt(e)),n=t.length;while(n--)o=Tt(t[n]),o[b]?r.push(o):i.push(o);o=E(e,Ct(i,r))}return o};function Nt(e,t,n){var r=0,i=t.length;for(;i>r;r++)at(e,t[r],n);return n}function kt(e,t,n,i){var a,s,u,c,p,f=mt(e);if(!i&&1===f.length){if(s=f[0]=f[0].slice(0),s.length>2&&"ID"===(u=s[0]).type&&r.getById&&9===t.nodeType&&h&&o.relative[s[1].type]){if(t=(o.find.ID(u.matches[0].replace(rt,it),t)||[])[0],!t)return n;e=e.slice(s.shift().value.length)}a=Q.needsContext.test(e)?0:s.length;while(a--){if(u=s[a],o.relative[c=u.type])break;if((p=o.find[c])&&(i=p(u.matches[0].replace(rt,it),V.test(s[0].type)&&t.parent
 Node||t))){if(s.splice(a,1),e=i.length&&yt(s),!e)return M.apply(n,i),n;break}}}return l(e,f)(i,t,!h,n,V.test(e)),n}r.sortStable=b.split("").sort(A).join("")===b,r.detectDuplicates=S,p(),r.sortDetached=ut(function(e){return 1&e.compareDocumentPosition(f.createElement("div"))}),ut(function(e){return e.innerHTML="<a href='#'></a>","#"===e.firstChild.getAttribute("href")})||ct("type|href|height|width",function(e,n,r){return r?t:e.getAttribute(n,"type"===n.toLowerCase()?1:2)}),r.attributes&&ut(function(e){return e.innerHTML="<input/>",e.firstChild.setAttribute("value",""),""===e.firstChild.getAttribute("value")})||ct("value",function(e,n,r){return r||"input"!==e.nodeName.toLowerCase()?t:e.defaultValue}),ut(function(e){return null==e.getAttribute("disabled")})||ct(B,function(e,n,r){var i;return r?t:(i=e.getAttributeNode(n))&&i.specified?i.value:e[n]===!0?n.toLowerCase():null}),x.find=at,x.expr=at.selectors,x.expr[":"]=x.expr.pseudos,x.unique=at.uniqueSort,x.text=at.getText,x.isXML
 Doc=at.isXML,x.contains=at.contains}(e);var O={};function F(e){var t=O[e]={};return x.each(e.match(T)||[],function(e,n){t[n]=!0}),t}x.Callbacks=function(e){e="string"==typeof e?O[e]||F(e):x.extend({},e);var n,r,i,o,a,s,l=[],u=!e.once&&[],c=function(t){for(r=e.memory&&t,i=!0,a=s||0,s=0,o=l.length,n=!0;l&&o>a;a++)if(l[a].apply(t[0],t[1])===!1&&e.stopOnFalse){r=!1;break}n=!1,l&&(u?u.length&&c(u.shift()):r?l=[]:p.disable())},p={add:function(){if(l){var t=l.length;(function i(t){x.each(t,function(t,n){var r=x.type(n);"function"===r?e.unique&&p.has(n)||l.push(n):n&&n.length&&"string"!==r&&i(n)})})(arguments),n?o=l.length:r&&(s=t,c(r))}return this},remove:function(){return l&&x.each(arguments,function(e,t){var r;while((r=x.inArray(t,l,r))>-1)l.splice(r,1),n&&(o>=r&&o--,a>=r&&a--)}),this},has:function(e){return e?x.inArray(e,l)>-1:!(!l||!l.length)},empty:function(){return l=[],o=0,this},disable:function(){return l=u=r=t,this},disabled:function(){return!l},lock:function(){return u=t,
 r||p.disable(),this},locked:function(){return!u},fireWith:function(e,t){return!l||i&&!u||(t=t||[],t=[e,t.slice?t.slice():t],n?u.push(t):c(t)),this},fire:function(){return p.fireWith(this,arguments),this},fired:function(){return!!i}};return p},x.extend({Deferred:function(e){var t=[["resolve","done",x.Callbacks("once memory"),"resolved"],["reject","fail",x.Callbacks("once memory"),"rejected"],["notify","progress",x.Callbacks("memory")]],n="pending",r={state:function(){return n},always:function(){return i.done(arguments).fail(arguments),this},then:function(){var e=arguments;return x.Deferred(function(n){x.each(t,function(t,o){var a=o[0],s=x.isFunction(e[t])&&e[t];i[o[1]](function(){var e=s&&s.apply(this,arguments);e&&x.isFunction(e.promise)?e.promise().done(n.resolve).fail(n.reject).progress(n.notify):n[a+"With"](this===r?n.promise():this,s?[e]:arguments)})}),e=null}).promise()},promise:function(e){return null!=e?x.extend(e,r):r}},i={};return r.pipe=r.then,x.each(t,function(e,o
 ){var a=o[2],s=o[3];r[o[1]]=a.add,s&&a.add(function(){n=s},t[1^e][2].disable,t[2][2].lock),i[o[0]]=function(){return i[o[0]+"With"](this===i?r:this,arguments),this},i[o[0]+"With"]=a.fireWith}),r.promise(i),e&&e.call(i,i),i},when:function(e){var t=0,n=g.call(arguments),r=n.length,i=1!==r||e&&x.isFunction(e.promise)?r:0,o=1===i?e:x.Deferred(),a=function(e,t,n){return function(r){t[e]=this,n[e]=arguments.length>1?g.call(arguments):r,n===s?o.notifyWith(t,n):--i||o.resolveWith(t,n)}},s,l,u;if(r>1)for(s=Array(r),l=Array(r),u=Array(r);r>t;t++)n[t]&&x.isFunction(n[t].promise)?n[t].promise().done(a(t,u,n)).fail(o.reject).progress(a(t,l,s)):--i;return i||o.resolveWith(u,n),o.promise()}}),x.support=function(t){var n,r,o,s,l,u,c,p,f,d=a.createElement("div");if(d.setAttribute("className","t"),d.innerHTML="  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>",n=d.getElementsByTagName("*")||[],r=d.getElementsByTagName("a")[0],!r||!r.style||!n.length)return t;s=a.createElement
 ("select"),u=s.appendChild(a.createElement("option")),o=d.getElementsByTagName("input")[0],r.style.cssText="top:1px;float:left;opacity:.5",t.getSetAttribute="t"!==d.className,t.leadingWhitespace=3===d.firstChild.nodeType,t.tbody=!d.getElementsByTagName("tbody").length,t.htmlSerialize=!!d.getElementsByTagName("link").length,t.style=/top/.test(r.getAttribute("style")),t.hrefNormalized="/a"===r.getAttribute("href"),t.opacity=/^0.5/.test(r.style.opacity),t.cssFloat=!!r.style.cssFloat,t.checkOn=!!o.value,t.optSelected=u.selected,t.enctype=!!a.createElement("form").enctype,t.html5Clone="<:nav></:nav>"!==a.createElement("nav").cloneNode(!0).outerHTML,t.inlineBlockNeedsLayout=!1,t.shrinkWrapBlocks=!1,t.pixelPosition=!1,t.deleteExpando=!0,t.noCloneEvent=!0,t.reliableMarginRight=!0,t.boxSizingReliable=!0,o.checked=!0,t.noCloneChecked=o.cloneNode(!0).checked,s.disabled=!0,t.optDisabled=!u.disabled;try{delete d.test}catch(h){t.deleteExpando=!1}o=a.createElement("input"),o.setAttribute("
 value",""),t.input=""===o.getAttribute("value"),o.value="t",o.setAttribute("type","radio"),t.radioValue="t"===o.value,o.setAttribute("checked","t"),o.setAttribute("name","t"),l=a.createDocumentFragment(),l.appendChild(o),t.appendChecked=o.checked,t.checkClone=l.cloneNode(!0).cloneNode(!0).lastChild.checked,d.attachEvent&&(d.attachEvent("onclick",function(){t.noCloneEvent=!1}),d.cloneNode(!0).click());for(f in{submit:!0,change:!0,focusin:!0})d.setAttribute(c="on"+f,"t"),t[f+"Bubbles"]=c in e||d.attributes[c].expando===!1;d.style.backgroundClip="content-box",d.cloneNode(!0).style.backgroundClip="",t.clearCloneStyle="content-box"===d.style.backgroundClip;for(f in x(t))break;return t.ownLast="0"!==f,x(function(){var n,r,o,s="padding:0;margin:0;border:0;display:block;box-sizing:content-box;-moz-box-sizing:content-box;-webkit-box-sizing:content-box;",l=a.getElementsByTagName("body")[0];l&&(n=a.createElement("div"),n.style.cssText="border:0;width:0;height:0;position:absolute;top:0;
 left:-9999px;margin-top:1px",l.appendChild(n).appendChild(d),d.innerHTML="<table><tr><td></td><td>t</td></tr></table>",o=d.getElementsByTagName("td"),o[0].style.cssText="padding:0;margin:0;border:0;display:none",p=0===o[0].offsetHeight,o[0].style.display="",o[1].style.display="none",t.reliableHiddenOffsets=p&&0===o[0].offsetHeight,d.innerHTML="",d.style.cssText="box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;padding:1px;border:1px;display:block;width:4px;margin-top:1%;position:absolute;top:1%;",x.swap(l,null!=l.style.zoom?{zoom:1}:{},function(){t.boxSizing=4===d.offsetWidth}),e.getComputedStyle&&(t.pixelPosition="1%"!==(e.getComputedStyle(d,null)||{}).top,t.boxSizingReliable="4px"===(e.getComputedStyle(d,null)||{width:"4px"}).width,r=d.appendChild(a.createElement("div")),r.style.cssText=d.style.cssText=s,r.style.marginRight=r.style.width="0",d.style.width="1px",t.reliableMarginRight=!parseFloat((e.getComputedStyle(r,null)||{}).marginRight)),ty
 peof d.style.zoom!==i&&(d.innerHTML="",d.style.cssText=s+"width:1px;padding:1px;display:inline;zoom:1",t.inlineBlockNeedsLayout=3===d.offsetWidth,d.style.display="block",d.innerHTML="<div></div>",d.firstChild.style.width="5px",t.shrinkWrapBlocks=3!==d.offsetWidth,t.inlineBlockNeedsLayout&&(l.style.zoom=1)),l.removeChild(n),n=d=o=r=null)}),n=s=l=u=r=o=null,t
+}({});var B=/(?:\{[\s\S]*\}|\[[\s\S]*\])$/,P=/([A-Z])/g;function R(e,n,r,i){if(x.acceptData(e)){var o,a,s=x.expando,l=e.nodeType,u=l?x.cache:e,c=l?e[s]:e[s]&&s;if(c&&u[c]&&(i||u[c].data)||r!==t||"string"!=typeof n)return c||(c=l?e[s]=p.pop()||x.guid++:s),u[c]||(u[c]=l?{}:{toJSON:x.noop}),("object"==typeof n||"function"==typeof n)&&(i?u[c]=x.extend(u[c],n):u[c].data=x.extend(u[c].data,n)),a=u[c],i||(a.data||(a.data={}),a=a.data),r!==t&&(a[x.camelCase(n)]=r),"string"==typeof n?(o=a[n],null==o&&(o=a[x.camelCase(n)])):o=a,o}}function W(e,t,n){if(x.acceptData(e)){var r,i,o=e.nodeType,a=o?x.cache:e,s=o?e[x.expando]:x.expando;if(a[s]){if(t&&(r=n?a[s]:a[s].data)){x.isArray(t)?t=t.concat(x.map(t,x.camelCase)):t in r?t=[t]:(t=x.camelCase(t),t=t in r?[t]:t.split(" ")),i=t.length;while(i--)delete r[t[i]];if(n?!I(r):!x.isEmptyObject(r))return}(n||(delete a[s].data,I(a[s])))&&(o?x.cleanData([e],!0):x.support.deleteExpando||a!=a.window?delete a[s]:a[s]=null)}}}x.extend({cache:{},noData:{ap
 plet:!0,embed:!0,object:"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"},hasData:function(e){return e=e.nodeType?x.cache[e[x.expando]]:e[x.expando],!!e&&!I(e)},data:function(e,t,n){return R(e,t,n)},removeData:function(e,t){return W(e,t)},_data:function(e,t,n){return R(e,t,n,!0)},_removeData:function(e,t){return W(e,t,!0)},acceptData:function(e){if(e.nodeType&&1!==e.nodeType&&9!==e.nodeType)return!1;var t=e.nodeName&&x.noData[e.nodeName.toLowerCase()];return!t||t!==!0&&e.getAttribute("classid")===t}}),x.fn.extend({data:function(e,n){var r,i,o=null,a=0,s=this[0];if(e===t){if(this.length&&(o=x.data(s),1===s.nodeType&&!x._data(s,"parsedAttrs"))){for(r=s.attributes;r.length>a;a++)i=r[a].name,0===i.indexOf("data-")&&(i=x.camelCase(i.slice(5)),$(s,i,o[i]));x._data(s,"parsedAttrs",!0)}return o}return"object"==typeof e?this.each(function(){x.data(this,e)}):arguments.length>1?this.each(function(){x.data(this,e,n)}):s?$(s,e,x.data(s,e)):null},removeData:function(e){return this.each(functi
 on(){x.removeData(this,e)})}});function $(e,n,r){if(r===t&&1===e.nodeType){var i="data-"+n.replace(P,"-$1").toLowerCase();if(r=e.getAttribute(i),"string"==typeof r){try{r="true"===r?!0:"false"===r?!1:"null"===r?null:+r+""===r?+r:B.test(r)?x.parseJSON(r):r}catch(o){}x.data(e,n,r)}else r=t}return r}function I(e){var t;for(t in e)if(("data"!==t||!x.isEmptyObject(e[t]))&&"toJSON"!==t)return!1;return!0}x.extend({queue:function(e,n,r){var i;return e?(n=(n||"fx")+"queue",i=x._data(e,n),r&&(!i||x.isArray(r)?i=x._data(e,n,x.makeArray(r)):i.push(r)),i||[]):t},dequeue:function(e,t){t=t||"fx";var n=x.queue(e,t),r=n.length,i=n.shift(),o=x._queueHooks(e,t),a=function(){x.dequeue(e,t)};"inprogress"===i&&(i=n.shift(),r--),i&&("fx"===t&&n.unshift("inprogress"),delete o.stop,i.call(e,a,o)),!r&&o&&o.empty.fire()},_queueHooks:function(e,t){var n=t+"queueHooks";return x._data(e,n)||x._data(e,n,{empty:x.Callbacks("once memory").add(function(){x._removeData(e,t+"queue"),x._removeData(e,n)})})}}),x
 .fn.extend({queue:function(e,n){var r=2;return"string"!=typeof e&&(n=e,e="fx",r--),r>arguments.length?x.queue(this[0],e):n===t?this:this.each(function(){var t=x.queue(this,e,n);x._queueHooks(this,e),"fx"===e&&"inprogress"!==t[0]&&x.dequeue(this,e)})},dequeue:function(e){return this.each(function(){x.dequeue(this,e)})},delay:function(e,t){return e=x.fx?x.fx.speeds[e]||e:e,t=t||"fx",this.queue(t,function(t,n){var r=setTimeout(t,e);n.stop=function(){clearTimeout(r)}})},clearQueue:function(e){return this.queue(e||"fx",[])},promise:function(e,n){var r,i=1,o=x.Deferred(),a=this,s=this.length,l=function(){--i||o.resolveWith(a,[a])};"string"!=typeof e&&(n=e,e=t),e=e||"fx";while(s--)r=x._data(a[s],e+"queueHooks"),r&&r.empty&&(i++,r.empty.add(l));return l(),o.promise(n)}});var z,X,U=/[\t\r\n\f]/g,V=/\r/g,Y=/^(?:input|select|textarea|button|object)$/i,J=/^(?:a|area)$/i,G=/^(?:checked|selected)$/i,Q=x.support.getSetAttribute,K=x.support.input;x.fn.extend({attr:function(e,t){return x.acc
 ess(this,x.attr,e,t,arguments.length>1)},removeAttr:function(e){return this.each(function(){x.removeAttr(this,e)})},prop:function(e,t){return x.access(this,x.prop,e,t,arguments.length>1)},removeProp:function(e){return e=x.propFix[e]||e,this.each(function(){try{this[e]=t,delete this[e]}catch(n){}})},addClass:function(e){var t,n,r,i,o,a=0,s=this.length,l="string"==typeof e&&e;if(x.isFunction(e))return this.each(function(t){x(this).addClass(e.call(this,t,this.className))});if(l)for(t=(e||"").match(T)||[];s>a;a++)if(n=this[a],r=1===n.nodeType&&(n.className?(" "+n.className+" ").replace(U," "):" ")){o=0;while(i=t[o++])0>r.indexOf(" "+i+" ")&&(r+=i+" ");n.className=x.trim(r)}return this},removeClass:function(e){var t,n,r,i,o,a=0,s=this.length,l=0===arguments.length||"string"==typeof e&&e;if(x.isFunction(e))return this.each(function(t){x(this).removeClass(e.call(this,t,this.className))});if(l)for(t=(e||"").match(T)||[];s>a;a++)if(n=this[a],r=1===n.nodeType&&(n.className?(" "+n.clas
 sName+" ").replace(U," "):"")){o=0;while(i=t[o++])while(r.indexOf(" "+i+" ")>=0)r=r.replace(" "+i+" "," ");n.className=e?x.trim(r):""}return this},toggleClass:function(e,t){var n=typeof e;return"boolean"==typeof t&&"string"===n?t?this.addClass(e):this.removeClass(e):x.isFunction(e)?this.each(function(n){x(this).toggleClass(e.call(this,n,this.className,t),t)}):this.each(function(){if("string"===n){var t,r=0,o=x(this),a=e.match(T)||[];while(t=a[r++])o.hasClass(t)?o.removeClass(t):o.addClass(t)}else(n===i||"boolean"===n)&&(this.className&&x._data(this,"__className__",this.className),this.className=this.className||e===!1?"":x._data(this,"__className__")||"")})},hasClass:function(e){var t=" "+e+" ",n=0,r=this.length;for(;r>n;n++)if(1===this[n].nodeType&&(" "+this[n].className+" ").replace(U," ").indexOf(t)>=0)return!0;return!1},val:function(e){var n,r,i,o=this[0];{if(arguments.length)return i=x.isFunction(e),this.each(function(n){var o;1===this.nodeType&&(o=i?e.call(this,n,x(this
 ).val()):e,null==o?o="":"number"==typeof o?o+="":x.isArray(o)&&(o=x.map(o,function(e){return null==e?"":e+""})),r=x.valHooks[this.type]||x.valHooks[this.nodeName.toLowerCase()],r&&"set"in r&&r.set(this,o,"value")!==t||(this.value=o))});if(o)return r=x.valHooks[o.type]||x.valHooks[o.nodeName.toLowerCase()],r&&"get"in r&&(n=r.get(o,"value"))!==t?n:(n=o.value,"string"==typeof n?n.replace(V,""):null==n?"":n)}}}),x.extend({valHooks:{option:{get:function(e){var t=x.find.attr(e,"value");return null!=t?t:e.text}},select:{get:function(e){var t,n,r=e.options,i=e.selectedIndex,o="select-one"===e.type||0>i,a=o?null:[],s=o?i+1:r.length,l=0>i?s:o?i:0;for(;s>l;l++)if(n=r[l],!(!n.selected&&l!==i||(x.support.optDisabled?n.disabled:null!==n.getAttribute("disabled"))||n.parentNode.disabled&&x.nodeName(n.parentNode,"optgroup"))){if(t=x(n).val(),o)return t;a.push(t)}return a},set:function(e,t){var n,r,i=e.options,o=x.makeArray(t),a=i.length;while(a--)r=i[a],(r.selected=x.inArray(x(r).val(),o)>=0
 )&&(n=!0);return n||(e.selectedIndex=-1),o}}},attr:function(e,n,r){var o,a,s=e.nodeType;if(e&&3!==s&&8!==s&&2!==s)return typeof e.getAttribute===i?x.prop(e,n,r):(1===s&&x.isXMLDoc(e)||(n=n.toLowerCase(),o=x.attrHooks[n]||(x.expr.match.bool.test(n)?X:z)),r===t?o&&"get"in o&&null!==(a=o.get(e,n))?a:(a=x.find.attr(e,n),null==a?t:a):null!==r?o&&"set"in o&&(a=o.set(e,r,n))!==t?a:(e.setAttribute(n,r+""),r):(x.removeAttr(e,n),t))},removeAttr:function(e,t){var n,r,i=0,o=t&&t.match(T);if(o&&1===e.nodeType)while(n=o[i++])r=x.propFix[n]||n,x.expr.match.bool.test(n)?K&&Q||!G.test(n)?e[r]=!1:e[x.camelCase("default-"+n)]=e[r]=!1:x.attr(e,n,""),e.removeAttribute(Q?n:r)},attrHooks:{type:{set:function(e,t){if(!x.support.radioValue&&"radio"===t&&x.nodeName(e,"input")){var n=e.value;return e.setAttribute("type",t),n&&(e.value=n),t}}}},propFix:{"for":"htmlFor","class":"className"},prop:function(e,n,r){var i,o,a,s=e.nodeType;if(e&&3!==s&&8!==s&&2!==s)return a=1!==s||!x.isXMLDoc(e),a&&(n=x.propFi
 x[n]||n,o=x.propHooks[n]),r!==t?o&&"set"in o&&(i=o.set(e,r,n))!==t?i:e[n]=r:o&&"get"in o&&null!==(i=o.get(e,n))?i:e[n]},propHooks:{tabIndex:{get:function(e){var t=x.find.attr(e,"tabindex");return t?parseInt(t,10):Y.test(e.nodeName)||J.test(e.nodeName)&&e.href?0:-1}}}}),X={set:function(e,t,n){return t===!1?x.removeAttr(e,n):K&&Q||!G.test(n)?e.setAttribute(!Q&&x.propFix[n]||n,n):e[x.camelCase("default-"+n)]=e[n]=!0,n}},x.each(x.expr.match.bool.source.match(/\w+/g),function(e,n){var r=x.expr.attrHandle[n]||x.find.attr;x.expr.attrHandle[n]=K&&Q||!G.test(n)?function(e,n,i){var o=x.expr.attrHandle[n],a=i?t:(x.expr.attrHandle[n]=t)!=r(e,n,i)?n.toLowerCase():null;return x.expr.attrHandle[n]=o,a}:function(e,n,r){return r?t:e[x.camelCase("default-"+n)]?n.toLowerCase():null}}),K&&Q||(x.attrHooks.value={set:function(e,n,r){return x.nodeName(e,"input")?(e.defaultValue=n,t):z&&z.set(e,n,r)}}),Q||(z={set:function(e,n,r){var i=e.getAttributeNode(r);return i||e.setAttributeNode(i=e.ownerDocu
 ment.createAttribute(r)),i.value=n+="","value"===r||n===e.getAttribute(r)?n:t}},x.expr.attrHandle.id=x.expr.attrHandle.name=x.expr.attrHandle.coords=function(e,n,r){var i;return r?t:(i=e.getAttributeNode(n))&&""!==i.value?i.value:null},x.valHooks.button={get:function(e,n){var r=e.getAttributeNode(n);return r&&r.specified?r.value:t},set:z.set},x.attrHooks.contenteditable={set:function(e,t,n){z.set(e,""===t?!1:t,n)}},x.each(["width","height"],function(e,n){x.attrHooks[n]={set:function(e,r){return""===r?(e.setAttribute(n,"auto"),r):t}}})),x.support.hrefNormalized||x.each(["href","src"],function(e,t){x.propHooks[t]={get:function(e){return e.getAttribute(t,4)}}}),x.support.style||(x.attrHooks.style={get:function(e){return e.style.cssText||t},set:function(e,t){return e.style.cssText=t+""}}),x.support.optSelected||(x.propHooks.selected={get:function(e){var t=e.parentNode;return t&&(t.selectedIndex,t.parentNode&&t.parentNode.selectedIndex),null}}),x.each(["tabIndex","readOnly","maxL
 ength","cellSpacing","cellPadding","rowSpan","colSpan","useMap","frameBorder","contentEditable"],function(){x.propFix[this.toLowerCase()]=this}),x.support.enctype||(x.propFix.enctype="encoding"),x.each(["radio","checkbox"],function(){x.valHooks[this]={set:function(e,n){return x.isArray(n)?e.checked=x.inArray(x(e).val(),n)>=0:t}},x.support.checkOn||(x.valHooks[this].get=function(e){return null===e.getAttribute("value")?"on":e.value})});var Z=/^(?:input|select|textarea)$/i,et=/^key/,tt=/^(?:mouse|contextmenu)|click/,nt=/^(?:focusinfocus|focusoutblur)$/,rt=/^([^.]*)(?:\.(.+)|)$/;function it(){return!0}function ot(){return!1}function at(){try{return a.activeElement}catch(e){}}x.event={global:{},add:function(e,n,r,o,a){var s,l,u,c,p,f,d,h,g,m,y,v=x._data(e);if(v){r.handler&&(c=r,r=c.handler,a=c.selector),r.guid||(r.guid=x.guid++),(l=v.events)||(l=v.events={}),(f=v.handle)||(f=v.handle=function(e){return typeof x===i||e&&x.event.triggered===e.type?t:x.event.dispatch.apply(f.elem,a
 rguments)},f.elem=e),n=(n||"").match(T)||[""],u=n.length;while(u--)s=rt.exec(n[u])||[],g=y=s[1],m=(s[2]||"").split(".").sort(),g&&(p=x.event.special[g]||{},g=(a?p.delegateType:p.bindType)||g,p=x.event.special[g]||{},d=x.extend({type:g,origType:y,data:o,handler:r,guid:r.guid,selector:a,needsContext:a&&x.expr.match.needsContext.test(a),namespace:m.join(".")},c),(h=l[g])||(h=l[g]=[],h.delegateCount=0,p.setup&&p.setup.call(e,o,m,f)!==!1||(e.addEventListener?e.addEventListener(g,f,!1):e.attachEvent&&e.attachEvent("on"+g,f))),p.add&&(p.add.call(e,d),d.handler.guid||(d.handler.guid=r.guid)),a?h.splice(h.delegateCount++,0,d):h.push(d),x.event.global[g]=!0);e=null}},remove:function(e,t,n,r,i){var o,a,s,l,u,c,p,f,d,h,g,m=x.hasData(e)&&x._data(e);if(m&&(c=m.events)){t=(t||"").match(T)||[""],u=t.length;while(u--)if(s=rt.exec(t[u])||[],d=g=s[1],h=(s[2]||"").split(".").sort(),d){p=x.event.special[d]||{},d=(r?p.delegateType:p.bindType)||d,f=c[d]||[],s=s[2]&&RegExp("(^|\\.)"+h.join("\\.(?:.
 *\\.|)")+"(\\.|$)"),l=o=f.length;while(o--)a=f[o],!i&&g!==a.origType||n&&n.guid!==a.guid||s&&!s.test(a.namespace)||r&&r!==a.selector&&("**"!==r||!a.selector)||(f.splice(o,1),a.selector&&f.delegateCount--,p.remove&&p.remove.call(e,a));l&&!f.length&&(p.teardown&&p.teardown.call(e,h,m.handle)!==!1||x.removeEvent(e,d,m.handle),delete c[d])}else for(d in c)x.event.remove(e,d+t[u],n,r,!0);x.isEmptyObject(c)&&(delete m.handle,x._removeData(e,"events"))}},trigger:function(n,r,i,o){var s,l,u,c,p,f,d,h=[i||a],g=v.call(n,"type")?n.type:n,m=v.call(n,"namespace")?n.namespace.split("."):[];if(u=f=i=i||a,3!==i.nodeType&&8!==i.nodeType&&!nt.test(g+x.event.triggered)&&(g.indexOf(".")>=0&&(m=g.split("."),g=m.shift(),m.sort()),l=0>g.indexOf(":")&&"on"+g,n=n[x.expando]?n:new x.Event(g,"object"==typeof n&&n),n.isTrigger=o?2:3,n.namespace=m.join("."),n.namespace_re=n.namespace?RegExp("(^|\\.)"+m.join("\\.(?:.*\\.|)")+"(\\.|$)"):null,n.result=t,n.target||(n.target=i),r=null==r?[n]:x.makeArray(r,[n
 ]),p=x.event.special[g]||{},o||!p.trigger||p.trigger.apply(i,r)!==!1)){if(!o&&!p.noBubble&&!x.isWindow(i)){for(c=p.delegateType||g,nt.test(c+g)||(u=u.parentNode);u;u=u.parentNode)h.push(u),f=u;f===(i.ownerDocument||a)&&h.push(f.defaultView||f.parentWindow||e)}d=0;while((u=h[d++])&&!n.isPropagationStopped())n.type=d>1?c:p.bindType||g,s=(x._data(u,"events")||{})[n.type]&&x._data(u,"handle"),s&&s.apply(u,r),s=l&&u[l],s&&x.acceptData(u)&&s.apply&&s.apply(u,r)===!1&&n.preventDefault();if(n.type=g,!o&&!n.isDefaultPrevented()&&(!p._default||p._default.apply(h.pop(),r)===!1)&&x.acceptData(i)&&l&&i[g]&&!x.isWindow(i)){f=i[l],f&&(i[l]=null),x.event.triggered=g;try{i[g]()}catch(y){}x.event.triggered=t,f&&(i[l]=f)}return n.result}},dispatch:function(e){e=x.event.fix(e);var n,r,i,o,a,s=[],l=g.call(arguments),u=(x._data(this,"events")||{})[e.type]||[],c=x.event.special[e.type]||{};if(l[0]=e,e.delegateTarget=this,!c.preDispatch||c.preDispatch.call(this,e)!==!1){s=x.event.handlers.call(this
 ,e,u),n=0;while((o=s[n++])&&!e.isPropagationStopped()){e.currentTarget=o.elem,a=0;while((i=o.handlers[a++])&&!e.isImmediatePropagationStopped())(!e.namespace_re||e.namespace_re.test(i.namespace))&&(e.handleObj=i,e.data=i.data,r=((x.event.special[i.origType]||{}).handle||i.handler).apply(o.elem,l),r!==t&&(e.result=r)===!1&&(e.preventDefault(),e.stopPropagation()))}return c.postDispatch&&c.postDispatch.call(this,e),e.result}},handlers:function(e,n){var r,i,o,a,s=[],l=n.delegateCount,u=e.target;if(l&&u.nodeType&&(!e.button||"click"!==e.type))for(;u!=this;u=u.parentNode||this)if(1===u.nodeType&&(u.disabled!==!0||"click"!==e.type)){for(o=[],a=0;l>a;a++)i=n[a],r=i.selector+" ",o[r]===t&&(o[r]=i.needsContext?x(r,this).index(u)>=0:x.find(r,this,null,[u]).length),o[r]&&o.push(i);o.length&&s.push({elem:u,handlers:o})}return n.length>l&&s.push({elem:this,handlers:n.slice(l)}),s},fix:function(e){if(e[x.expando])return e;var t,n,r,i=e.type,o=e,s=this.fixHooks[i];s||(this.fixHooks[i]=s=tt
 .test(i)?this.mouseHooks:et.test(i)?this.keyHooks:{}),r=s.props?this.props.concat(s.props):this.props,e=new x.Event(o),t=r.length;while(t--)n=r[t],e[n]=o[n];return e.target||(e.target=o.srcElement||a),3===e.target.nodeType&&(e.target=e.target.parentNode),e.metaKey=!!e.metaKey,s.filter?s.filter(e,o):e},props:"altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),fixHooks:{},keyHooks:{props:"char charCode key keyCode".split(" "),filter:function(e,t){return null==e.which&&(e.which=null!=t.charCode?t.charCode:t.keyCode),e}},mouseHooks:{props:"button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),filter:function(e,n){var r,i,o,s=n.button,l=n.fromElement;return null==e.pageX&&null!=n.clientX&&(i=e.target.ownerDocument||a,o=i.documentElement,r=i.body,e.pageX=n.clientX+(o&&o.scrollLeft||r&&r.scrollLeft||0)-(o&&o.clientLeft||r&&r.clientLeft||0),e.pageY=n.
 clientY+(o&&o.scrollTop||r&&r.scrollTop||0)-(o&&o.clientTop||r&&r.clientTop||0)),!e.relatedTarget&&l&&(e.relatedTarget=l===e.target?n.toElement:l),e.which||s===t||(e.which=1&s?1:2&s?3:4&s?2:0),e}},special:{load:{noBubble:!0},focus:{trigger:function(){if(this!==at()&&this.focus)try{return this.focus(),!1}catch(e){}},delegateType:"focusin"},blur:{trigger:function(){return this===at()&&this.blur?(this.blur(),!1):t},delegateType:"focusout"},click:{trigger:function(){return x.nodeName(this,"input")&&"checkbox"===this.type&&this.click?(this.click(),!1):t},_default:function(e){return x.nodeName(e.target,"a")}},beforeunload:{postDispatch:function(e){e.result!==t&&(e.originalEvent.returnValue=e.result)}}},simulate:function(e,t,n,r){var i=x.extend(new x.Event,n,{type:e,isSimulated:!0,originalEvent:{}});r?x.event.trigger(i,null,t):x.event.dispatch.call(t,i),i.isDefaultPrevented()&&n.preventDefault()}},x.removeEvent=a.removeEventListener?function(e,t,n){e.removeEventListener&&e.removeEv
 entListener(t,n,!1)}:function(e,t,n){var r="on"+t;e.detachEvent&&(typeof e[r]===i&&(e[r]=null),e.detachEvent(r,n))},x.Event=function(e,n){return this instanceof x.Event?(e&&e.type?(this.originalEvent=e,this.type=e.type,this.isDefaultPrevented=e.defaultPrevented||e.returnValue===!1||e.getPreventDefault&&e.getPreventDefault()?it:ot):this.type=e,n&&x.extend(this,n),this.timeStamp=e&&e.timeStamp||x.now(),this[x.expando]=!0,t):new x.Event(e,n)},x.Event.prototype={isDefaultPrevented:ot,isPropagationStopped:ot,isImmediatePropagationStopped:ot,preventDefault:function(){var e=this.originalEvent;this.isDefaultPrevented=it,e&&(e.preventDefault?e.preventDefault():e.returnValue=!1)},stopPropagation:function(){var e=this.originalEvent;this.isPropagationStopped=it,e&&(e.stopPropagation&&e.stopPropagation(),e.cancelBubble=!0)},stopImmediatePropagation:function(){this.isImmediatePropagationStopped=it,this.stopPropagation()}},x.each({mouseenter:"mouseover",mouseleave:"mouseout"},function(e,t)
 {x.event.special[e]={delegateType:t,bindType:t,handle:function(e){var n,r=this,i=e.relatedTarget,o=e.handleObj;return(!i||i!==r&&!x.contains(r,i))&&(e.type=o.origType,n=o.handler.apply(this,arguments),e.type=t),n}}}),x.support.submitBubbles||(x.event.special.submit={setup:function(){return x.nodeName(this,"form")?!1:(x.event.add(this,"click._submit keypress._submit",function(e){var n=e.target,r=x.nodeName(n,"input")||x.nodeName(n,"button")?n.form:t;r&&!x._data(r,"submitBubbles")&&(x.event.add(r,"submit._submit",function(e){e._submit_bubble=!0}),x._data(r,"submitBubbles",!0))}),t)},postDispatch:function(e){e._submit_bubble&&(delete e._submit_bubble,this.parentNode&&!e.isTrigger&&x.event.simulate("submit",this.parentNode,e,!0))},teardown:function(){return x.nodeName(this,"form")?!1:(x.event.remove(this,"._submit"),t)}}),x.support.changeBubbles||(x.event.special.change={setup:function(){return Z.test(this.nodeName)?(("checkbox"===this.type||"radio"===this.type)&&(x.event.add(th
 is,"propertychange._change",function(e){"checked"===e.originalEvent.propertyName&&(this._just_changed=!0)}),x.event.add(this,"click._change",function(e){this._just_changed&&!e.isTrigger&&(this._just_changed=!1),x.event.simulate("change",this,e,!0)})),!1):(x.event.add(this,"beforeactivate._change",function(e){var t=e.target;Z.test(t.nodeName)&&!x._data(t,"changeBubbles")&&(x.event.add(t,"change._change",function(e){!this.parentNode||e.isSimulated||e.isTrigger||x.event.simulate("change",this.parentNode,e,!0)}),x._data(t,"changeBubbles",!0))}),t)},handle:function(e){var n=e.target;return this!==n||e.isSimulated||e.isTrigger||"radio"!==n.type&&"checkbox"!==n.type?e.handleObj.handler.apply(this,arguments):t},teardown:function(){return x.event.remove(this,"._change"),!Z.test(this.nodeName)}}),x.support.focusinBubbles||x.each({focus:"focusin",blur:"focusout"},function(e,t){var n=0,r=function(e){x.event.simulate(t,e.target,x.event.fix(e),!0)};x.event.special[t]={setup:function(){0==
 =n++&&a.addEventListener(e,r,!0)},teardown:function(){0===--n&&a.removeEventListener(e,r,!0)}}}),x.fn.extend({on:function(e,n,r,i,o){var a,s;if("object"==typeof e){"string"!=typeof n&&(r=r||n,n=t);for(a in e)this.on(a,n,r,e[a],o);return this}if(null==r&&null==i?(i=n,r=n=t):null==i&&("string"==typeof n?(i=r,r=t):(i=r,r=n,n=t)),i===!1)i=ot;else if(!i)return this;return 1===o&&(s=i,i=function(e){return x().off(e),s.apply(this,arguments)},i.guid=s.guid||(s.guid=x.guid++)),this.each(function(){x.event.add(this,e,i,r,n)})},one:function(e,t,n,r){return this.on(e,t,n,r,1)},off:function(e,n,r){var i,o;if(e&&e.preventDefault&&e.handleObj)return i=e.handleObj,x(e.delegateTarget).off(i.namespace?i.origType+"."+i.namespace:i.origType,i.selector,i.handler),this;if("object"==typeof e){for(o in e)this.off(o,n,e[o]);return this}return(n===!1||"function"==typeof n)&&(r=n,n=t),r===!1&&(r=ot),this.each(function(){x.event.remove(this,e,r,n)})},trigger:function(e,t){return this.each(function(){x.
 event.trigger(e,t,this)})},triggerHandler:function(e,n){var r=this[0];return r?x.event.trigger(e,n,r,!0):t}});var st=/^.[^:#\[\.,]*$/,lt=/^(?:parents|prev(?:Until|All))/,ut=x.expr.match.needsContext,ct={children:!0,contents:!0,next:!0,prev:!0};x.fn.extend({find:function(e){var t,n=[],r=this,i=r.length;if("string"!=typeof e)return this.pushStack(x(e).filter(function(){for(t=0;i>t;t++)if(x.contains(r[t],this))return!0}));for(t=0;i>t;t++)x.find(e,r[t],n);return n=this.pushStack(i>1?x.unique(n):n),n.selector=this.selector?this.selector+" "+e:e,n},has:function(e){var t,n=x(e,this),r=n.length;return this.filter(function(){for(t=0;r>t;t++)if(x.contains(this,n[t]))return!0})},not:function(e){return this.pushStack(ft(this,e||[],!0))},filter:function(e){return this.pushStack(ft(this,e||[],!1))},is:function(e){return!!ft(this,"string"==typeof e&&ut.test(e)?x(e):e||[],!1).length},closest:function(e,t){var n,r=0,i=this.length,o=[],a=ut.test(e)||"string"!=typeof e?x(e,t||this.context):0;f
 or(;i>r;r++)for(n=this[r];n&&n!==t;n=n.parentNode)if(11>n.nodeType&&(a?a.index(n)>-1:1===n.nodeType&&x.find.matchesSelector(n,e))){n=o.push(n);break}return this.pushStack(o.length>1?x.unique(o):o)},index:function(e){return e?"string"==typeof e?x.inArray(this[0],x(e)):x.inArray(e.jquery?e[0]:e,this):this[0]&&this[0].parentNode?this.first().prevAll().length:-1},add:function(e,t){var n="string"==typeof e?x(e,t):x.makeArray(e&&e.nodeType?[e]:e),r=x.merge(this.get(),n);return this.pushStack(x.unique(r))},addBack:function(e){return this.add(null==e?this.prevObject:this.prevObject.filter(e))}});function pt(e,t){do e=e[t];while(e&&1!==e.nodeType);return e}x.each({parent:function(e){var t=e.parentNode;return t&&11!==t.nodeType?t:null},parents:function(e){return x.dir(e,"parentNode")},parentsUntil:function(e,t,n){return x.dir(e,"parentNode",n)},next:function(e){return pt(e,"nextSibling")},prev:function(e){return pt(e,"previousSibling")},nextAll:function(e){return x.dir(e,"nextSibling"
 )},prevAll:function(e){return x.dir(e,"previousSibling")},nextUntil:function(e,t,n){return x.dir(e,"nextSibling",n)},prevUntil:function(e,t,n){return x.dir(e,"previousSibling",n)},siblings:function(e){return x.sibling((e.parentNode||{}).firstChild,e)},children:function(e){return x.sibling(e.firstChild)},contents:function(e){return x.nodeName(e,"iframe")?e.contentDocument||e.contentWindow.document:x.merge([],e.childNodes)}},function(e,t){x.fn[e]=function(n,r){var i=x.map(this,t,n);return"Until"!==e.slice(-5)&&(r=n),r&&"string"==typeof r&&(i=x.filter(r,i)),this.length>1&&(ct[e]||(i=x.unique(i)),lt.test(e)&&(i=i.reverse())),this.pushStack(i)}}),x.extend({filter:function(e,t,n){var r=t[0];return n&&(e=":not("+e+")"),1===t.length&&1===r.nodeType?x.find.matchesSelector(r,e)?[r]:[]:x.find.matches(e,x.grep(t,function(e){return 1===e.nodeType}))},dir:function(e,n,r){var i=[],o=e[n];while(o&&9!==o.nodeType&&(r===t||1!==o.nodeType||!x(o).is(r)))1===o.nodeType&&i.push(o),o=o[n];return i
 },sibling:function(e,t){var n=[];for(;e;e=e.nextSibling)1===e.nodeType&&e!==t&&n.push(e);return n}});function ft(e,t,n){if(x.isFunction(t))return x.grep(e,function(e,r){return!!t.call(e,r,e)!==n});if(t.nodeType)return x.grep(e,function(e){return e===t!==n});if("string"==typeof t){if(st.test(t))return x.filter(t,e,n);t=x.filter(t,e)}return x.grep(e,function(e){return x.inArray(e,t)>=0!==n})}function dt(e){var t=ht.split("|"),n=e.createDocumentFragment();if(n.createElement)while(t.length)n.createElement(t.pop());return n}var ht="abbr|article|aside|audio|bdi|canvas|data|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video",gt=/ jQuery\d+="(?:null|\d+)"/g,mt=RegExp("<(?:"+ht+")[\\s/>]","i"),yt=/^\s+/,vt=/<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi,bt=/<([\w:]+)/,xt=/<tbody/i,wt=/<|&#?\w+;/,Tt=/<(?:script|style|link)/i,Ct=/^(?:checkbox|radio)$/i,Nt=/checked\s*(?:[^=]|=\s*.checked.)/i,kt=/^$|
 \/(?:java|ecma)script/i,Et=/^true\/(.*)/,St=/^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g,At={option:[1,"<select multiple='multiple'>","</select>"],legend:[1,"<fieldset>","</fieldset>"],area:[1,"<map>","</map>"],param:[1,"<object>","</object>"],thead:[1,"<table>","</table>"],tr:[2,"<table><tbody>","</tbody></table>"],col:[2,"<table><tbody></tbody><colgroup>","</colgroup></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],_default:x.support.htmlSerialize?[0,"",""]:[1,"X<div>","</div>"]},jt=dt(a),Dt=jt.appendChild(a.createElement("div"));At.optgroup=At.option,At.tbody=At.tfoot=At.colgroup=At.caption=At.thead,At.th=At.td,x.fn.extend({text:function(e){return x.access(this,function(e){return e===t?x.text(this):this.empty().append((this[0]&&this[0].ownerDocument||a).createTextNode(e))},null,e,arguments.length)},append:function(){return this.domManip(arguments,function(e){if(1===this.nodeType||11===this.nodeType||9===this.nodeType){var t=Lt(this,e);t.appendChild(e)}})},prep
 end:function(){return this.domManip(arguments,function(e){if(1===this.nodeType||11===this.nodeType||9===this.nodeType){var t=Lt(this,e);t.insertBefore(e,t.firstChild)}})},before:function(){return this.domManip(arguments,function(e){this.parentNode&&this.parentNode.insertBefore(e,this)})},after:function(){return this.domManip(arguments,function(e){this.parentNode&&this.parentNode.insertBefore(e,this.nextSibling)})},remove:function(e,t){var n,r=e?x.filter(e,this):this,i=0;for(;null!=(n=r[i]);i++)t||1!==n.nodeType||x.cleanData(Ft(n)),n.parentNode&&(t&&x.contains(n.ownerDocument,n)&&_t(Ft(n,"script")),n.parentNode.removeChild(n));return this},empty:function(){var e,t=0;for(;null!=(e=this[t]);t++){1===e.nodeType&&x.cleanData(Ft(e,!1));while(e.firstChild)e.removeChild(e.firstChild);e.options&&x.nodeName(e,"select")&&(e.options.length=0)}return this},clone:function(e,t){return e=null==e?!1:e,t=null==t?e:t,this.map(function(){return x.clone(this,e,t)})},html:function(e){return x.acc
 ess(this,function(e){var n=this[0]||{},r=0,i=this.length;if(e===t)return 1===n.nodeType?n.innerHTML.replace(gt,""):t;if(!("string"!=typeof e||Tt.test(e)||!x.support.htmlSerialize&&mt.test(e)||!x.support.leadingWhitespace&&yt.test(e)||At[(bt.exec(e)||["",""])[1].toLowerCase()])){e=e.replace(vt,"<$1></$2>");try{for(;i>r;r++)n=this[r]||{},1===n.nodeType&&(x.cleanData(Ft(n,!1)),n.innerHTML=e);n=0}catch(o){}}n&&this.empty().append(e)},null,e,arguments.length)},replaceWith:function(){var e=x.map(this,function(e){return[e.nextSibling,e.parentNode]}),t=0;return this.domManip(arguments,function(n){var r=e[t++],i=e[t++];i&&(r&&r.parentNode!==i&&(r=this.nextSibling),x(this).remove(),i.insertBefore(n,r))},!0),t?this:this.remove()},detach:function(e){return this.remove(e,!0)},domManip:function(e,t,n){e=d.apply([],e);var r,i,o,a,s,l,u=0,c=this.length,p=this,f=c-1,h=e[0],g=x.isFunction(h);if(g||!(1>=c||"string"!=typeof h||x.support.checkClone)&&Nt.test(h))return this.each(function(r){var i
 =p.eq(r);g&&(e[0]=h.call(this,r,i.html())),i.domManip(e,t,n)});if(c&&(l=x.buildFragment(e,this[0].ownerDocument,!1,!n&&this),r=l.firstChild,1===l.childNodes.length&&(l=r),r)){for(a=x.map(Ft(l,"script"),Ht),o=a.length;c>u;u++)i=l,u!==f&&(i=x.clone(i,!0,!0),o&&x.merge(a,Ft(i,"script"))),t.call(this[u],i,u);if(o)for(s=a[a.length-1].ownerDocument,x.map(a,qt),u=0;o>u;u++)i=a[u],kt.test(i.type||"")&&!x._data(i,"globalEval")&&x.contains(s,i)&&(i.src?x._evalUrl(i.src):x.globalEval((i.text||i.textContent||i.innerHTML||"").replace(St,"")));l=r=null}return this}});function Lt(e,t){return x.nodeName(e,"table")&&x.nodeName(1===t.nodeType?t:t.firstChild,"tr")?e.getElementsByTagName("tbody")[0]||e.appendChild(e.ownerDocument.createElement("tbody")):e}function Ht(e){return e.type=(null!==x.find.attr(e,"type"))+"/"+e.type,e}function qt(e){var t=Et.exec(e.type);return t?e.type=t[1]:e.removeAttribute("type"),e}function _t(e,t){var n,r=0;for(;null!=(n=e[r]);r++)x._data(n,"globalEval",!t||x._dat
 a(t[r],"globalEval"))}function Mt(e,t){if(1===t.nodeType&&x.hasData(e)){var n,r,i,o=x._data(e),a=x._data(t,o),s=o.events;if(s){delete a.handle,a.events={};for(n in s)for(r=0,i=s[n].length;i>r;r++)x.event.add(t,n,s[n][r])}a.data&&(a.data=x.extend({},a.data))}}function Ot(e,t){var n,r,i;if(1===t.nodeType){if(n=t.nodeName.toLowerCase(),!x.support.noCloneEvent&&t[x.expando]){i=x._data(t);for(r in i.events)x.removeEvent(t,r,i.handle);t.removeAttribute(x.expando)}"script"===n&&t.text!==e.text?(Ht(t).text=e.text,qt(t)):"object"===n?(t.parentNode&&(t.outerHTML=e.outerHTML),x.support.html5Clone&&e.innerHTML&&!x.trim(t.innerHTML)&&(t.innerHTML=e.innerHTML)):"input"===n&&Ct.test(e.type)?(t.defaultChecked=t.checked=e.checked,t.value!==e.value&&(t.value=e.value)):"option"===n?t.defaultSelected=t.selected=e.defaultSelected:("input"===n||"textarea"===n)&&(t.defaultValue=e.defaultValue)}}x.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"repl
 aceWith"},function(e,t){x.fn[e]=function(e){var n,r=0,i=[],o=x(e),a=o.length-1;for(;a>=r;r++)n=r===a?this:this.clone(!0),x(o[r])[t](n),h.apply(i,n.get());return this.pushStack(i)}});function Ft(e,n){var r,o,a=0,s=typeof e.getElementsByTagName!==i?e.getElementsByTagName(n||"*"):typeof e.querySelectorAll!==i?e.querySelectorAll(n||"*"):t;if(!s)for(s=[],r=e.childNodes||e;null!=(o=r[a]);a++)!n||x.nodeName(o,n)?s.push(o):x.merge(s,Ft(o,n));return n===t||n&&x.nodeName(e,n)?x.merge([e],s):s}function Bt(e){Ct.test(e.type)&&(e.defaultChecked=e.checked)}x.extend({clone:function(e,t,n){var r,i,o,a,s,l=x.contains(e.ownerDocument,e);if(x.support.html5Clone||x.isXMLDoc(e)||!mt.test("<"+e.nodeName+">")?o=e.cloneNode(!0):(Dt.innerHTML=e.outerHTML,Dt.removeChild(o=Dt.firstChild)),!(x.support.noCloneEvent&&x.support.noCloneChecked||1!==e.nodeType&&11!==e.nodeType||x.isXMLDoc(e)))for(r=Ft(o),s=Ft(e),a=0;null!=(i=s[a]);++a)r[a]&&Ot(i,r[a]);if(t)if(n)for(s=s||Ft(e),r=r||Ft(o),a=0;null!=(i=s[a]);a
 ++)Mt(i,r[a]);else Mt(e,o);return r=Ft(o,"script"),r.length>0&&_t(r,!l&&Ft(e,"script")),r=s=i=null,o},buildFragment:function(e,t,n,r){var i,o,a,s,l,u,c,p=e.length,f=dt(t),d=[],h=0;for(;p>h;h++)if(o=e[h],o||0===o)if("object"===x.type(o))x.merge(d,o.nodeType?[o]:o);else if(wt.test(o)){s=s||f.appendChild(t.createElement("div")),l=(bt.exec(o)||["",""])[1].toLowerCase(),c=At[l]||At._default,s.innerHTML=c[1]+o.replace(vt,"<$1></$2>")+c[2],i=c[0];while(i--)s=s.lastChild;if(!x.support.leadingWhitespace&&yt.test(o)&&d.push(t.createTextNode(yt.exec(o)[0])),!x.support.tbody){o="table"!==l||xt.test(o)?"<table>"!==c[1]||xt.test(o)?0:s:s.firstChild,i=o&&o.childNodes.length;while(i--)x.nodeName(u=o.childNodes[i],"tbody")&&!u.childNodes.length&&o.removeChild(u)}x.merge(d,s.childNodes),s.textContent="";while(s.firstChild)s.removeChild(s.firstChild);s=f.lastChild}else d.push(t.createTextNode(o));s&&f.removeChild(s),x.support.appendChecked||x.grep(Ft(d,"input"),Bt),h=0;while(o=d[h++])if((!r||-
 1===x.inArray(o,r))&&(a=x.contains(o.ownerDocument,o),s=Ft(f.appendChild(o),"script"),a&&_t(s),n)){i=0;while(o=s[i++])kt.test(o.type||"")&&n.push(o)}return s=null,f},cleanData:function(e,t){var n,r,o,a,s=0,l=x.expando,u=x.cache,c=x.support.deleteExpando,f=x.event.special;for(;null!=(n=e[s]);s++)if((t||x.acceptData(n))&&(o=n[l],a=o&&u[o])){if(a.events)for(r in a.events)f[r]?x.event.remove(n,r):x.removeEvent(n,r,a.handle);
+u[o]&&(delete u[o],c?delete n[l]:typeof n.removeAttribute!==i?n.removeAttribute(l):n[l]=null,p.push(o))}},_evalUrl:function(e){return x.ajax({url:e,type:"GET",dataType:"script",async:!1,global:!1,"throws":!0})}}),x.fn.extend({wrapAll:function(e){if(x.isFunction(e))return this.each(function(t){x(this).wrapAll(e.call(this,t))});if(this[0]){var t=x(e,this[0].ownerDocument).eq(0).clone(!0);this[0].parentNode&&t.insertBefore(this[0]),t.map(function(){var e=this;while(e.firstChild&&1===e.firstChild.nodeType)e=e.firstChild;return e}).append(this)}return this},wrapInner:function(e){return x.isFunction(e)?this.each(function(t){x(this).wrapInner(e.call(this,t))}):this.each(function(){var t=x(this),n=t.contents();n.length?n.wrapAll(e):t.append(e)})},wrap:function(e){var t=x.isFunction(e);return this.each(function(n){x(this).wrapAll(t?e.call(this,n):e)})},unwrap:function(){return this.parent().each(function(){x.nodeName(this,"body")||x(this).replaceWith(this.childNodes)}).end()}});var P
 t,Rt,Wt,$t=/alpha\([^)]*\)/i,It=/opacity\s*=\s*([^)]*)/,zt=/^(top|right|bottom|left)$/,Xt=/^(none|table(?!-c[ea]).+)/,Ut=/^margin/,Vt=RegExp("^("+w+")(.*)$","i"),Yt=RegExp("^("+w+")(?!px)[a-z%]+$","i"),Jt=RegExp("^([+-])=("+w+")","i"),Gt={BODY:"block"},Qt={position:"absolute",visibility:"hidden",display:"block"},Kt={letterSpacing:0,fontWeight:400},Zt=["Top","Right","Bottom","Left"],en=["Webkit","O","Moz","ms"];function tn(e,t){if(t in e)return t;var n=t.charAt(0).toUpperCase()+t.slice(1),r=t,i=en.length;while(i--)if(t=en[i]+n,t in e)return t;return r}function nn(e,t){return e=t||e,"none"===x.css(e,"display")||!x.contains(e.ownerDocument,e)}function rn(e,t){var n,r,i,o=[],a=0,s=e.length;for(;s>a;a++)r=e[a],r.style&&(o[a]=x._data(r,"olddisplay"),n=r.style.display,t?(o[a]||"none"!==n||(r.style.display=""),""===r.style.display&&nn(r)&&(o[a]=x._data(r,"olddisplay",ln(r.nodeName)))):o[a]||(i=nn(r),(n&&"none"!==n||!i)&&x._data(r,"olddisplay",i?n:x.css(r,"display"))));for(a=0;s>a;a+
 +)r=e[a],r.style&&(t&&"none"!==r.style.display&&""!==r.style.display||(r.style.display=t?o[a]||"":"none"));return e}x.fn.extend({css:function(e,n){return x.access(this,function(e,n,r){var i,o,a={},s=0;if(x.isArray(n)){for(o=Rt(e),i=n.length;i>s;s++)a[n[s]]=x.css(e,n[s],!1,o);return a}return r!==t?x.style(e,n,r):x.css(e,n)},e,n,arguments.length>1)},show:function(){return rn(this,!0)},hide:function(){return rn(this)},toggle:function(e){return"boolean"==typeof e?e?this.show():this.hide():this.each(function(){nn(this)?x(this).show():x(this).hide()})}}),x.extend({cssHooks:{opacity:{get:function(e,t){if(t){var n=Wt(e,"opacity");return""===n?"1":n}}}},cssNumber:{columnCount:!0,fillOpacity:!0,fontWeight:!0,lineHeight:!0,opacity:!0,order:!0,orphans:!0,widows:!0,zIndex:!0,zoom:!0},cssProps:{"float":x.support.cssFloat?"cssFloat":"styleFloat"},style:function(e,n,r,i){if(e&&3!==e.nodeType&&8!==e.nodeType&&e.style){var o,a,s,l=x.camelCase(n),u=e.style;if(n=x.cssProps[l]||(x.cssProps[l]=tn
 (u,l)),s=x.cssHooks[n]||x.cssHooks[l],r===t)return s&&"get"in s&&(o=s.get(e,!1,i))!==t?o:u[n];if(a=typeof r,"string"===a&&(o=Jt.exec(r))&&(r=(o[1]+1)*o[2]+parseFloat(x.css(e,n)),a="number"),!(null==r||"number"===a&&isNaN(r)||("number"!==a||x.cssNumber[l]||(r+="px"),x.support.clearCloneStyle||""!==r||0!==n.indexOf("background")||(u[n]="inherit"),s&&"set"in s&&(r=s.set(e,r,i))===t)))try{u[n]=r}catch(c){}}},css:function(e,n,r,i){var o,a,s,l=x.camelCase(n);return n=x.cssProps[l]||(x.cssProps[l]=tn(e.style,l)),s=x.cssHooks[n]||x.cssHooks[l],s&&"get"in s&&(a=s.get(e,!0,r)),a===t&&(a=Wt(e,n,i)),"normal"===a&&n in Kt&&(a=Kt[n]),""===r||r?(o=parseFloat(a),r===!0||x.isNumeric(o)?o||0:a):a}}),e.getComputedStyle?(Rt=function(t){return e.getComputedStyle(t,null)},Wt=function(e,n,r){var i,o,a,s=r||Rt(e),l=s?s.getPropertyValue(n)||s[n]:t,u=e.style;return s&&(""!==l||x.contains(e.ownerDocument,e)||(l=x.style(e,n)),Yt.test(l)&&Ut.test(n)&&(i=u.width,o=u.minWidth,a=u.maxWidth,u.minWidth=u.max
 Width=u.width=l,l=s.width,u.width=i,u.minWidth=o,u.maxWidth=a)),l}):a.documentElement.currentStyle&&(Rt=function(e){return e.currentStyle},Wt=function(e,n,r){var i,o,a,s=r||Rt(e),l=s?s[n]:t,u=e.style;return null==l&&u&&u[n]&&(l=u[n]),Yt.test(l)&&!zt.test(n)&&(i=u.left,o=e.runtimeStyle,a=o&&o.left,a&&(o.left=e.currentStyle.left),u.left="fontSize"===n?"1em":l,l=u.pixelLeft+"px",u.left=i,a&&(o.left=a)),""===l?"auto":l});function on(e,t,n){var r=Vt.exec(t);return r?Math.max(0,r[1]-(n||0))+(r[2]||"px"):t}function an(e,t,n,r,i){var o=n===(r?"border":"content")?4:"width"===t?1:0,a=0;for(;4>o;o+=2)"margin"===n&&(a+=x.css(e,n+Zt[o],!0,i)),r?("content"===n&&(a-=x.css(e,"padding"+Zt[o],!0,i)),"margin"!==n&&(a-=x.css(e,"border"+Zt[o]+"Width",!0,i))):(a+=x.css(e,"padding"+Zt[o],!0,i),"padding"!==n&&(a+=x.css(e,"border"+Zt[o]+"Width",!0,i)));return a}function sn(e,t,n){var r=!0,i="width"===t?e.offsetWidth:e.offsetHeight,o=Rt(e),a=x.support.boxSizing&&"border-box"===x.css(e,"boxSizing",!1,
 o);if(0>=i||null==i){if(i=Wt(e,t,o),(0>i||null==i)&&(i=e.style[t]),Yt.test(i))return i;r=a&&(x.support.boxSizingReliable||i===e.style[t]),i=parseFloat(i)||0}return i+an(e,t,n||(a?"border":"content"),r,o)+"px"}function ln(e){var t=a,n=Gt[e];return n||(n=un(e,t),"none"!==n&&n||(Pt=(Pt||x("<iframe frameborder='0' width='0' height='0'/>").css("cssText","display:block !important")).appendTo(t.documentElement),t=(Pt[0].contentWindow||Pt[0].contentDocument).document,t.write("<!doctype html><html><body>"),t.close(),n=un(e,t),Pt.detach()),Gt[e]=n),n}function un(e,t){var n=x(t.createElement(e)).appendTo(t.body),r=x.css(n[0],"display");return n.remove(),r}x.each(["height","width"],function(e,n){x.cssHooks[n]={get:function(e,r,i){return r?0===e.offsetWidth&&Xt.test(x.css(e,"display"))?x.swap(e,Qt,function(){return sn(e,n,i)}):sn(e,n,i):t},set:function(e,t,r){var i=r&&Rt(e);return on(e,t,r?an(e,n,r,x.support.boxSizing&&"border-box"===x.css(e,"boxSizing",!1,i),i):0)}}}),x.support.opacity|
 |(x.cssHooks.opacity={get:function(e,t){return It.test((t&&e.currentStyle?e.currentStyle.filter:e.style.filter)||"")?.01*parseFloat(RegExp.$1)+"":t?"1":""},set:function(e,t){var n=e.style,r=e.currentStyle,i=x.isNumeric(t)?"alpha(opacity="+100*t+")":"",o=r&&r.filter||n.filter||"";n.zoom=1,(t>=1||""===t)&&""===x.trim(o.replace($t,""))&&n.removeAttribute&&(n.removeAttribute("filter"),""===t||r&&!r.filter)||(n.filter=$t.test(o)?o.replace($t,i):o+" "+i)}}),x(function(){x.support.reliableMarginRight||(x.cssHooks.marginRight={get:function(e,n){return n?x.swap(e,{display:"inline-block"},Wt,[e,"marginRight"]):t}}),!x.support.pixelPosition&&x.fn.position&&x.each(["top","left"],function(e,n){x.cssHooks[n]={get:function(e,r){return r?(r=Wt(e,n),Yt.test(r)?x(e).position()[n]+"px":r):t}}})}),x.expr&&x.expr.filters&&(x.expr.filters.hidden=function(e){return 0>=e.offsetWidth&&0>=e.offsetHeight||!x.support.reliableHiddenOffsets&&"none"===(e.style&&e.style.display||x.css(e,"display"))},x.expr
 .filters.visible=function(e){return!x.expr.filters.hidden(e)}),x.each({margin:"",padding:"",border:"Width"},function(e,t){x.cssHooks[e+t]={expand:function(n){var r=0,i={},o="string"==typeof n?n.split(" "):[n];for(;4>r;r++)i[e+Zt[r]+t]=o[r]||o[r-2]||o[0];return i}},Ut.test(e)||(x.cssHooks[e+t].set=on)});var cn=/%20/g,pn=/\[\]$/,fn=/\r?\n/g,dn=/^(?:submit|button|image|reset|file)$/i,hn=/^(?:input|select|textarea|keygen)/i;x.fn.extend({serialize:function(){return x.param(this.serializeArray())},serializeArray:function(){return this.map(function(){var e=x.prop(this,"elements");return e?x.makeArray(e):this}).filter(function(){var e=this.type;return this.name&&!x(this).is(":disabled")&&hn.test(this.nodeName)&&!dn.test(e)&&(this.checked||!Ct.test(e))}).map(function(e,t){var n=x(this).val();return null==n?null:x.isArray(n)?x.map(n,function(e){return{name:t.name,value:e.replace(fn,"\r\n")}}):{name:t.name,value:n.replace(fn,"\r\n")}}).get()}}),x.param=function(e,n){var r,i=[],o=functi
 on(e,t){t=x.isFunction(t)?t():null==t?"":t,i[i.length]=encodeURIComponent(e)+"="+encodeURIComponent(t)};if(n===t&&(n=x.ajaxSettings&&x.ajaxSettings.traditional),x.isArray(e)||e.jquery&&!x.isPlainObject(e))x.each(e,function(){o(this.name,this.value)});else for(r in e)gn(r,e[r],n,o);return i.join("&").replace(cn,"+")};function gn(e,t,n,r){var i;if(x.isArray(t))x.each(t,function(t,i){n||pn.test(e)?r(e,i):gn(e+"["+("object"==typeof i?t:"")+"]",i,n,r)});else if(n||"object"!==x.type(t))r(e,t);else for(i in t)gn(e+"["+i+"]",t[i],n,r)}x.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "),function(e,t){x.fn[t]=function(e,n){return arguments.length>0?this.on(t,null,e,n):this.trigger(t)}}),x.fn.extend({hover:function(e,t){return this.mouseenter(e).mouseleave(t||e)},bind:function(e,t,n){return this.on(e,null,t,n)},unbind:fu
 nction(e,t){return this.off(e,null,t)},delegate:function(e,t,n,r){return this.on(t,e,n,r)},undelegate:function(e,t,n){return 1===arguments.length?this.off(e,"**"):this.off(t,e||"**",n)}});var mn,yn,vn=x.now(),bn=/\?/,xn=/#.*$/,wn=/([?&])_=[^&]*/,Tn=/^(.*?):[ \t]*([^\r\n]*)\r?$/gm,Cn=/^(?:about|app|app-storage|.+-extension|file|res|widget):$/,Nn=/^(?:GET|HEAD)$/,kn=/^\/\//,En=/^([\w.+-]+:)(?:\/\/([^\/?#:]*)(?::(\d+)|)|)/,Sn=x.fn.load,An={},jn={},Dn="*/".concat("*");try{yn=o.href}catch(Ln){yn=a.createElement("a"),yn.href="",yn=yn.href}mn=En.exec(yn.toLowerCase())||[];function Hn(e){return function(t,n){"string"!=typeof t&&(n=t,t="*");var r,i=0,o=t.toLowerCase().match(T)||[];if(x.isFunction(n))while(r=o[i++])"+"===r[0]?(r=r.slice(1)||"*",(e[r]=e[r]||[]).unshift(n)):(e[r]=e[r]||[]).push(n)}}function qn(e,n,r,i){var o={},a=e===jn;function s(l){var u;return o[l]=!0,x.each(e[l]||[],function(e,l){var c=l(n,r,i);return"string"!=typeof c||a||o[c]?a?!(u=c):t:(n.dataTypes.unshift(c),s(c
 ),!1)}),u}return s(n.dataTypes[0])||!o["*"]&&s("*")}function _n(e,n){var r,i,o=x.ajaxSettings.flatOptions||{};for(i in n)n[i]!==t&&((o[i]?e:r||(r={}))[i]=n[i]);return r&&x.extend(!0,e,r),e}x.fn.load=function(e,n,r){if("string"!=typeof e&&Sn)return Sn.apply(this,arguments);var i,o,a,s=this,l=e.indexOf(" ");return l>=0&&(i=e.slice(l,e.length),e=e.slice(0,l)),x.isFunction(n)?(r=n,n=t):n&&"object"==typeof n&&(a="POST"),s.length>0&&x.ajax({url:e,type:a,dataType:"html",data:n}).done(function(e){o=arguments,s.html(i?x("<div>").append(x.parseHTML(e)).find(i):e)}).complete(r&&function(e,t){s.each(r,o||[e.responseText,t,e])}),this},x.each(["ajaxStart","ajaxStop","ajaxComplete","ajaxError","ajaxSuccess","ajaxSend"],function(e,t){x.fn[t]=function(e){return this.on(t,e)}}),x.extend({active:0,lastModified:{},etag:{},ajaxSettings:{url:yn,type:"GET",isLocal:Cn.test(mn[1]),global:!0,processData:!0,async:!0,contentType:"application/x-www-form-urlencoded; charset=UTF-8",accepts:{"*":Dn,text:"t
 ext/plain",html:"text/html",xml:"application/xml, text/xml",json:"application/json, text/javascript"},contents:{xml:/xml/,html:/html/,json:/json/},responseFields:{xml:"responseXML",text:"responseText",json:"responseJSON"},converters:{"* text":String,"text html":!0,"text json":x.parseJSON,"text xml":x.parseXML},flatOptions:{url:!0,context:!0}},ajaxSetup:function(e,t){return t?_n(_n(e,x.ajaxSettings),t):_n(x.ajaxSettings,e)},ajaxPrefilter:Hn(An),ajaxTransport:Hn(jn),ajax:function(e,n){"object"==typeof e&&(n=e,e=t),n=n||{};var r,i,o,a,s,l,u,c,p=x.ajaxSetup({},n),f=p.context||p,d=p.context&&(f.nodeType||f.jquery)?x(f):x.event,h=x.Deferred(),g=x.Callbacks("once memory"),m=p.statusCode||{},y={},v={},b=0,w="canceled",C={readyState:0,getResponseHeader:function(e){var t;if(2===b){if(!c){c={};while(t=Tn.exec(a))c[t[1].toLowerCase()]=t[2]}t=c[e.toLowerCase()]}return null==t?null:t},getAllResponseHeaders:function(){return 2===b?a:null},setRequestHeader:function(e,t){var n=e.toLowerCase(
 );return b||(e=v[n]=v[n]||e,y[e]=t),this},overrideMimeType:function(e){return b||(p.mimeType=e),this},statusCode:function(e){var t;if(e)if(2>b)for(t in e)m[t]=[m[t],e[t]];else C.always(e[C.status]);return this},abort:function(e){var t=e||w;return u&&u.abort(t),k(0,t),this}};if(h.promise(C).complete=g.add,C.success=C.done,C.error=C.fail,p.url=((e||p.url||yn)+"").replace(xn,"").replace(kn,mn[1]+"//"),p.type=n.method||n.type||p.method||p.type,p.dataTypes=x.trim(p.dataType||"*").toLowerCase().match(T)||[""],null==p.crossDomain&&(r=En.exec(p.url.toLowerCase()),p.crossDomain=!(!r||r[1]===mn[1]&&r[2]===mn[2]&&(r[3]||("http:"===r[1]?"80":"443"))===(mn[3]||("http:"===mn[1]?"80":"443")))),p.data&&p.processData&&"string"!=typeof p.data&&(p.data=x.param(p.data,p.traditional)),qn(An,p,n,C),2===b)return C;l=p.global,l&&0===x.active++&&x.event.trigger("ajaxStart"),p.type=p.type.toUpperCase(),p.hasContent=!Nn.test(p.type),o=p.url,p.hasContent||(p.data&&(o=p.url+=(bn.test(o)?"&":"?")+p.data,
 delete p.data),p.cache===!1&&(p.url=wn.test(o)?o.replace(wn,"$1_="+vn++):o+(bn.test(o)?"&":"?")+"_="+vn++)),p.ifModified&&(x.lastModified[o]&&C.setRequestHeader("If-Modified-Since",x.lastModified[o]),x.etag[o]&&C.setRequestHeader("If-None-Match",x.etag[o])),(p.data&&p.hasContent&&p.contentType!==!1||n.contentType)&&C.setRequestHeader("Content-Type",p.contentType),C.setRequestHeader("Accept",p.dataTypes[0]&&p.accepts[p.dataTypes[0]]?p.accepts[p.dataTypes[0]]+("*"!==p.dataTypes[0]?", "+Dn+"; q=0.01":""):p.accepts["*"]);for(i in p.headers)C.setRequestHeader(i,p.headers[i]);if(p.beforeSend&&(p.beforeSend.call(f,C,p)===!1||2===b))return C.abort();w="abort";for(i in{success:1,error:1,complete:1})C[i](p[i]);if(u=qn(jn,p,n,C)){C.readyState=1,l&&d.trigger("ajaxSend",[C,p]),p.async&&p.timeout>0&&(s=setTimeout(function(){C.abort("timeout")},p.timeout));try{b=1,u.send(y,k)}catch(N){if(!(2>b))throw N;k(-1,N)}}else k(-1,"No Transport");function k(e,n,r,i){var c,y,v,w,T,N=n;2!==b&&(b=2,s&&
 clearTimeout(s),u=t,a=i||"",C.readyState=e>0?4:0,c=e>=200&&300>e||304===e,r&&(w=Mn(p,C,r)),w=On(p,w,C,c),c?(p.ifModified&&(T=C.getResponseHeader("Last-Modified"),T&&(x.lastModified[o]=T),T=C.getResponseHeader("etag"),T&&(x.etag[o]=T)),204===e||"HEAD"===p.type?N="nocontent":304===e?N="notmodified":(N=w.state,y=w.data,v=w.error,c=!v)):(v=N,(e||!N)&&(N="error",0>e&&(e=0))),C.status=e,C.statusText=(n||N)+"",c?h.resolveWith(f,[y,N,C]):h.rejectWith(f,[C,N,v]),C.statusCode(m),m=t,l&&d.trigger(c?"ajaxSuccess":"ajaxError",[C,p,c?y:v]),g.fireWith(f,[C,N]),l&&(d.trigger("ajaxComplete",[C,p]),--x.active||x.event.trigger("ajaxStop")))}return C},getJSON:function(e,t,n){return x.get(e,t,n,"json")},getScript:function(e,n){return x.get(e,t,n,"script")}}),x.each(["get","post"],function(e,n){x[n]=function(e,r,i,o){return x.isFunction(r)&&(o=o||i,i=r,r=t),x.ajax({url:e,type:n,dataType:o,data:r,success:i})}});function Mn(e,n,r){var i,o,a,s,l=e.contents,u=e.dataTypes;while("*"===u[0])u.shift(),o=
 ==t&&(o=e.mimeType||n.getResponseHeader("Content-Type"));if(o)for(s in l)if(l[s]&&l[s].test(o)){u.unshift(s);break}if(u[0]in r)a=u[0];else{for(s in r){if(!u[0]||e.converters[s+" "+u[0]]){a=s;break}i||(i=s)}a=a||i}return a?(a!==u[0]&&u.unshift(a),r[a]):t}function On(e,t,n,r){var i,o,a,s,l,u={},c=e.dataTypes.slice();if(c[1])for(a in e.converters)u[a.toLowerCase()]=e.converters[a];o=c.shift();while(o)if(e.responseFields[o]&&(n[e.responseFields[o]]=t),!l&&r&&e.dataFilter&&(t=e.dataFilter(t,e.dataType)),l=o,o=c.shift())if("*"===o)o=l;else if("*"!==l&&l!==o){if(a=u[l+" "+o]||u["* "+o],!a)for(i in u)if(s=i.split(" "),s[1]===o&&(a=u[l+" "+s[0]]||u["* "+s[0]])){a===!0?a=u[i]:u[i]!==!0&&(o=s[0],c.unshift(s[1]));break}if(a!==!0)if(a&&e["throws"])t=a(t);else try{t=a(t)}catch(p){return{state:"parsererror",error:a?p:"No conversion from "+l+" to "+o}}}return{state:"success",data:t}}x.ajaxSetup({accepts:{script:"text/javascript, application/javascript, application/ecmascript, application/x-
 ecmascript"},contents:{script:/(?:java|ecma)script/},converters:{"text script":function(e){return x.globalEval(e),e}}}),x.ajaxPrefilter("script",function(e){e.cache===t&&(e.cache=!1),e.crossDomain&&(e.type="GET",e.global=!1)}),x.ajaxTransport("script",function(e){if(e.crossDomain){var n,r=a.head||x("head")[0]||a.documentElement;return{send:function(t,i){n=a.createElement("script"),n.async=!0,e.scriptCharset&&(n.charset=e.scriptCharset),n.src=e.url,n.onload=n.onreadystatechange=function(e,t){(t||!n.readyState||/loaded|complete/.test(n.readyState))&&(n.onload=n.onreadystatechange=null,n.parentNode&&n.parentNode.removeChild(n),n=null,t||i(200,"success"))},r.insertBefore(n,r.firstChild)},abort:function(){n&&n.onload(t,!0)}}}});var Fn=[],Bn=/(=)\?(?=&|$)|\?\?/;x.ajaxSetup({jsonp:"callback",jsonpCallback:function(){var e=Fn.pop()||x.expando+"_"+vn++;return this[e]=!0,e}}),x.ajaxPrefilter("json jsonp",function(n,r,i){var o,a,s,l=n.jsonp!==!1&&(Bn.test(n.url)?"url":"string"==typeof 
 n.data&&!(n.contentType||"").indexOf("application/x-www-form-urlencoded")&&Bn.test(n.data)&&"data");return l||"jsonp"===n.dataTypes[0]?(o=n.jsonpCallback=x.isFunction(n.jsonpCallback)?n.jsonpCallback():n.jsonpCallback,l?n[l]=n[l].replace(Bn,"$1"+o):n.jsonp!==!1&&(n.url+=(bn.test(n.url)?"&":"?")+n.jsonp+"="+o),n.converters["script json"]=function(){return s||x.error(o+" was not called"),s[0]},n.dataTypes[0]="json",a=e[o],e[o]=function(){s=arguments},i.always(function(){e[o]=a,n[o]&&(n.jsonpCallback=r.jsonpCallback,Fn.push(o)),s&&x.isFunction(a)&&a(s[0]),s=a=t}),"script"):t});var Pn,Rn,Wn=0,$n=e.ActiveXObject&&function(){var e;for(e in Pn)Pn[e](t,!0)};function In(){try{return new e.XMLHttpRequest}catch(t){}}function zn(){try{return new e.ActiveXObject("Microsoft.XMLHTTP")}catch(t){}}x.ajaxSettings.xhr=e.ActiveXObject?function(){return!this.isLocal&&In()||zn()}:In,Rn=x.ajaxSettings.xhr(),x.support.cors=!!Rn&&"withCredentials"in Rn,Rn=x.support.ajax=!!Rn,Rn&&x.ajaxTransport(func
 tion(n){if(!n.crossDomain||x.support.cors){var r;return{send:function(i,o){var a,s,l=n.xhr();if(n.username?l.open(n.type,n.url,n.async,n.username,n.password):l.open(n.type,n.url,n.async),n.xhrFields)for(s in n.xhrFields)l[s]=n.xhrFields[s];n.mimeType&&l.overrideMimeType&&l.overrideMimeType(n.mimeType),n.crossDomain||i["X-Requested-With"]||(i["X-Requested-With"]="XMLHttpRequest");try{for(s in i)l.setRequestHeader(s,i[s])}catch(u){}l.send(n.hasContent&&n.data||null),r=function(e,i){var s,u,c,p;try{if(r&&(i||4===l.readyState))if(r=t,a&&(l.onreadystatechange=x.noop,$n&&delete Pn[a]),i)4!==l.readyState&&l.abort();else{p={},s=l.status,u=l.getAllResponseHeaders(),"string"==typeof l.responseText&&(p.text=l.responseText);try{c=l.statusText}catch(f){c=""}s||!n.isLocal||n.crossDomain?1223===s&&(s=204):s=p.text?200:404}}catch(d){i||o(-1,d)}p&&o(s,c,p,u)},n.async?4===l.readyState?setTimeout(r):(a=++Wn,$n&&(Pn||(Pn={},x(e).unload($n)),Pn[a]=r),l.onreadystatechange=r):r()},abort:function()
 {r&&r(t,!0)}}}});var Xn,Un,Vn=/^(?:toggle|show|hide)$/,Yn=RegExp("^(?:([+-])=|)("+w+")([a-z%]*)$","i"),Jn=/queueHooks$/,Gn=[nr],Qn={"*":[function(e,t){var n=this.createTween(e,t),r=n.cur(),i=Yn.exec(t),o=i&&i[3]||(x.cssNumber[e]?"":"px"),a=(x.cssNumber[e]||"px"!==o&&+r)&&Yn.exec(x.css(n.elem,e)),s=1,l=20;if(a&&a[3]!==o){o=o||a[3],i=i||[],a=+r||1;do s=s||".5",a/=s,x.style(n.elem,e,a+o);while(s!==(s=n.cur()/r)&&1!==s&&--l)}return i&&(a=n.start=+a||+r||0,n.unit=o,n.end=i[1]?a+(i[1]+1)*i[2]:+i[2]),n}]};function Kn(){return setTimeout(function(){Xn=t}),Xn=x.now()}function Zn(e,t,n){var r,i=(Qn[t]||[]).concat(Qn["*"]),o=0,a=i.length;for(;a>o;o++)if(r=i[o].call(n,t,e))return r}function er(e,t,n){var r,i,o=0,a=Gn.length,s=x.Deferred().always(function(){delete l.elem}),l=function(){if(i)return!1;var t=Xn||Kn(),n=Math.max(0,u.startTime+u.duration-t),r=n/u.duration||0,o=1-r,a=0,l=u.tweens.length;for(;l>a;a++)u.tweens[a].run(o);return s.notifyWith(e,[u,o,n]),1>o&&l?n:(s.resolveWith(e,[u
 ]),!1)},u=s.promise({elem:e,props:x.extend({},t),opts:x.extend(!0,{specialEasing:{}},n),originalProperties:t,originalOptions:n,startTime:Xn||Kn(),duration:n.duration,tweens:[],createTween:function(t,n){var r=x.Tween(e,u.opts,t,n,u.opts.specialEasing[t]||u.opts.easing);return u.tweens.push(r),r},stop:function(t){var n=0,r=t?u.tweens.length:0;if(i)return this;for(i=!0;r>n;n++)u.tweens[n].run(1);return t?s.resolveWith(e,[u,t]):s.rejectWith(e,[u,t]),this}}),c=u.props;for(tr(c,u.opts.specialEasing);a>o;o++)if(r=Gn[o].call(u,e,c,u.opts))return r;return x.map(c,Zn,u),x.isFunction(u.opts.start)&&u.opts.start.call(e,u),x.fx.timer(x.extend(l,{elem:e,anim:u,queue:u.opts.queue})),u.progress(u.opts.progress).done(u.opts.done,u.opts.complete).fail(u.opts.fail).always(u.opts.always)}function tr(e,t){var n,r,i,o,a;for(n in e)if(r=x.camelCase(n),i=t[r],o=e[n],x.isArray(o)&&(i=o[1],o=e[n]=o[0]),n!==r&&(e[r]=o,delete e[n]),a=x.cssHooks[r],a&&"expand"in a){o=a.expand(o),delete e[r];for(n in o)n
  in e||(e[n]=o[n],t[n]=i)}else t[r]=i}x.Animation=x.extend(er,{tweener:function(e,t){x.isFunction(e)?(t=e,e=["*"]):e=e.split(" ");var n,r=0,i=e.length;for(;i>r;r++)n=e[r],Qn[n]=Qn[n]||[],Qn[n].unshift(t)},prefilter:function(e,t){t?Gn.unshift(e):Gn.push(e)}});function nr(e,t,n){var r,i,o,a,s,l,u=this,c={},p=e.style,f=e.nodeType&&nn(e),d=x._data(e,"fxshow");n.queue||(s=x._queueHooks(e,"fx"),null==s.unqueued&&(s.unqueued=0,l=s.empty.fire,s.empty.fire=function(){s.unqueued||l()}),s.unqueued++,u.always(function(){u.always(function(){s.unqueued--,x.queue(e,"fx").length||s.empty.fire()})})),1===e.nodeType&&("height"in t||"width"in t)&&(n.overflow=[p.overflow,p.overflowX,p.overflowY],"inline"===x.css(e,"display")&&"none"===x.css(e,"float")&&(x.support.inlineBlockNeedsLayout&&"inline"!==ln(e.nodeName)?p.zoom=1:p.display="inline-block")),n.overflow&&(p.overflow="hidden",x.support.shrinkWrapBlocks||u.always(function(){p.overflow=n.overflow[0],p.overflowX=n.overflow[1],p.overflowY=n.ove
 rflow[2]}));for(r in t)if(i=t[r],Vn.exec(i)){if(delete t[r],o=o||"toggle"===i,i===(f?"hide":"show"))continue;c[r]=d&&d[r]||x.style(e,r)}if(!x.isEmptyObject(c)){d?"hidden"in d&&(f=d.hidden):d=x._data(e,"fxshow",{}),o&&(d.hidden=!f),f?x(e).show():u.done(function(){x(e).hide()}),u.done(function(){var t;x._removeData(e,"fxshow");for(t in c)x.style(e,t,c[t])});for(r in c)a=Zn(f?d[r]:0,r,u),r in d||(d[r]=a.start,f&&(a.end=a.start,a.start="width"===r||"height"===r?1:0))}}function rr(e,t,n,r,i){return new rr.prototype.init(e,t,n,r,i)}x.Tween=rr,rr.prototype={constructor:rr,init:function(e,t,n,r,i,o){this.elem=e,this.prop=n,this.easing=i||"swing",this.options=t,this.start=this.now=this.cur(),this.end=r,this.unit=o||(x.cssNumber[n]?"":"px")},cur:function(){var e=rr.propHooks[this.prop];return e&&e.get?e.get(this):rr.propHooks._default.get(this)},run:function(e){var t,n=rr.propHooks[this.prop];return this.pos=t=this.options.duration?x.easing[this.easing](e,this.options.duration*e,0,1,t
 his.options.duration):e,this.now=(this.end-this.start)*t+this.start,this.options.step&&this.options.step.call(this.elem,this.now,this),n&&n.set?n.set(this):rr.propHooks._default.set(this),this}},rr.prototype.init.prototype=rr.prototype,rr.propHooks={_default:{get:function(e){var t;return null==e.elem[e.prop]||e.elem.style&&null!=e.elem.style[e.prop]?(t=x.css(e.elem,e.prop,""),t&&"auto"!==t?t:0):e.elem[e.prop]},set:function(e){x.fx.step[e.prop]?x.fx.step[e.prop](e):e.elem.style&&(null!=e.elem.style[x.cssProps[e.prop]]||x.cssHooks[e.prop])?x.style(e.elem,e.prop,e.now+e.unit):e.elem[e.prop]=e.now}}},rr.propHooks.scrollTop=rr.propHooks.scrollLeft={set:function(e){e.elem.nodeType&&e.elem.parentNode&&(e.elem[e.prop]=e.now)}},x.each(["toggle","show","hide"],function(e,t){var n=x.fn[t];x.fn[t]=function(e,r,i){return null==e||"boolean"==typeof e?n.apply(this,arguments):this.animate(ir(t,!0),e,r,i)}}),x.fn.extend({fadeTo:function(e,t,n,r){return this.filter(nn).css("opacity",0).show()
 .end().animate({opacity:t},e,n,r)},animate:function(e,t,n,r){var i=x.isEmptyObject(e),o=x.speed(t,n,r),a=function(){var t=er(this,x.extend({},e),o);(i||x._data(this,"finish"))&&t.stop(!0)};return a.finish=a,i||o.queue===!1?this.each(a):this.queue(o.queue,a)},stop:function(e,n,r){var i=function(e){var t=e.stop;delete e.stop,t(r)};return"string"!=typeof e&&(r=n,n=e,e=t),n&&e!==!1&&this.queue(e||"fx",[]),this.each(function(){var t=!0,n=null!=e&&e+"queueHooks",o=x.timers,a=x._data(this);if(n)a[n]&&a[n].stop&&i(a[n]);else for(n in a)a[n]&&a[n].stop&&Jn.test(n)&&i(a[n]);for(n=o.length;n--;)o[n].elem!==this||null!=e&&o[n].queue!==e||(o[n].anim.stop(r),t=!1,o.splice(n,1));(t||!r)&&x.dequeue(this,e)})},finish:function(e){return e!==!1&&(e=e||"fx"),this.each(function(){var t,n=x._data(this),r=n[e+"queue"],i=n[e+"queueHooks"],o=x.timers,a=r?r.length:0;for(n.finish=!0,x.queue(this,e,[]),i&&i.stop&&i.stop.call(this,!0),t=o.length;t--;)o[t].elem===this&&o[t].queue===e&&(o[t].anim.stop(!0)
 ,o.splice(t,1));for(t=0;a>t;t++)r[t]&&r[t].finish&&r[t].finish.call(this);delete n.finish})}});function ir(e,t){var n,r={height:e},i=0;for(t=t?1:0;4>i;i+=2-t)n=Zt[i],r["margin"+n]=r["padding"+n]=e;return t&&(r.opacity=r.width=e),r}x.each({slideDown:ir("show"),slideUp:ir("hide"),slideToggle:ir("toggle"),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(e,t){x.fn[e]=function(e,n,r){return this.animate(t,e,n,r)}}),x.speed=function(e,t,n){var r=e&&"object"==typeof e?x.extend({},e):{complete:n||!n&&t||x.isFunction(e)&&e,duration:e,easing:n&&t||t&&!x.isFunction(t)&&t};return r.duration=x.fx.off?0:"number"==typeof r.duration?r.duration:r.duration in x.fx.speeds?x.fx.speeds[r.duration]:x.fx.speeds._default,(null==r.queue||r.queue===!0)&&(r.queue="fx"),r.old=r.complete,r.complete=function(){x.isFunction(r.old)&&r.old.call(this),r.queue&&x.dequeue(this,r.queue)},r},x.easing={linear:function(e){return e},swing:function(e){return.5-Math.cos(e*Math.
 PI)/2}},x.timers=[],x.fx=rr.prototype.init,x.fx.tick=function(){var e,n=x.timers,r=0;for(Xn=x.now();n.length>r;r++)e=n[r],e()||n[r]!==e||n.splice(r--,1);n.length||x.fx.stop(),Xn=t},x.fx.timer=function(e){e()&&x.timers.push(e)&&x.fx.start()},x.fx.interval=13,x.fx.start=function(){Un||(Un=setInterval(x.fx.tick,x.fx.interval))},x.fx.stop=function(){clearInterval(Un),Un=null},x.fx.speeds={slow:600,fast:200,_default:400},x.fx.step={},x.expr&&x.expr.filters&&(x.expr.filters.animated=function(e){return x.grep(x.timers,function(t){return e===t.elem}).length}),x.fn.offset=function(e){if(arguments.length)return e===t?this:this.each(function(t){x.offset.setOffset(this,e,t)});var n,r,o={top:0,left:0},a=this[0],s=a&&a.ownerDocument;if(s)return n=s.documentElement,x.contains(n,a)?(typeof a.getBoundingClientRect!==i&&(o=a.getBoundingClientRect()),r=or(s),{top:o.top+(r.pageYOffset||n.scrollTop)-(n.clientTop||0),left:o.left+(r.pageXOffset||n.scrollLeft)-(n.clientLeft||0)}):o},x.offset={setOf
 fset:function(e,t,n){var r=x.css(e,"position");"static"===r&&(e.style.position="relative");var i=x(e),o=i.offset(),a=x.css(e,"top"),s=x.css(e,"left"),l=("absolute"===r||"fixed"===r)&&x.inArray("auto",[a,s])>-1,u={},c={},p,f;l?(c=i.position(),p=c.top,f=c.left):(p=parseFloat(a)||0,f=parseFloat(s)||0),x.isFunction(t)&&(t=t.call(e,n,o)),null!=t.top&&(u.top=t.top-o.top+p),null!=t.left&&(u.left=t.left-o.left+f),"using"in t?t.using.call(e,u):i.css(u)}},x.fn.extend({position:function(){if(this[0]){var e,t,n={top:0,left:0},r=this[0];return"fixed"===x.css(r,"position")?t=r.getBoundingClientRect():(e=this.offsetParent(),t=this.offset(),x.nodeName(e[0],"html")||(n=e.offset()),n.top+=x.css(e[0],"borderTopWidth",!0),n.left+=x.css(e[0],"borderLeftWidth",!0)),{top:t.top-n.top-x.css(r,"marginTop",!0),left:t.left-n.left-x.css(r,"marginLeft",!0)}}},offsetParent:function(){return this.map(function(){var e=this.offsetParent||s;while(e&&!x.nodeName(e,"html")&&"static"===x.css(e,"position"))e=e.of
 fsetParent;return e||s})}}),x.each({scrollLeft:"pageXOffset",scrollTop:"pageYOffset"},function(e,n){var r=/Y/.test(n);x.fn[e]=function(i){return x.access(this,function(e,i,o){var a=or(e);return o===t?a?n in a?a[n]:a.document.documentElement[i]:e[i]:(a?a.scrollTo(r?x(a).scrollLeft():o,r?o:x(a).scrollTop()):e[i]=o,t)},e,i,arguments.length,null)}});function or(e){return x.isWindow(e)?e:9===e.nodeType?e.defaultView||e.parentWindow:!1}x.each({Height:"height",Width:"width"},function(e,n){x.each({padding:"inner"+e,content:n,"":"outer"+e},function(r,i){x.fn[i]=function(i,o){var a=arguments.length&&(r||"boolean"!=typeof i),s=r||(i===!0||o===!0?"margin":"border");return x.access(this,function(n,r,i){var o;return x.isWindow(n)?n.document.documentElement["client"+e]:9===n.nodeType?(o=n.documentElement,Math.max(n.body["scroll"+e],o["scroll"+e],n.body["offset"+e],o["offset"+e],o["client"+e])):i===t?x.css(n,r,s):x.style(n,r,i,s)},n,a?i:t,a,null)}})}),x.fn.size=function(){return this.length
 },x.fn.andSelf=x.fn.addBack,"object"==typeof module&&module&&"object"==typeof module.exports?module.exports=x:(e.jQuery=e.$=x,"function"==typeof define&&define.amd&&define("jquery",[],function(){return x}))})(window);
diff --git a/docs/lists.html b/docs/lists.html
deleted file mode 100644
index b806d77..0000000
--- a/docs/lists.html
+++ /dev/null
@@ -1,40 +0,0 @@
-<!--#include file="header.html" -->
-
-<!-- Begin Introduction section -->
-
-<h3>Mailing List Information</h3>
-Buildroot has a <a href="/lists/buildroot/">mailing list</a> for discussion and
-development.  You can subscribe by visiting
-<a href="http://lists.busybox.net/mailman/listinfo/buildroot">this page</a>.
-Only subscribers to the Buildroot mailing list are allowed to post
-to this list.
-<p>
-The list is also available through <a
-href="http://gmane.org">Gmane</a> at <a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot">gmane.comp.lib.uclibc.buildroot</a>.
-<p>
-
-<h3>Search the List Archives</h3>
-Please search the mailing list archives before asking questions on the mailing
-list, since there is a good chance someone else has asked the same question
-before.  Checking the archives is a great way to avoid annoying everyone on the
-list with frequently asked questions...
-<p>
-
-<center>
-<div id="cse" style="width: 100%;">Loading</div>
-<script src="http://www.google.com/jsapi" type="text/javascript"></script>
-<script type="text/javascript">
-	google.load('search', '1', {language : 'en'});
-	google.setOnLoadCallback(function() {
-		var customSearchControl = new google.search.CustomSearchControl(
-					      '009810735161915413714:3rfmqierl8s');
-		customSearchControl.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET);
-		var customSearchOptions = new google.search.DrawOptions();
-		customSearchOptions.enableSearchboxOnly("http://google.com/cse?cx=009810735161915413714:3rfmqierl8s");
-		customSearchControl.draw('cse', customSearchOptions);
-	}, true);
-</script>
-<link rel="stylesheet" href="http://www.google.com/cse/style/look/default.css" type="text/css" />
-</center>
-
-<!--#include file="footer.html" -->
diff --git a/docs/news.html b/docs/news.html
index e473ba0..944577a 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -1,6 +1,6 @@
 <!--#include file="header.html" -->
 
-<h3>News</h3>
+<h2>News</h2>
 
 <p>
 
@@ -10,12 +10,13 @@
     <p>We have a new release candidate! Lots of changes all over the
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02-rc1">CHANGES</a>
-    file for details.</p>
+    file for details, and read the
+    <a href="http://lists.busybox.net/pipermail/buildroot/2014-February/089055.html">announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2014.02-rc1.tar.bz2">2014.02-rc1
     release candidate</a>, and report any problems found to the
-    <a href="lists.html">mailing list</a> or
+    <a href="support.html">mailing list</a> or
     <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>9 February 2014 -- Report from Buildroot Developers Meeting</b>
@@ -72,7 +73,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.11-rc3.tar.bz2">2013.11-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>18 November 2013 -- 2013.11-rc2 released</b>
@@ -85,7 +86,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.11-rc2.tar.bz2">2013.11-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>13 November 2013 -- Announcement of the next Buildroot Developer Days</b>
@@ -124,7 +125,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.11-rc1.tar.bz2">2013.11-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>11 November 2013 -- Report from Buildroot Developers Meeting</b>
@@ -183,7 +184,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.08-rc3.tar.bz2">2013.08-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>16 August 2013 -- 2013.08-rc2 released</b>
@@ -196,7 +197,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.08-rc2.tar.bz2">2013.08-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>5 August 2013 -- 2013.08-rc1 released</b>
@@ -209,7 +210,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.08-rc1.tar.bz2">2013.08-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>31 May 2013 -- 2013.05 released</b>
@@ -232,7 +233,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.05-rc3.tar.bz2">2013.05-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>15 May 2013 -- 2013.05-rc2 released</b>
@@ -245,7 +246,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.05-rc2.tar.bz2">2013.05-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>8 May 2013 -- 2013.05-rc1 released</b>
@@ -259,7 +260,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.05-rc1.tar.bz2">2013.05-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>28 February 2013 -- 2013.02 released</b>
@@ -281,7 +282,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.02-rc3.tar.bz2">2013.02-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>19 February 2013 -- 2013.02-rc2 released</b>
@@ -294,7 +295,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.02-rc2.tar.bz2">2013.02-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>10 February 2013 -- 2013.02-rc1 released</b>
@@ -308,7 +309,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.02-rc1.tar.bz2">2013.02-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>10 February 2013 -- Report from Buildroot Developers Meeting</b>
@@ -369,7 +370,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.11-rc2.tar.bz2">2012.11-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>17 November 2012 -- 2012.11-rc1 released</b>
@@ -383,7 +384,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.11-rc1.tar.bz2">2012.11-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>17 November 2012 -- Buildroot Developer Day</b>
@@ -419,7 +420,7 @@
      <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
      <a href="/downloads/buildroot-2012.08-rc3.tar.bz2">2012.08-rc3
      release candidate</a>, and report any problems found to the <a
-     href="lists.html">mailing list</a> or <a
+     href="support.html">mailing list</a> or <a
      href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
    <li><b>15 August 2012 -- 2012.08-rc2 released</b>
@@ -432,7 +433,7 @@
      <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
      <a href="/downloads/buildroot-2012.08-rc2.tar.bz2">2012.08-rc2
      release candidate</a>, and report any problems found to the <a
-     href="lists.html">mailing list</a> or <a
+     href="support.html">mailing list</a> or <a
      href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
    <li><b>1 August 2012 -- 2012.08-rc1 released</b>
@@ -445,7 +446,7 @@
      <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
      <a href="/downloads/buildroot-2012.08-rc1.tar.bz2">2012.08-rc1
      release candidate</a>, and report any problems found to the <a
-     href="lists.html">mailing list</a> or <a
+     href="support.html">mailing list</a> or <a
      href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>22 July 2012 -- Buildroot Developer Day</b>
@@ -483,7 +484,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.05-rc3.tar.bz2">2012.05-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>18 May 2012 -- 2012.05-rc2 released</b>
@@ -496,7 +497,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.05-rc2.tar.bz2">2012.05-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>10 May 2012 -- 2012.05-rc1 released</b>
@@ -510,7 +511,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.05-rc1.tar.bz2">2012.05-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>20 April 2012 -- Autobuilder Results Online</b>
@@ -547,7 +548,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.02-rc3.tar.bz2">2012.02-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>19 February 2012 -- 2012.02-rc2 released</b>
@@ -560,7 +561,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.02-rc2.tar.bz2">2012.02-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>12 February 2012 -- 2012.02-rc1 released</b>
@@ -574,7 +575,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.02-rc1.tar.bz2">2012.02-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>31 January 2012 -- Buildroot Developer Day</b>
@@ -605,7 +606,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.11-rc3.tar.bz2">2011.11-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>18 November 2011 -- 2011.11-rc2 released</b>
@@ -618,7 +619,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.11-rc2.tar.bz2">2011.11-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>11 November 2011 -- 2011.11-rc1 released</b>
@@ -632,7 +633,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.11-rc1.tar.bz2">2011.11-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>31 August 2011 -- 2011.08 released</b>
@@ -653,7 +654,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.08-rc2.tar.bz2">2011.08-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>4 August 2011 -- 2011.08-rc1 released</b>
@@ -667,7 +668,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.08-rc1.tar.bz2">2011.08-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>27 May 2011 -- 2011.05 released</b>
@@ -687,7 +688,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.05-rc2.tar.bz2">2011.05-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>18 May 2011 -- 2011.05-rc1 released</b>
@@ -701,7 +702,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.05-rc1.tar.bz2">2011.05-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>28 February 2011 -- 2011.02 released</b>
@@ -723,7 +724,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.02-rc2.tar.bz2">2011.02-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>14 February 2011 -- 2011.02-rc1 released</b>
@@ -737,7 +738,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.02-rc1.tar.bz2">2011.02-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>30 November 2010 -- 2010.11 released</b>
@@ -759,7 +760,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.11-rc2.tar.bz2">2010.11-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>8 November 2010 -- 2010.11-rc1 released</b>
@@ -773,7 +774,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.11-rc1.tar.bz2">2010.11-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>28 September 2010 - Buildroot Developer Day</b>
@@ -809,7 +810,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.08-rc2.tar.bz2">2010.08-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
     This is very much expected to be the final release
@@ -826,7 +827,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.08-rc1.tar.bz2">2010.08-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>30 May 2010 -- 2010.05 released</b>
@@ -848,7 +849,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.05-rc3.tar.bz2">2010.05-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>11 May 2010 -- 2010.05-rc2 released</b>
@@ -859,7 +860,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.05-rc2.tar.bz2">2010.05-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>3 May 2010 -- 2010.05-rc1 released</b>
@@ -872,7 +873,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.05-rc1.tar.bz2">2010.05-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>2 May 2010 - FOSDEM slides online</b>
@@ -901,7 +902,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.02-rc2.tar.bz2">2010.02-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>9 February 2010 -- 2010.02-rc1 released</b>
@@ -914,7 +915,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.02-rc1.tar.bz2">2010.02-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>1 December 2009 -- 2009.11 released</b>
@@ -936,7 +937,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.11-rc2.tar.bz2">2009.11-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>23 November 2009 -- 2009.11-rc1 released</b>
@@ -949,7 +950,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.11-rc1.tar.bz2">2009.11-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>7 September 2009 -- First Buildroot Developer Day</b>
@@ -991,7 +992,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.08-rc3.tar.bz2">2009.08-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>6 August 2009 -- 2009.08-rc2 released</b>
@@ -1003,7 +1004,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.08-rc2.tar.bz2">2009.08-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>2 August 2009 -- 2009.08-rc1 released</b>
@@ -1016,7 +1017,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.08-rc1.tar.bz2">2009.08-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>1 June 2009 -- 2009.05 released</b>
@@ -1039,7 +1040,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.05-rc3.tar.bz2">2009.05-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>19 May 2009 -- 2009.05-rc2 released</b>
@@ -1052,7 +1053,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.05-rc2.tar.bz2">2009.05-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>14 May 2009 -- Buildroot.org</b>
@@ -1074,7 +1075,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.05-rc1.tar.bz2">2009.05-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>3 May 2009 -- Moved to git</b>
@@ -1114,7 +1115,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.02-rc4.tar.bz2">2009.02-rc4
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>31 January 2009 -- 2009.02-rc3 released</b>
@@ -1125,7 +1126,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.02-rc3.tar.bz2">2009.02-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>23 January 2009 -- 2009.02-rc2 released</b>
@@ -1135,7 +1136,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.02-rc2.tar.bz2">2009.02-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>16 January 2009 -- Release candidate and new maintainer</b>
@@ -1145,13 +1146,13 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.02-rc1.tar.bz2">2009.02-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>. The plan is to
     release 2009.02 in time for <a
     href="http://www.fosdem.org/2009/">FOSDEM</a>.</p>
 
   <li><b>16 July 2006 -- Buildroot mailing list</b>
-    <p>Buildroot now has its own <a href=lists.html>mailing list</a>.</p>
+    <p>Buildroot now has its own <a href=support.html>mailing list</a>.</p>
 
   <li><b>21 February 2005 -- Buildroot webpage added</b><p>
 
diff --git a/docs/sponsors.html b/docs/sponsors.html
index 281b269..321dad7 100644
--- a/docs/sponsors.html
+++ b/docs/sponsors.html
@@ -1,6 +1,6 @@
 <!--#include file="header.html" -->
 
-<h3>Sponsors</h3>
+<h2>Sponsors</h2>
 
 <p>Throughout its history, the Buildroot project has been sponsored by
 various companies, that we would like to thank below:</p>
diff --git a/docs/stylesheet.css b/docs/stylesheet.css
deleted file mode 100644
index 0feb32e..0000000
--- a/docs/stylesheet.css
+++ /dev/null
@@ -1,75 +0,0 @@
-body {
-	margin: 0px;
-	color: white;
-	background-color: #93c6f9;
-	font: 12pt/18pt georgia;
-}
-
-div.main {
-	margin: 10px;
-	padding: 10px;
-	color: black;
-	background-color: white;
-}
-
-div.titre {
-	text-align: center;
-	background-color: #336699;
-	color: white;
-	padding: 10px;
-}
-
-h1 {
-	text-align: center;
-	font: 26pt georgia;
-	letter-spacing: 3px;
-}
-
-h2 {
-	padding: 5px;
-	background-color: #c2e0ff;
-	color: #336699;
-}
-
-a:link, a:visited {
-	font-weight: bold;
-	text-decoration: none;
-	color: #336699;
-}
-
-a:hover, a:active {
-	text-decoration: underline;
-	color: #9685BA;
-}
-
-h3 {
-	font: italic normal 14pt georgia;
-	letter-spacing: 1px;
-	margin-bottom: 0px;
-	margin-left: 10px;
-	margin-right: 10px;
-	color: #336699;
-	border-bottom: 2px solid #336699;
-}
-
-h4 {
-	font: italic normal 14pt georgia;
-	letter-spacing: 1px;
-	margin-bottom: 0px;
-	margin-left: 10px;
-	margin-right: 10px;
-	border-bottom: 1px dashed black;
-}
-
-p {
-	margin-left: 10px;
-	margin-right: 10px;
-	text-align: justify;
-}
-
-pre {
-	border-left: 3px #aaa solid;
-	margin-left: 1em;
-	padding: 0 1em;
-	color: #888;
-}
diff --git a/docs/support.html b/docs/support.html
new file mode 100644
index 0000000..4cc4932
--- /dev/null
+++ b/docs/support.html
@@ -0,0 +1,45 @@
+<!--#include file="header.html" -->
+
+<h2>Support</h2>
+
+You can get support for Buildroot through three main channels:
+
+<h3>IRC</h3>
+The Buildroot IRC is <a href="irc://freenode.net/#buildroot">#buildroot</a>.
+The channel #buildroot is hosted on Freenode <a href="http://webchat.freenode.net">WebChat</a>.
+
+When asking for help on IRC, share relevant logs or pieces of code using a code
+sharing website.
+
+<h3>Mailing List Information</h3>
+The <a href="/lists/buildroot/">mailing list</a> is for discussion and
+development.  You can subscribe by visiting
+<a href="http://lists.busybox.net/mailman/listinfo/buildroot">this page</a>.
+Only subscribers to the Buildroot mailing list are allowed to post
+to this list.
+<p>
+The list is also available through <a
+href="http://gmane.org">Gmane</a> at <a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot">gmane.comp.lib.uclibc.buildroot</a>.
+<p>
+
+<h4>Search the List Archives</h4>
+Please search the mailing list archives before asking questions on the mailing
+list, since there is a good chance someone else has asked the same question
+before.  Checking the archives is a great way to avoid annoying everyone on the
+list with frequently asked questions...
+<p>
+
+<form method="get" action="http://search.gmane.org/">
+  <input type="text" name="query">
+  <input type="hidden" name="group" value="gmane.comp.lib.uclibc.buildroot">
+  <input type="submit" value="Search">
+</form>
+
+<h3>Bug Tracker</h3>
+
+If you encounter any problems while using Buildroot, you can use the <a href="https://bugs.uclibc.org/">Bug Tracker</a>
+to post your bugs and/or participate to find solutions to existing problems.
+
+Note: Patch are only accepted through the mailing list.
+
+<!--#include file="footer.html" -->
-- 
1.8.5.3
