Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A6BE77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6083E83DAE;
	Sat, 30 Sep 2023 13:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6083E83DAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9lbO1tu5mvlD; Sat, 30 Sep 2023 13:56:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 963F383D98;
	Sat, 30 Sep 2023 13:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 963F383D98
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F07C1BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 777E583DAC
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 777E583DAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QNJMtBSbResT for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:56:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C00AD83D98
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C00AD83D98
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB88D83A24; Sat, 30 Sep 2023 13:56:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 15:55:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 314e52add434b5ba612d68be3d57c425a2975282
X-Git-Newrev: 72c9362103b2f5157b82249280d7250a80db592c
X-Patchwork-Hint: ignore
Message-Id: <20230930135603.AB88D83A24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: remove mention of snapshot
 tarballs
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

commit: https://git.buildroot.net/buildroot/commit/?id=72c9362103b2f5157b82249280d7250a80db592c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In a Git era, those snapshot tarballs are no longer relevant, so drop
it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/website/download.html | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 7d7b405a61..91ad4c7547 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -162,30 +162,6 @@ git pull
 	  </div>
 	</div>
 
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
       </div>
     </div>
   </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
