Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AA7CF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E755405A1;
	Sat, 12 Oct 2024 14:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYHvn2csSlOQ; Sat, 12 Oct 2024 14:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6C7B405D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6C7B405D4;
	Sat, 12 Oct 2024 14:03:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B4A31BF8A8
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0CC240580
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jceVrveeuJo for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A31C1402D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A31C1402D0
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:03:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A62185C84; Sat, 12 Oct 2024 14:03:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:53:18 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: fefb22826dec414be732c9f8923de9c40568d0f8
X-Git-Newrev: 99cf714dd813db8f112c40cc8da2491202223c8c
X-Patchwork-Hint: ignore
Message-Id: <20241012140333.8A62185C84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] docs/website/docs.html:
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

commit: https://git.buildroot.net/buildroot/commit/?id=99cf714dd813db8f112c40cc8da2491202223c8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
