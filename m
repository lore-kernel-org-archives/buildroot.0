Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB6710AB81C
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 20:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB82060E65;
	Thu, 26 Mar 2026 20:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsMicHt7NMvQ; Thu, 26 Mar 2026 20:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B4AC60E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774555278;
	bh=4Atm1G0x46qzpZFJjRCELXxnBBe796hNLRJ2j1F7uNs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ED2iTQFEg3MoiZHLNyPvE3+YjFhFQcZPamutfO1UHPuRTTYvGHsBP3b4Z4f44Nybr
	 WaLQgP3FT+U+DVDTnIu9A+zvKvD+jYT1Nf/PXY7GdZflgHHKRqQ1DCCNarMnAtXFEE
	 Go1edy6BdW8uZOpz/obBuHlYvQ8qLmB6Z+YlRHbEsgW4pxD7pwXfUFdxceAMXa9EtX
	 0dtdUqn2QbTSA21WkaxtgBIMjkjmXwAYk8jvigh1SnsMeHGwv4/RgtaexfMAnxrdzr
	 KGGbdquDRUlTpZ6JHtdglNkAh/E+fIvEg6N60vbjZiL78wQoKMNl4sMFqBk8OrU7cr
	 yYsF8MI8ceGnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B4AC60E9D;
	Thu, 26 Mar 2026 20:01:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 50B5D353
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32AF560E45
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F8vA2iFrFwQS for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 20:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93D4160E32
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93D4160E32
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:01:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2F997FA5F; Thu, 26 Mar 2026 20:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 20:36:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35e86cef162ff842acf060b9451929b7bf1343c7
X-Git-Newrev: 1a2037d2b812da16965e29d32f64430312a74c60
X-Patchwork-Hint: ignore
Message-Id: <20260326200109.D2F997FA5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/sponsors.html: use flexbox for
 sponsor grid
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1a2037d2b812da16965e29d32f64430312a74c60
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

To avoid having to move all the sponsors through the bootstrap 'row'
when adding a new "past sponsor" on top of the current stack, this
commit make the card rely on flexboxes instead of the bootstrap
internals.

This make sure that the body of the card always fit the row height and
the also make sure that the image always fit properly without having to
touch the inline css.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/css/sponsors.css |  40 ++++++++
 docs/website/sponsors.html    | 207 ++++++++++++++++++++----------------------
 2 files changed, 139 insertions(+), 108 deletions(-)

diff --git a/docs/website/css/sponsors.css b/docs/website/css/sponsors.css
new file mode 100644
index 0000000000..889737eabd
--- /dev/null
+++ b/docs/website/css/sponsors.css
@@ -0,0 +1,40 @@
+.sponsors-container {
+  display: flex;
+  flex-wrap: wrap;
+  gap: 15px;
+  align-items: stretch;
+}
+
+.sponsor-entry {
+  flex: 0 0 calc(33.333% - 10px);
+  display: flex;
+  flex-direction: column;
+  min-width: 250px;
+}
+
+.sponsor-entry .panel {
+  flex: 1;
+  display: flex;
+  flex-direction: column;
+}
+
+.sponsor-entry .panel-body {
+  flex: 1;
+  display: flex;
+  flex-direction: column;
+}
+
+.sponsor-title {
+  display: flex;
+  align-items: center;
+  justify-content: center;
+  min-height: 150px;
+}
+
+.sponsor-title img {
+  max-height: 120px;
+}
+
+.sponsor-body {
+  flex: 1;
+}
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index eef82d2cfa..c15802257e 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -1,5 +1,7 @@
 <!--#include file="header.html" -->
 
+<link href="css/sponsors.css" rel="stylesheet">
+
 <div class="container">
 <div class="row nh"><!-- current sponsor row -->
 <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
@@ -15,29 +17,30 @@
     <div class="panel-body">
       <h3>Gold Sponsors</h3>
 
-	<div class="col-sm-4">
+      <div class="sponsors-container">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-lts-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<a href="https://evs.com">
-		  <img class="img-responsive center-block" src="images/evs-logo.png"/>
+		  <img class="img-responsive" src="images/evs-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="http://evs.com">EVS Broadcast Equipment</a>
 	      </div>
 	    </div>
 	  </div>
 	</div>
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-lts-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<a href="https://www.openhomefoundation.org/">
-		  <img class="img-responsive center-block" src="images/openhomefoundation-logo.png"/>
+		  <img class="img-responsive" src="images/openhomefoundation-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="https://www.openhomefoundation.org">Open Home
 		Foundation</a>
 	    </div>
@@ -48,22 +51,22 @@
     </div>
     <div class="panel-body">
       <h3>Bronze Sponsors</h3>
