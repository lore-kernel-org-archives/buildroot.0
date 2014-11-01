From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 14:37:51 +0100
Subject: [Buildroot] [git commit] docs: responsive web design website
Message-ID: <20141101133814.9AC88B2779@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da9ab5e2905723415157cfa8b0994d74a91d6098
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch migrate the layout to a responsive web design one.

* Fixing the layout of all pages to be fully responsive
* Adding panels around "Recent commints" and "Recent discussion"
* Adding fonts for glyphs in buttons

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/about.html                              |   13 ++-
 docs/contribute.html                         |    6 +
 docs/css/buildroot.css                       |   14 ++-
 docs/docs.html                               |    6 +
 docs/download.html                           |    6 +
 docs/fonts/glyphicons-halflings-regular.woff |  Bin 0 -> 23320 bytes
 docs/footer.html                             |    2 +-
 docs/git.html                                |    5 +
 docs/header.html                             |   36 +++--
 docs/index.html                              |   55 +++++---
 docs/js/buildroot.js                         |   11 +-
 docs/news.html                               |    6 +
 docs/sponsors.html                           |  207 +++++++++++++-------------
 docs/support.html                            |    6 +
 14 files changed, 221 insertions(+), 152 deletions(-)

diff --git a/docs/about.html b/docs/about.html
index c2e963a..5d7cee3 100644
--- a/docs/about.html
+++ b/docs/about.html
@@ -1,8 +1,12 @@
 <!--#include file="header.html" -->
 
-<div align="center">
-  <img src="images/menuconfig.png" width="340" height="220" alt="Buildroot menuconfig" border="0">
-</div>
+<div class="row">
+  <div class="col-sm-6 col-sm-offset-3" style="padding-bottom:10px">
+    <img class="center-block" src="images/menuconfig.png"
+    style="max-width:100%;"
+    alt="Buildroot menuconfig" border="0">
+  </div>
+<div class="col-sm-10 col-sm-offset-1">
 
 <p>Buildroot is a set of Makefiles and patches that makes it easy to
 generate a complete embedded Linux system. Buildroot can generate any
@@ -52,4 +56,7 @@ cross-compilation process.</p>
 GENERAL PUBLIC LICENSE V2 (Or later)</a>. Stable releases are
 delivered every three months.</p>
 
+</div><!--/.col-sm-10 -->
+</div><!--/.row -->
+
 <!--#include file="footer.html" -->
diff --git a/docs/contribute.html b/docs/contribute.html
index 91959f8..17ed26f 100644
--- a/docs/contribute.html
+++ b/docs/contribute.html
@@ -1,5 +1,8 @@
 <!--#include file="header.html" -->
 
+<div class="row">
+<div class="col-sm-10 col-sm-offset-1">
+
 <h2>Contribute</h2>
 
 <p>Buildroot is an open source project and you are very welcome to contribute to
@@ -29,4 +32,7 @@ Contributing to buildroot</a> chapter in the Buildroot manual. Thanks for your h
 <p>If you need any support yourself, have a look at <a href="./support.html">
 Support</a>.</p>
 
+</div><!--/.col-sm-10 -->
+</div><!--/.row -->
+
 <!--#include file="footer.html" -->
