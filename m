From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 21:40:50 +0100
Subject: [Buildroot] [git commit] website: new website !
Message-ID: <20140303204144.E79AE9BCC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cec43a8f2544532642bb2c5d48bf95eac8606ba7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A new menu and logo for the website, also some of the contents has been
reworked.

This patch also removes files that are no longer used, like the old
stylesheet and a few pages. The content of theses pages has mostly been
merged in other pages or was redudant with the manual.

[Thomas: integrate a few typo fixes noticed by Thomas De
Schampheleire]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/about.html      |   11 +----
 docs/contribute.html |   39 +++++++++++++++++
 docs/developer.html  |   47 ---------------------
 docs/docs.html       |    4 +-
 docs/download.html   |   45 ++++++++++++++++++--
 docs/footer.html     |   24 ++--------
 docs/git.html        |    3 +-
 docs/header.html     |  104 +++++++++++++++++++--------------------------
 docs/images/logo.png |  Bin 129459 -> 117499 bytes
 docs/index.html      |   34 +++++++++++++++-
 docs/lists.html      |   40 ------------------
 docs/news.html       |  113 +++++++++++++++++++++++++-------------------------
 docs/sponsors.html   |    2 +-
 docs/stylesheet.css  |   75 ---------------------------------
 docs/support.html    |   45 ++++++++++++++++++++
 15 files changed, 268 insertions(+), 318 deletions(-)

diff --git a/docs/about.html b/docs/about.html
index ae409fc..c2e963a 100644
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
+  <img src="images/menuconfig.png" width="340" height="220" alt="Buildroot menuconfig" border="0">
 </div>
 
 <p>Buildroot is a set of Makefiles and patches that makes it easy to
@@ -60,5 +52,4 @@ cross-compilation process.</p>
 GENERAL PUBLIC LICENSE V2 (Or later)</a>. Stable releases are
 delivered every three months.</p>
 
-
 <!--#include file="footer.html" -->
diff --git a/docs/contribute.html b/docs/contribute.html
new file mode 100644
index 0000000..1a2042d
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
+<h3>Autobuilders</h3>
+
+The <a href="http://autobuild.buildroot.org/">Autobuilders</a> are used to test
+Buildroot with a lot of differents settings (toolchains, various packages, etc)
+on all the supported platforms.
+
+<p>But despite our best effort, sometimes it fails.</p>
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
+<a href="http://patchwork.ozlabs.org/project/buildroot/list/">Patchwork</a>
+is a patch tracking system, if you submit a patch, it will appear here.
+
+<p>You can have a look at a patch that interests you and test it on your machine,
+if it succeeds, you can send a <a
+  href="http://buildroot.org/downloads/manual/manual.html#_reviewing_testing_patches">"Tested-by"</a>,
+if it fails, you can also send a mail on the <a
+  href="http://buildroot.org/downloads/manual/manual.html#_mailing_list">mailing
+  list</a> and report what has happened to you.</p>
+
+<!--#include file="footer.html" -->
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
index bae86df..828b49c 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -1,8 +1,6 @@
 <!--#include file="header.html" -->
 
-
-
-<h3>Download</h3>
+<h2>Download</h2>
 
 <p>
 
@@ -43,8 +41,45 @@ follow development, but cannot or do not wish to use Git.
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
+inclusion by posting them to the buildroot mailing list.
+
 <!--#include file="footer.html" -->
diff --git a/docs/footer.html b/docs/footer.html
index d3b239b..0a555cc 100644
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
-	The Buildroot developers <A HREF="mailto:buildroot@buildroot.org">buildroot at buildroot.org</A><BR>
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
index 0c99251..ce86e16 100644
--- a/docs/git.html
+++ b/docs/git.html
@@ -37,8 +37,7 @@ git pull
 
 Because you've only been granted anonymous access to the tree, you won't be
 able to push your changes to the repo. Changes can instead be submitted for
-inclusion by posting them to the buildroot mailing list or to the <a
-href="https://bugs.uclibc.org/">Bug and Patch Tracking System</a>.
+inclusion by posting them to the buildroot mailing list.
 
 <!--#include file="footer.html" -->
 
diff --git a/docs/header.html b/docs/header.html
index 625c079..f64869f 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -1,67 +1,51 @@
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
-    <br><a href="https://plus.google.com/100084591154899263420?prsrc=3" rel="publisher" target="_top" style="text-decoration:none;">
-      <img src="https://ssl.gstatic.com/images/icons/gplus-32.png" alt="Google+" style="border:0;width:32px;height:32px;"/>
-    </a>
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
 
