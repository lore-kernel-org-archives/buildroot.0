From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri,  4 Dec 2015 08:21:14 +0100
Subject: [Buildroot] [PATCH 4/4] docs/website: cosmetic changes
In-Reply-To: <1449213674-11333-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1449213674-11333-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1449213674-11333-5-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Smaller images in download and docs pages
* Fixes to links in docs
* Minor fixings in index

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/css/main.css  | 15 ++++++++++-----
 docs/website/docs.html     | 43 ++++++++++++++++++++++++-------------------
 docs/website/download.html | 17 ++++++++---------
 docs/website/header.html   | 12 ++++++------
 4 files changed, 48 insertions(+), 39 deletions(-)

diff --git a/docs/website/css/main.css b/docs/website/css/main.css
index db9c4c9..57009cf 100644
--- a/docs/website/css/main.css
+++ b/docs/website/css/main.css
@@ -207,16 +207,21 @@ i {
 .flip-container {
 	perspective: 1000;
 }
-	/* flip the pane when hovered */
-	.flip-container:hover .flipper, .flip-container.hover .flipper {
-		transform: rotateY(180deg);
-	}
+/* flip the pane when hovered */
+.flip-container:hover .flipper, .flip-container.hover .flipper {
+	transform: rotateY(180deg);
+}
 
-.flip-container, .front, .back {
+.flip-container, .flip-container .front, .flip-container .back {
 	width: 180px;
 	height: 180px;
 }
 
+.flip-container-small, .flip-container-small .front, .flip-container-small .back {
+	width: 120px;
+	height: 120px;
+}
+
 /* flip speed goes here */
 .flipper {
 	transition: 0.6s;
diff --git a/docs/website/docs.html b/docs/website/docs.html
index 4b86383..f2a8597 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -10,60 +10,65 @@
           change/extend/fix things. It is available as:</p>
           <div class="row mt centered">
             <div class="col-sm-4">
-              <div class="flip-container center-block"
+              <div class="flip-container flip-container-small center-block"
               ontouchstart="this.classList.toggle('hover');">
                 <div class="flipper">
                   <div class="front">
                     <a href="/manual.html">
-                      <img src="images/browser.png" width="180" alt="" />
+                      <img src="images/browser.png" alt="" />
                     </a>
                   </div>
                   <div class="back">
                     <a href="/manual.html">
-                      <img src="images/browser.png" width="180" alt="" />
+                      <img src="images/browser.png" alt="" />
                     </a>
                   </div>
                 </div>
               </div>
-              <h3>HTML 
-              <br />
-              <a href="/manual.html">Stable</a>| 
+              <h3>HTML</h3>
+              <h4><a href="/manual.html">Stable</a>| 
               <a href="http://nightly.buildroot.org/manual.html">
-              Nightly</a></h3>
+              Nightly</a></h4>
             </div>
             <div class="col-sm-4">
-              <div class="flip-container center-block"
+              <div class="flip-container flip-container-small center-block"
               ontouchstart="this.classList.toggle('hover');">
                 <div class="flipper">
                   <div class="front">
-                    <img src="images/pdf-icon.png" width="180" alt="" />
+                    <a href="downloads/manual/manual.pdf">
+                      <img src="images/pdf-icon.png" alt="" />
+                    </a>
                   </div>
                   <div class="back">
-                    <img src="images/pdf-icon.png" width="180" alt="" />
+                    <a href="downloads/manual/manual.pdf">
+                      <img src="images/pdf-icon.png" alt="" />
+                    </a>
                   </div>
                 </div>
               </div>
-              <h3>PDF 
-              <br />
-              <a href="/downloads/manual/manual.pdf">Stable</a>| 
+              <h3>PDF</h3>
+              <h4><a href="/downloads/manual/manual.pdf">Stable</a>| 
               <a href="http://nightly.buildroot.org/manual.pdf">
               Nightly</a></h3>
             </div>
             <div class="col-sm-4">
-              <div class="flip-container center-block"
+              <div class="flip-container flip-container-small center-block"
               ontouchstart="this.classList.toggle('hover');">
                 <div class="flipper">
                   <div class="front">
-                    <img src="images/text.png" width="180" alt="" />
+                    <a href="downloads/manual/manual.text">
+                      <img src="images/text.png" alt="" />
+                    </a>
                   </div>
                   <div class="back">
-                    <img src="images/text.png" width="180" alt="" />
+                    <a href="downloads/manual/manual.text">
+                      <img src="images/text.png" alt="" />
+                    </a>
                   </div>
                 </div>
               </div>
-              <h3>ASCII 
-              <br />
-              <a href="/downloads/manual/manual.text">Stable</a>| 
+              <h3>ASCII</h3> 
+              <h4><a href="/downloads/manual/manual.text">Stable</a>| 
               <a href="http://nightly.buildroot.org/manual.text">
               Nightly</a></h3>
             </div>
diff --git a/docs/website/download.html b/docs/website/download.html
index 4ff397d..ea77b25 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -9,17 +9,17 @@
         <b>2015.11</b></h3>
         <div class="row mt centered">
           <div class="col-sm-6">
-            <div class="flip-container center-block"
+            <div class="flip-container flip-container-small center-block"
             ontouchstart="this.classList.toggle('hover');">
               <div class="flipper">
                 <div class="front">
                   <a href="/downloads/buildroot-2015.11.tar.gz">
-                    <img src="images/zip.png" width="180" alt="" />
+                    <img src="images/zip.png" alt="" />
                   </a>
                 </div>
                 <div class="back">
                   <a href="/downloads/buildroot-2015.11.tar.gz">
-                    <img src="images/zip.png" width="180" alt="" />
+                    <img src="images/zip.png" alt="" />
                   </a>
                 </div>
               </div>
@@ -34,17 +34,17 @@
             </p>
           </div>
           <div class="col-sm-6">
-            <div class="flip-container center-block"
+            <div class="flip-container flip-container-small center-block"
             ontouchstart="this.classList.toggle('hover');">
               <div class="flipper">
                 <div class="front">
                   <a href="/downloads/buildroot-2015.11.tar.bz2">
-                    <img src="images/package.png" width="180" alt="" />
+                    <img src="images/package.png" alt="" />
                   </a>
                 </div>
                 <div class="back">
                   <a href="/downloads/buildroot-2015.11.tar.bz2">
-                    <img src="images/package.png" width="180" alt="" />
+                    <img src="images/package.png" alt="" />
                   </a>
                 </div>
               </div>
@@ -153,9 +153,8 @@
                   can update your source tree at any time so it is in sync
                   with the latest and greatest by entering your buildroot
                   directory and running the command:</p>
-                  <pre>
-                  git pull
-                
+<pre>
+git pull
 </pre>
                   <p>Because you've only been granted anonymous access to
                   the tree, you won't be able to push your changes to the
diff --git a/docs/website/header.html b/docs/website/header.html
index 69f4203..c348ebb 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -36,31 +36,31 @@
           <ul class="nav navbar-nav navbar-right">
             <li>
               <a href="/news.html">
-              <span class="glyphicon glyphicon-star"></span>News</a>
+              <span class="glyphicon glyphicon-star"></span> News</a>
             </li>
             <li>
               <a href="/docs.html">
               <span class="glyphicon glyphicon-book">
-              </span>Documentation</a>
+              </span> Documentation</a>
             </li>
             <li>
               <a href="/support.html">
               <span class="glyphicon glyphicon-question-sign">
-              </span>Support</a>
+              </span> Support</a>
             </li>
             <li>
               <a href="/contribute.html">
-              <span class="glyphicon glyphicon-share"></span>Contribute</a>
+              <span class="glyphicon glyphicon-share"></span> Contribute</a>
             </li>
             <li>
               <a href="/sponsors.html">
-              <span class="glyphicon glyphicon-usd"></span>Sponsors</a>
+              <span class="glyphicon glyphicon-usd"></span> Sponsors</a>
             </li>
             <li>
               <a id="menubutton" class="btn btn-success btn-shrink"
               href="/download.html">
                 <span class="glyphicon glyphicon-cloud-download"></span>
-                <span class="text-shrink">Download</span>
+                <span class="text-shrink"> Download</span>
               </a>
             </li>
           </ul>
-- 
1.9.1
