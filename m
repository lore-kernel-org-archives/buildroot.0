From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri,  4 Dec 2015 08:21:12 +0100
Subject: [Buildroot] [PATCH 2/4] docs/website: html cleaning and indentation
	fixing
In-Reply-To: <1449213674-11333-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1449213674-11333-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1449213674-11333-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Fixing indentation and cleaning with html tidy
* Adding tidy_config.txt containing tidy settings

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/contribute.html |   74 +-
 docs/website/docs.html       |  232 +-
 docs/website/download.html   |  356 +--
 docs/website/footer.html     |   12 +-
 docs/website/header.html     |  120 +-
 docs/website/index.html      |  241 +-
 docs/website/news.html       | 6342 ++++++++++++++++++++++++------------------
 docs/website/sponsors.html   |  461 +--
 docs/website/support.html    |  187 +-
 docs/website/tidy_config.txt |    5 +
 10 files changed, 4481 insertions(+), 3549 deletions(-)
 create mode 100644 docs/website/tidy_config.txt

diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index da5700c..5e2e159 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -1,43 +1,43 @@
 <!--#include file="header.html" -->
-
 <div class="container">
-<div class="row nh">
-<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
-
-  <div class="panel panel-primary">
-    <div class="panel-heading">Contribute</div>
-    <div class="panel-body">
-      <p>Buildroot is an open source project and you are very welcome to contribute to
-	it.<br />
-	There are many different ways to contribute:</p>
-
-      <ul>
-	<li>Reproducing, analyzing and fixing bugs from our
-	  <a href="https://bugs.buildroot.org/">bug tracker</a></li>
-	<li>Analyzing and fixing <a href="http://autobuild.buildroot.org/">
-	    autobuild failures</a></li>
-	<li>Reviewing and testing patches sent by other developers. See the
-	  <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
-	  </a> or <a href="http://patchwork.ozlabs.org/project/buildroot/list/">
-	    patchwork</a>.</li>
-	<li>Working on items from the
-	  <a href="http://www.elinux.org/Buildroot#Todo_list">TODO list</a></li>
-	<li>Submitting your own patches through the
-	  <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
-	</a></li>
-      </ul>
-
-      <p>For more details on these topics, check out the
-	<a href="http://buildroot.org/manual.html#_contributing_to_buildroot">
-	  Contributing to buildroot</a> chapter in the Buildroot manual. Thanks for your help!</p>
-
-      <p>If you need any support yourself, have a look at <a href="./support.html">
-	  Support</a>.</p>
+  <div class="row nh">
+    <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+      <div class="panel panel-primary">
+        <div class="panel-heading">Contribute</div>
+        <div class="panel-body">
+          <p>Buildroot is an open source project and you are very welcome
+          to contribute to it.
+          <br />There are many different ways to contribute:</p>
+          <ul>
+            <li>Reproducing, analyzing and fixing bugs from our 
+            <a href="https://bugs.buildroot.org/">bug tracker</a></li>
+            <li>Analyzing and fixing 
+            <a href="http://autobuild.buildroot.org/">autobuild
+            failures</a></li>
+            <li>Reviewing and testing patches sent by other developers. See
+            the 
+            <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">
+            mailing list</a>or 
+            <a href="http://patchwork.ozlabs.org/project/buildroot/list/">
+            patchwork</a>.</li>
+            <li>Working on items from the 
+            <a href="http://www.elinux.org/Buildroot#Todo_list">TODO
+            list</a></li>
+            <li>Submitting your own patches through the 
+            <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">
+            mailing list</a></li>
+          </ul>
+          <p>For more details on these topics, check out the 
+          <a href="http://buildroot.org/manual.html#_contributing_to_buildroot">
+          Contributing to buildroot</a>chapter in the Buildroot manual.
+          Thanks for your help!</p>
+          <p>If you need any support yourself, have a look at 
+          <a href="./support.html">Support</a>.</p>
+        </div>
+      </div>
     </div>
+    <!--/.col-sm-10 -->
   </div>
-
-</div><!--/.col-sm-10 -->
-</div><!--/.row -->
+  <!--/.row -->
 </div>
-
 <!--#include file="footer.html" -->
diff --git a/docs/website/docs.html b/docs/website/docs.html
index 4335796..4b86383 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -1,119 +1,129 @@
 <!--#include file="header.html" -->
-
 <div class="container">
-<div class="row nh">
-<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
-
-  <div class="panel panel-primary">
-    <div class="panel-heading">Documentation</div>
-    <div class="panel-body">
-      <p>The Buildroot user manual is where you want to start reading if you
-	wish to understand how Buildroot works, or wish to change/extend/fix
-	things. It is available as:</p>
-
-      <div class="row mt centered">
-	<div class="col-sm-4">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/manual.html"><img src="images/browser.png" width="180" alt="" /></a>
-	      </div>
-	      <div class="back">
-		<a href="/manual.html"><img src="images/browser.png" width="180" alt="" /></a>
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3>HTML <br/>
-	    <a href="/manual.html">Stable</a> |
-	    <a href="http://nightly.buildroot.org/manual.html">Nightly</a>
-	  </h3>
-
-	</div>
-
-	<div class="col-sm-4">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<img src="images/pdf-icon.png" width="180" alt="" />
-	      </div>
-	      <div class="back">
-		<img src="images/pdf-icon.png" width="180" alt="" />
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3>PDF <br/>
-	    <a href="/downloads/manual/manual.pdf">Stable</a> |
-	    <a href="http://nightly.buildroot.org/manual.pdf">Nightly</a>
-	  </h3>
-
-	</div>
-
-	<div class="col-sm-4">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<img src="images/text.png" width="180" alt="" />
-	      </div>
-	      <div class="back">
-		<img src="images/text.png" width="180" alt="" />
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3>ASCII <br/>
-	    <a href="/downloads/manual/manual.text">Stable</a> |
-	    <a href="http://nightly.buildroot.org/manual.text">Nightly</a>
-	  </h3>
-
-	</div>
+  <div class="row nh">
+    <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+      <div class="panel panel-primary">
+        <div class="panel-heading">Documentation</div>
+        <div class="panel-body">
+          <p>The Buildroot user manual is where you want to start reading
+          if you wish to understand how Buildroot works, or wish to
+          change/extend/fix things. It is available as:</p>
+          <div class="row mt centered">
+            <div class="col-sm-4">
+              <div class="flip-container center-block"
+              ontouchstart="this.classList.toggle('hover');">
+                <div class="flipper">
+                  <div class="front">
+                    <a href="/manual.html">
+                      <img src="images/browser.png" width="180" alt="" />
+                    </a>
+                  </div>
+                  <div class="back">
+                    <a href="/manual.html">
+                      <img src="images/browser.png" width="180" alt="" />
+                    </a>
+                  </div>
+                </div>
+              </div>
+              <h3>HTML 
+              <br />
+              <a href="/manual.html">Stable</a>| 
+              <a href="http://nightly.buildroot.org/manual.html">
+              Nightly</a></h3>
+            </div>
+            <div class="col-sm-4">
+              <div class="flip-container center-block"
+              ontouchstart="this.classList.toggle('hover');">
+                <div class="flipper">
+                  <div class="front">
+                    <img src="images/pdf-icon.png" width="180" alt="" />
+                  </div>
+                  <div class="back">
+                    <img src="images/pdf-icon.png" width="180" alt="" />
+                  </div>
+                </div>
+              </div>
+              <h3>PDF 
+              <br />
+              <a href="/downloads/manual/manual.pdf">Stable</a>| 
+              <a href="http://nightly.buildroot.org/manual.pdf">
+              Nightly</a></h3>
+            </div>
+            <div class="col-sm-4">
+              <div class="flip-container center-block"
+              ontouchstart="this.classList.toggle('hover');">
+                <div class="flipper">
+                  <div class="front">
+                    <img src="images/text.png" width="180" alt="" />
+                  </div>
+                  <div class="back">
+                    <img src="images/text.png" width="180" alt="" />
+                  </div>
+                </div>
+              </div>
+              <h3>ASCII 
+              <br />
+              <a href="/downloads/manual/manual.text">Stable</a>| 
+              <a href="http://nightly.buildroot.org/manual.text">
+              Nightly</a></h3>
+            </div>
+          </div>
+          <p>If you find any errors (factual, grammatical, whatever) please
+          report them to us.</p>
+        </div>
       </div>
-
-      <p>If you find any errors (factual, grammatical, whatever) please
-	report them to us.</p>
-    </div>
-  </div>
-
-  <div class="panel panel-primary">
-    <div class="panel-heading">Training</div>
-    <div class="panel-body">
-      <p><a href="http://www.free-electrons.com">Free Electrons</a> offers a
-	complete <a href="http://free-electrons.com/training/buildroot/">3-days
-	  training course on Buildroot</a>. They also make the training
-	materials freely available:</p>
-
-      <div class="row">
-	<div class="col-sm-8">
-	  <div class="panel panel-success">
-	    <div class="panel-heading">Slides preview</div>
-	    <div class="panel-body">
-	      <div id="slides" style="width: 100%; padding-bottom: 75%; position: relative">
-		<a href="http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf"><img src="images/buildroot-slides.png" alt="buildroot slides" style="position:absolute; width:100%; height:100%; top:0; left:0;" /></a>
-	      </div>
-	    </div>
-	  </div>
-	</div>
-
-	<div class="col-sm-4">
-	  <div class="panel panel-default	">
-	    <div class="panel-heading">Training materials</div>
-	    <div class="panel-body">
-	      <ul>
-		<li><a href="http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf">slides (PDF)</a></li>
-		<li><a href="http://free-electrons.com/doc/training/buildroot/buildroot-labs.pdf">practical labs (PDF)</a></li>
-		<li><a href="http://free-electrons.com/doc/training/buildroot/buildroot-labs.tar.xz">practical labs data (.tar.xz)</a></li>
-	      </ul>
-	    </div>
-	  </div>
-	</div>
+      <div class="panel panel-primary">
+        <div class="panel-heading">Training</div>
+        <div class="panel-body">
+          <p>
+          <a href="http://www.free-electrons.com">Free Electrons</a>offers
+          a complete 
+          <a href="http://free-electrons.com/training/buildroot/">3-days
+          training course on Buildroot</a>. They also make the training
+          materials freely available:</p>
+          <div class="row">
+            <div class="col-sm-8">
+              <div class="panel panel-success">
+                <div class="panel-heading">Slides preview</div>
+                <div class="panel-body">
+                  <div id="slides"
+                  style="width: 100%; padding-bottom: 75%; position: relative">
+
+                    <a href="http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf">
+
+                      <img src="images/buildroot-slides.png"
+                      alt="buildroot slides"
+                      style="position:absolute; width:100%; height:100%; top:0; left:0;" />
+                    </a>
+                  </div>
+                </div>
+              </div>
+            </div>
+            <div class="col-sm-4">
+              <div class="panel panel-default">
+                <div class="panel-heading">Training materials</div>
+                <div class="panel-body">
+                  <ul>
+                    <li>
+                      <a href="http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf">
+                      slides (PDF)</a>
+                    </li>
+                    <li>
+                      <a href="http://free-electrons.com/doc/training/buildroot/buildroot-labs.pdf">
+                      practical labs (PDF)</a>
+                    </li>
+                    <li>
+                      <a href="http://free-electrons.com/doc/training/buildroot/buildroot-labs.tar.xz">
+                      practical labs data (.tar.xz)</a>
+                    </li>
+                  </ul>
+                </div>
+              </div>
+            </div>
+          </div>
+        </div>
       </div>
     </div>
   </div>
-
-</div>
-</div>
 </div>
-
 <!--#include file="footer.html" -->
-
diff --git a/docs/website/download.html b/docs/website/download.html
index 19b5362..4ff397d 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -1,184 +1,194 @@
 <!--#include file="header.html" -->
-
 <div class="container">
-<div class="row nh">
-<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
-
-  <div class="panel panel-primary">
-    <div class="panel-heading">Download</div>
-    <div class="panel-body">
-
-      <h3 style="text-align: center;">Latest stable release: <b>2015.11</b></h3>
-
-      <div class="row mt centered">
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2015.11.tar.gz"><img src="images/zip.png" width="180" alt="" /></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2015.11.tar.gz"><img src="images/zip.png" width="180" alt="" /></a>
-	      </div>
-	    </div>
-	  </div>
-	  <h3><a href="/downloads/buildroot-2015.11.tar.gz">buildroot-2015.11.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2015.11.tar.gz.sign">PGP signature</a></p>
-	</div>
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2015.11.tar.bz2"><img src="images/package.png" width="180" alt="" /></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2015.11.tar.bz2"><img src="images/package.png" width="180" alt="" /></a>
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3><a href="/downloads/buildroot-2015.11.tar.bz2">buildroot-2015.11.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2015.11.tar.bz2.sign">PGP signature</a></p>
-	</div>
-      </div>
-<!--
+  <div class="row nh">
+    <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+      <div class="panel panel-primary">
+        <div class="panel-heading">Download</div>
+        <div class="panel-body">
+        <h3 style="text-align: center;">Latest stable release: 
+        <b>2015.11</b></h3>
+        <div class="row mt centered">
+          <div class="col-sm-6">
+            <div class="flip-container center-block"
+            ontouchstart="this.classList.toggle('hover');">
+              <div class="flipper">
+                <div class="front">
+                  <a href="/downloads/buildroot-2015.11.tar.gz">
+                    <img src="images/zip.png" width="180" alt="" />
+                  </a>
+                </div>
+                <div class="back">
+                  <a href="/downloads/buildroot-2015.11.tar.gz">
+                    <img src="images/zip.png" width="180" alt="" />
+                  </a>
+                </div>
+              </div>
+            </div>
+            <h3>
+              <a href="/downloads/buildroot-2015.11.tar.gz">
+              buildroot-2015.11.tar.gz</a>
+            </h3>
+            <p>
+              <a href="/downloads/buildroot-2015.11.tar.gz.sign">PGP
+              signature</a>
+            </p>
+          </div>
+          <div class="col-sm-6">
+            <div class="flip-container center-block"
+            ontouchstart="this.classList.toggle('hover');">
+              <div class="flipper">
+                <div class="front">
+                  <a href="/downloads/buildroot-2015.11.tar.bz2">
+                    <img src="images/package.png" width="180" alt="" />
+                  </a>
+                </div>
+                <div class="back">
+                  <a href="/downloads/buildroot-2015.11.tar.bz2">
+                    <img src="images/package.png" width="180" alt="" />
+                  </a>
+                </div>
+              </div>
+            </div>
+            <h3>
+              <a href="/downloads/buildroot-2015.11.tar.bz2">
+              buildroot-2015.11.tar.bz2</a>
+            </h3>
+            <p>
+              <a href="/downloads/buildroot-2015.11.tar.bz2.sign">PGP
+              signature</a>
+            </p>
+          </div>
+        </div>
+        <!--
       <h3 style="text-align: center;">Latest release candidate: <b>2015.11-rc3</b></h3>
       <div class="row mt centered">
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt="" /></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt="" /></a>
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3><a href="/downloads/buildroot-2015.11-rc3.tar.gz">buildroot-2015.11-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2015.11-rc3.tar.gz.sign">PGP signature</a></p>
-	</div>
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt="" /></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt="" /></a>
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3><a href="/downloads/buildroot-2015.11-rc3.tar.bz2">buildroot-2015.11-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2015.11-rc3.tar.bz2.sign">PGP signature</a></p>
-	</div>
+        <div class="col-sm-6">
+          <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
+            <div class="flipper">
+              <div class="front">
+                <a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt="" /></a>
+              </div>
+              <div class="back">
+                <a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt="" /></a>
+              </div>
+            </div>
+          </div>
+
+          <h3><a href="/downloads/buildroot-2015.11-rc3.tar.gz">buildroot-2015.11-rc3.tar.gz</a></h3>
+          <p><a href="/downloads/buildroot-2015.11-rc3.tar.gz.sign">PGP signature</a></p>
+        </div>
+        <div class="col-sm-6">
+          <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
+            <div class="flipper">
+              <div class="front">
+                <a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt="" /></a>
+              </div>
+              <div class="back">
+                <a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt="" /></a>
+              </div>
+            </div>
+          </div>
+
+          <h3><a href="/downloads/buildroot-2015.11-rc3.tar.bz2">buildroot-2015.11-rc3.tar.bz2</a></h3>
+          <p><a href="/downloads/buildroot-2015.11-rc3.tar.bz2.sign">PGP signature</a></p>
+        </div>
       </div>
 -->
