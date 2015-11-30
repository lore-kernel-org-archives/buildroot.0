From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 30 Nov 2015 22:54:41 +0100
Subject: [Buildroot] [PATCH v2] docs/website: cosmetic changes
Message-ID: <1448920481-21268-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Resized too big icons in download and documentation
  pages

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Cheangelog:

v1 -> v2:
Rebase to the latest git version

 docs/website/css/main.css  |  15 ++-
 docs/website/docs.html     |  30 ++---
 docs/website/download.html | 330 ++++++++++++++++++++++-----------------------
 3 files changed, 189 insertions(+), 186 deletions(-)

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
index 9cee36d..23cc13f 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -13,59 +13,59 @@
 
       <div class="row mt centered">
 	<div class="col-sm-4">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
+	  <div class="flip-container flip-container-small center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/manual.html"><img src="images/browser.png" width="180" alt=""></a>
+		<a href="/manual.html"><img src="images/browser.png" width="120" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/manual.html"><img src="images/browser.png" width="180" alt=""></a>
+		<a href="/manual.html"><img src="images/browser.png" width="120" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3>HTML <br>
+	  <h4>HTML <br>
 	    <a href="/manual.html">Stable</a> |
 	    <a href="http://nightly.buildroot.org/manual.html">Nightly</a>
-	  </h3>
+	  </h4>
 
 	</div>
 
 	<div class="col-sm-4">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
+	  <div class="flip-container flip-container-small center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<img src="images/pdf-icon.png" width="180" alt="">
+		<img src="images/pdf-icon.png" width="120" alt="">
 	      </div>
 	      <div class="back">
-		<img src="images/pdf-icon.png" width="180" alt="">
+		<img src="images/pdf-icon.png" width="120" alt="">
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3>PDF <br>
+	  <h4>PDF <br>
 	    <a href="/downloads/manual/manual.pdf">Stable</a> |
 	    <a href="http://nightly.buildroot.org/manual.pdf">Nightly</a>
-	  </h3>
+	  </h4>
 
 	</div>
 
 	<div class="col-sm-4">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
+	  <div class="flip-container flip-container-small center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<img src="images/text.png" width="180" alt="">
+		<img src="images/text.png" width="120" alt="">
 	      </div>
 	      <div class="back">
-		<img src="images/text.png" width="180" alt="">
+		<img src="images/text.png" width="120" alt="">
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3>ASCII <br>
+	  <h4>ASCII <br>
 	    <a href="/downloads/manual/manual.text">Stable</a> |
 	    <a href="http://nightly.buildroot.org/manual.text">Nightly</a>
-	  </h3>
+	  </h4>
 
 	</div>
       </div>
diff --git a/docs/website/download.html b/docs/website/download.html
index 76279d6..ea47c48 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -4,176 +4,174 @@
 <div class="row nh">
 <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Download</div>