diff --git a/docs/images/logo.png b/docs/images/logo.png
index 9286c18..2db743b 100644
Binary files a/docs/images/logo.png and b/docs/images/logo.png differ
diff --git a/docs/index.html b/docs/index.html
index 82d5792..a569bee 100644
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
+    <h2>Recent commits</h2>
+  </div>
+  <div class="span6" id="mailing-list-activity">
+    <h2>Recent discussions</h2>
+  </div>
+</div>
+
+<!--#include file="footer.html" -->
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
index 9efca65..56d7f1d 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -1,10 +1,11 @@
 <!--#include file="header.html" -->
 
-<h3>News</h3>
+<h2>News</h2>
 
 <p>
 
 <ul>
+
   <li><b>27 February 2014 -- 2014.02 released</b>
 
     <p>The stable 2014.02 release is out - Thanks to everyone
@@ -50,7 +51,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2014.02-rc1.tar.bz2">2014.02-rc1
     release candidate</a>, and report any problems found to the
-    <a href="lists.html">mailing list</a> or
+    <a href="support.html">mailing list</a> or
     <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>9 February 2014 -- Report from Buildroot Developers Meeting</b>
@@ -107,7 +108,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.11-rc3.tar.bz2">2013.11-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>18 November 2013 -- 2013.11-rc2 released</b>
@@ -120,7 +121,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.11-rc2.tar.bz2">2013.11-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>13 November 2013 -- Announcement of the next Buildroot Developer Days</b>
@@ -159,7 +160,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.11-rc1.tar.bz2">2013.11-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>11 November 2013 -- Report from Buildroot Developers Meeting</b>
@@ -218,7 +219,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.08-rc3.tar.bz2">2013.08-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>16 August 2013 -- 2013.08-rc2 released</b>
@@ -231,7 +232,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.08-rc2.tar.bz2">2013.08-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>5 August 2013 -- 2013.08-rc1 released</b>
@@ -244,7 +245,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.08-rc1.tar.bz2">2013.08-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>31 May 2013 -- 2013.05 released</b>
@@ -267,7 +268,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.05-rc3.tar.bz2">2013.05-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>15 May 2013 -- 2013.05-rc2 released</b>
@@ -280,7 +281,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.05-rc2.tar.bz2">2013.05-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>8 May 2013 -- 2013.05-rc1 released</b>
@@ -294,7 +295,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.05-rc1.tar.bz2">2013.05-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>28 February 2013 -- 2013.02 released</b>
@@ -316,7 +317,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.02-rc3.tar.bz2">2013.02-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>19 February 2013 -- 2013.02-rc2 released</b>
@@ -329,7 +330,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.02-rc2.tar.bz2">2013.02-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>10 February 2013 -- 2013.02-rc1 released</b>
@@ -343,7 +344,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.02-rc1.tar.bz2">2013.02-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>10 February 2013 -- Report from Buildroot Developers Meeting</b>
@@ -404,7 +405,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.11-rc2.tar.bz2">2012.11-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>17 November 2012 -- 2012.11-rc1 released</b>
@@ -418,7 +419,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.11-rc1.tar.bz2">2012.11-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>17 November 2012 -- Buildroot Developer Day</b>
@@ -454,7 +455,7 @@
      <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
      <a href="/downloads/buildroot-2012.08-rc3.tar.bz2">2012.08-rc3
      release candidate</a>, and report any problems found to the <a
-     href="lists.html">mailing list</a> or <a
+     href="support.html">mailing list</a> or <a
      href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
    <li><b>15 August 2012 -- 2012.08-rc2 released</b>
@@ -467,7 +468,7 @@
      <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
      <a href="/downloads/buildroot-2012.08-rc2.tar.bz2">2012.08-rc2
      release candidate</a>, and report any problems found to the <a
-     href="lists.html">mailing list</a> or <a
+     href="support.html">mailing list</a> or <a
      href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
    <li><b>1 August 2012 -- 2012.08-rc1 released</b>
@@ -480,7 +481,7 @@
      <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
      <a href="/downloads/buildroot-2012.08-rc1.tar.bz2">2012.08-rc1
      release candidate</a>, and report any problems found to the <a
-     href="lists.html">mailing list</a> or <a
+     href="support.html">mailing list</a> or <a
      href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>22 July 2012 -- Buildroot Developer Day</b>
