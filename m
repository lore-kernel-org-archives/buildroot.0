From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:20:54 +0200
Subject: [Buildroot] [git commit] docs: improve look of sponsors page
Message-ID: <20140921192111.EB5949D488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=918766098e9445402e4f736d833d938751348c94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit completely reworks the Sponsors page, to improve its look,
put the current sponsor in a clearly visible way, and add the logo of
all sponsors.

[Thomas: fixed the next meeting date, as noticed by Thomas DS.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/css/buildroot.css                |   23 +++++
 docs/images/boundary-devices-logo.png |  Bin 0 -> 13305 bytes
 docs/images/calao-logo.png            |  Bin 0 -> 15386 bytes
 docs/images/circuitco-logo.png        |  Bin 0 -> 10750 bytes
 docs/images/fluendo-logo.png          |  Bin 0 -> 9098 bytes
 docs/images/free-electrons-logo.png   |  Bin 0 -> 9968 bytes
 docs/images/google-logo.png           |  Bin 0 -> 12005 bytes
 docs/images/imgtec-logo.png           |  Bin 0 -> 5276 bytes
 docs/images/mind-logo.png             |  Bin 0 -> 10214 bytes
 docs/images/synopsys-logo.png         |  Bin 0 -> 52426 bytes
 docs/sponsors.html                    |  169 ++++++++++++++++++++++++++-------
 11 files changed, 157 insertions(+), 35 deletions(-)

diff --git a/docs/css/buildroot.css b/docs/css/buildroot.css
index 86a9c77..09db24b 100644
--- a/docs/css/buildroot.css
+++ b/docs/css/buildroot.css
@@ -11,3 +11,26 @@ body {
     float:right;
     margin: 10px 0 0;
 }
+
+div.sponsor-main {
+    background: #eeeeee;
+    padding: 2em;
+}
+
+div.sponsor {
+    background: #eeeeee;
+    padding: 0.5em;
+    height: 12em;
+    display: table !important;
+}
+
+div.sponsor-description {
+    display: table-cell;
+    vertical-align: middle;
+    text-align: center;
+}
+
+div.sponsor-description img {
+    height: 4em;
+    margin-bottom: 1em;
+}
diff --git a/docs/images/boundary-devices-logo.png b/docs/images/boundary-devices-logo.png
new file mode 100644
index 0000000..35d7a93
Binary files /dev/null and b/docs/images/boundary-devices-logo.png differ
diff --git a/docs/images/calao-logo.png b/docs/images/calao-logo.png
new file mode 100644
index 0000000..c01ecf6
Binary files /dev/null and b/docs/images/calao-logo.png differ
diff --git a/docs/images/circuitco-logo.png b/docs/images/circuitco-logo.png
new file mode 100644
index 0000000..8b315da
Binary files /dev/null and b/docs/images/circuitco-logo.png differ
diff --git a/docs/images/fluendo-logo.png b/docs/images/fluendo-logo.png
new file mode 100644
index 0000000..b4d02cb
Binary files /dev/null and b/docs/images/fluendo-logo.png differ
diff --git a/docs/images/free-electrons-logo.png b/docs/images/free-electrons-logo.png
new file mode 100644
index 0000000..a5c7d8a
Binary files /dev/null and b/docs/images/free-electrons-logo.png differ
diff --git a/docs/images/google-logo.png b/docs/images/google-logo.png
new file mode 100644
index 0000000..bceab16
Binary files /dev/null and b/docs/images/google-logo.png differ
diff --git a/docs/images/imgtec-logo.png b/docs/images/imgtec-logo.png
new file mode 100644
index 0000000..f8a0ffa
Binary files /dev/null and b/docs/images/imgtec-logo.png differ
diff --git a/docs/images/mind-logo.png b/docs/images/mind-logo.png
new file mode 100644
index 0000000..ecc3fa0
Binary files /dev/null and b/docs/images/mind-logo.png differ
diff --git a/docs/images/synopsys-logo.png b/docs/images/synopsys-logo.png
new file mode 100644
index 0000000..d4fbd89
Binary files /dev/null and b/docs/images/synopsys-logo.png differ
diff --git a/docs/sponsors.html b/docs/sponsors.html
index 321dad7..a1eb0bd 100644
--- a/docs/sponsors.html
+++ b/docs/sponsors.html
@@ -2,46 +2,145 @@
 
 <h2>Sponsors</h2>
 
-<p>Throughout its history, the Buildroot project has been sponsored by
-various companies, that we would like to thank below:</p>
-
-<ul>
-
-  <li><a href="http://www.mind.be">Mind</a>, for sponsoring the dinner
-  of the FOSDEM 2014 Developers meeting in Brussels, Belgium. Mind
-  (www.mind.be) is the Embedded Software division of Essensium, which
-  provides consultancy and services specifically in the field of Linux
-  and Open Source SW for Embedded Systems.</li>
+<h3>Current sponsors</h3>
 
-  <li><a href="http://www.google.com">Google</a>, for providing all
-  the logistics for the FOSDEM 2013 and FOSDEM 2014 Developer Days in
-  Brussels, Belgium.</li>
+<div class="container">
+  <div class="row-fluid">
+    <div class="span12 sponsor-main">
+      <div class="row-fluid">
+	<div class="span4">
+	  <a href="http://mind.be">
+	    <img src="images/mind-logo.png"/>
+	  </a>
+	</div>
+	<div class="span8">
+	  <p><a href="http://www.mind.be">Mind</a> is the Embedded
+	  Software division of Essensium, which provides consultancy
+	  and services specifically in the field of Linux and Open
+	    Source SW for Embedded Systems.</p>
 
-  <li><a href="http://www.imgtec.com/">Imagination Technologies</a>,
-  for sponsoring the meeting room and dinner of the ELCE 2013
-  Developer Days in Edinburgh, UK.</li>
+	  <p>Mind is sponsoring
+	  the <a href="http://elinux.org/Buildroot:DeveloperDaysELCE2014">Buildroot
+	  Developers Meeting</a> colocated with the Embedded Linux
+	  Conference Europe, taking place on October 11-12 2014 in
+	  D??sseldorf, Germany. Mind is helping with the logistics of
+	  the meeting room, as well as the Saturday dinner for the
+	  participants.</p>
+	</div>
+      </div>
+    </div>
+  </div>
+</div>
 
-  <li><a href="http://circuitco.com/">CircuitCo</a>, for sponsoring
-  several development boards for the Google Summer of Code 2013
-  project on Buildroot.</li>
+<h3>Past sponsors</h3>
 
-  <li><a href="http://boundarydevices.com/">BoundaryDevices</a>, for
-  sponsoring an i.MX6 development board for the Google Summer of Code
-  2013 project on Buildroot.</li>
-
-  <li><a href="http://www.fluendo.com/">Fluendo</a>, for sponsoring
-  the meeting room for the ELCE 2012 Developer Days in Barcelona
-  Spain.</li>
-
-  <li><a href="http://www.synopsys.com">Synopsys</a>, for sponsoring
-  the dinner for the ELCE 2012 Developer Days in Barcelona,
-  Spain.</li>
+<p>Throughout its history, the Buildroot project has been sponsored by
+  various companies, that we would like to thank below.</p>
 
-  <li><a href="http://www.calao-systems.com/">Calao Systems</a>
-  and <a href="http://free-electrons.com/">Free Electrons</a> for
-  providing a meeting room and offering lunch for the ELCE 2009
-  Developer Days in Grenoble, France.</li>
+<div class="container">
+  <div class="row-fluid">
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://www.mind.be">
+	  <img src="images/mind-logo.png" alt="Mind" title="Mind"/>
+	</a><br/>
+	<a href="http://www.mind.be">Mind</a> sponsored the dinner of
+	the FOSDEM 2014 Developers Meeting.
+      </div>
+    </div>
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://www.google.com">
+	  <img src="images/google-logo.png" alt="Google" title="Google"/>
+	</a>
+	<br/>
+	<a href="http://www.google.com">Google</a> provided the
+	logistics for the FOSDEM 2013 and FOSDEM 2014 Developer Days in
+	Brussels, Belgium.
+      </div>
+    </div>
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://www.imgtec.com/">
+	  <img src="images/imgtec-logo.png" alt="Imagination Technologies" title="Imagination Technologies"/>
+	</a>
+	<br/>
+	<a href="http://www.imgtec.com/">Imagination Technologies</a>
+	  sponsored the meeting room and dinner of the ELCE 2013
+	Developer Days in Edinburgh, UK.
+      </div>
+    </div>
+  </div>
 
-</ul>
+  <div class="row-fluid" style="margin-top: 1em;">
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://circuitco.com/">
+	  <img src="images/circuitco-logo.png" alt="CircuitCo" title="CircuitCo"/>
+	</a>
+	<br/>
+	<a href="http://circuitco.com/">CircuitCo</a> sponsored
+	  several development boards for the Google Summer of Code
+	  2013 project on Buildroot.
+      </div>
+    </div>
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://boundarydevices.com/">
+	  <img src="images/boundary-devices-logo.png" alt="Boundary Devices" title="Boundary Devices"/>
+	</a>
+	<br/>
+	<a href="http://boundarydevices.com/">BoundaryDevices</a>
+	sponsored an i.MX6 development board for the Google Summer of
+	Code 2013 project on Buildroot.
+      </div>
+    </div>
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://www.fluendo.com/">
+	  <img src="images/fluendo-logo.png" alt="Fluendo" title="Fluendo"/>
+	</a>
+	<br/>
+	<a href="http://www.fluendo.com/">Fluendo</a> sponsored the
+	meeting room for the ELCE 2012 Developer Days in Barcelona
+	Spain.
+      </div>
+    </div>
+  </div>
+  <div class="row-fluid" style="margin-top: 1em;">
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://www.synopsys.com">
+	  <img src="images/synopsys-logo.png" alt="Synopsys" title="Synopsys"/>
+	</a>
+	<br/>
+	<a href="http://www.synopsys.com">Synopsys</a> sponsored the
+	  dinner for the ELCE 2012 Developer Days in Barcelona, Spain.
+      </div>
+    </div>
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://www.calao-systems.com/">
+	  <img src="images/calao-logo.png"/ alt="Calao Systems" title="Calao Systems">
+	</a>
+	<br/>
+	<a href="http://www.calao-systems.com/">Calao Systems</a>
+	provided a a meeting room for the ELCE 2009 Developer Days
+	in Grenoble, France.
+      </div>
+    </div>
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://www.free-electrons.com">
+	  <img src="images/free-electrons-logo.png" alt="Free Electrons" title="Free Electrons"/>
+	</a>
+	<br/>
+	<a href="http://www.free-electrons.com">Free Electrons</a>
+	sponsored the lunch for the ELCE 2009 Developer Days in
+	Grenoble, France.
+      </div>
+    </div>
+  </div>
+</div>
 
 <!--#include file="footer.html" -->