diff --git a/docs/css/buildroot.css b/docs/css/buildroot.css
index 09db24b..7138abc 100644
--- a/docs/css/buildroot.css
+++ b/docs/css/buildroot.css
@@ -14,23 +14,33 @@ body {
 
 div.sponsor-main {
     background: #eeeeee;
-    padding: 2em;
+    padding-top: 2em;
+    padding-bottom: 2em;
 }
 
 div.sponsor {
-    background: #eeeeee;
     padding: 0.5em;
     height: 12em;
     display: table !important;
 }
 
 div.sponsor-description {
+    background: #eeeeee;
     display: table-cell;
     vertical-align: middle;
     text-align: center;
 }
 
 div.sponsor-description img {
+    max-width: 99%;
     height: 4em;
     margin-bottom: 1em;
 }
+
+div.panel-body p {
+    text-overflow: ellipsis;
+    width: 95%;
+    white-space: nowrap;
+    overflow: hidden;
+    height: 1.5em;
+}
diff --git a/docs/docs.html b/docs/docs.html
index 9ddc059..c44ad8b 100644
--- a/docs/docs.html
+++ b/docs/docs.html
@@ -1,5 +1,8 @@
 <!--#include file="header.html" -->
 
+<div class="row">
+<div class="col-sm-10 col-sm-offset-1">
+
 <h2>Documentation</h2>
 
 <p>The Buildroot user manual is where you want to start reading if you
@@ -41,5 +44,8 @@ help:</p>
 
 </ul>
 
+</div><!--/.col-sm-10 -->
+</div><!--/.row -->
+
 <!--#include file="footer.html" -->
 
diff --git a/docs/download.html b/docs/download.html
index 88efbe7..33da838 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -1,5 +1,8 @@
 <!--#include file="header.html" -->
 
+<div class="row">
+<div class="col-sm-10 col-sm-offset-1">
+
 <h2>Download</h2>
 
 <p>
@@ -83,4 +86,7 @@ Because you've only been granted anonymous access to the tree, you won't be
 able to push your changes to the repo. Changes can instead be submitted for
 inclusion by posting them to the buildroot mailing list.
 
+</div><!--/.col-sm-10 -->
+</div><!--/.row -->
+
 <!--#include file="footer.html" -->
diff --git a/docs/fonts/glyphicons-halflings-regular.woff b/docs/fonts/glyphicons-halflings-regular.woff
new file mode 100644
index 0000000..8c54182
Binary files /dev/null and b/docs/fonts/glyphicons-halflings-regular.woff differ
diff --git a/docs/footer.html b/docs/footer.html
index 0a555cc..9f7194f 100644
--- a/docs/footer.html
+++ b/docs/footer.html
@@ -1,5 +1,5 @@
     </div> <!-- /container -->
-    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
+    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
     <script type="text/javascript" src="js/bootstrap.min.js"></script>
     <script type="text/javascript" src="https://www.google.com/jsapi"></script>
     <script type="text/javascript" src="js/buildroot.js"></script>
diff --git a/docs/git.html b/docs/git.html
index ce86e16..8903975 100644
--- a/docs/git.html
+++ b/docs/git.html
@@ -1,5 +1,7 @@
 <!--#include file="header.html" -->
 
+<div class="row">
+<div class="col-sm-10 col-sm-offset-1">
 
 <h3>Git Access</h3>
 
@@ -39,5 +41,8 @@ Because you've only been granted anonymous access to the tree, you won't be
 able to push your changes to the repo. Changes can instead be submitted for
 inclusion by posting them to the buildroot mailing list.
 
+</div><!--/.col-sm-10 -->
+</div><!--/.row -->
+
 <!--#include file="footer.html" -->
 
diff --git a/docs/header.html b/docs/header.html
index f37759e..98f6ec5 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -3,7 +3,7 @@
   <head>
     <meta charset="utf-8">
     <title>Buildroot: making embedded Linux easy</title>
-    <meta name="viewport" content="width=device-width, initial-scale=1.0">
+    <meta name="viewport" content="width=device-width, initial-scale=1">
     <meta name="author" content="The Buildroot developers">
     <link rel="shortcut icon" href="favicon.ico">
     <link href="css/bootstrap.min.css" rel="stylesheet">
@@ -14,21 +14,24 @@
 
     <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
     <!--[if lt IE 9]>
-	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
-	<![endif]-->
+    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
+    <![endif]-->
   </head>
   <body>
-    <div class="navbar navbar-fixed-top">
-      <div class="navbar-inner">
-        <div class="container">
-          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
-            <span class="icon-bar"></span>
-            <span class="icon-bar"></span>
-            <span class="icon-bar"></span>
-          </a>
-          <a class="brand" href="/">Buildroot</a>
-          <div class="nav-collapse">
-            <ul class="nav">
+    <nav class="navbar navbar-default navbar-fixed-top">
+      <div class="row">
+        <div class="col-sm-10 col-sm-offset-1">
+          <div class="navbar-header">
+            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#buildroot-navbar-collapse-1">
+              <span class="sr-only">Toggle navigation</span>
+              <span class="icon-bar"></span>
+              <span class="icon-bar"></span>
+              <span class="icon-bar"></span>
+            </button>
+            <a class="navbar-brand" href="/">Buildroot</a>
+          </div>
+          <div class="collapse navbar-collapse" id="buildroot-navbar-collapse-1">
+            <ul class="nav navbar-nav">
               <li><a href="/news.html">News</a></li>
               <li><a href="/about.html">About</a></li>
               <li><a href="/download.html">Download</a></li>
@@ -42,6 +45,5 @@
           </div><!--/.nav-collapse -->
         </div>
       </div>
-    </div>
-    <div class="container">
-
+    </nav>
+    <div class="container-fluid">
diff --git a/docs/index.html b/docs/index.html
index f5c0ea7..36075bc 100644
--- a/docs/index.html
+++ b/docs/index.html
@@ -1,33 +1,46 @@
 <!--#include file="header.html" -->
-
-<div class="hero-unit">
-  <div class="row-fluid">
-    <img src="images/logo.png" height="170" width="170" style="float: right;"
-        alt="Buildroot logo" />
-    <div class="span8">
-      <h1>Buildroot<br/><small>Making Embedded Linux Easy</small></h1>
-      <p>Buildroot is a simple, efficient and easy-to-use tool to generate
-      embedded Linux systems through cross-compilation.</p>
-    </div>
-    <div class="button_column pull-right">
-      <div class="btn-group btn-group-justified">
-        <div class="btn-group">
-          <a class="btn btn-primary btn-large" href="/about.html">Learn more &raquo;</a>
+<div class="row">
+  <div class="container" style="width:100%">
+    <div class="col-sm-10 col-sm-offset-1 jumbotron">
+      <div class="row">
+        <div class="col-sm-9">
+          <h1>Buildroot<br/><small>Making Embedded Linux Easy</small></h1>
+          <p>Buildroot is a simple, efficient and easy-to-use tool to generate
+          embedded Linux systems through cross-compilation.</p>
         </div>
-        <div class="btn-group">
-          <a class="btn btn-primary btn-large" href="/download.html">Download &raquo;</a>
+        <div class="col-sm-3">
+          <img src="images/logo.png" class="center-block" style="width:170px; heigth:170px;"
+          alt="Buildroot logo" />
+        </div>
+      </div>
+      <div class="row">
+        <div class="col-sm-offset-5 col-sm-7">
+          <div class="col-sm-6" style="margin-top:1em; padding-left:0px;">
+          <a class="btn btn-primary btn-lg" style="width:100%;" href="/about.html"><span class="glyphicon glyphicon-info-sign"></span> Learn more ??</a>
+          </div>
+          <div class="col-sm-6" style="margin-top:1em; padding-left:0px;">
+          <a class="btn btn-primary btn-lg" style="width:100%;"href="/download.html"><span class="glyphicon glyphicon-cloud-download"></span> Download ??</a>
+          </div>
         </div>
       </div>
     </div>
   </div>
 </div>
 
-<div class="row" style="line-height: 17px;">
-  <div class="span6" id="commit-activity">
-    <a href="http://git.buildroot.net/buildroot"><h2>Recent commits</h2></a>
+<div class="row">
+  <div class="col-sm-5 col-sm-offset-1">
+    <div class="panel panel-default">
+      <div class="panel-body" id="commit-activity">
+        <a href="http://git.buildroot.net/buildroot"><h2>Recent commits</h2></a>
+      </div>
+    </div>
   </div>
-  <div class="span6" id="mailing-list-activity">
-    <a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot"><h2>Recent discussions</h2></a>
+  <div class="col-sm-5" >
+    <div class="panel panel-default" style="min-height: 22em;">
+      <div class="panel-body" id="mailing-list-activity">
+        <a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot"><h2>Recent discussions</h2></a>
+      </div>
+    </div>
   </div>
 </div>
 
diff --git a/docs/js/buildroot.js b/docs/js/buildroot.js
index 55e5eb3..03c3968 100644
--- a/docs/js/buildroot.js
+++ b/docs/js/buildroot.js
@@ -11,17 +11,12 @@ function load_activity(feedurl, divid) {
           if (entry.title.indexOf("git commit") != -1)
             continue;
           loaded += 1;
-          if (loaded >= nb_display)
+          if (loaded > nb_display)
             break;
           var div = document.createElement("p");
           var link = document.createElement("a");
           var d = new Date(entry.publishedDate);
           var data = '[' + d.toLocaleDateString() + '] ' + entry.title
-          // Ensure all titles are the same length
-          if (data.length > 60) {
-            data = data.substr(0, 57)
-            data += '...'
-          }
           var text = document.createTextNode(data);
           link.appendChild(text);
           link.title = entry.title;
@@ -29,6 +24,10 @@ function load_activity(feedurl, divid) {
           div.appendChild(link);
           container.appendChild(div);
         }
+        var empty = nb_display - loaded;
+        for (var i = 0; i < empty; i++) {
+          container.appendChild(document.createElement("p"));
+        }
         console.log(loaded);
       }
     });