-      This and earlier releases (and their PGP signatures) can always be downloaded from
-      <a href="/downloads/">http://buildroot.net/downloads/</a>.
-    </div>
-  </div>
-
-  <div class="panel panel-primary">
-    <div class="panel-heading">Source code</div>
-    <div class="panel-body">
-
-      <div class="row">
-	<div class="col-sm-7">
-	  <div class="panel panel-success">
-	    <div class="panel-heading">Repository</div>
-	    <div class="panel-body">
-	      <p>The buildroot repository can be browsed online through cgit at
-		<a href="http://git.buildroot.net/buildroot/">http://git.buildroot.net/buildroot</a>.
-		To grab a copy of the repository use</p>
-
-
-	      <div class="input-group" style="width: 100%;">
-		<input class="form-control" style="width: 85%;" id="giturl"
-		       value="git clone git://git.buildroot.net/buildroot" type="text" readonly 	/>
-		<span class="input-group-button">
-		  <button class="btn pull-right" type="button" data-clipboard-target="#giturl"
-			  data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="Copied!">
-		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13" />
-		  </button>
-		</span>
-	      </div><br/>
-
-	      <p>
-		Or if you're behind a firewall blocking git:
-	      </p>
-
-	      <div class="input-group" style="width: 100%;">
-		<input class="form-control" style="width: 85%;" id="giturlhttps"
-		       value="git clone https://git.buildroot.net/buildroot" type="text" readonly></input>
-		<span class="input-group-button">
-		  <button class="btn pull-right" type="button" data-clipboard-target="#giturlhttps"
-			  data-toggle="tooltip" data-placement="bottom" data-trigger="click" title="Copied!">
-		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13" />
-		  </button>
-		</span>
-	      </div><br/>
-
-	      <p>
-
-		Please use the native git protocol if at all possible, as it's a lot
-		more efficient than HTTP.</p>
-
-	      <p>
-
-		If you are not already familiar with using Git, we recommend you visit <a
-											  href="http://git-scm.org">the Git website</a>.</p>
-
-	      <p>
-
-		Once you've checked out a copy of the source tree, you can update your source
-		tree at any time so it is in sync with the latest and greatest by entering your
-		buildroot directory and running the command: </p>
-
-		<pre>
-		  git pull
-		</pre>
-
-		<p>
-			Because you've only been granted anonymous access to the tree, you won't be
-		able to push your changes to the repo. Changes can instead be submitted for
-		inclusion by posting them to the buildroot mailing list.</p>
-	    </div>
-	  </div>
-	</div>
-
-	<div class="col-sm-5">
-	  <div class="panel panel-default	">
-	    <div class="panel-heading">Tarballs</div>
-	    <div class="panel-body">
-	      You can also obtain daily snapshots of the latest Buildroot source tree if you
-	      want to follow development, but cannot or do not wish to use Git.
-
-	      <ul>
-		<li>You can download the
-		  <a href="downloads/snapshots/buildroot-snapshot.tar.bz2">latest snapshot
-		  </a> or view recent <a href="downloads/snapshots/">daily snapshots</a>.
-		</li>
-
-		<li>You can also <a href="http://git.buildroot.net/buildroot">browse the
-		    source tree online</a>.
-		</li>
-	      </ul>
-
-	      <p>
-		Older versions can be downloaded from <a href="/downloads/">the release archive</a>.
-	      </p>
-	    </div>
-	  </div>
-	</div>
+        This and earlier releases (and their PGP signatures) can always be
+        downloaded from 
+        <a href="/downloads/">http://buildroot.net/downloads/</a>.</div>
+      </div>
+      <div class="panel panel-primary">
+        <div class="panel-heading">Source code</div>
+        <div class="panel-body">
+          <div class="row">
+            <div class="col-sm-7">
+              <div class="panel panel-success">
+                <div class="panel-heading">Repository</div>
+                <div class="panel-body">
+                  <p>The buildroot repository can be browsed online through
+                  cgit at 
+                  <a href="http://git.buildroot.net/buildroot/">
+                  http://git.buildroot.net/buildroot</a>. To grab a copy of
+                  the repository use</p>
+                  <div class="input-group" style="width: 100%;">
+                    <input class="form-control" style="width: 85%;"
+                    id="giturl"
+                    value="git clone git://git.buildroot.net/buildroot"
+                    type="text" readonly="readonly" />
+                    <span class="input-group-button">
+                      <button class="btn pull-right" type="button"
+                      data-clipboard-target="#giturl" data-toggle="tooltip"
+                      data-placement="bottom" data-trigger="manual"
+                      title="Copied!">
+                        <img class="clippy" src="images/clippy.svg"
+                        alt="Copy to clipboard" width="13" />
+                      </button>
+                    </span>
+                  </div>
+                  <br />
+                  <p>Or if you're behind a firewall blocking git:</p>
+                  <div class="input-group" style="width: 100%;">
+                    <input class="form-control" style="width: 85%;"
+                    id="giturlhttps"
+                    value="git clone https://git.buildroot.net/buildroot"
+                    type="text" readonly="readonly"></input>
+                    <span class="input-group-button">
+                      <button class="btn pull-right" type="button"
+                      data-clipboard-target="#giturlhttps"
+                      data-toggle="tooltip" data-placement="bottom"
+                      data-trigger="click" title="Copied!">
+                        <img class="clippy" src="images/clippy.svg"
+                        alt="Copy to clipboard" width="13" />
+                      </button>
+                    </span>
+                  </div>
+                  <br />
+                  <p>Please use the native git protocol if at all possible,
+                  as it's a lot more efficient than HTTP.</p>
+                  <p>If you are not already familiar with using Git, we
+                  recommend you visit 
+                  <a href="http://git-scm.org">the Git website</a>.</p>
+                  <p>Once you've checked out a copy of the source tree, you
+                  can update your source tree at any time so it is in sync
+                  with the latest and greatest by entering your buildroot
+                  directory and running the command:</p>
+                  <pre>
+                  git pull
+                
+</pre>
+                  <p>Because you've only been granted anonymous access to
+                  the tree, you won't be able to push your changes to the
+                  repo. Changes can instead be submitted for inclusion by
+                  posting them to the buildroot mailing list.</p>
+                </div>
+              </div>
+            </div>
+            <div class="col-sm-5">
+              <div class="panel panel-default">
+                <div class="panel-heading">Tarballs</div>
+                <div class="panel-body">You can also obtain daily snapshots
+                of the latest Buildroot source tree if you want to follow
+                development, but cannot or do not wish to use Git. 
+                <ul>
+                  <li>You can download the 
+                  <a href="downloads/snapshots/buildroot-snapshot.tar.bz2">
+                  latest snapshot</a>or view recent 
+                  <a href="downloads/snapshots/">daily snapshots</a>.</li>
+                  <li>You can also 
+                  <a href="http://git.buildroot.net/buildroot">browse the
+                  source tree online</a>.</li>
+                </ul>
+                <p>Older versions can be downloaded from 
+                <a href="/downloads/">the release archive</a>.</p></div>
+              </div>
+            </div>
+          </div>
+        </div>
       </div>
     </div>
+    <!--/.col-sm-10 -->
   </div>
-
-</div><!--/.col-sm-10 -->
-</div><!--/.row -->
+  <!--/.row -->
 </div>
-
 <!--#include file="footer.html" -->
diff --git a/docs/website/footer.html b/docs/website/footer.html
index 16fab36..4725b2b 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -1,7 +1,9 @@
-	<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
-	<script src="https://oss.maxcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
-	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
-	<script src="https://cdn.rawgit.com/zenorocha/clipboard.js/master/dist/clipboard.min.js"></script>
-	<script type="text/javascript" src="js/buildroot.js"></script>
+<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
+<script src="https://oss.maxcdn.com/bootstrap/3.3.5/js/bootstrap.min.js">
+</script>
+<script type="text/javascript" src="https://www.google.com/jsapi"></script>
+<script src="https://cdn.rawgit.com/zenorocha/clipboard.js/master/dist/clipboard.min.js">
+</script>
+<script type="text/javascript" src="js/buildroot.js"></script>
 </body>
 </html>
diff --git a/docs/website/header.html b/docs/website/header.html
index 6385111..69f4203 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -1,52 +1,72 @@
 <!DOCTYPE html>
 <html lang="en">
-<head>
-	<meta charset="utf-8" />
-	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
-	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
-	<meta name="Buildroot" content="" />
-	<meta name="angelo.compagnucci@gmail.com" content="" />
-	<link rel="shortcut icon" href="images/favicon.png" />
-
-	<title>Buildroot - Making Embedded Linux Easy</title>
-
-	<link href="https://oss.maxcdn.com/bootswatch/3.3.5/paper/bootstrap.min.css" rel="stylesheet" />
-	<link href="css/main.css" rel="stylesheet" />
-
-	<!--[if lt IE 9]>
-	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
-	  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
-	<![endif]-->
-</head>
-
-<body>
-	<!-- Fixed navbar -->
-	<div class="navbar navbar-default navbar-fixed-top">
-		<div class="container">
-		<div class="navbar-header">
-		  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
-			<span class="icon-bar"></span>
-			<span class="icon-bar"></span>
-			<span class="icon-bar"></span>
-		  </button>
-		  <a class="navbar-brand" href="/"><b>Buildroot</b></a>
-		</div>
-		<div class="navbar-collapse collapse">
-			<ul class="nav navbar-nav navbar-right">
-				<li><a href="/news.html">
-					<span class="glyphicon glyphicon-star"></span> News</a></li>
-				<li><a href="/docs.html">
-					<span class="glyphicon glyphicon-book"></span> Documentation</a></li>
-				<li><a href="/support.html">
-					<span class="glyphicon glyphicon-question-sign"></span> Support</a></li>
-				<li><a href="/contribute.html">
-					<span class="glyphicon glyphicon-share"></span> Contribute</a></li>
-				<li><a href="/sponsors.html">
-					<span class="glyphicon glyphicon-usd"></span> Sponsors</a></li>
-				<li><a id="menubutton" class="btn btn-success btn-shrink" href="/download.html">
-					<span class="glyphicon glyphicon-cloud-download"></span>
-					<span class="text-shrink" >Download</span></a></li>
-			</ul>
-		</div><!--/.nav-collapse -->
-		</div>
-	</div>
+  <head>
+    <meta charset="utf-8" />
+    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
+    <meta name="viewport"
+    content="width=device-width, initial-scale=1.0" />
+    <meta name="Buildroot" content="" />
+    <meta name="angelo.compagnucci@gmail.com" content="" />
+    <link rel="shortcut icon" href="images/favicon.png" />
+    <title>Buildroot - Making Embedded Linux Easy</title>
+    <link href="https://oss.maxcdn.com/bootswatch/3.3.5/paper/bootstrap.min.css"
+    rel="stylesheet" />
+    <link href="css/main.css" rel="stylesheet" />
+    <!--[if lt IE 9]>
+          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
+          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
+        <![endif]-->
+  </head>
+  <body>
+    <!-- Fixed navbar -->
+    <div class="navbar navbar-default navbar-fixed-top">
+      <div class="container">
+        <div class="navbar-header">
+          <button type="button" class="navbar-toggle"
+          data-toggle="collapse" data-target=".navbar-collapse">
+            <span class="icon-bar"></span>
+            <span class="icon-bar"></span>
+            <span class="icon-bar"></span>
+          </button>
+          <a class="navbar-brand" href="/">
+            <b>Buildroot</b>
+          </a>
+        </div>
+        <div class="navbar-collapse collapse">
+          <ul class="nav navbar-nav navbar-right">
+            <li>
+              <a href="/news.html">
+              <span class="glyphicon glyphicon-star"></span>News</a>
+            </li>
+            <li>
+              <a href="/docs.html">
+              <span class="glyphicon glyphicon-book">
+              </span>Documentation</a>
+            </li>
+            <li>
+              <a href="/support.html">
+              <span class="glyphicon glyphicon-question-sign">
+              </span>Support</a>
+            </li>
+            <li>
+              <a href="/contribute.html">
+              <span class="glyphicon glyphicon-share"></span>Contribute</a>
+            </li>
+            <li>
+              <a href="/sponsors.html">
+              <span class="glyphicon glyphicon-usd"></span>Sponsors</a>
+            </li>
+            <li>
+              <a id="menubutton" class="btn btn-success btn-shrink"
+              href="/download.html">
+                <span class="glyphicon glyphicon-cloud-download"></span>
+                <span class="text-shrink">Download</span>
+              </a>
+            </li>
+          </ul>
+        </div>
+        <!--/.nav-collapse -->
+      </div>
+    </div>
+  </body>
+</html>
diff --git a/docs/website/index.html b/docs/website/index.html
index 6bc37b9..1296a5e 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -1,151 +1,180 @@
 <!--#include file="header.html" -->
-
 <div id="headerwrap">
   <div class="container">
     <div class="row">
       <div class="col-sm-6">
-	<img class="img-responsive center-block" src="images/logo.png" alt="" style="max-width:300px" />
-      </div><!-- /col-lg-6 -->
+        <img class="img-responsive center-block" src="images/logo.png"
+        alt="" style="max-width:300px" />
+      </div>
+      <!-- /col-lg-6 -->
       <div class="col-sm-6">
-	<h1>Buildroot<br/>
-	  <small>Making Embedded Linux Easy</small></h1>
-	<div class="col-sm-6" style="margin-top:1em; padding-left:0px;">
-	  <a class="btn btn-default btn-lg" style="width:100%;" href="#about"><span class="glyphicon glyphicon-info-sign"></span>&nbsp; Learn more</a>
-	</div>
-	<div class="col-sm-6" style="margin-top:1em; padding-left:0px;">
-	  <a class="btn btn-default btn-lg" style="width:100%; margin-bottom: 20px;" href="/download.html"><span class="glyphicon glyphicon-cloud-download"></span>&nbsp; Download</a>
-	</div>
-      </div><!-- /col-lg-6 -->
-    </div><!-- /row -->
-  </div><!-- /container -->
-</div><!-- /headerwrap -->
-
+        <h1>Buildroot 
+        <br />
+        <small>Making Embedded Linux Easy</small></h1>
+        <div class="col-sm-6" style="margin-top:1em; padding-left:0px;">
+          <a class="btn btn-default btn-lg" style="width:100%;"
+          href="#about">
+          <span class="glyphicon glyphicon-info-sign"></span>&#160; Learn
+          more</a>
+        </div>
+        <div class="col-sm-6" style="margin-top:1em; padding-left:0px;">
+          <a class="btn btn-default btn-lg"
+          style="width:100%; margin-bottom: 20px;" href="/download.html">
+          <span class="glyphicon glyphicon-cloud-download"></span>&#160;
+          Download</a>
+        </div>
+      </div>
+      <!-- /col-lg-6 -->
+    </div>
+    <!-- /row -->
+  </div>
+  <!-- /container -->
+</div>
+<!-- /headerwrap -->
 <a name="about"></a>
 <div class="container">
   <div class="row mt centered">
     <div class="col-lg-8 col-lg-offset-2">
