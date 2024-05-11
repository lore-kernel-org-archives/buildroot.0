Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD2CC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 22:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 570B983EB2;
	Sat, 11 May 2024 22:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f8f9FexPQePr; Sat, 11 May 2024 22:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B3F683EB5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B3F683EB5;
	Sat, 11 May 2024 22:18:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 301C11BF575
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 22:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29E4B40328
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 22:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2q5Yow1umDj for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 22:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A8EA400F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A8EA400F2
 for <buildroot@buildroot.org>; Sat, 11 May 2024 22:18:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6024B87000; Sat, 11 May 2024 22:18:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 00:17:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1680e491d8aea0ba0d294873ff3722390b9923af
X-Git-Newrev: 3e3bcd633875db0e1f366e86fe8763b5b2d9112e
X-Patchwork-Hint: ignore
Message-Id: <20240511221817.6024B87000@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/index.html: refer to Gitlab
 and lore
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3e3bcd633875db0e1f366e86fe8763b5b2d9112e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our index.html page still points to git.buildroot.net as the Git
repository, and to the defunct gmane for the mailing list
activity. Fix these by pointing to Gitlab and lore respectively.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/index.html | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/index.html b/docs/website/index.html
index 300adbb83d..d68436c721 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -133,14 +133,14 @@
   <div class="row">
     <div class="col-sm-6">
       <div class="panel panel-primary">
-	<div class="panel-heading"><a href="http://git.buildroot.net/buildroot"><h5>Recent commits</h5></a></div>
+	<div class="panel-heading"><a href="https://gitlab.com/buildroot.org/buildroot/"><h5>Recent commits</h5></a></div>
 	<div class="panel-box panel-body ellipsis" id="commit-activity">
 	</div>
       </div>
     </div>
     <div class="col-sm-6" >
       <div class="panel panel-primary">
-	<div class="panel-heading"><a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot"><h5>Recent discussions</h5></a></div>
+	<div class="panel-heading"><a href="https://lore.kernel.org/buildroot/"><h5>Recent discussions</h5></a></div>
 	<div class="panel-box panel-body ellipsis" id="mailing-list-activity">
 	</div>
       </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