diff --git a/docs/news.html b/docs/news.html
index ee2e9c4..2f1b168 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -1,5 +1,8 @@
 <!--#include file="header.html" -->
 
+<div class="row">
+<div class="col-sm-10 col-sm-offset-1">
+
 <h2>News</h2>
 
 <p>
@@ -1314,5 +1317,8 @@
 
 </ul>
 
+</div><!--/.col-sm-10 -->
+</div><!--/.row -->
+
 <!--#include file="footer.html" -->
 
diff --git a/docs/sponsors.html b/docs/sponsors.html
index a1eb0bd..4c47e5c 100644
--- a/docs/sponsors.html
+++ b/docs/sponsors.html
@@ -1,146 +1,149 @@
 <!--#include file="header.html" -->
 
-<h2>Sponsors</h2>
+<div class="row"><!-- current sponsor row -->
+  <div class="col-sm-10 col-sm-offset-1">
+    <h2>Sponsors</h2>
 
-<h3>Current sponsors</h3>
+    <h3>Current sponsors</h3>
+  </div>
+</div>
 
-<div class="container">
-  <div class="row-fluid">
-    <div class="span12 sponsor-main">
-      <div class="row-fluid">
-	<div class="span4">
-	  <a href="http://mind.be">
-	    <img src="images/mind-logo.png"/>
-	  </a>
-	</div>
-	<div class="span8">
-	  <p><a href="http://www.mind.be">Mind</a> is the Embedded
-	  Software division of Essensium, which provides consultancy
-	  and services specifically in the field of Linux and Open
-	    Source SW for Embedded Systems.</p>
+<div class="row"><!-- main sponsor row -->
+  <div class="col-sm-10 col-sm-offset-1">
+    <div class="col-sm-12 sponsor-main">
+      <div class="col-sm-4">
+        <a href="http://mind.be">
+          <img src="images/mind-logo.png"/>
+        </a>
+      </div>
+      <div class="col-sm-8">
+        <p><a href="http://www.mind.be">Mind</a> is the Embedded
+        Software division of Essensium, which provides consultancy
+        and services specifically in the field of Linux and Open
+        Source SW for Embedded Systems.</p>
 