-
-	<div class="col-sm-4">
+      <div class="sponsors-container">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-lts-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<a href="https://www.sense.com">
 		  <img class="img-responsive center-block" style="width: 100%;" src="images/sense-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="https://www.sense.com">Sense Labs</a>
 	      </div>
 	    </div>
 	  </div>
 	</div>
-
+      </div>
     </div>
     </div>
 
@@ -71,15 +74,16 @@
     <div class="panel-heading">Current sponsors</div>
     <div class="panel-body">
 
-	<div class="col-sm-4">
+      <div class="sponsors-container">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<a href="https://www.smile.eu">
-		  <img class="img-responsive center-block" src="images/smile-logo.png"/>
+		  <img class="img-responsive" src="images/smile-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-body">
 		<a href="http://www.smile.eu">Smile</a> is sponsoring the
 		Buildroot project by hosting
 		the <a href="https://elinux.org/Buildroot:DeveloperDaysFOSDEM2025">Buildroot
@@ -91,15 +95,15 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 180px;">
+	      <div class="sponsor-title">
 		<a href="http://www.opossom.com/english/index.html">
-		  <img class="img-responsive center-block" src="images/armadeus-systems-logo.png"/>
+		  <img class="img-responsive" src="images/armadeus-systems-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-body">
 		<a href="http://www.opossom.com/english/index.html">Armadeus
 		Systems</a> financially sponsored
 		the <a href="/association.html">Buildroot
@@ -108,15 +112,15 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 180px;">
+	      <div class="sponsor-title">
 		<a href="https://www.openhomefoundation.org/">
-		  <img class="img-responsive center-block" src="images/openhomefoundation-logo.png"/>
+		  <img class="img-responsive" src="images/openhomefoundation-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-body">
 		<a href="https://www.openhomefoundation.org">Open Home
 		Foundation</a> financially sponsored
 		the <a href="/association.html">Buildroot
@@ -124,6 +128,7 @@
 	    </div>
 	  </div>
 	</div>
+      </div>
 
     </div>
     </div>
@@ -134,16 +139,16 @@
       <p>Throughout its history, the Buildroot project has been sponsored by
 	various companies, that we would like to thank below.</p>
 
-      <div class="row">
-	<div class="col-sm-4">
+      <div class="sponsors-container">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<a href="https://www.smile.eu">
-		  <img class="img-responsive center-block" src="images/smile-logo.png"/>
+		  <img class="img-responsive" src="images/smile-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="height: 400px;">
+	      <div class="sponsor-body">
 	        <a href="https://www.smile.eu">Smile</a> provided the
 	        meeting location Buildroot Developers days after
 	        FOSDEM 2023, 2024 and 2025, for the
@@ -157,15 +162,15 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<a href="http://www.mind.be">
-		  <img class="img-responsive center-block" src="images/mind-logo.png"/>
+		  <img class="img-responsive" src="images/mind-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="height: 400px;">
+	      <div class="sponsor-body">
 		<a href="http://www.mind.be">Mind</a> sponsored
 		financially the Buildroot Association for the ELCE
 		2018 meeting, sponsored the dinner of the FOSDEM 2014,
@@ -178,14 +183,14 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<p><a href="http://www.google.com">
-		    <img class="img-responsive center-block" src="images/google-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/google-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12" style="height: 400px;">
+	      <div class="sponsor-body">
 		<p><a href="http://www.google.com">Google</a> provided
 		  the logistics for the FOSDEM 2013, FOSDEM 2014,
 		  FOSDEM 2015, FOSDEM 2016, FOSDEM 2017, FOSDEM 2018,
@@ -195,18 +200,15 @@
 	    </div>
 	  </div>
 	</div>
-      </div>
-
-      <div class="row">
 
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor" style="height: 400px;">
+	<div class="sponsor-entry">
+	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="https://www.amarulasolutions.com/">
-		    <img class="img-responsive center-block" src="images/amarula-solutions-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/amarula-solutions-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="https://www.amarulasolutions.com/">Amarula
 		  Solutions</a> sponsored the <em>Buildroot
 		  Association</em> in 2018.
@@ -215,15 +217,14 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor" style="height: 400px;">
+	<div class="sponsor-entry">
+	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="https://www.bootlin.com/">
-		    <img class="img-responsive center-block" src="images/bootlin-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/bootlin-logo.png"/></a></p>
 	      </div>
-
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<p><a href="http://www.bootlin.com">Bootlin</a>
 		  sponsored financially the Buildroot Association for
 		  the ELCE 2018 meeting, sponsored the meeting
