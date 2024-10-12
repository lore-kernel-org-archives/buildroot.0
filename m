Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6F0CF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5D4741A2A;
	Sat, 12 Oct 2024 14:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3j-StCJRmOnT; Sat, 12 Oct 2024 14:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27FEA41A14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27FEA41A14;
	Sat, 12 Oct 2024 14:06:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 215921BF8B4
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9543080EF4
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvV2y0poleCp for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB60481CDB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB60481CDB
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:05:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7BE6839C1; Sat, 12 Oct 2024 14:05:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:53:22 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: e7074c3efbbb27a9eff6b4e6b33affcd5411202a
X-Git-Newrev: 52f9df9222e705402db234d84c977ab1bee68f6f
X-Patchwork-Hint: ignore
Message-Id: <20241012140529.A7BE6839C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] docs/website/docs.html:
 use HTTPS for nightly.buildroot.org links
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

commit: https://git.buildroot.net/buildroot/commit/?id=52f9df9222e705402db234d84c977ab1bee68f6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Browsers nowadays complain about HTTP downloads (E.G. manual.pdf) from a
site served over HTTPS, so also use HTTPS for the nightly.buildroot.org
manual links.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 06397d26a0cef5ddce0b04919acac8f4d63dacbf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/docs.html | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/website/docs.html b/docs/website/docs.html
index 85b005004d..ee3eb3d065 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -26,7 +26,7 @@
 
 	  <h3>HTML <br>
 	    <a href="/manual.html">Stable</a> |
-	    <a href="http://nightly.buildroot.org/manual.html">Nightly</a>
+	    <a href="https://nightly.buildroot.org/manual.html">Nightly</a>
 	  </h3>
 
 	</div>
@@ -45,7 +45,7 @@
 
 	  <h3>PDF <br>
 	    <a href="/downloads/manual/manual.pdf">Stable</a> |
-	    <a href="http://nightly.buildroot.org/manual.pdf">Nightly</a>
+	    <a href="https://nightly.buildroot.org/manual.pdf">Nightly</a>
 	  </h3>
 
 	</div>
@@ -64,7 +64,7 @@
 
 	  <h3>ASCII <br>
 	    <a href="/downloads/manual/manual.text">Stable</a> |
-	    <a href="http://nightly.buildroot.org/manual.text">Nightly</a>
+	    <a href="https://nightly.buildroot.org/manual.text">Nightly</a>
 	  </h3>
 
 	</div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