-    <div class="panel-body">
-
-      <h3 style="text-align: center;">Latest stable release: <b>2015.08.1</b></h3>
-
-      <div class="row mt centered">
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2015.08.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2015.08.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-	  <h3><a href="/downloads/buildroot-2015.08.1.tar.gz">buildroot-2015.08.1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2015.08.1.tar.gz.sign">PGP signature</a></p>
-	</div>
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2015.08.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2015.08.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3><a href="/downloads/buildroot-2015.08.1.tar.bz2">buildroot-2015.08.1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2015.08.1.tar.bz2.sign">PGP signature</a></p>
-	</div>
-      </div>
-
-      <h3 style="text-align: center;">Latest release candidate: <b>2015.11-rc3</b></h3>
-      <div class="row mt centered">
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
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
-		<a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3><a href="/downloads/buildroot-2015.11-rc3.tar.bz2">buildroot-2015.11-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2015.11-rc3.tar.bz2.sign">PGP signature</a></p>
-	</div>
-      </div>
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
-	      <P>The buildroot repository can be browsed online through cgit at
-		<a href="http://git.buildroot.net/buildroot/">http://git.buildroot.net/buildroot</a>.
-		To grab a copy of the repository use</p>
-
-
-	      <div class="input-group" style="width: 100%;">
-		<input class="form-control" style="width: 85%;" id="giturl"
-		       value="git clone git://git.buildroot.net/buildroot" type="text" readonly></input>
-		<span class="input-group-button">
-		  <button class="btn pull-right" type="button" data-clipboard-target="#giturl"
-			  data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="Copied!">
-		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
-		  </button>
-		</span>
-	      </div><br>
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
-		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
-		  </button>
-		</span>
-	      </div><br>
-
-	      <p>
-
-		Please use the native git protocol if at all possible, as it's a lot
-		more efficient than HTTP.
-
-	      <p>
-
-		If you are not already familiar with using Git, we recommend you visit <a
-											  href="http://git-scm.org">the Git website</a>.
-
-	      <p>
-
-		Once you've checked out a copy of the source tree, you can update your source
-		tree at any time so it is in sync with the latest and greatest by entering your
-		buildroot directory and running the command:
+<div class="panel panel-primary">
+<div class="panel-heading">Download</div>
+<div class="panel-body">
+
+	<div class="panel panel-primary">
+	<div class="panel-body">
+		<h3 style="text-align: center;">Latest stable release: <b>2015.08.1</b></h3>
+		<div class="row mt centered">
+			<div class="col-sm-6">
+				<div class="flip-container flip-container-small center-block" ontouchstart="this.classList.toggle('hover');">
+					<div class="flipper">
+					<div class="front">
+					<a href="/downloads/buildroot-2015.08.1.tar.gz"><img src="images/zip.png" width="120" alt=""></a>
+					</div>
+					<div class="back">
+					<a href="/downloads/buildroot-2015.08.1.tar.gz"><img src="images/zip.png" width="120" alt=""></a>
+					</div>
+					</div>
+				</div>
+				<h3><a href="/downloads/buildroot-2015.08.1.tar.gz">buildroot-2015.08.1.tar.gz</a></h3>
+				<p><a href="/downloads/buildroot-2015.08.1.tar.gz.sign">PGP signature</a></p>
+			</div>
+			<div class="col-sm-6">
+				<div class="flip-container flip-container-small center-block" ontouchstart="this.classList.toggle('hover');">
+					<div class="flipper">
+					<div class="front">
+					<a href="/downloads/buildroot-2015.08.1.tar.bz2"><img src="images/package.png" width="120" alt=""></a>
+					</div>
+					<div class="back">
+					<a href="/downloads/buildroot-2015.08.1.tar.bz2"><img src="images/package.png" width="120" alt=""></a>
+					</div>
+					</div>
+				</div>
+				<h3><a href="/downloads/buildroot-2015.08.1.tar.bz2">buildroot-2015.08.1.tar.bz2</a></h3>
+				<p><a href="/downloads/buildroot-2015.08.1.tar.bz2.sign">PGP signature</a></p>
+			</div>
+		</div>
+	</div></div>
+
+	<div class="panel panel-primary">
+	<div class="panel-body">
+		<h3 style="text-align: center;">Latest release candidate: <b>2015.11-rc3</b></h3>
+		<div class="row mt centered">
+			<div class="col-sm-6">
+				<div class="flip-container flip-container-small center-block" ontouchstart="this.classList.toggle('hover');">
+					<div class="flipper">
+					<div class="front">
+					<a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="120" alt=""></a>
+					</div>
+					<div class="back">
+					<a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="120" alt=""></a>
+					</div>
+					</div>
+				</div>
+				<h3><a href="/downloads/buildroot-2015.11-rc3.tar.gz">buildroot-2015.11-rc3.tar.gz</a></h3>
+				<p><a href="/downloads/buildroot-2015.11-rc3.tar.gz.sign">PGP signature</a></p>
+			</div>
+			<div class="col-sm-6">
+				<div class="flip-container flip-container-small center-block" ontouchstart="this.classList.toggle('hover');">
+					<div class="flipper">
+					<div class="front">
+					<a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="120" alt=""></a>
+					</div>
+					<div class="back">
+					<a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="120" alt=""></a>
+					</div>
+					</div>
+				</div>
+				<h3><a href="/downloads/buildroot-2015.11-rc3.tar.bz2">buildroot-2015.11-rc3.tar.bz2</a></h3>
+				<p><a href="/downloads/buildroot-2015.11-rc3.tar.bz2.sign">PGP signature</a></p>
+			</div>
+		</div>
+	<p>This and earlier releases (and their PGP signatures) can always be downloaded from
+	<a href="/downloads/">http://buildroot.net/downloads/</a>.</p>
+	</div></div>
+</div>
 