-      <h1>Buildroot is a simple, efficient and easy-to-use tool to
-	generate embedded Linux systems through cross-compilation.</h1>
+      <h1>Buildroot is a simple, efficient and easy-to-use tool to generate
+      embedded Linux systems through cross-compilation.</h1>
     </div>
-  </div><!-- /row -->
-
+  </div>
+  <!-- /row -->
   <div class="row mt centered">
     <div class="col-md-4">
-      <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	<div class="flipper">
-	  <div class="front">
-	    <img src="images/tux-flat.png" width="180" alt="" />
-	  </div>
-	  <div class="back">
-	    <img src="images/tux-flat.png" width="180" alt="" />
-	  </div>
-	</div>
+      <div class="flip-container center-block"
+      ontouchstart="this.classList.toggle('hover');">
+        <div class="flipper">
+          <div class="front">
+            <img src="images/tux-flat.png" width="180" alt="" />
+          </div>
+          <div class="back">
+            <img src="images/tux-flat.png" width="180" alt="" />
+          </div>
+        </div>
       </div>
-
       <h4>Can handle everything</h4>
-      <p>Cross-compilation toolchain, root filesystem generation,
-	kernel image compilation and bootloader compilation.</p>
-    </div><!--/col-lg-4 -->
-
+      <p>Cross-compilation toolchain, root filesystem generation, kernel
+      image compilation and bootloader compilation.</p>
+    </div>
+    <!--/col-lg-4 -->
     <div class="col-md-4">
-      <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	<div class="flipper">
-	  <div class="front">
-	    <img src="images/hammer.png" width="180" alt="" />
-	  </div>
-	  <div class="back">
-	    <img src="images/hammer.png" width="180" alt="" />
-	  </div>
-	</div>
+      <div class="flip-container center-block"
+      ontouchstart="this.classList.toggle('hover');">
+        <div class="flipper">
+          <div class="front">
+            <img src="images/hammer.png" width="180" alt="" />
+          </div>
+          <div class="back">
+            <img src="images/hammer.png" width="180" alt="" />
+          </div>
+        </div>
       </div>
-
       <h4>Is very easy</h4>
-      <p>Thanks to its kernel-like menuconfig, gconfig and
-	xconfig configuration interfaces, building a basic system with
-	Buildroot is easy and typically takes 15-30 minutes.</p>
-
-    </div><!--/col-lg-4 -->
-
+      <p>Thanks to its kernel-like menuconfig, gconfig and xconfig
+      configuration interfaces, building a basic system with Buildroot is
+      easy and typically takes 15-30 minutes.</p>
+    </div>
+    <!--/col-lg-4 -->
     <div class="col-md-4">
-      <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	<div class="flipper">
-	  <div class="front">
-	    <img src="images/gift.png" width="180" alt="" />
-	  </div>
-	  <div class="back">
-	    <img src="images/gift.png" width="180" alt="" />
-	  </div>
-	</div>
+      <div class="flip-container center-block"
+      ontouchstart="this.classList.toggle('hover');">
+        <div class="flipper">
+          <div class="front">
+            <img src="images/gift.png" width="180" alt="" />
+          </div>
+          <div class="back">
+            <img src="images/gift.png" width="180" alt="" />
+          </div>
+        </div>
       </div>
-
       <h4>Supports several hundreds of packages</h4>
-      <p>X.org stack, Gtk3, Qt 5, GStreamer, Webkit, Kodi, a large number of network-related and system-related utilities are supported.</p>
-
-    </div><!--/col-lg-4 -->
-  </div><!-- /row -->
-  <hr/>
-</div><!-- /container -->
-
+      <p>X.org stack, Gtk3, Qt 5, GStreamer, Webkit, Kodi, a large number
+      of network-related and system-related utilities are supported.</p>
+    </div>
+    <!--/col-lg-4 -->
+  </div>
+  <!-- /row -->
+  <hr />
+</div>
+<!-- /container -->
 <div class="container">
   <div class="row mt centered">
     <div class="col-lg-6 col-lg-offset-3">
       <h1>Buildroot is for Everyone.</h1>
-      <h3>Has a simple structure that makes it easy to understand and extend. It relies only on the well-known Makefile language.</h3>
+      <h3>Has a simple structure that makes it easy to understand and
+      extend. It relies only on the well-known Makefile language.</h3>
     </div>
-  </div><!-- /row -->
-
+  </div>
+  <!-- /row -->
   <div class="row mt centered">
     <div class="col-lg-8 col-lg-offset-2">
-      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
-	<!-- Wrapper for slides -->
-	<div class="carousel-inner">
-	  <div class="item active">
-	    <img src="images/nconfig.png" alt="" />
-	  </div>
-	  <div class="item">
-	    <img src="images/menuconfig.png" alt="" />
-	  </div>
-	  <div class="item">
-	    <img src="images/xconfig.png" alt="" />
-	  </div>
-	</div>
-	<!-- Indicators -->
-	<ol class="carousel-indicators" style="margin-top:10px">
-	  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
-	  <li data-target="#carousel-example-generic" data-slide-to="1"></li>
-	  <li data-target="#carousel-example-generic" data-slide-to="2"></li>
-	</ol>
+      <div id="carousel-example-generic" class="carousel slide"
+      data-ride="carousel">
+        <!-- Wrapper for slides -->
+        <div class="carousel-inner">
+          <div class="item active">
+            <img src="images/nconfig.png" alt="" />
+          </div>
+          <div class="item">
+            <img src="images/menuconfig.png" alt="" />
+          </div>
+          <div class="item">
+            <img src="images/xconfig.png" alt="" />
+          </div>
+        </div>
+        <!-- Indicators -->
+        <ol class="carousel-indicators" style="margin-top:10px">
+          <li data-target="#carousel-example-generic" data-slide-to="0"
+          class="active"></li>
+          <li data-target="#carousel-example-generic" data-slide-to="1">
+          </li>
+          <li data-target="#carousel-example-generic" data-slide-to="2">
+          </li>
+        </ol>
       </div>
-    </div><!-- /col-lg-8 -->
-  </div><!-- /row -->
-</div><!-- /container -->
-
+    </div>
+    <!-- /col-lg-8 -->
+  </div>
+  <!-- /row -->
+</div>
+<!-- /container -->
 <div class="container">
   <div class="row mt centered">
     <div class="col-lg-6 col-lg-offset-3">
       <h1>Our recent activity.</h1>
-      <h3>Buildroot is an open source project: many developers contribute to it daily.</h3>
+      <h3>Buildroot is an open source project: many developers contribute
+      to it daily.</h3>
     </div>
-  </div><!-- /row -->
-</div><!-- /container -->
-
+  </div>
+  <!-- /row -->
+</div>
+<!-- /container -->
 <div class="container">
   <div class="row">
     <div class="col-sm-6">
       <div class="panel panel-primary">
-	<div class="panel-heading"><a href="http://git.buildroot.net/buildroot"><h5>Recent commits</h5></a></div>
-	<div class="panel-box panel-body ellipsis" id="commit-activity">
-	</div>
+        <div class="panel-heading">
+          <a href="http://git.buildroot.net/buildroot">
+            <h5>Recent commits</h5>
+          </a>
+        </div>
+        <div class="panel-box panel-body ellipsis" id="commit-activity">
+        </div>
       </div>
     </div>
-    <div class="col-sm-6" >
+    <div class="col-sm-6">
       <div class="panel panel-primary">
-	<div class="panel-heading"><a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot"><h5>Recent discussions</h5></a></div>
-	<div class="panel-box panel-body ellipsis" id="mailing-list-activity">
-	</div>
+        <div class="panel-heading">
+          <a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot">
+            <h5>Recent discussions</h5>
+          </a>
+        </div>
+        <div class="panel-box panel-body ellipsis"
+        id="mailing-list-activity"></div>
       </div>
     </div>
   </div>
-</div><!-- /container -->
-
+</div>
+<!-- /container -->
 <!--#include file="footer.html" -->
diff --git a/docs/website/news.html b/docs/website/news.html
index f1961bf..7185d1d 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -1,2765 +1,3581 @@
 <!--#include file="header.html" -->
-
 <link href="css/timeline.css" rel="stylesheet">