-	  <p>Mind is sponsoring
-	  the <a href="http://elinux.org/Buildroot:DeveloperDaysELCE2014">Buildroot
-	  Developers Meeting</a> colocated with the Embedded Linux
-	  Conference Europe, taking place on October 11-12 2014 in
-	  D??sseldorf, Germany. Mind is helping with the logistics of
-	  the meeting room, as well as the Saturday dinner for the
-	  participants.</p>
-	</div>
+        <p>Mind is sponsoring
+        the <a href="http://elinux.org/Buildroot:DeveloperDaysELCE2014">Buildroot
+        Developers Meeting</a> colocated with the Embedded Linux
+        Conference Europe, taking place on October 11-12 2014 in
+        D??sseldorf, Germany. Mind is helping with the logistics of
+        the meeting room, as well as the Saturday dinner for the
+        participants.</p>
       </div>
     </div>
   </div>
-</div>
+</div><!-- /main sponsor row -->
 
-<h3>Past sponsors</h3>
+<div class="row"><!-- past sponsor row -->
+  <div class="col-sm-10 col-sm-offset-1">
+    <h3>Past sponsors</h3>
 
-<p>Throughout its history, the Buildroot project has been sponsored by
-  various companies, that we would like to thank below.</p>
+    <p>Throughout its history, the Buildroot project has been sponsored by
+    various companies, that we would like to thank below.</p>
+  </div>
+</div><!--/past sponsor row -->
 
