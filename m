Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8DCE77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 636A783DE5;
	Sat, 30 Sep 2023 13:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 636A783DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p26zwQ-rAQ3O; Sat, 30 Sep 2023 13:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21E5183DD9;
	Sat, 30 Sep 2023 13:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21E5183DD9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B237E1BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8260183DAE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8260183DAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W170x2_C1Lgl for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:56:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7AF283CFC
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7AF283CFC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A47D883A23; Sat, 30 Sep 2023 13:56:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 15:55:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fa4131de5a5a5b156eb110d5f40ac602f6c1d87
X-Git-Newrev: 314e52add434b5ba612d68be3d57c425a2975282
X-Patchwork-Hint: ignore
Message-Id: <20230930135603.A47D883A23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: move Git repository to Gitlab
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=314e52add434b5ba612d68be3d57c425a2975282
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We're now using Gitlab as our official Git repository, so let's update
the website accordingly. Gitlab only provides https:// access, so drop
the explanation about the Git native protocol being more efficient
than HTTP (also because that's no longer true).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/website/download.html | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index c1fd38998c..7d7b405a61 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -124,14 +124,14 @@
 	  <div class="panel panel-success">
 	    <div class="panel-heading">Repository</div>
 	    <div class="panel-body">
-	      <P>The buildroot repository can be browsed online through cgit at
-		<a href="http://git.buildroot.net/buildroot/">http://git.buildroot.net/buildroot</a>.
+	      <P>The buildroot repository can be browsed online at
+		<a href="https://gitlab.com/buildroot.org/buildroot/">https://gitlab.com/buildroot.org/buildroot/</a>.
 		To grab a copy of the repository use</p>
 
 
 	      <div class="input-group" style="width: 100%;">
 		<input class="form-control" style="width: 85%;" id="giturl"
-		       value="git clone git://git.buildroot.net/buildroot" type="text" readonly></input>
+		       value="git clone https://gitlab.com/buildroot.org/buildroot.git" type="text" readonly></input>
 		<span class="input-group-button">
 		  <button class="btn pull-right" type="button" data-clipboard-target="#giturl"
 			  data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="Copied!">
@@ -140,26 +140,6 @@
 		</span>
 	      </div><br>
 
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
 	      <p>
 
 		If you are not already familiar with using Git, we recommend you visit <a
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