-
-<div class="container">
-<div class="row nh">
-<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
-
-<h2>News</h2>
-<ul class="timeline">
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2015.11 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11">CHANGES</a>
-	  file for more details, read the
-	  <a href="http://lists.busybox.net/pipermail/buildroot/2015-November/145727.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2015.11.tar.bz2">2015.11 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 November 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Release candidate 3 is out with more cleanups and security
-	  / build fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11-rc3">CHANGES</a>
-	  file for details.</p>
-	<p>Head to the <a href="/downloads/">downloads page</a> to
-	  pick up
-	  the <a href="/downloads/buildroot-2015.11-rc3.tar.bz2">2015.11-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 November 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups
-	  and build fixes. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11-rc2">CHANGES</a>
-	  file for details.</p>
-	<p>Head to the <a href="/downloads/">downloads page</a> to
-	  pick up
-	  the <a href="/downloads/buildroot-2015.11-rc2.tar.bz2">2015.11-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 November 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of
-	  changes all over the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11-rc1">CHANGES</a>
-	  file for details. See also
-	  the <a href="http://lists.busybox.net/pipermail/buildroot/2015-November/144026.html">announcement
-	    e-mail</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2015.11-rc1.tar.bz2">2015.11-rc1
-	    release candidate</a>, and report any
-	  problems found to the
-	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 September 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The 2015.08.1 bugfix release is out - Thanks to everyone
-	  contributing. This release fixes critical issues discovered since
-	  the 2015.08 release. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08.1">CHANGES</a>
-	  file for more details,
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2015.08.1.tar.bz2">2015.08.1 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2015.08 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08">CHANGES</a>
-	  file for more details, read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2015-August/138336.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2015.08.tar.bz2">2015.08 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 August 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over the
-	  tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08-rc2">CHANGES</a>
-	  file for details, and
-	  the <a href="http://lists.buildroot.org/pipermail/buildroot/2015-August/137879.html">release
-	    announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2015.08-rc2.tar.bz2">2015.08-rc2
-	    release candidate</a>, and report any problems found to the
-	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 August 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08-rc1">CHANGES</a>
-	  file for details, read
-	  the <a href="http://lists.buildroot.org/pipermail/buildroot/2015-August/135417.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2015.08-rc1.tar.bz2">2015.08-rc1
-	    release candidate</a>, and report any problems found to the
-	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 May 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2015.05 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05">CHANGES</a>
-	  file for more details, read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2015-May/129209.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2015.05.tar.bz2">2015.05 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 May 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Release candidate 3 is out with more cleanups and security
-	  / build fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05-rc3">CHANGES</a>
-	  file for details.</p>
-	<p>Head to the <a href="/downloads/">downloads page</a> to
-	  pick up
-	  the <a href="/downloads/buildroot-2015.05-rc3.tar.bz2">2015.05-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 May 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups
-	  and build fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05-rc2">CHANGES</a>
-	  file for details.</p>
-	<p>Head to the <a href="/downloads/">downloads page</a> to
-	  pick up the
-	  <a href="/downloads/buildroot-2015.05-rc2.tar.bz2">2015.05-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 May 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over the
-	  tree, see the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05-rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2015-May/127794.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2015.05-rc1.tar.bz2">2015.05-rc1
-	    release candidate</a>, and report any problems found to the
-	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 March 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2015.02 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02">CHANGES</a>
-	  file for more details, read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2015-March/120396.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2015.02.tar.bz2">2015.02 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 February 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Release candidate 3 is out with more cleanups and security
-	  / build fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02-rc3">CHANGES</a>
-	  file for details.</p>
-	<p>Head to the <a href="/downloads/">downloads page</a> to
-	  pick up the
-	  <a href="/downloads/buildroot-2015.02-rc3.tar.bz2">2015.02-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 February 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups
-	  and build fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02-rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2015.02-rc2.tar.bz2">2015.02-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2015.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 February 2015</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over
-	  the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02-rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2015-February/118982.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2015.02-rc1.tar.bz2">2015.02-rc1
-	    release candidate</a>, and report any problems found to
-	  the
-	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2014.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 December 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2014.11 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.11">CHANGES</a>
-	  file for more details,
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2014.11.tar.bz2">2014.11 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li  class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2014.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 November 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Release candidate 3 is out with more cleanups and build
-	  fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.11-rc3">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to
-	  pick up the
-	  <a href="/downloads/buildroot-2014.11-rc3.tar.bz2">2014.11-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2014.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 November 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups
-	  and build fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.11-rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2014.11-rc2.tar.bz2">2014.11-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Report from Buildroot Developers Meeting</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 November 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>A report from the recent
-	  <a href="http://elinux.org/Buildroot:DeveloperDaysELCE2014">
-	    Buildroot Developers Meeting</a> is now
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2014-October/109966.html">available</a>.</p>
-
-	<p>Once again, thanks to all the participants and to
-	  <a href="http://www.mind.be">Mind</a> for sponsoring the event.</p>
-
-	<p>The next Developer Days will take place on February 2nd and
-	  3rd in Brussels, Belgium, right
-	  after <a href="http://fosdem.org">FOSDEM</a>. See
-	  the <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2015">wiki</a>
-	  for more details.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2014.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 November 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over the
-	  tree, see the <a
-			   href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.11-rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2014-November/111946.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2014.11-rc1.tar.bz2">2014.11-rc1
-	    release candidate</a>, and report any problems found to the
-	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2014.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 September 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2014.08 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08">CHANGES</a>
-	  file for more details, read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2014-September/105257.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2014.08.tar.bz2">2014.08 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2014.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 August 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Release candidate 3 is out with more cleanups and build
-	  fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08-rc3">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2014.08-rc3.tar.bz2">2014.08-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2014.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 August 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups
-	  and build fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08-rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2014.08-rc2.tar.bz2">2014.08-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2014.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 August 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over the
-	  tree, see the <a
-			   href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08-rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2014-August/103972.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2014.08-rc1.tar.bz2">2014.08-rc1
-	    release candidate</a>, and report any problems found to the
-	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2014.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 May 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2014.05 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05">CHANGES</a>
-	  file for more details, read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2014-May/097863.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2014.05.tar.bz2">2014.05 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2014.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 May 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Release candidate 3 is out with more cleanups and build
-	  fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05-rc3">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2014.05-rc3.tar.bz2">2014.05-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2014.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 May 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups
-	  and build fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05-rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to
-	  pick up the
-	  <a href="/downloads/buildroot-2014.05-rc2.tar.bz2">2014.05-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2014.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 May 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over the
-	  tree, see the <a
-			   href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05-rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2014-May/096492.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2014.05-rc1.tar.bz2">2014.05-rc1
-	    release candidate</a>, and report any problems found to the
-	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">27 February 2014</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2014.02 released</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2014.02 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02">CHANGES</a>
-	  file for more details,
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2014.02.tar.bz2">2014.02 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">25 February 2014</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2014.02-rc3 released</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Release candidate 3 is out with more cleanups and build
-	  fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02-rc3">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2014.02-rc3.tar.bz2">2014.02-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">20 February 2014</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2014.02-rc2 released</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups
-	  and build fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02-rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2014.02-rc2.tar.bz2">2014.02-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2014.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 February 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over the
-	  tree, see the <a
-			   href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02-rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2014-February/089055.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2014.02-rc1.tar.bz2">2014.02-rc1
-	    release candidate</a>, and report any problems found to the
-	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">9 February 2014</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>Report from Buildroot Developers Meeting</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>A report from the recent
-	  <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2014">
-	    Buildroot Developers Meeting</a> is now
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2014-February/088373.html">available</a>.</p>
-
-	<p>Once again, thanks to all the participants and to
-	  <a href="http://www.google.com">Google</a> and
-	  <a href="http://www.mind.be">Mind</a> for sponsoring the event.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Upcoming Buildroot Developers meeting</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 January 2014</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The upcoming Buildroot Developers meeting will take place in
-	  Brussels on February, 3rd and 4th, after the
-	  <a href="http://www.fosdem.org">FOSDEM</a> conference. Additional
-	  details about the meeting can be found on the corresponding
-	  <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2014">
-	    wiki page</a>.</p>
-
-	<p>Persons not able to join the meeting in Brussels can participate
-	  remotely using Google Hangouts. Simply give your Google address to
-	  <code>thomas.petazzoni at free-electrons.com</code>.</p>
-
-	<p>This meeting is sponsored by
-	  <a href="http://www.google.com">Google</a> (for the meeting room)
-	  and <a href="http://www.mind.be">Mind</a> (for the dinner).
-	  Thanks to our sponsors!</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2013.11 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11">CHANGES</a>
-	  file for more details, read the <a href="http://lists.buildroot.org/pipermail/buildroot/2013-November/083600.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.11.tar.bz2">2013.11 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Slides from Embedded Linux Conference Europe</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The slides from the Buildroot presentation at the recent
-	  <a href="http://events.linuxfoundation.org/events/embedded-linux-conference-europe">Embedded Linux Conference Europe 2013</a>
-	  are now
-	  <a href="http://elinux.org/images/2/23/Buildroot-whats-new-elce2013.pdf">available</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 November 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more
-	  fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11-rc3">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.11-rc3.tar.bz2">2013.11-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 November 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups
-	  and build fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11-rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.11-rc2.tar.bz2">2013.11-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Announcement of the next Buildroot Developer Days</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 November 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The next <i>Buildroot Developer Days</i> meeting will take
-	  place on Monday 3rd and Tuesday 4th February 2014 in Brussels,
-	  Belgium - Just after
-	  <a href="http://www.fosdem.org">FOSDEM</a> (February
-	  1st/2nd). This two days meeting is mainly open to Buildroot
-	  developers and contributors, or Buildroot users having a prior
-	  experience with the tool. It will allow developers to work on
-	  Buildroot and discuss current issues, the future directions, and
-	  more.</p>
-
-	<p>In addition to the Buildroot event, we encourage embedded Linux
-	  developers to propose talks for the Embedded and Mobile Developer
-	  Room at FOSDEM. See
-	  the <a href="https://lists.fosdem.org/pipermail/fosdem/2013-October/001870.html">CFP</a>.</p>
-
-	<p>We would like to thank our
-	  sponsor <a href="http://www.google.com">Google</a> for sponsoring
-	  the event by providing all the needed logistics.</p>
-
-	<p>For more details, see the
-	  <a href="http://www.elinux.org/Buildroot:DeveloperDaysFOSDEM2014">wiki
-	    page</a> dedicated to the meeting.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 November 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over the
-	  tree, see the <a
-			   href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11_rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2013-November/082514.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.11-rc1.tar.bz2">2013.11-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Report from Buildroot Developers Meeting</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 November 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>A report from the recent
-	  <a href="http://elinux.org/Buildroot:DeveloperDaysELCE2013">
-	    Buildroot Developers Meeting</a> is now
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2013-November/082401.html">available</a>.</p>
-
-	<p>Once again, thanks to all the participants and to
-	  <a href="http://www.imgtec.com/">Imagination Technologies</a>
-	  for sponsoring the event.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 September 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The 2013.08.1 bugfix release is out - Thanks to everyone
-	  contributing. This release fixes critical issues discovered since
-	  the 2013.08 release. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08.1">CHANGES</a>
-	  file for more details,
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.08.1.tar.bz2">2013.08.1 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Buildroot Developer Days</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 September 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The next <i>Buildroot Developer Days</i> meeting will take
-	  place on Saturday October 26th and Sunday October 27th 2013 in
-	  Edinburgh, UK - Just after the <a
-					    href="https://events.linuxfoundation.org/events/embedded-linux-conference-europe">
-	    Embedded Linux Conference Europe</a> (October 23th-24th). This two
-	  days meeting is mainly open to Buildroot developers and
-	  contributors, or Buildroot users having a prior experience with
-	  the tool. It will allow developers to work on Buildroot and
-	  discuss current issues, the future directions, and more.</p>
-
-	<p>For more details, see the
-	  <a href="http://www.elinux.org/Buildroot:DeveloperDaysELCE2013">wiki
-	    page</a> dedicated to the meeting.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2013.08 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08">CHANGES</a>
-	  file for more details, read the <a href="http://lists.buildroot.org/pipermail/buildroot/2013-August/077224.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.08.tar.bz2">2013.08 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 August 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups and
-	  build fixes. See the <a
-				  href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08_rc3">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.08-rc3.tar.bz2">2013.08-rc3
-	    release candidate</a>, and report any problems found to the <a
-									   href="support.html">mailing list</a> or <a
-														      href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 August 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over the
-	  tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08_rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.08-rc2.tar.bz2">2013.08-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 August 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over the
-	  tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08_rc1">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.08-rc1.tar.bz2">2013.08-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 May 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2013.05 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05">CHANGES</a>
-	  file for more details, read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2013-May/073121.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.05.tar.bz2">2013.05 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 May 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups and
-	  build fixes. See the <a
-				  href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05_rc3">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.05-rc3.tar.bz2">2013.05-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 May 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups and
-	  build fixes. See the <a
-				  href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05_rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.05-rc2.tar.bz2">2013.05-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 May 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over the
-	  tree, see the <a
-			   href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05_rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2013-May/071737.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.05-rc1.tar.bz2">2013.05-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 February 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2013.02 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02">CHANGES</a>
-	  file for more details
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.02.tar.bz2">2013.02 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 February 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups
-	  and build fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02_rc3">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.02-rc3.tar.bz2">2013.02-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 February 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups and
-	  build fixes. See the <a
-				  href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02_rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.02-rc2.tar.bz2">2013.02-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2013.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 February 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over the
-	  tree, see the <a
-			   href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02_rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2013-February/067148.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2013.02-rc1.tar.bz2">2013.02-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Report from Buildroot Developers Meeting</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 February 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>A report from the recent Buildroot Developers Meeting is now
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2013-February/067105.html">available</a>.
-	  <a href="http://emlinews.net">Embedded Linux News</a> also has a
-	  <a href="http://www.emlinews.net/2013/02/buildroot-developers-meeting-report/">
-	    writeup about the event</a>, including photos.</p>
-
-	<p>Once again, thanks to all the participants and to
-	  <a href="http://www.google.com">Google</a> for sponsoring the event.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Next Buildroot Developers Meeting next to FOSDEM, Brussels</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 January 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The next Buildroot Developers Meeting will take place on Monday
-	  4th February 2013 and Tuesday 5th February 2013 in Brussels,
-	  Belgium. Those dates have been chosen to immediately follow the
-	  great <a href="http://www.fosdem.org">FOSDEM</a> conference.</p>
-
-	<p>Attending this meeting is free, after registration by
-	  contacting <a href="mailto:thomas.petazzoni@free-electrons.com">Thomas
-	    Petazzoni</a>. For more details about the meeting, please see
-	  the <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013">related
-	    Wiki page</a>.</p>
-
-	<p>We would like to
-	  thank <a href="http://www.google.com">Google</a> for providing the
-	  meeting location and the Internet connection, and offering free
-	  lunch and refreshments to the participants.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.11.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>3 January 2013</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The 2012.11.1 bugfix release is out - Thanks to everyone
-	  contributing. This release fixes critical issues discovered since
-	  the 2012.11 release, most importantly with non-largefile builds on
-	  recent Ubuntu versions. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11.1">CHANGES</a>
-	  file for more details,
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.11.1.tar.bz2">2012.11.1 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 December 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2012.11 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11">CHANGES</a>
-	  file for more details
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.11.tar.bz2">2012.11 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC2 is out with more bugfixes - See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11_rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.11-rc2.tar.bz2">2012.11-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 November 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over the
-	  tree, see the <a
-			   href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11_rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2012-November/061995.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.11-rc1.tar.bz2">2012.11-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Buildroot Developer Day</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 November 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>A report from the recent <i>Buildroot Developer Days</i>
-	  meeting in Barcelona, Spain is
-	  now <a href="http://lists.buildroot.org/pipermail/buildroot/2012-November/061558.html">available</a>.
-	  Many thanks to all the participants, and a special thanks to
-	  Arnout Vandecappelle from <a href="http://mind.be/">mind</a>
-	  for taking notes and Thomas Petazzoni
-	  from <a href="http://free-electrons.com/">Free Electrons</a>
-	  for handling all the practical arrangements, and naturally
-	  our sponsors, <a href="http://www.fluendo.com/">Fluendo</a>
-	  and <a href="http://www.synopsys.com/">Synopsis</a>.
-	</p>
-	<p>The next Developer Days will take place on February 4th and
-	  5th in Brussels, Belgium, right
-	  after <a href="http://fosdem.org">FOSDEM</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2012.08 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08">CHANGES</a>
-	  file for more details and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.08.tar.bz2">2012.08 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 August 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Various fixes, and
-	  addition of licensing informations on many
-	  packages. See <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08_rc3">CHANGES</a>
-	  file for details</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.08-rc3.tar.bz2">2012.08-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 August 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Various fixes, and addition
-	  of licensing informations on many
-	  packages. See <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08_rc2">CHANGES</a>
-	  file for details</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.08-rc2.tar.bz2">2012.08-rc2
-	    release candidate</a>, and report any problems found to the <a
-									   href="support.html">mailing list</a> or <a
-														      href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 August 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over
-	  the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08_rc1">CHANGES</a>
-	  file for details</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.08-rc1.tar.bz2">2012.08-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Buildroot Developer Day</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 July 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The next <i>Buildroot Developer Day</i> meeting will take place
-	  on Saturday November 3th and Sunday November 4th 2012 in
-	  Barcelona, Spain, just before
-	  the <a href="https://events.linuxfoundation.org/events/embedded-linux-conference-europe">Embedded
-	    Linux Conference Europe</a> (November 5th-7th). This two days
-	  meeting is mainly opened to Buildroot developers and contributors,
-	  or Buildroot users having a prior experience with the tool. This
-	  meeting will allow developers to work and Buildroot, and discuss
-	  current issues, the future directions, and more.</p>
-
-	<p>For more details, see
-	  the <a href="http://elinux.org/Buildroot#Buildroot_Developers_Meeting.2C_3-4_November_2012.2C_Barcelona_Spain">wiki
-	    page</a> dedicated to the meeting.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 May 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2012.05 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05">CHANGES</a>
-	  file for more details, read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2012-May/054342.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.05.tar.bz2">2012.05 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 May 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC3 is out with more bugfixes - See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05_rc3">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.05-rc3.tar.bz2">2012.05-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 May 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups
-	  and build fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05_rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.05-rc2.tar.bz2">2012.05-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 May 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over
-	  the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05_rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2012-May/053736.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.05-rc1.tar.bz2">2012.05-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Autobuilder Results Online</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 April 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The status of the autobuilders, which do repeated
-	  <code>randpackageconfig</code> builds for continuous
-	  integration testing, is now online
-	  at <a href='http://autobuild.buildroot.org'>autobuild.buildroot.org</a>. The
-	  code behind it can be found
-	  in <a href='http://git.buildroot.net/buildroot-test/'>git</a>.</p>
-
-	<p>Thanks to Thomas Petazzoni for running the web interface, and
-	  to <a href='http://gcc.gnu.org/wiki/CompileFarm'>The GCC Compile
-	    Farm</a> and <a href='http://free-electrons.com/'>Free
-	    Electrons</a> for hosting builders. Thomas also sends out a daily
-	  summary of the build status to the mailing list.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 February 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2012.02 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02">CHANGES</a>
-	  file for more details, read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2012-February/050752.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.02.tar.bz2">2012.02 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 February 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC3 is out with more bugfixes - See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.02-rc3.tar.bz2">2012.02-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 February 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with more cleanups
-	  and build fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.02-rc2.tar.bz2">2012.02-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2012.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 February 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over
-	  the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2012-February/050234.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2012.02-rc1.tar.bz2">2012.02-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Buildroot Developer Day</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 January 2012</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another <i>Buildroot Developer Day</i> will take place on
-	  Friday, February 3rd in Brussels, Belgium - The day
-	  before <a href="http://fosdem.org">FOSDEM</a>. See the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2012-January/049340.html">announcement</a>
-	  or
-	  the <a href="http://free-electrons.com/blog/bdd-2012-brussels/">Free
-	    Electrons blog</a> for more info.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2011.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2011</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2011.11 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11">CHANGES</a>
-	  file for more details, read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-November/047926.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2011.11.tar.bz2">2011.11 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2011.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 November 2011</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC3 is out with more bugfixes - See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11_rc3">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2011.11-rc3.tar.bz2">2011.11-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2011.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 November 2011</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with a bunch of
-	  cleanups and build fixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11_rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2011.11-rc2.tar.bz2">2011.11-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2011.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 November 2011</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over
-	  the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11_rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-November/047395.html">announcement</a></p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2011.11-rc1.tar.bz2">2011.11-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2011.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2011</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2011.08 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08">CHANGES</a>
-	  file for more details, and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2011.08.tar.bz2">2011.08 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2011.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 August 2011</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC2 is out with more bugfixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08_rc2">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-August/045211.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2011.08-rc2.tar.bz2">2011.08-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2011.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 August 2011</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over
-	  the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08_rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-August/044855.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2011.08-rc1.tar.bz2">2011.08-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2011.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 May 2011</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2011.05 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.05">CHANGES</a>
-	  file for more details, and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2011.05.tar.bz2">2011.05 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2011.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 May 2011</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC2 is out with more bugfixes. See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.05_rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2011.05-rc2.tar.bz2">2011.05-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2011.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 May 2011</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over
-	  the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.05_rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-May/043317.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2011.05-rc1.tar.bz2">2011.05-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2011.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 February 2011</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2011.02 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.02">CHANGES</a>
-	  file for more details, read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-February/041662.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2011.02.tar.bz2">2011.02 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2011.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 February 2011</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC2 is out with more cleanups and bugfixes, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.02_rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2011.02-rc2.tar.bz2">2011.02-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2011.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 February 2011</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over
-	  the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.02_rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2011-February/041365.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2011.02-rc1.tar.bz2">2011.02-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2010.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2010.11 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.11">CHANGES</a>
-	  file for more details, read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2010-November/039135.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2010.11.tar.bz2">2010.11 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2010.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 November 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC2 is out with more cleanups and bugfixes, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.11_rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2010.11-rc2.tar.bz2">2010.11-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2010.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 November 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over
-	  the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.11_rc1">CHANGES</a>
-	  file for details, and read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2010-November/038645.html">announcement</a>.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2010.11-rc1.tar.bz2">2010.11-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Buildroot Developer Day</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 September 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>A <i>Buildroot Developer Day</i> will take place on
-	  Friday, October 29th in Cambridge, UK - Just the day after the
-	  <a href="http://www.embeddedlinuxconference.com/elc_europe10/">Embedded
-	    Linux Conference Europe</a>. This <i>Developer Day</i>
-	  aims at allowing Buildroot developers to meet and exchange
-	  ideas on the project and its future. See the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2010-September/037930.html">announcement</a>
-	  for more info.</p>
-
-	<p>Thanks to Thomas Petazzoni for taking care of the practical
-	  arrangements.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2010.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2010.08 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08">CHANGES</a>
-	  file for more details, read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2010-August/037078.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2010.08.tar.bz2">2010.08 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2010.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 August 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC2 is out with more cleanups and bugfixes, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08_rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2010.08-rc2.tar.bz2">2010.08-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-
-	<p>This is very much expected to be the final release candidate,
-	so give it a good test and expect a final 2010.08 release
-	before September unless critical issues are found.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2010.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 July 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over
-	  the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08_rc1">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2010.08-rc1.tar.bz2">2010.08-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2010.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 May 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2010.05 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.05">CHANGES</a>
-	  file for more details, read the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2010-May/034878.html">announcement</a>
-	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2010.05.tar.bz2">2010.05 release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2010.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 May 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC3 is out with more cleanups and bugfixes, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.05_rc3">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2010.05-rc3.tar.bz2">2010.05-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2010.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 May 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with a bunch of
-	  cleanups and build fixes.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2010.05-rc2.tar.bz2">2010.05-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2010.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>3 May 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over
-	  the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.05_rc1">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2010.05-rc1.tar.bz2">2010.05-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">FOSDEM slides online</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 May 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The slides from
-	  the <a href="http://fosdem.org/2010/schedule/events/emb_cross_build">Cross
-	    Build Systems: Present &amp; Future</a> session
-	  at <a href="http://fosdem.org/2010">FOSDEM</a> are
-	  now <a href="http://send-patches.org/news/20100211-1-FOSDEM-Crossdev-Workshop.pdf">online</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2010.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 February 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2010.02 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.02">CHANGES</a>
-	  file for more details, and go to
-	  the <a href="/downloads/">downloads page</a> to pick up
-	  the <a href="/downloads/buildroot-2010.02.tar.bz2">2010.02
-	    release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2010.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 February 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC2 is out with more cleanups and bugfixes, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.02_rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2010.02-rc2.tar.bz2">2010.02-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2010.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 February 2010</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over
-	  the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.02_rc1">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2010.02-rc1.tar.bz2">2010.02-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 December 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2009.11 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2009-December/030672.html">announcement</a>
-	  or <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.11">CHANGES</a>
-	  for more details, and go to the <a href="/downloads/">downloads page</a>
-	  to pick up the <a href="/downloads/buildroot-2009.11.tar.bz2">2009.11
-	    release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 November 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC2 is out with more cleanups and bugfixes, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.11_rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2009.11-rc2.tar.bz2">2009.11-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 November 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over
-	  the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.11_rc1">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2009.11-rc1.tar.bz2">2009.11-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">First Buildroot Developer Day</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 September 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The first <i>Buildroot Developer Day</i> will take place on
-	  Saturday, October 17th in Grenoble, France, just the day after
-	  Embedded Linux Conference Europe. This <i>Developer Day</i> aims
-	  at allowing Buildroot developers to meet and exchange ideas on the
-	  project and its future.</p>
-
-	<p>As the number of places is limited, interested candidates are
-	  invited to send an e-mail to Peter Korsgaard (<code>jacmet at
-	    uclibc dot org</code>) and Thomas Petazzoni (<code>thomas dot
-	    petazzoni at free-electrons dot com</code>).</p>
-
-	<p>This <i>Developer Day</i> will take place thanks to the
-	  sponsoring of <a href="http://www.calao-systems.com">Calao
-	    Systems</a> and <a href="http://www.free-electrons.com">Free
-	    Electrons</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2009.08 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2009-August/029018.html">announcement</a>
-	  or <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08">CHANGES</a>
-	  for more details, and go to the <a href="/downloads/">downloads page</a>
-	  to pick up the <a href="/downloads/buildroot-2009.08.tar.bz2">2009.08
-	    release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 August 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>A number of bugfixes have been added to the tree since RC2
-	  (especially thanks to Thomas Petazzoni) - See
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08_rc3">CHANGES</a>
-	  file for details. This is very much expected to be the final
-	  release candidate, so give it a good test and expect a final
-	  2009.08 release next weekend unless critical issues are
-	  found.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to
-	  pick up the
-	  <a href="/downloads/buildroot-2009.08-rc3.tar.bz2">2009.08-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 August 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC2 is out with more cleanups and bugfixes, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08_rc2">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2009.08-rc2.tar.bz2">2009.08-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 August 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over
-	  the tree, see
-	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08_rc1">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2009.08-rc1.tar.bz2">2009.08-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 June 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2009.05 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2009-June/027640.html">announcement</a>
-	  or <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.05">CHANGES</a>
-	  for more details, and go to the <a href="/downloads/">downloads page</a>
-	  to pick up the <a href="/downloads/buildroot-2009.05.tar.bz2">2009.05
-	    release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 May 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We had a number of fixes post-RC2, so RC3 is out
-	  (see <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.05_rc3">CHANGES</a>
-	  for details). Now is the moment to test and verify that
-	  everything is working for your favorite config - Expect a
-	  final 2009.05 very soon.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2009.05-rc3.tar.bz2">2009.05-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 May 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC2 is out with more cleanups and bug fixes
-	  (see <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.05_rc2">CHANGES</a>).
-	  Unless big issues are found, expect this to be the last
-	  release candidate before the release - So give it a good
-	  test.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2009.05-rc2.tar.bz2">2009.05-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Buildroot.org</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 May 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Earl Levine has been so kind to donate
-	  the <b>buildroot.org</b> domain to us, so the website can
-	  now also be reached
-	  at <a href="http://www.buildroot.org">www.buildroot.org</a>
-	  (and git at
-	  <a href="http://git.buildroot.org/buildroot">git.buildroot.org</a>).
-
-	  Thanks a lot Earl!</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 May 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a new release candidate! Lots of changes all over the
-	  tree, see the <a
-			   href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.05_rc1">CHANGES</a>
-	  file for details.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2009.05-rc1.tar.bz2">2009.05-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Moved to git</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>3 May 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We've moved the source code
-	  from <a href="http://subversion.tigris.org">Subversion</a>
-	  to <a href="http://git-scm.org">Git</a>. You can browse the
-	  repo online
-	  <a href="http://git.buildroot.net/buildroot">here</a>, and clone
-	  the repo using:
-	  <pre>git clone git://git.buildroot.net/buildroot</pre>
-	  See the <a href="/git.html">Git Access</a> page for more details.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">new Logo</h4>
-	    <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 March 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We have a <a href="images/logo.png">logo</a>! We have so
-	  far been using the <a href="http://busybox.net">Busybox</a>
-	  logo on the website, as the website was a copy of
-	  the <a href="http://busybox.net">Busybox</a> one - But not
-	  anymore, we now have a shiny new logo of our own.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 February 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>The stable 2009.02 release is out - Thanks to everyone
-	  contributing and testing the release candidates. See the
-	  <a href="http://lists.buildroot.org/pipermail/buildroot/2009-February/025974.html">announcement</a>
-	  for more details, and go to the <a href="/downloads/">downloads page</a>
-	  to pick up the <a href="/downloads/buildroot-2009.02.tar.bz2">2009.02
-	    release</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.02-rc4 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 February 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>We had more than 50 changes since RC3, several of them
-	  toolchain related, so decided to make a RC4 as well. This is
-	  very much expected to be the final release candidate, so
-	  give it a good test and expect a final 2009.02 release this
-	  week unless critical issues are found.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to
-	  pick up the
-	  <a href="/downloads/buildroot-2009.02-rc4.tar.bz2">2009.02-rc4
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 January 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>RC3 is out with more cleanups and bug fixes. Unless big
-	  issues are found, expect this to be the last release
-	  candidate before the release - So give it a good test.</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to
-	  pick up the
-	  <a href="/downloads/buildroot-2009.02-rc3.tar.bz2">2009.02-rc3
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">2009.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 January 2009</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Another week, another release candidate with a bunch of
-	  cleanups and build fixes.</p>
-	<p>Head to the <a href="/downloads/">downloads page</a> to
-	  pick up the
-	  <a href="/downloads/buildroot-2009.02-rc2.tar.bz2">2009.02-rc2
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Release candidate and new maintainer</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 January 2009</small></p>
-      </div>
-      <div class="timeline-body">
-
-	<p>It has been a long time coming, but we finally have a new
-	  release candidate! - And a new maintainer to match (Peter
-	  Korsgaard).</p>
-
-	<p>Head to the <a href="/downloads/">downloads page</a> to
-	  pick up the
-	  <a href="/downloads/buildroot-2009.02-rc1.tar.bz2">2009.02-rc1
-	    release candidate</a>, and report any problems found to
-	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>. The
-	  plan is to release 2009.02 in time
-	  for <a href="http://www.fosdem.org/2009/">FOSDEM</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Buildroot mailing list</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 July 2006</small></p>
-      </div>
-      <div class="timeline-body">
-	<p>Buildroot now has its own <a href=support.html>mailing list</a>.</p>
-      </div>
-    </div>
-  </li>
-
-  <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
-      <div class="timeline-heading">
-	<h4 class="timeline-title">Buildroot webpage added</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 February 2005</small></p>
-
-	<p>Buildroot is a set of Makefiles and patches that makes it easy generate a
-	  cross-compilation toolchain and root filesystem for your target Linux
-	  system using the <a href= "http://www.uclibc.org/">uClibc C library</a>.
-	  Buildroot is useful mainly for people working with small or embedded
-	  systems.  Embedded systems often use processors that are not the regular
-	  x86 processors everyone is used to using on their PC. It can be PowerPC
-	  processors, MIPS processors, ARM processors, etc.  And to be extra safe,
-	  you do not need to be root to build or run buildroot.</p>
-
-	<p>And as of today buildroot even has its own webpage, making it a first class
-	  citizen of uclibc.org and busybox.net, and more importantly, make it easy
-	  to find and point to buildroot.</p>
-
-	<p>If you find a bug in buildroot, or wish to submit a patch
-	  to fix a problem or add a shiny new feature, please use
-	  the <a href="https://bugs.uclibc.org/">Bug and Patch
-	  Tracking System</a> to post the details, to make certain
-	  your work is not lost</p>
-      </div>
-    </div>
-  </li>
-</ul>
-
-</div><!--/.col-sm-10 -->
-</div><!--/.row -->
-</div>
-
-<!--#include file="footer.html" -->
-
+  <div class="container">
+    <div class="row nh">
+      <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+        <h2>News</h2>
+        <ul class="timeline">
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.11 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>30 November
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2015.11 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.busybox.net/pipermail/buildroot/2015-November/145727.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.11.tar.bz2">2015.11
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.11-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>26 November
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Release candidate 3 is out with more cleanups and
+                security / build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11-rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.11-rc3.tar.bz2">
+                2015.11-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.11-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>19 November
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11-rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.11-rc2.tar.bz2">
+                2015.11-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.11-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>7 November
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11-rc1">
+                CHANGES</a>file for details. See also the 
+                <a href="http://lists.busybox.net/pipermail/buildroot/2015-November/144026.html">
+                announcement e-mail</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.11-rc1.tar.bz2">
+                2015.11-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.08.1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>6 September
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The 2015.08.1 bugfix release is out - Thanks to everyone
+                contributing. This release fixes critical issues discovered
+                since the 2015.08 release. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08.1">
+                CHANGES</a>file for more details, and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.08.1.tar.bz2">2015.08.1
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.08 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>31 August
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2015.08 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2015-August/138336.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.08.tar.bz2">2015.08
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.08-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>24 August
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08-rc2">
+                CHANGES</a>file for details, and the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2015-August/137879.html">
+                release announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.08-rc2.tar.bz2">
+                2015.08-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.08-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>5 August
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08-rc1">
+                CHANGES</a>file for details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2015-August/135417.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.08-rc1.tar.bz2">
+                2015.08-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.05 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>31 May
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2015.05 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2015-May/129209.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.05.tar.bz2">2015.05
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.05-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>22 May
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Release candidate 3 is out with more cleanups and
+                security / build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05-rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.05-rc3.tar.bz2">
+                2015.05-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.05-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>11 May
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05-rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.05-rc2.tar.bz2">
+                2015.05-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.05-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>4 May
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05-rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2015-May/127794.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.05-rc1.tar.bz2">
+                2015.05-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.02 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>1 March
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2015.02 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2015-March/120396.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.02.tar.bz2">2015.02
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.02-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>24 February
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Release candidate 3 is out with more cleanups and
+                security / build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02-rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.02-rc3.tar.bz2">
+                2015.02-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.02-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>15 February
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02-rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.02-rc2.tar.bz2">
+                2015.02-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2015.02-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>8 February
+                  2015</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02-rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2015-February/118982.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2015.02-rc1.tar.bz2">
+                2015.02-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2014.11 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>1 December
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2014.11 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.11">
+                CHANGES</a>file for more details, and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.11.tar.bz2">2014.11
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2014.11-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>28 November
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Release candidate 3 is out with more cleanups and build
+                fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.11-rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.11-rc3.tar.bz2">
+                2014.11-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2014.11-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>21 November
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.11-rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.11-rc2.tar.bz2">
+                2014.11-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Report from Buildroot Developers
+                Meeting</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>13 November
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>A report from the recent 
+                <a href="http://elinux.org/Buildroot:DeveloperDaysELCE2014">
+                Buildroot Developers Meeting</a>is now 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2014-October/109966.html">
+                available</a>.</p>
+                <p>Once again, thanks to all the participants and to 
+                <a href="http://www.mind.be">Mind</a>for sponsoring the
+                event.</p>
+                <p>The next Developer Days will take place on February 2nd
+                and 3rd in Brussels, Belgium, right after 
+                <a href="http://fosdem.org">FOSDEM</a>. See the 
+                <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2015">
+                wiki</a>for more details.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2014.11-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>12 November
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.11-rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2014-November/111946.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.11-rc1.tar.bz2">
+                2014.11-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2014.08 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>1 September
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2014.08 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2014-September/105257.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.08.tar.bz2">2014.08
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2014.08-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>26 August
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Release candidate 3 is out with more cleanups and build
+                fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08-rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.08-rc3.tar.bz2">
+                2014.08-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2014.08-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>18 August
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08-rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.08-rc2.tar.bz2">
+                2014.08-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2014.08-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>8 August
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08-rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2014-August/103972.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.08-rc1.tar.bz2">
+                2014.08-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2014.05 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>31 May
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2014.05 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2014-May/097863.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.05.tar.bz2">2014.05
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2014.05-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>28 May
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Release candidate 3 is out with more cleanups and build
+                fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05-rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.05-rc3.tar.bz2">
+                2014.05-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2014.05-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>21 May
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05-rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.05-rc2.tar.bz2">
+                2014.05-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2014.05-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>13 May
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05-rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2014-May/096492.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.05-rc1.tar.bz2">
+                2014.05-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">27 February 2014</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>2014.02
+                  released</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2014.02 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02">
+                CHANGES</a>file for more details, and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.02.tar.bz2">2014.02
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">25 February 2014</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>2014.02-rc3
+                  released</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Release candidate 3 is out with more cleanups and build
+                fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02-rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.02-rc3.tar.bz2">
+                2014.02-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">20 February 2014</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>2014.02-rc2
+                  released</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02-rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.02-rc2.tar.bz2">
+                2014.02-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2014.02-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>11 February
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02-rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2014-February/089055.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2014.02-rc1.tar.bz2">
+                2014.02-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">9 February 2014</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>Report from
+                  Buildroot Developers Meeting</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>A report from the recent 
+                <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2014">
+                Buildroot Developers Meeting</a>is now 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2014-February/088373.html">
+                available</a>.</p>
+                <p>Once again, thanks to all the participants and to 
+                <a href="http://www.google.com">Google</a>and 
+                <a href="http://www.mind.be">Mind</a>for sponsoring the
+                event.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Upcoming Buildroot Developers
+                meeting</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>30 January
+                  2014</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The upcoming Buildroot Developers meeting will take
+                place in Brussels on February, 3rd and 4th, after the 
+                <a href="http://www.fosdem.org">FOSDEM</a>conference.
+                Additional details about the meeting can be found on the
+                corresponding 
+                <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2014">
+                wiki page</a>.</p>
+                <p>Persons not able to join the meeting in Brussels can
+                participate remotely using Google Hangouts. Simply give
+                your Google address to 
+                <code>thomas.petazzoni at free-electrons.com</code>.</p>
+                <p>This meeting is sponsored by 
+                <a href="http://www.google.com">Google</a>(for the meeting
+                room) and 
+                <a href="http://www.mind.be">Mind</a>(for the dinner).
+                Thanks to our sponsors!</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.11 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>30 November
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2013.11 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2013-November/083600.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.11.tar.bz2">2013.11
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Slides from Embedded Linux
+                Conference Europe</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>30 November
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The slides from the Buildroot presentation at the recent
+                
+                <a href="http://events.linuxfoundation.org/events/embedded-linux-conference-europe">
+                Embedded Linux Conference Europe 2013</a>are now 
+                <a href="http://elinux.org/images/2/23/Buildroot-whats-new-elce2013.pdf">
+                available</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.11-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>18 November
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more fixes.
+                See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11-rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.11-rc3.tar.bz2">
+                2013.11-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.11-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>18 November
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11-rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.11-rc2.tar.bz2">
+                2013.11-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Announcement of the next
+                Buildroot Developer Days</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>13 November
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The next 
+                <i>Buildroot Developer Days</i>meeting will take place on
+                Monday 3rd and Tuesday 4th February 2014 in Brussels,
+                Belgium - Just after 
+                <a href="http://www.fosdem.org">FOSDEM</a>(February
+                1st/2nd). This two days meeting is mainly open to Buildroot
+                developers and contributors, or Buildroot users having a
+                prior experience with the tool. It will allow developers to
+                work on Buildroot and discuss current issues, the future
+                directions, and more.</p>
+                <p>In addition to the Buildroot event, we encourage
+                embedded Linux developers to propose talks for the Embedded
+                and Mobile Developer Room at FOSDEM. See the 
+                <a href="https://lists.fosdem.org/pipermail/fosdem/2013-October/001870.html">
+                CFP</a>.</p>
+                <p>We would like to thank our sponsor 
+                <a href="http://www.google.com">Google</a>for sponsoring
+                the event by providing all the needed logistics.</p>
+                <p>For more details, see the 
+                <a href="http://www.elinux.org/Buildroot:DeveloperDaysFOSDEM2014">
+                wiki page</a>dedicated to the meeting.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.11-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>12 November
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11_rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2013-November/082514.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.11-rc1.tar.bz2">
+                2013.11-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Report from Buildroot Developers
+                Meeting</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>11 November
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>A report from the recent 
+                <a href="http://elinux.org/Buildroot:DeveloperDaysELCE2013">
+                Buildroot Developers Meeting</a>is now 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2013-November/082401.html">
+                available</a>.</p>
+                <p>Once again, thanks to all the participants and to 
+                <a href="http://www.imgtec.com/">Imagination
+                Technologies</a>for sponsoring the event.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.08.1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>17 September
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The 2013.08.1 bugfix release is out - Thanks to everyone
+                contributing. This release fixes critical issues discovered
+                since the 2013.08 release. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08.1">
+                CHANGES</a>file for more details, and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.08.1.tar.bz2">2013.08.1
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Buildroot Developer Days</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>16 September
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The next 
+                <i>Buildroot Developer Days</i>meeting will take place on
+                Saturday October 26th and Sunday October 27th 2013 in
+                Edinburgh, UK - Just after the 
+                <a href="https://events.linuxfoundation.org/events/embedded-linux-conference-europe">
+                Embedded Linux Conference Europe</a>(October 23th-24th).
+                This two days meeting is mainly open to Buildroot
+                developers and contributors, or Buildroot users having a
+                prior experience with the tool. It will allow developers to
+                work on Buildroot and discuss current issues, the future
+                directions, and more.</p>
+                <p>For more details, see the 
+                <a href="http://www.elinux.org/Buildroot:DeveloperDaysELCE2013">
+                wiki page</a>dedicated to the meeting.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.08 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>31 August
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2013.08 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2013-August/077224.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.08.tar.bz2">2013.08
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.08-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>29 August
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08_rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.08-rc3.tar.bz2">
+                2013.08-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.08-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>16 August
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08_rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.08-rc2.tar.bz2">
+                2013.08-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.08-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>5 August
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08_rc1">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.08-rc1.tar.bz2">
+                2013.08-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.05 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>31 May
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2013.05 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2013-May/073121.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.05.tar.bz2">2013.05
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.05-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>25 May
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05_rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.05-rc3.tar.bz2">
+                2013.05-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.05-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>15 May
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05_rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.05-rc2.tar.bz2">
+                2013.05-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.05-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>8 May
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05_rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2013-May/071737.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.05-rc1.tar.bz2">
+                2013.05-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.02 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>28 February
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2013.02 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02">
+                CHANGES</a>file for more details and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.02.tar.bz2">2013.02
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.02-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>26 February
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02_rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.02-rc3.tar.bz2">
+                2013.02-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.02-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>19 February
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02_rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.02-rc2.tar.bz2">
+                2013.02-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2013.02-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>10 February
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02_rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2013-February/067148.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2013.02-rc1.tar.bz2">
+                2013.02-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Report from Buildroot Developers
+                Meeting</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>10 February
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>A report from the recent Buildroot Developers Meeting is
+                now 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2013-February/067105.html">
+                available</a>. 
+                <a href="http://emlinews.net">Embedded Linux News</a>also
+                has a 
+                <a href="http://www.emlinews.net/2013/02/buildroot-developers-meeting-report/">
+                writeup about the event</a>, including photos.</p>
+                <p>Once again, thanks to all the participants and to 
+                <a href="http://www.google.com">Google</a>for sponsoring
+                the event.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Next Buildroot Developers
+                Meeting next to FOSDEM, Brussels</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>12 January
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The next Buildroot Developers Meeting will take place on
+                Monday 4th February 2013 and Tuesday 5th February 2013 in
+                Brussels, Belgium. Those dates have been chosen to
+                immediately follow the great 
+                <a href="http://www.fosdem.org">FOSDEM</a>conference.</p>
+                <p>Attending this meeting is free, after registration by
+                contacting 
+                <a href="mailto:thomas.petazzoni@free-electrons.com">Thomas
+                Petazzoni</a>. For more details about the meeting, please
+                see the 
+                <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013">
+                related Wiki page</a>.</p>
+                <p>We would like to thank 
+                <a href="http://www.google.com">Google</a>for providing the
+                meeting location and the Internet connection, and offering
+                free lunch and refreshments to the participants.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.11.1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>3 January
+                  2013</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The 2012.11.1 bugfix release is out - Thanks to everyone
+                contributing. This release fixes critical issues discovered
+                since the 2012.11 release, most importantly with
+                non-largefile builds on recent Ubuntu versions. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11.1">
+                CHANGES</a>file for more details, and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.11.1.tar.bz2">2012.11.1
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.11 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>2 December
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2012.11 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11">
+                CHANGES</a>file for more details and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.11.tar.bz2">2012.11
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.11-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>30 November
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC2 is out with more bugfixes - See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11_rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.11-rc2.tar.bz2">
+                2012.11-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.11-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>17 November
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11_rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2012-November/061995.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.11-rc1.tar.bz2">
+                2012.11-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Buildroot Developer Day</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>17 November
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>A report from the recent 
+                <i>Buildroot Developer Days</i>meeting in Barcelona, Spain
+                is now 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2012-November/061558.html">
+                available</a>. Many thanks to all the participants, and a
+                special thanks to Arnout Vandecappelle from 
+                <a href="http://mind.be/">mind</a>for taking notes and
+                Thomas Petazzoni from 
+                <a href="http://free-electrons.com/">Free Electrons</a>for
+                handling all the practical arrangements, and naturally our
+                sponsors, 
+                <a href="http://www.fluendo.com/">Fluendo</a>and 
+                <a href="http://www.synopsys.com/">Synopsis</a>.</p>
+                <p>The next Developer Days will take place on February 4th
+                and 5th in Brussels, Belgium, right after 
+                <a href="http://fosdem.org">FOSDEM</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.08 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>31 August
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2012.08 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08">
+                CHANGES</a>file for more details and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.08.tar.bz2">2012.08
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.08-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>25 August
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Various fixes, and
+                addition of licensing informations on many packages. See 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08_rc3">
+                CHANGES</a>file for details</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.08-rc3.tar.bz2">
+                2012.08-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.08-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>15 August
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Various fixes, and
+                addition of licensing informations on many packages. See 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08_rc2">
+                CHANGES</a>file for details</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.08-rc2.tar.bz2">
+                2012.08-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.08-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>1 August
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08_rc1">
+                CHANGES</a>file for details</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.08-rc1.tar.bz2">
+                2012.08-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Buildroot Developer Day</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>22 July
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The next 
+                <i>Buildroot Developer Day</i>meeting will take place on
+                Saturday November 3th and Sunday November 4th 2012 in
+                Barcelona, Spain, just before the 
+                <a href="https://events.linuxfoundation.org/events/embedded-linux-conference-europe">
+                Embedded Linux Conference Europe</a>(November 5th-7th).
+                This two days meeting is mainly opened to Buildroot
+                developers and contributors, or Buildroot users having a
+                prior experience with the tool. This meeting will allow
+                developers to work and Buildroot, and discuss current
+                issues, the future directions, and more.</p>
+                <p>For more details, see the 
+                <a href="http://elinux.org/Buildroot#Buildroot_Developers_Meeting.2C_3-4_November_2012.2C_Barcelona_Spain">
+                wiki page</a>dedicated to the meeting.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.05 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>30 May
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2012.05 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2012-May/054342.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.05.tar.bz2">2012.05
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.05-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>25 May
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC3 is out with more bugfixes - See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05_rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.05-rc3.tar.bz2">
+                2012.05-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.05-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>18 May
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05_rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.05-rc2.tar.bz2">
+                2012.05-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.05-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>10 May
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05_rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2012-May/053736.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.05-rc1.tar.bz2">
+                2012.05-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Autobuilder Results Online</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>20 April
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The status of the autobuilders, which do repeated 
+                <code>randpackageconfig</code>builds for continuous
+                integration testing, is now online at 
+                <a href='http://autobuild.buildroot.org'>
+                autobuild.buildroot.org</a>. The code behind it can be
+                found in 
+                <a href='http://git.buildroot.net/buildroot-test/'>
+                git</a>.</p>
+                <p>Thanks to Thomas Petazzoni for running the web
+                interface, and to 
+                <a href='http://gcc.gnu.org/wiki/CompileFarm'>The GCC
+                Compile Farm</a>and 
+                <a href='http://free-electrons.com/'>Free Electrons</a>for
+                hosting builders. Thomas also sends out a daily summary of
+                the build status to the mailing list.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.02 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>29 February
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2012.02 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2012-February/050752.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.02.tar.bz2">2012.02
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.02-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>27 February
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC3 is out with more bugfixes - See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.02-rc3.tar.bz2">
+                2012.02-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.02-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>19 February
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with more
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.02-rc2.tar.bz2">
+                2012.02-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2012.02-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>12 February
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2012-February/050234.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2012.02-rc1.tar.bz2">
+                2012.02-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Buildroot Developer Day</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>31 January
+                  2012</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another 
+                <i>Buildroot Developer Day</i>will take place on Friday,
+                February 3rd in Brussels, Belgium - The day before 
+                <a href="http://fosdem.org">FOSDEM</a>. See the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2012-January/049340.html">
+                announcement</a>or the 
+                <a href="http://free-electrons.com/blog/bdd-2012-brussels/">
+                Free Electrons blog</a>for more info.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2011.11 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>30 November
+                  2011</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2011.11 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2011-November/047926.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2011.11.tar.bz2">2011.11
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2011.11-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>26 November
+                  2011</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC3 is out with more bugfixes - See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11_rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2011.11-rc3.tar.bz2">
+                2011.11-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2011.11-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>18 November
+                  2011</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with a bunch of
+                cleanups and build fixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11_rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2011.11-rc2.tar.bz2">
+                2011.11-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2011.11-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>11 November
+                  2011</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11_rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2011-November/047395.html">
+                announcement</a></p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2011.11-rc1.tar.bz2">
+                2011.11-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2011.08 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>31 August
+                  2011</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2011.08 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08">
+                CHANGES</a>file for more details, and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2011.08.tar.bz2">2011.08
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2011.08-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>29 August
+                  2011</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC2 is out with more bugfixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08_rc2">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2011-August/045211.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2011.08-rc2.tar.bz2">
+                2011.08-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2011.08-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>4 August
+                  2011</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08_rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2011-August/044855.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2011.08-rc1.tar.bz2">
+                2011.08-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2011.05 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>27 May
+                  2011</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2011.05 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.05">
+                CHANGES</a>file for more details, and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2011.05.tar.bz2">2011.05
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2011.05-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>24 May
+                  2011</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC2 is out with more bugfixes. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.05_rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2011.05-rc2.tar.bz2">
+                2011.05-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2011.05-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>18 May
+                  2011</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.05_rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2011-May/043317.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2011.05-rc1.tar.bz2">
+                2011.05-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2011.02 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>28 February
+                  2011</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2011.02 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.02">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2011-February/041662.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2011.02.tar.bz2">2011.02
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2011.02-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>24 February
+                  2011</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC2 is out with more cleanups and bugfixes, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.02_rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2011.02-rc2.tar.bz2">
+                2011.02-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2011.02-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>14 February
+                  2011</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.02_rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2011-February/041365.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2011.02-rc1.tar.bz2">
+                2011.02-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2010.11 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>30 November
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2010.11 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.11">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2010-November/039135.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2010.11.tar.bz2">2010.11
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2010.11-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>25 November
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC2 is out with more cleanups and bugfixes, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.11_rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2010.11-rc2.tar.bz2">
+                2010.11-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2010.11-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>8 November
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.11_rc1">
+                CHANGES</a>file for details, and read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2010-November/038645.html">
+                announcement</a>.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2010.11-rc1.tar.bz2">
+                2010.11-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Buildroot Developer Day</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>28 September
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>A 
+                <i>Buildroot Developer Day</i>will take place on Friday,
+                October 29th in Cambridge, UK - Just the day after the 
+                <a href="http://www.embeddedlinuxconference.com/elc_europe10/">
+                Embedded Linux Conference Europe</a>. This 
+                <i>Developer Day</i>aims at allowing Buildroot developers
+                to meet and exchange ideas on the project and its future.
+                See the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2010-September/037930.html">
+                announcement</a>for more info.</p>
+                <p>Thanks to Thomas Petazzoni for taking care of the
+                practical arrangements.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2010.08 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>31 August
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2010.08 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2010-August/037078.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2010.08.tar.bz2">2010.08
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2010.08-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>30 August
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC2 is out with more cleanups and bugfixes, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08_rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2010.08-rc2.tar.bz2">
+                2010.08-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+                <p>This is very much expected to be the final release
+                candidate, so give it a good test and expect a final
+                2010.08 release before September unless critical issues are
+                found.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2010.08-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>30 July
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08_rc1">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2010.08-rc1.tar.bz2">
+                2010.08-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2010.05 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>30 May
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2010.05 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.05">
+                CHANGES</a>file for more details, read the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2010-May/034878.html">
+                announcement</a>and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2010.05.tar.bz2">2010.05
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2010.05-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>27 May
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC3 is out with more cleanups and bugfixes, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.05_rc3">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2010.05-rc3.tar.bz2">
+                2010.05-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2010.05-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>11 May
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with a bunch of
+                cleanups and build fixes.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2010.05-rc2.tar.bz2">
+                2010.05-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2010.05-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>3 May
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.05_rc1">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2010.05-rc1.tar.bz2">
+                2010.05-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">FOSDEM slides online</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>2 May
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The slides from the 
+                <a href="http://fosdem.org/2010/schedule/events/emb_cross_build">
+                Cross Build Systems: Present &amp; Future</a>session at 
+                <a href="http://fosdem.org/2010">FOSDEM</a>are now 
+                <a href="http://send-patches.org/news/20100211-1-FOSDEM-Crossdev-Workshop.pdf">
+                online</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2010.02 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>26 February
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2010.02 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.02">
+                CHANGES</a>file for more details, and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2010.02.tar.bz2">2010.02
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2010.02-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>23 February
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC2 is out with more cleanups and bugfixes, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.02_rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2010.02-rc2.tar.bz2">
+                2010.02-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2010.02-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>9 February
+                  2010</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.02_rc1">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2010.02-rc1.tar.bz2">
+                2010.02-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.11 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>1 December
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2009.11 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2009-December/030672.html">
+                announcement</a>or 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.11">
+                CHANGES</a>for more details, and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.11.tar.bz2">2009.11
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.11-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>29 November
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC2 is out with more cleanups and bugfixes, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.11_rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.11-rc2.tar.bz2">
+                2009.11-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.11-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>23 November
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.11_rc1">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.11-rc1.tar.bz2">
+                2009.11-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">First Buildroot Developer
+                Day</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>7 September
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The first 
+                <i>Buildroot Developer Day</i>will take place on Saturday,
+                October 17th in Grenoble, France, just the day after
+                Embedded Linux Conference Europe. This 
+                <i>Developer Day</i>aims at allowing Buildroot developers
+                to meet and exchange ideas on the project and its
+                future.</p>
+                <p>As the number of places is limited, interested
+                candidates are invited to send an e-mail to Peter Korsgaard
+                ( 
+                <code>jacmet at uclibc dot org</code>) and Thomas Petazzoni
+                ( 
+                <code>thomas dot petazzoni at free-electrons dot
+                com</code>).</p>
+                <p>This 
+                <i>Developer Day</i>will take place thanks to the
+                sponsoring of 
+                <a href="http://www.calao-systems.com">Calao Systems</a>and
+                
+                <a href="http://www.free-electrons.com">Free
+                Electrons</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.08 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>31 August
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2009.08 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2009-August/029018.html">
+                announcement</a>or 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08">
+                CHANGES</a>for more details, and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.08.tar.bz2">2009.08
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.08-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>26 August
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>A number of bugfixes have been added to the tree since
+                RC2 (especially thanks to Thomas Petazzoni) - See the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08_rc3">
+                CHANGES</a>file for details. This is very much expected to
+                be the final release candidate, so give it a good test and
+                expect a final 2009.08 release next weekend unless critical
+                issues are found.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.08-rc3.tar.bz2">
+                2009.08-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.08-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>6 August
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC2 is out with more cleanups and bugfixes, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08_rc2">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.08-rc2.tar.bz2">
+                2009.08-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.08-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>2 August
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08_rc1">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.08-rc1.tar.bz2">
+                2009.08-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.05 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>1 June
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2009.05 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2009-June/027640.html">
+                announcement</a>or 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.05">
+                CHANGES</a>for more details, and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.05.tar.bz2">2009.05
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.05-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>27 May
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We had a number of fixes post-RC2, so RC3 is out (see 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.05_rc3">
+                CHANGES</a>for details). Now is the moment to test and
+                verify that everything is working for your favorite config
+                - Expect a final 2009.05 very soon.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.05-rc3.tar.bz2">
+                2009.05-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.05-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>19 May
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC2 is out with more cleanups and bug fixes (see 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.05_rc2">
+                CHANGES</a>). Unless big issues are found, expect this to
+                be the last release candidate before the release - So give
+                it a good test.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.05-rc2.tar.bz2">
+                2009.05-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Buildroot.org</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>14 May
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Earl Levine has been so kind to donate the 
+                <b>buildroot.org</b>domain to us, so the website can now
+                also be reached at 
+                <a href="http://www.buildroot.org">
+                www.buildroot.org</a>(and git at 
+                <a href="http://git.buildroot.org/buildroot">
+                git.buildroot.org</a>). Thanks a lot Earl!</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.05-rc1 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>5 May
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a new release candidate! Lots of changes all
+                over the tree, see the 
+                <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.05_rc1">
+                CHANGES</a>file for details.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.05-rc1.tar.bz2">
+                2009.05-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Moved to git</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>3 May
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We've moved the source code from 
+                <a href="http://subversion.tigris.org">Subversion</a>to 
+                <a href="http://git-scm.org">Git</a>. You can browse the
+                repo online 
+                <a href="http://git.buildroot.net/buildroot">here</a>, and
+                clone the repo using: 
+                <pre>
+git clone git://git.buildroot.net/buildroot
+</pre>See the 
+                <a href="/git.html">Git Access</a>page for more
+                details.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">new Logo</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>27 March
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We have a 
+                <a href="images/logo.png">logo</a>! We have so far been
+                using the 
+                <a href="http://busybox.net">Busybox</a>logo on the
+                website, as the website was a copy of the 
+                <a href="http://busybox.net">Busybox</a>one - But not
+                anymore, we now have a shiny new logo of our own.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.02 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>12 February
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>The stable 2009.02 release is out - Thanks to everyone
+                contributing and testing the release candidates. See the 
+                <a href="http://lists.buildroot.org/pipermail/buildroot/2009-February/025974.html">
+                announcement</a>for more details, and go to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.02.tar.bz2">2009.02
+                release</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.02-rc4 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>9 February
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>We had more than 50 changes since RC3, several of them
+                toolchain related, so decided to make a RC4 as well. This
+                is very much expected to be the final release candidate, so
+                give it a good test and expect a final 2009.02 release this
+                week unless critical issues are found.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.02-rc4.tar.bz2">
+                2009.02-rc4 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.02-rc3 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>31 January
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>RC3 is out with more cleanups and bug fixes. Unless big
+                issues are found, expect this to be the last release
+                candidate before the release - So give it a good test.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.02-rc3.tar.bz2">
+                2009.02-rc3 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">2009.02-rc2 released</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>23 January
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Another week, another release candidate with a bunch of
+                cleanups and build fixes.</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.02-rc2.tar.bz2">
+                2009.02-rc2 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Release candidate and new
+                maintainer</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>16 January
+                  2009</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>It has been a long time coming, but we finally have a
+                new release candidate! - And a new maintainer to match
+                (Peter Korsgaard).</p>
+                <p>Head to the 
+                <a href="/downloads/">downloads page</a>to pick up the 
+                <a href="/downloads/buildroot-2009.02-rc1.tar.bz2">
+                2009.02-rc1 release candidate</a>, and report any problems
+                found to the 
+                <a href="support.html">mailing list</a>or 
+                <a href="https://bugs.uclibc.org">bug tracker</a>. The plan
+                is to release 2009.02 in time for 
+                <a href="http://www.fosdem.org/2009/">FOSDEM</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li>
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Buildroot mailing list</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>16 July
+                  2006</small>
+                </p>
+              </div>
+              <div class="timeline-body">
+                <p>Buildroot now has its own 
+                <a href="support.html">mailing list</a>.</p>
+              </div>
+            </div>
+          </li>
+          <li class="timeline-inverted">
+            <div class="timeline-badge">
+              <i class="glyphicon glyphicon-thumbs-up"></i>
+            </div>
+            <div class="timeline-panel">
+              <div class="timeline-heading">
+                <h4 class="timeline-title">Buildroot webpage added</h4>
+                <p>
+                  <small class="text-muted">
+                  <i class="glyphicon glyphicon-time"></i>21 February
+                  2005</small>
+                </p>
+                <p>Buildroot is a set of Makefiles and patches that makes
+                it easy generate a cross-compilation toolchain and root
+                filesystem for your target Linux system using the 
+                <a href="http://www.uclibc.org/">uClibc C library</a>.
+                Buildroot is useful mainly for people working with small or
+                embedded systems. Embedded systems often use processors
+                that are not the regular x86 processors everyone is used to
+                using on their PC. It can be PowerPC processors, MIPS
+                processors, ARM processors, etc. And to be extra safe, you
+                do not need to be root to build or run buildroot.</p>
+                <p>And as of today buildroot even has its own webpage,
+                making it a first class citizen of uclibc.org and
+                busybox.net, and more importantly, make it easy to find and
+                point to buildroot.</p>
+                <p>If you find a bug in buildroot, or wish to submit a
+                patch to fix a problem or add a shiny new feature, please
+                use the 
+                <a href="https://bugs.uclibc.org/">Bug and Patch Tracking
+                System</a>to post the details, to make certain your work is
+                not lost</p>
+              </div>
+            </div>
+          </li>
+        </ul>
+      </div>
+      <!--/.col-sm-10 -->
+    </div>
+    <!--/.row -->
+  </div>
+  <!--#include file="footer.html" -->
+</link>
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 801bca9..b32477b 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -1,223 +1,254 @@
 <!--#include file="header.html" -->
-
 <div class="container">
-<div class="row nh"><!-- current sponsor row -->
-<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
-
-  <div class="panel panel-primary">
-    <div class="panel-heading">Current sponsors</div>
-    <div class="panel-body">
-
-      <div class="row">
-	<div class="col-sm-12">
-	  <div class="panel panel-default">
-	    <div class="panel-body">
-	      <div class="col-sm-4">
-		<a href="http://google.com">
-		  <img class="img-responsive center-block" src="images/google-logo.png" alt="google logo"/>
-		</a>
-	      </div>
-	      <div class="col-sm-8">
-		<a href="http://www.google">Google</a> is sponsoring
-		the <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2015">Buildroot
-		  Developers Meeting</a> colocated with the FOSDEM conference,
-		taking place on February 2-3 in Brussels, Belgium. Google is
-		providing the meeting room and lunch for the two days of the
-		meeting.
-	      </div>
-	    </div>
-	  </div>
-	</div>
-
-	<div class="col-sm-12">
-	  <div class="panel panel-default">
-	    <div class="panel-body">
-	      <div class="col-sm-4">
-		<a href="http://www.mind.be">
-		  <img class="img-responsive center-block" src="images/mind-logo.png" alt="mind logo"/>
-		</a>
-	      </div>
-	      <div class="col-sm-8">
-		<a href="http://www.mind.be">Mind</a> is the Embedded
-		Software division of Essensium, which provides consultancy
-		and services specifically in the field of Linux and Open
-		Source SW for Embedded Systems.
-
-		Mind is sponsoring
-		the <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2015">Buildroot
-		  Developers Meeting</a> colocated with the FOSDEM conference,
-		taking place on February 2-3 in Brussels, Belgium. Mind has
-		funded the Monday dinner for the meeting participants.
-	      </div>
-	    </div>
-	  </div>
-	</div>
+  <div class="row nh">
+    <!-- current sponsor row -->
+    <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+      <div class="panel panel-primary">
+        <div class="panel-heading">Current sponsors</div>
+        <div class="panel-body">
+          <div class="row">
+            <div class="col-sm-12">
+              <div class="panel panel-default">
+                <div class="panel-body">
+                  <div class="col-sm-4">
+                    <a href="http://google.com">
+                      <img class="img-responsive center-block"
+                      src="images/google-logo.png" alt="google logo" />
+                    </a>
+                  </div>
+                  <div class="col-sm-8">
+                  <a href="http://www.google">Google</a>is sponsoring the 
+                  <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2015">
+                  Buildroot Developers Meeting</a>colocated with the FOSDEM
+                  conference, taking place on February 2-3 in Brussels,
+                  Belgium. Google is providing the meeting room and lunch
+                  for the two days of the meeting.</div>
+                </div>
+              </div>
+            </div>
+            <div class="col-sm-12">
+              <div class="panel panel-default">
+                <div class="panel-body">
+                  <div class="col-sm-4">
+                    <a href="http://www.mind.be">
+                      <img class="img-responsive center-block"
+                      src="images/mind-logo.png" alt="mind logo" />
+                    </a>
+                  </div>
+                  <div class="col-sm-8">
+                  <a href="http://www.mind.be">Mind</a>is the Embedded
+                  Software division of Essensium, which provides
+                  consultancy and services specifically in the field of
+                  Linux and Open Source SW for Embedded Systems. Mind is
+                  sponsoring the 
+                  <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2015">
+                  Buildroot Developers Meeting</a>colocated with the FOSDEM
+                  conference, taking place on February 2-3 in Brussels,
+                  Belgium. Mind has funded the Monday dinner for the
+                  meeting participants.</div>
+                </div>
+              </div>
+            </div>
+          </div>
+        </div>
       </div>
-    </div>
-  </div>
-
-  <div class="panel panel-primary">
-    <div class="panel-heading">Past sponsors</div>
-    <div class="panel-body">
-      <p>Throughout its history, the Buildroot project has been sponsored by
-	various companies, that we would like to thank below.</p>
-
-      <div class="row">
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<a href="http://www.mind.be">
-		  <img class="img-responsive center-block" src="images/mind-logo.png" alt="minid logo"/>
-		</a>
-	      </div>
-	      <div class="col-sm-12" style="font-size: 12px;">
-		<a href="http://www.mind.be">Mind</a> sponsored the dinner of
-		the FOSDEM 2014 Developers Meeting (Brussels), the meeting
-		room and the dinner for the ELCE 2014 Developers Meeting
-		(D?sseldorf), and the dinner for the FOSDEM 2015 Developers
-		meeting (Brussels).
-	      </div>
-	    </div>
-	  </div>
-	</div>
-
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<p><a href="http://www.google.com">
-		    <img class="img-responsive center-block" src="images/google-logo.png" alt="google logo"/></a></p>
-	      </div>
-	      <div class="col-sm-12">
-		<p><a href="http://www.google.com">Google</a> provided the
-		  logistics for the FOSDEM 2013, FOSDEM 2014 and FOSDEM 2015
-		  Developer Days in Brussels, Belgium.</p>
-	      </div>
-	    </div>
-	  </div>
-	</div>
-
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<p><a href="http://www.imgtec.com/">
-		    <img class="img-responsive center-block" src="images/imgtec-logo.png" alt="imgtec logo"/></a></p>
-	      </div>
-	      <div class="col-sm-12">
-		<a href="http://www.imgtec.com/">Imagination Technologies</a>
-		sponsored the meeting room and dinner of the ELCE 2013
-		Developer Days in Edinburgh, UK.
-	      </div>
-	    </div>
-	  </div>
-	</div>
-      </div>
-
-      <div class="row">
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<p><a href="http://circuitco.com/">
-		    <img class="img-responsive center-block" src="images/circuitco-logo.png" alt="circuitco logo"/></a></p>
-	      </div>
-	      <div class="col-sm-12">
-		<p><a href="http://circuitco.com/">CircuitCo</a> sponsored
-		  several development boards for the Google Summer of Code
-		  2013 project on Buildroot.</p>
-	      </div>
-	    </div>
-	  </div>
-	</div>
-
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<p><a href="http://boundarydevices.com/">
-		    <img class="img-responsive center-block" src="images/boundary-devices-logo.png" alt="boundarydevices logo"/></a></p>
-	      </div>
-	      <div class="col-sm-12">
-		<p><a href="http://boundarydevices.com/">BoundaryDevices</a>
-		  sponsored an i.MX6 development board for the Google Summer of
-		  Code 2013 project on Buildroot.</p>
-	      </div>
-	    </div>
-	  </div>
-	</div>
-
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<p><a href="http://www.fluendo.com/">
-		    <img class="img-responsive center-block" src="images/fluendo-logo.png" alt="fluendo logo"/></a></p>
-	      </div>
-	      <div class="col-sm-12">
-		<p><a href="http://www.fluendo.com/">Fluendo</a> sponsored the
-		  meeting room for the ELCE 2012 Developer Days in Barcelona
-		  Spain.</p>
-	      </div>
-	    </div>
-	  </div>
-	</div>
+      <div class="panel panel-primary">
+        <div class="panel-heading">Past sponsors</div>
+        <div class="panel-body">
+          <p>Throughout its history, the Buildroot project has been
+          sponsored by various companies, that we would like to thank
+          below.</p>
+          <div class="row">
+            <div class="col-sm-4">
+              <div class="panel panel-default panel-sponsor">
+                <div class="panel-body">
+                  <div class="col-sm-12">
+                    <a href="http://www.mind.be">
+                      <img class="img-responsive center-block"
+                      src="images/mind-logo.png" alt="minid logo" />
+                    </a>
+                  </div>
+                  <div class="col-sm-12" style="font-size: 12px;">
+                  <a href="http://www.mind.be">Mind</a>sponsored the dinner
+                  of the FOSDEM 2014 Developers Meeting (Brussels), the
+                  meeting room and the dinner for the ELCE 2014 Developers
+                  Meeting (D&#195;&#188;sseldorf), and the dinner for the
+                  FOSDEM 2015 Developers meeting (Brussels).</div>
+                </div>
+              </div>
+            </div>
+            <div class="col-sm-4">
+              <div class="panel panel-default panel-sponsor">
+                <div class="panel-body">
+                  <div class="col-sm-12">
+                    <p>
+                      <a href="http://www.google.com">
+                        <img class="img-responsive center-block"
+                        src="images/google-logo.png" alt="google logo" />
+                      </a>
+                    </p>
+                  </div>
+                  <div class="col-sm-12">
+                    <p>
+                    <a href="http://www.google.com">Google</a>provided the
+                    logistics for the FOSDEM 2013, FOSDEM 2014 and FOSDEM
+                    2015 Developer Days in Brussels, Belgium.</p>
+                  </div>
+                </div>
+              </div>
+            </div>
+            <div class="col-sm-4">
+              <div class="panel panel-default panel-sponsor">
+                <div class="panel-body">
+                  <div class="col-sm-12">
+                    <p>
+                      <a href="http://www.imgtec.com/">
+                        <img class="img-responsive center-block"
+                        src="images/imgtec-logo.png" alt="imgtec logo" />
+                      </a>
+                    </p>
+                  </div>
+                  <div class="col-sm-12">
+                  <a href="http://www.imgtec.com/">Imagination
+                  Technologies</a>sponsored the meeting room and dinner of
+                  the ELCE 2013 Developer Days in Edinburgh, UK.</div>
+                </div>
+              </div>
+            </div>
+          </div>
+          <div class="row">
+            <div class="col-sm-4">
+              <div class="panel panel-default panel-sponsor">
+                <div class="panel-body">
+                  <div class="col-sm-12">
+                    <p>
+                      <a href="http://circuitco.com/">
+                        <img class="img-responsive center-block"
+                        src="images/circuitco-logo.png"
+                        alt="circuitco logo" />
+                      </a>
+                    </p>
+                  </div>
+                  <div class="col-sm-12">
+                    <p>
+                    <a href="http://circuitco.com/">CircuitCo</a>sponsored
+                    several development boards for the Google Summer of
+                    Code 2013 project on Buildroot.</p>
+                  </div>
+                </div>
+              </div>
+            </div>
+            <div class="col-sm-4">
+              <div class="panel panel-default panel-sponsor">
+                <div class="panel-body">
+                  <div class="col-sm-12">
+                    <p>
+                      <a href="http://boundarydevices.com/">
+                        <img class="img-responsive center-block"
+                        src="images/boundary-devices-logo.png"
+                        alt="boundarydevices logo" />
+                      </a>
+                    </p>
+                  </div>
+                  <div class="col-sm-12">
+                    <p>
+                    <a href="http://boundarydevices.com/">
+                    BoundaryDevices</a>sponsored an i.MX6 development board
+                    for the Google Summer of Code 2013 project on
+                    Buildroot.</p>
+                  </div>
+                </div>
+              </div>
+            </div>
+            <div class="col-sm-4">
+              <div class="panel panel-default panel-sponsor">
+                <div class="panel-body">
+                  <div class="col-sm-12">
+                    <p>
+                      <a href="http://www.fluendo.com/">
+                        <img class="img-responsive center-block"
+                        src="images/fluendo-logo.png" alt="fluendo logo" />
+                      </a>
+                    </p>
+                  </div>
+                  <div class="col-sm-12">
+                    <p>
+                    <a href="http://www.fluendo.com/">Fluendo</a>sponsored
+                    the meeting room for the ELCE 2012 Developer Days in
+                    Barcelona Spain.</p>
+                  </div>
+                </div>
+              </div>
+            </div>
+          </div>
+          <div class="row">
+            <div class="col-sm-4">
+              <div class="panel panel-default panel-sponsor">
+                <div class="panel-body">
+                  <div class="col-sm-12">
+                    <p>
+                      <a href="http://www.synopsys.com">
+                        <img class="img-responsive center-block"
+                        src="images/synopsys-logo.png"
+                        alt="synopsys logo" />
+                      </a>
+                    </p>
+                  </div>
+                  <div class="col-sm-12">
+                    <p>
+                    <a href="http://www.synopsys.com">Synopsys</a>sponsored
+                    the dinner for the ELCE 2012 Developer Days in
+                    Barcelona, Spain.</p>
+                  </div>
+                </div>
+              </div>
+            </div>
+            <div class="col-sm-4">
+              <div class="panel panel-default panel-sponsor">
+                <div class="panel-body">
+                  <div class="col-sm-12">
+                    <p>
+                      <a href="http://www.calao-systems.com/">
+                        <img class="img-responsive center-block"
+                        src="images/calao-logo.png"
+                        alt="calao systems logo" />
+                      </a>
+                    </p>
+                  </div>
+                  <div class="col-sm-12">
+                    <p>
+                    <a href="http://www.calao-systems.com/">Calao
+                    Systems</a>provided a a meeting room for the ELCE 2009
+                    Developer Days in Grenoble, France.</p>
+                  </div>
+                </div>
+              </div>
+            </div>
+            <div class="col-sm-4">
+              <div class="panel panel-default panel-sponsor">
+                <div class="panel-body">
+                  <div class="col-sm-12">
+                    <p>
+                      <a href="http://www.free-electrons.com">
+                        <img class="img-responsive center-block"
+                        src="images/free-electrons-logo.png"
+                        alt="free electrons logo" />
+                      </a>
+                    </p>
+                  </div>
+                  <div class="col-sm-12">
+                    <p>
+                    <a href="http://www.free-electrons.com">Free
+                    Electrons</a>sponsored the lunch for the ELCE 2009
+                    Developer Days in Grenoble, France.</p>
+                  </div>
+                </div>
+              </div>
+            </div>
+          </div>
+        </div>
       </div>
-
-      <div class="row">
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<p><a href="http://www.synopsys.com">
-		    <img class="img-responsive center-block" src="images/synopsys-logo.png" alt="synopsys logo"/></a></p>
-	      </div>
-	      <div class="col-sm-12">
-		<p><a href="http://www.synopsys.com">Synopsys</a> sponsored the
-		  dinner for the ELCE 2012 Developer Days in Barcelona, Spain.</p>
-	      </div>
-	    </div>
-	  </div>
-	</div>
-
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<p><a href="http://www.calao-systems.com/">
-		    <img class="img-responsive center-block" src="images/calao-logo.png" alt="calao systems logo"/></a></p>
-	      </div>
-	      <div class="col-sm-12">
-		<p><a href="http://www.calao-systems.com/">Calao Systems</a>
-		  provided a a meeting room for the ELCE 2009 Developer Days
-		  in Grenoble, France.</p>
-	      </div>
-	    </div>
-	  </div>
-	</div>
-
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12">
-		<p><a href="http://www.free-electrons.com">
-		    <img class="img-responsive center-block" src="images/free-electrons-logo.png" alt="free electrons logo"/></a></p>
-	      </div>
-	      <div class="col-sm-12">
-		<p><a href="http://www.free-electrons.com">Free Electrons</a>
-		  sponsored the lunch for the ELCE 2009 Developer Days in
-		  Grenoble, France.</p>
-	      </div>
-	    </div>
-	  </div>
-	</div>
-      </div>
-
     </div>
   </div>
 </div>
-</div>
-</div>
-
 <!--#include file="footer.html" -->
diff --git a/docs/website/support.html b/docs/website/support.html
index 6f3fb06..b2ce8d7 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -1,96 +1,105 @@
 <!--#include file="header.html" -->
-
 <div class="container">
-<div class="row nh">
-<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
-
-  <div class="panel panel-primary">
-    <div class="panel-heading">Support</div>
-    <div class="panel-body">
-      <p>You can get support for Buildroot through three main channels:</p>
-
-      <div class="row">
-	<div class="col-sm-12">
-	  <div class="panel panel-primary">
-	    <div class="panel-heading">IRC</div>
-	    <div class="panel-body">
-	      <div class="row">
-		<div class="col-sm-1">
-		  <img class="img-responsive" src="images/irc.png" alt="irc icon" style="max-width:50px; margin-bottom:10px;" />
-		</div>
-		<div class="col-sm-11">
-		  <p>The Buildroot IRC channel is <a href="irc://freenode.net/#buildroot">
-		      #buildroot</a>, hosted on Freenode. If you do not have an IRC client, you can
-		    use the <a href="http://webchat.freenode.net">Freenode web interface</a>.
-		    When asking for help on IRC, share relevant logs or pieces of code using a code
-		    sharing website.</p>
-		</div>
-	      </div>
-	    </div>
-	  </div>
-	</div>
-
-	<div class="col-sm-12">
-	  <div class="panel panel-primary">
-	    <div class="panel-heading">Mailing List Information</div>
-	    <div class="panel-body">
-	      <div class="row">
-		<div class="col-sm-1">
-		  <img class="img-responsive" src="images/email.png" alt="mailing list icon" style="max-width:50px; margin-bottom:10px;" />
-		</div>
-		<div class="col-sm-11">
-		  <p>The <a href="/lists/buildroot/">mailing list</a> is for discussion and
-		    development.  You can subscribe by visiting
-		    <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">this page</a>.
-		    Only subscribers to the Buildroot mailing list are allowed to post
-		    to this list.</p>
-
-		  <p>The list is also available
-		    through <a href="http://gmane.org">Gmane</a>
-		    at <a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot">gmane.comp.lib.uclibc.buildroot</a>.
-		  </p>
-
-		  <h4>Search the List Archives</h4>
-		  <p>Please search the mailing list archives before asking questions on the mailing
-		    list, since there is a good chance someone else has asked the same question
-		    before.</p>
-
-		  <form method="get" action="http://search.gmane.org/">
-		    <input type="text" name="query" />
-		    <input type="hidden" name="group" value="gmane.comp.lib.uclibc.buildroot" />
-		    <button type="submit" class="btn btn-default">Submit</button>
-		  </form>
-		</div>
-	      </div>
-	    </div>
-	  </div>
-	</div>
-
-	<div class="col-sm-12">
-	  <div class="panel panel-primary">
-	    <div class="panel-heading">Bug Tracker</div>
-	    <div class="panel-body">
-	      <div class="row">
-		<div class="col-sm-1">
-		  <img class="img-responsive" src="images/bug-buddy.png" alt="bug tracker icon" style="max-width:50px; margin-bottom:10px;" />
-		</div>
-		<div class="col-sm-11">
-		  <p>If you encounter any problem while using Buildroot, you can use the
-		    <a href="https://bugs.buildroot.org/">Bug Tracker</a> to post your bugs and/or
-		    participate to find solutions to existing problems.</p>
-
-		  <p>Note: patches are only accepted through the mailing list.</p>
-		</div>
-	      </div>
-	    </div>
-	  </div>
-	</div>
+  <div class="row nh">
+    <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+      <div class="panel panel-primary">
+        <div class="panel-heading">Support</div>
+        <div class="panel-body">
+          <p>You can get support for Buildroot through three main
+          channels:</p>
+          <div class="row">
+            <div class="col-sm-12">
+              <div class="panel panel-primary">
+                <div class="panel-heading">IRC</div>
+                <div class="panel-body">
+                  <div class="row">
+                    <div class="col-sm-1">
+                      <img class="img-responsive" src="images/irc.png"
+                      alt="irc icon"
+                      style="max-width:50px; margin-bottom:10px;" />
+                    </div>
+                    <div class="col-sm-11">
+                      <p>The Buildroot IRC channel is 
+                      <a href="irc://freenode.net/#buildroot">
+                      #buildroot</a>, hosted on Freenode. If you do not
+                      have an IRC client, you can use the 
+                      <a href="http://webchat.freenode.net">Freenode web
+                      interface</a>. When asking for help on IRC, share
+                      relevant logs or pieces of code using a code sharing
+                      website.</p>
+                    </div>
+                  </div>
+                </div>
+              </div>
+            </div>
+            <div class="col-sm-12">
+              <div class="panel panel-primary">
+                <div class="panel-heading">Mailing List Information</div>
+                <div class="panel-body">
+                  <div class="row">
+                    <div class="col-sm-1">
+                      <img class="img-responsive" src="images/email.png"
+                      alt="mailing list icon"
+                      style="max-width:50px; margin-bottom:10px;" />
+                    </div>
+                    <div class="col-sm-11">
+                      <p>The 
+                      <a href="/lists/buildroot/">mailing list</a>is for
+                      discussion and development. You can subscribe by
+                      visiting 
+                      <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">
+                      this page</a>. Only subscribers to the Buildroot
+                      mailing list are allowed to post to this list.</p>
+                      <p>The list is also available through 
+                      <a href="http://gmane.org">Gmane</a>at 
+                      <a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot">
+                      gmane.comp.lib.uclibc.buildroot</a>.</p>
+                      <h4>Search the List Archives</h4>
+                      <p>Please search the mailing list archives before
+                      asking questions on the mailing list, since there is
+                      a good chance someone else has asked the same
+                      question before.</p>
+                      <form method="get" action="http://search.gmane.org/">
+                        <input type="text" name="query" />
+                        <input type="hidden" name="group"
+                        value="gmane.comp.lib.uclibc.buildroot" />
+                        <button type="submit" class="btn btn-default">
+                        Submit</button>
+                      </form>
+                    </div>
+                  </div>
+                </div>
+              </div>
+            </div>
+            <div class="col-sm-12">
+              <div class="panel panel-primary">
+                <div class="panel-heading">Bug Tracker</div>
+                <div class="panel-body">
+                  <div class="row">
+                    <div class="col-sm-1">
+                      <img class="img-responsive"
+                      src="images/bug-buddy.png" alt="bug tracker icon"
+                      style="max-width:50px; margin-bottom:10px;" />
+                    </div>
+                    <div class="col-sm-11">
+                      <p>If you encounter any problem while using
+                      Buildroot, you can use the 
+                      <a href="https://bugs.buildroot.org/">Bug
+                      Tracker</a>to post your bugs and/or participate to
+                      find solutions to existing problems.</p>
+                      <p>Note: patches are only accepted through the
+                      mailing list.</p>
+                    </div>
+                  </div>
+                </div>
+              </div>
+            </div>
+          </div>
+        </div>
       </div>
     </div>
+    <!--/.col-sm-10 -->
   </div>
-
-</div><!--/.col-sm-10 -->
-</div><!--/.row -->
+  <!--/.row -->
 </div>
-
 <!--#include file="footer.html" -->
diff --git a/docs/website/tidy_config.txt b/docs/website/tidy_config.txt
new file mode 100644
index 0000000..c1b5b38
--- /dev/null
+++ b/docs/website/tidy_config.txt
@@ -0,0 +1,5 @@
+indent: auto
+indent-spaces: 2
+quiet: yes
+input-xml: yes
+wrap: 76
-- 
1.9.1