-<div class="container">
-  <div class="row-fluid">
-    <div class="span4 sponsor">
+<div class="row"><!-- past sponsors row 1-->
+  <div class="col-sm-10 col-sm-offset-1">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://www.mind.be">
-	  <img src="images/mind-logo.png" alt="Mind" title="Mind"/>
-	</a><br/>
-	<a href="http://www.mind.be">Mind</a> sponsored the dinner of
-	the FOSDEM 2014 Developers Meeting.
+        <a href="http://www.mind.be">
+        <img src="images/mind-logo.png" alt="Mind" title="Mind"/>
+        </a><br/>
+        <a href="http://www.mind.be">Mind</a> sponsored the dinner of
+        the FOSDEM 2014 Developers Meeting.
       </div>
     </div>
-    <div class="span4 sponsor">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://www.google.com">
-	  <img src="images/google-logo.png" alt="Google" title="Google"/>
-	</a>
-	<br/>
-	<a href="http://www.google.com">Google</a> provided the
-	logistics for the FOSDEM 2013 and FOSDEM 2014 Developer Days in
-	Brussels, Belgium.
+        <a href="http://www.google.com">
+        <img src="images/google-logo.png" alt="Google" title="Google"/>
+        </a><br/>
+        <a href="http://www.google.com">Google</a> provided the
+        logistics for the FOSDEM 2013 and FOSDEM 2014 Developer Days in
+        Brussels, Belgium.
       </div>
     </div>
-    <div class="span4 sponsor">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://www.imgtec.com/">
-	  <img src="images/imgtec-logo.png" alt="Imagination Technologies" title="Imagination Technologies"/>
-	</a>
-	<br/>
-	<a href="http://www.imgtec.com/">Imagination Technologies</a>
-	  sponsored the meeting room and dinner of the ELCE 2013
-	Developer Days in Edinburgh, UK.
+        <a href="http://www.imgtec.com/">
+        <img src="images/imgtec-logo.png" alt="Imagination Technologies" title="Imagination Technologies"/>
+        </a><br/>
+        <a href="http://www.imgtec.com/">Imagination Technologies</a>
+        sponsored the meeting room and dinner of the ELCE 2013
+        Developer Days in Edinburgh, UK.
       </div>
     </div>
   </div>
+</div><!--/past sponsors row 1-->
 
-  <div class="row-fluid" style="margin-top: 1em;">
-    <div class="span4 sponsor">
+<div class="row"><!-- past sponsors row 2-->
+  <div class="col-sm-10 col-sm-offset-1">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://circuitco.com/">
-	  <img src="images/circuitco-logo.png" alt="CircuitCo" title="CircuitCo"/>
-	</a>
-	<br/>
-	<a href="http://circuitco.com/">CircuitCo</a> sponsored
-	  several development boards for the Google Summer of Code
-	  2013 project on Buildroot.
+        <a href="http://circuitco.com/">
+        <img src="images/circuitco-logo.png" alt="CircuitCo" title="CircuitCo"/>
+        </a><br/>
+        <a href="http://circuitco.com/">CircuitCo</a> sponsored
+        several development boards for the Google Summer of Code
+        2013 project on Buildroot.
       </div>
     </div>
-    <div class="span4 sponsor">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://boundarydevices.com/">
-	  <img src="images/boundary-devices-logo.png" alt="Boundary Devices" title="Boundary Devices"/>
-	</a>
-	<br/>
-	<a href="http://boundarydevices.com/">BoundaryDevices</a>
-	sponsored an i.MX6 development board for the Google Summer of
-	Code 2013 project on Buildroot.
+        <a href="http://boundarydevices.com/">
+        <img src="images/boundary-devices-logo.png" alt="Boundary Devices" title="Boundary Devices"/>
+        </a><br/>
+        <a href="http://boundarydevices.com/">BoundaryDevices</a>
+        sponsored an i.MX6 development board for the Google Summer of
+        Code 2013 project on Buildroot.
       </div>
     </div>
