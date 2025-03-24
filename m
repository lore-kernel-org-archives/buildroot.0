Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AC1C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 20:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2B6040D9D;
	Mon, 24 Mar 2025 20:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxNGcDylL9bm; Mon, 24 Mar 2025 20:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6CCC40B5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6CCC40B5D;
	Mon, 24 Mar 2025 20:44:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0E7EE0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97AEE404C0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQZIFPCR3pke for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 20:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9C04400D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9C04400D0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:44:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B287582876; Mon, 24 Mar 2025 20:44:06 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 21:39:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e287bc7f44df312ace41f53416e763abe35aeaf7
X-Git-Newrev: b111e07fd5ac90e3403fc2f7a4944bffbb5a518f
X-Patchwork-Hint: ignore
Message-Id: <20250324204406.B287582876@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: add current LTS sponsors
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b111e07fd5ac90e3403fc2f7a4944bffbb5a518f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the LTS sponsors who engaged already for 2025: EVS, Open Home
Foundation, and Sense Labs. There is one more sponsor but they prefer to
remain anonymous.

For Open Home Foundation, we can reuse the existing logo. For the other
two, add their logo.

Add a new class panel-lts-sponsor for sizing the panels. It is different
from panel-sponsor because there doesn't need to be space for an
explanation of what type of sponsorship is done, we just need to have
space for the company name. So the minimum height is 200px instead of
350px.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/css/main.css          |   6 ++++
 docs/website/images/evs-logo.png   | Bin 0 -> 16552 bytes
 docs/website/images/sense-logo.png | Bin 0 -> 2616 bytes
 docs/website/sponsors.html         |  59 ++++++++++++++++++++++++++++++++++---
 4 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/docs/website/css/main.css b/docs/website/css/main.css
index 5255531b30..81bcd2c4b6 100644
--- a/docs/website/css/main.css
+++ b/docs/website/css/main.css
@@ -168,6 +168,12 @@ i {
 	text-justify: inter-word;
 }
 
+.panel-lts-sponsor {
+	min-height: 200px;
+	text-align: justify;
+	text-justify: inter-word;
+}
+
 @media (min-width: 768px) and (max-width: 991px) {
 	.navbar-collapse.collapse {
 		display: none !important;
diff --git a/docs/website/images/evs-logo.png b/docs/website/images/evs-logo.png
new file mode 100644
index 0000000000..bcaabe8cb5
Binary files /dev/null and b/docs/website/images/evs-logo.png differ
diff --git a/docs/website/images/sense-logo.png b/docs/website/images/sense-logo.png
new file mode 100644
index 0000000000..d4cab95b82
Binary files /dev/null and b/docs/website/images/sense-logo.png differ
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index e5fdbc8c88..ba11b4b081 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -9,11 +9,62 @@
     <div class="panel-body">
       <p>The maintenance of the Long Term Support branch of Buildroot is
          possible thanks to the sponsors of the
-         <a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsoring
+         <a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsorship
          Program</a>.</p>
-      <p>When the Buildroot LTS Sponsoring program will be operational
-         later in 2024, those sponsors will be mentioned here.</p>
-      </div>
+    </div>
+    <div class="panel-body">
+      <h3>Gold Sponsors</h3>
+
+	<div class="col-sm-4">
+	  <div class="panel panel-default panel-lts-sponsor">
+	    <div class="panel-body">
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="https://evs.com">
+		  <img class="img-responsive center-block" src="images/evs-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-12">
+		<a href="http://evs.com">EVS Broadcast Equipment</a>
+	      </div>
+	    </div>
+	  </div>
+	</div>
+	<div class="col-sm-4">
+	  <div class="panel panel-default panel-lts-sponsor">
+	    <div class="panel-body">
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="https://www.openhomefoundation.org/">
+		  <img class="img-responsive center-block" src="images/openhomefoundation-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-12">
+		<a href="https://www.openhomefoundation.org">Open Home
+		Foundation</a>
+	    </div>
+	  </div>
+	</div>
+    </div>
+
+    </div>
+    <div class="panel-body">
+      <h3>Bronze Sponsors</h3>
+
+	<div class="col-sm-4">
+	  <div class="panel panel-default panel-lts-sponsor">
+	    <div class="panel-body">
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="https://www.sense.com">
+		  <img class="img-responsive center-block" style="width: 100%;" src="images/sense-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-12">
+		<a href="https://www.sense.com">Sense Labs</a>
+	      </div>
+	    </div>
+	  </div>
+	</div>
+
+    </div>
     </div>
 
     <div class="panel panel-primary">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