-		<pre>
-		  git pull
-		</pre>
+<div class="panel panel-primary">
+	<div class="panel-heading">Source code</div>
+	<div class="panel-body">
+	<div class="row">
+		<div class="col-sm-7">
+			<div class="panel panel-success">
+				<div class="panel-heading">Repository</div>
+				<div class="panel-body">
+				<P>The buildroot repository can be browsed online through cgit at
+				<a href="http://git.buildroot.net/buildroot/">http://git.buildroot.net/buildroot</a>.
+				To grab a copy of the repository use</p>
+				<div class="input-group" style="width: 100%;">
+				<input class="form-control" style="width: 85%;" id="giturl"
+				value="git clone git://git.buildroot.net/buildroot" type="text" readonly></input>
+				<span class="input-group-button">
+				<button class="btn pull-right" type="button" data-clipboard-target="#giturl"
+				data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="Copied!">
+				<img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
+				</button>
+				</span>
+				</div><br>
+
+				<p>
+				Or if you're behind a firewall blocking git:
+				</p>
+
+				<div class="input-group" style="width: 100%;">
+				<input class="form-control" style="width: 85%;" id="giturlhttps"
+				value="git clone https://git.buildroot.net/buildroot" type="text" readonly></input>
+				<span class="input-group-button">
+				<button class="btn pull-right" type="button" data-clipboard-target="#giturlhttps"
+				data-toggle="tooltip" data-placement="bottom" data-trigger="click" title="Copied!">
+				<img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
+				</button>
+				</span>
+				</div><br>
+
+				<p>
+
+				Please use the native git protocol if at all possible, as it's a lot
+				more efficient than HTTP.
+
+				<p>
+
+				If you are not already familiar with using Git, we recommend you visit <a
+											  href="http://git-scm.org">the Git website</a>.
 
-		Because you've only been granted anonymous access to the tree, you won't be
-		able to push your changes to the repo. Changes can instead be submitted for
-		inclusion by posting them to the buildroot mailing list.
-	    </div>
-	  </div>
+				<p>
+
+				Once you've checked out a copy of the source tree, you can update your source
+				tree at any time so it is in sync with the latest and greatest by entering your
+				buildroot directory and running the command:
+
+<pre>
+git pull
+</pre>
+
+				Because you've only been granted anonymous access to the tree, you won't be
+				able to push your changes to the repo. Changes can instead be submitted for
+				inclusion by posting them to the buildroot mailing list.
+				</div>
+			</div>
+		</div>
+		
+		<div class="col-sm-5">
+			<div class="panel panel-default	">
+				<div class="panel-heading">Tarballs</div>
+				<div class="panel-body">
+				You can also obtain daily snapshots of the latest Buildroot source tree if you
+				want to follow development, but cannot or do not wish to use Git.
+
+				<ul>
+				<li>You can download the
+				<a href="downloads/snapshots/buildroot-snapshot.tar.bz2">latest snapshot
+				</a> or view recent <a href="downloads/snapshots/">daily snapshots</a>.
+				</li>
+
+				<li>You can also <a href="http://git.buildroot.net/buildroot">browse the
+				source tree online</a>.
+				</li>
+				</ul>
+
+				<p>
+				Older versions can be downloaded from <a href="/downloads/">the release archive</a>.
+				</p>
+			</div>
+		</div>
+	</div>
 	</div>
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
 	</div>
-      </div>
-    </div>
-  </div>
+</div>
 
 </div><!--/.col-sm-10 -->
 </div><!--/.row -->
-- 
1.9.1