@@ -235,15 +236,15 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor" style="height: 400px;">
+	<div class="sponsor-entry">
+	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<a href="http://www.logilin.fr">
-		  <img class="img-responsive center-block" src="images/logilin-logo.png"/>
+		  <img class="img-responsive" src="images/logilin-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="http://www.logilin.fr">Logilin</a> sponsored
 		the ELCE 2018 Buildroot Developers meeting by
 		contributing financially to the <em>Buildroot
@@ -254,19 +255,15 @@
 	  </div>
 	</div>
 
-      </div>
-
-      <div class="row">
-
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<a href="http://www.tkos.col.il">
-		  <img class="img-responsive center-block" src="images/tkos-logo.png"/>
+		  <img class="img-responsive" src="images/tkos-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="http://www.tkos.co.il">Tk Open Systems</a>
 		sponsored the ELCE 2018 Buildroot Developers meeting
 		by contributing financially to the <em>Buildroot
@@ -276,15 +273,15 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 100px;">
+	      <div class="sponsor-title">
 		<a href="http://www.rockwellcollins.com/">
-		  <img class="img-responsive center-block" src="images/rockwell-collins-logo.png"/>
+		  <img class="img-responsive" src="images/rockwell-collins-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="http://www.rockwellcollins.com">Rockwell
 		Collins</a> sponsored the ELCE 2018 Buildroot
 		Developers meeting by funding the social Saturday
@@ -294,15 +291,15 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 100px;">
+	      <div class="sponsor-title">
 		<a href="http://www.scaleway.com">
-		  <img class="img-responsive center-block" src="images/scaleway-logo.png"/>
+		  <img class="img-responsive" src="images/scaleway-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="https://www.scaleway.com/">Scaleway</a>
 		sponsored the complete logistics to organize our Buildroot
 		Hackathon in Paris in March 2018: meeting room, Internet
@@ -311,17 +308,15 @@
 	    </div>
 	  </div>
 	</div>
-      </div>
 
-      <div class="row">
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="http://www.imgtec.com/">
-		    <img class="img-responsive center-block" src="images/imgtec-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/imgtec-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="http://www.imgtec.com/">Imagination Technologies</a>
 		sponsored the meeting room and dinner of the ELCE 2013
 		Developer Days in Edinburgh, UK.
@@ -330,14 +325,14 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="http://circuitco.com/">
-		    <img class="img-responsive center-block" src="images/circuitco-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/circuitco-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<p><a href="http://circuitco.com/">CircuitCo</a> sponsored
 		  several development boards for the Google Summer of Code
 		  2013 project on Buildroot.</p>
@@ -346,14 +341,14 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="http://boundarydevices.com/">
-		    <img class="img-responsive center-block" src="images/boundary-devices-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/boundary-devices-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<p><a href="http://boundarydevices.com/">BoundaryDevices</a>
 		  sponsored an i.MX6 development board for the Google Summer of
 		  Code 2013 project on Buildroot.</p>
@@ -361,17 +356,15 @@
 	    </div>
 	  </div>
 	</div>
-      </div>
 
-      <div class="row">
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="http://www.fluendo.com/">
-		    <img class="img-responsive center-block" src="images/fluendo-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/fluendo-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<p><a href="http://www.fluendo.com/">Fluendo</a> sponsored the
 		  meeting room for the ELCE 2012 Developer Days in Barcelona
 		  Spain.</p>
@@ -380,14 +373,14 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="http://www.synopsys.com">
-		    <img class="img-responsive center-block" src="images/synopsys-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/synopsys-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<p><a href="http://www.synopsys.com">Synopsys</a> sponsored the
 		  dinner for the ELCE 2012 Developer Days in Barcelona, Spain.</p>
 	      </div>
@@ -395,33 +388,31 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="http://www.calao-systems.com/">
-		    <img class="img-responsive center-block" src="images/calao-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/calao-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<p><a href="http://www.calao-systems.com/">Calao Systems</a>
-		  provided a a meeting room for the ELCE 2009 Developer Days
+		  provided a meeting room for the ELCE 2009 Developer Days
 		  in Grenoble, France.</p>
 	      </div>
 	    </div>
 	  </div>
 	</div>
-      </div>
 
-      <div class="row">
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<a href="https://www.tap2open.com">
-		  <img class="img-responsive center-block" src="images/tap2open-logo.png"/>
+		  <img class="img-responsive" src="images/tap2open-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-body">
 	        <a href="https://www.tap2open.com">Tap2Open</a>
 	        financially sponsored the <a href="/association.html">Buildroot Association</a>
 	        in 2020 and 2023.</div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