@@ -518,7 +519,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.05-rc3.tar.bz2">2012.05-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>18 May 2012 -- 2012.05-rc2 released</b>
@@ -531,7 +532,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.05-rc2.tar.bz2">2012.05-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>10 May 2012 -- 2012.05-rc1 released</b>
@@ -545,7 +546,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.05-rc1.tar.bz2">2012.05-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>20 April 2012 -- Autobuilder Results Online</b>
@@ -582,7 +583,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.02-rc3.tar.bz2">2012.02-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>19 February 2012 -- 2012.02-rc2 released</b>
@@ -595,7 +596,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.02-rc2.tar.bz2">2012.02-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>12 February 2012 -- 2012.02-rc1 released</b>
@@ -609,7 +610,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.02-rc1.tar.bz2">2012.02-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>31 January 2012 -- Buildroot Developer Day</b>
@@ -640,7 +641,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.11-rc3.tar.bz2">2011.11-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>18 November 2011 -- 2011.11-rc2 released</b>
@@ -653,7 +654,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.11-rc2.tar.bz2">2011.11-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>11 November 2011 -- 2011.11-rc1 released</b>
@@ -667,7 +668,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.11-rc1.tar.bz2">2011.11-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>31 August 2011 -- 2011.08 released</b>
@@ -688,7 +689,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.08-rc2.tar.bz2">2011.08-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>4 August 2011 -- 2011.08-rc1 released</b>
@@ -702,7 +703,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.08-rc1.tar.bz2">2011.08-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>27 May 2011 -- 2011.05 released</b>
@@ -722,7 +723,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.05-rc2.tar.bz2">2011.05-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>18 May 2011 -- 2011.05-rc1 released</b>
@@ -736,7 +737,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.05-rc1.tar.bz2">2011.05-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>28 February 2011 -- 2011.02 released</b>
@@ -758,7 +759,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.02-rc2.tar.bz2">2011.02-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>14 February 2011 -- 2011.02-rc1 released</b>
@@ -772,7 +773,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.02-rc1.tar.bz2">2011.02-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>30 November 2010 -- 2010.11 released</b>
@@ -794,7 +795,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.11-rc2.tar.bz2">2010.11-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>8 November 2010 -- 2010.11-rc1 released</b>
@@ -808,7 +809,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.11-rc1.tar.bz2">2010.11-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>28 September 2010 - Buildroot Developer Day</b>
@@ -844,7 +845,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.08-rc2.tar.bz2">2010.08-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
     This is very much expected to be the final release
@@ -861,7 +862,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.08-rc1.tar.bz2">2010.08-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>30 May 2010 -- 2010.05 released</b>
@@ -883,7 +884,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.05-rc3.tar.bz2">2010.05-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>11 May 2010 -- 2010.05-rc2 released</b>
@@ -894,7 +895,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.05-rc2.tar.bz2">2010.05-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>3 May 2010 -- 2010.05-rc1 released</b>
@@ -907,7 +908,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.05-rc1.tar.bz2">2010.05-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>2 May 2010 - FOSDEM slides online</b>
@@ -936,7 +937,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.02-rc2.tar.bz2">2010.02-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>9 February 2010 -- 2010.02-rc1 released</b>
@@ -949,7 +950,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.02-rc1.tar.bz2">2010.02-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>1 December 2009 -- 2009.11 released</b>
@@ -971,7 +972,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.11-rc2.tar.bz2">2009.11-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>23 November 2009 -- 2009.11-rc1 released</b>
@@ -984,7 +985,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.11-rc1.tar.bz2">2009.11-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>7 September 2009 -- First Buildroot Developer Day</b>
@@ -1026,7 +1027,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.08-rc3.tar.bz2">2009.08-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>6 August 2009 -- 2009.08-rc2 released</b>
@@ -1038,7 +1039,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.08-rc2.tar.bz2">2009.08-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>2 August 2009 -- 2009.08-rc1 released</b>
@@ -1051,7 +1052,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.08-rc1.tar.bz2">2009.08-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>1 June 2009 -- 2009.05 released</b>
@@ -1074,7 +1075,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.05-rc3.tar.bz2">2009.05-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>19 May 2009 -- 2009.05-rc2 released</b>
@@ -1087,7 +1088,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.05-rc2.tar.bz2">2009.05-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>14 May 2009 -- Buildroot.org</b>
@@ -1109,7 +1110,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.05-rc1.tar.bz2">2009.05-rc1
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>3 May 2009 -- Moved to git</b>
@@ -1149,7 +1150,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.02-rc4.tar.bz2">2009.02-rc4
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>31 January 2009 -- 2009.02-rc3 released</b>
@@ -1160,7 +1161,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.02-rc3.tar.bz2">2009.02-rc3
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>23 January 2009 -- 2009.02-rc2 released</b>
@@ -1170,7 +1171,7 @@
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2009.02-rc2.tar.bz2">2009.02-rc2
     release candidate</a>, and report any problems found to the <a
-    href="lists.html">mailing list</a> or <a
+    href="support.html">mailing list</a> or <a
     href="https://bugs.uclibc.org">bug tracker</a>.</p>
 
   <li><b>16 January 2009 -- Release candidate and new maintainer</b>
@@ -1180,13 +1181,13 @@
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