-    <div class="span4 sponsor">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://www.fluendo.com/">
-	  <img src="images/fluendo-logo.png" alt="Fluendo" title="Fluendo"/>
-	</a>
-	<br/>
-	<a href="http://www.fluendo.com/">Fluendo</a> sponsored the
-	meeting room for the ELCE 2012 Developer Days in Barcelona
-	Spain.
+        <a href="http://www.fluendo.com/">
+        <img src="images/fluendo-logo.png" alt="Fluendo" title="Fluendo"/>
+        </a><br/>
+        <a href="http://www.fluendo.com/">Fluendo</a> sponsored the
+        meeting room for the ELCE 2012 Developer Days in Barcelona
+        Spain.
       </div>
     </div>
   </div>
-  <div class="row-fluid" style="margin-top: 1em;">
-    <div class="span4 sponsor">
+</div><!--/past sponsors row 2-->
+
+<div class="row"><!-- past sponsors row 3-->
+  <div class="col-sm-10 col-sm-offset-1">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://www.synopsys.com">
-	  <img src="images/synopsys-logo.png" alt="Synopsys" title="Synopsys"/>
-	</a>
-	<br/>
-	<a href="http://www.synopsys.com">Synopsys</a> sponsored the
-	  dinner for the ELCE 2012 Developer Days in Barcelona, Spain.
+        <a href="http://www.synopsys.com">
+        <img src="images/synopsys-logo.png" alt="Synopsys" title="Synopsys"/>
+        </a><br/>
+        <a href="http://www.synopsys.com">Synopsys</a> sponsored the
+        dinner for the ELCE 2012 Developer Days in Barcelona, Spain.
       </div>
     </div>
-    <div class="span4 sponsor">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://www.calao-systems.com/">
-	  <img src="images/calao-logo.png"/ alt="Calao Systems" title="Calao Systems">
-	</a>
-	<br/>
-	<a href="http://www.calao-systems.com/">Calao Systems</a>
-	provided a a meeting room for the ELCE 2009 Developer Days
-	in Grenoble, France.
+        <a href="http://www.calao-systems.com/">
+        <img src="images/calao-logo.png"/ alt="Calao Systems" title="Calao Systems">
+        </a><br/>
+        <a href="http://www.calao-systems.com/">Calao Systems</a>
+        provided a a meeting room for the ELCE 2009 Developer Days
+        in Grenoble, France.
       </div>
     </div>
-    <div class="span4 sponsor">
+    <div class="col-xs-12 col-sm-4 sponsor">
       <div class="sponsor-description">
-	<a href="http://www.free-electrons.com">
-	  <img src="images/free-electrons-logo.png" alt="Free Electrons" title="Free Electrons"/>
-	</a>
-	<br/>
-	<a href="http://www.free-electrons.com">Free Electrons</a>
-	sponsored the lunch for the ELCE 2009 Developer Days in
-	Grenoble, France.
+        <a href="http://www.free-electrons.com">
+        <img src="images/free-electrons-logo.png" alt="Free Electrons" title="Free Electrons"/>
+        </a><br/>
+        <a href="http://www.free-electrons.com">Free Electrons</a>
+        sponsored the lunch for the ELCE 2009 Developer Days in
+        Grenoble, France.
       </div>
     </div>
   </div>
-</div>
+</div><!--/past sponsors row 3-->
 
 <!--#include file="footer.html" -->
diff --git a/docs/support.html b/docs/support.html
index 5fa3cde..c49a371 100644
--- a/docs/support.html
+++ b/docs/support.html
@@ -1,5 +1,8 @@
 <!--#include file="header.html" -->
 
+<div class="row">
+<div class="col-sm-10 col-sm-offset-1">
+
 <h2>Support</h2>
 
 <p>You can get support for Buildroot through three main channels:</p>
@@ -42,4 +45,7 @@ participate to find solutions to existing problems.</p>
 
 <p>Note: patches are only accepted through the mailing list.</p>
 
+</div><!--/.col-sm-10 -->
+</div><!--/.row -->
+
 <!--#include file="footer.html" -->
